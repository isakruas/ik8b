// Copyright 2026 The ik8b Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//! Target-independent SSA optimization: constant folding, copy / trivial-phi
//! propagation, and dead-code elimination with block-parameter cleanup.
//!
//! Each `optimize` round computes a value-alias map (copies and redundant phis) and a
//! constant map, then **rebuilds** the function in reverse-postorder keeping only
//! reachable blocks, needed instructions, and live block parameters. Rebuilding makes
//! parameter removal trivial: dropped parameters simply lose their matching predecessor
//! arguments. Rounds run to a fixpoint so constant cascades and chained copies settle.

use super::function::*;
use super::types::{IrType, Width};
use std::collections::{HashMap, HashSet, VecDeque};

/// Runs optimization rounds until the IR stops changing.
///
/// A round may rewrite an instruction without changing the instruction count (e.g.
/// folding `mul` into an `iconst`), which then makes its operands dead for the *next*
/// round to remove. Comparing the textual form (not just counts) detects those
/// content-only changes so the constant/DCE cascade runs to completion.
pub fn optimize(mut f: IrFunction) -> IrFunction {
    let mut prev = super::print::print_function(&f);
    for _ in 0..32 {
        f = optimize_round(&f);
        let cur = super::print::print_function(&f);
        if cur == prev {
            break;
        }
        prev = cur;
    }
    f
}

fn optimize_round(f: &IrFunction) -> IrFunction {
    let consts = collect_consts(f);
    let alias = compute_aliases(f, &consts);
    rebuild(f, &alias)
}

// ----------------------------------------------------------------------------------
// Constant and alias analysis
// ----------------------------------------------------------------------------------

fn collect_consts(f: &IrFunction) -> HashMap<u32, i64> {
    let mut consts = HashMap::new();
    for b in f.blocks() {
        for &inst in f.block_insts(b) {
            if let InstData::Iconst(c) = f.inst_data(inst) {
                if let Some(v) = f.inst_result(inst) {
                    consts.insert(v.0, *c);
                }
            }
        }
    }
    consts
}

/// Builds a value→value replacement map for redundant block parameters (trivial phis)
/// and pure copies. Resolved transitively.
fn compute_aliases(f: &IrFunction, _consts: &HashMap<u32, i64>) -> HashMap<u32, Value> {
    let mut alias: HashMap<u32, Value> = HashMap::new();
    let preds = f.predecessors();

    // Trivial-phi detection: a block parameter whose incoming arguments (over all
    // predecessors) are all identical, or identical except references to the parameter
    // itself, collapses to that single value.
    let mut changed = true;
    while changed {
        changed = false;
        for b in f.blocks() {
            if b == f.entry {
                continue; // entry params are ABI inputs, never phis.
            }
            let params = f.block_params(b).to_vec();
            for (k, &p) in params.iter().enumerate() {
                if alias.contains_key(&p.0) {
                    continue;
                }
                let mut unique: Option<Value> = None;
                let mut trivial = true;
                for &pred in &preds[b.index()] {
                    let arg = incoming_arg(f, pred, b, k);
                    let arg = resolve(&alias, arg);
                    if arg == p {
                        continue; // self-reference, ignore.
                    }
                    match unique {
                        None => unique = Some(arg),
                        Some(u) if u == arg => {}
                        Some(_) => {
                            trivial = false;
                            break;
                        }
                    }
                }
                if trivial {
                    if let Some(u) = unique {
                        alias.insert(p.0, u);
                        changed = true;
                    }
                }
            }
        }
    }
    alias
}

fn resolve(alias: &HashMap<u32, Value>, mut v: Value) -> Value {
    let mut guard = 0;
    while let Some(&n) = alias.get(&v.0) {
        if n == v {
            break;
        }
        v = n;
        guard += 1;
        if guard > 1_000_000 {
            break;
        }
    }
    v
}

/// The value a predecessor passes for the `k`th parameter of `target`.
fn incoming_arg(f: &IrFunction, pred: Block, target: Block, k: usize) -> Value {
    let term = f.terminator(pred).expect("predecessor terminated");
    match f.inst_data(term) {
        InstData::Jump { args, .. } => args[k],
        InstData::Branch {
            then_blk,
            then_args,
            else_blk,
            else_args,
            ..
        } => {
            if *then_blk == target {
                then_args[k]
            } else if *else_blk == target {
                else_args[k]
            } else {
                panic!("predecessor does not target block");
            }
        }
        _ => panic!("predecessor terminator is not a branch/jump"),
    }
}

// ----------------------------------------------------------------------------------
// Reachability, liveness, and rebuild
// ----------------------------------------------------------------------------------

fn reverse_postorder(f: &IrFunction) -> Vec<Block> {
    let mut visited = vec![false; f.num_blocks()];
    let mut post = Vec::new();
    // Iterative DFS to avoid recursion limits on large functions.
    let mut stack: Vec<(Block, usize)> = vec![(f.entry, 0)];
    visited[f.entry.index()] = true;
    while let Some((b, i)) = stack.pop() {
        let succs = f.successors(b);
        if i < succs.len() {
            stack.push((b, i + 1));
            let s = succs[i];
            if !visited[s.index()] {
                visited[s.index()] = true;
                stack.push((s, 0));
            }
        } else {
            post.push(b);
        }
    }
    post.reverse();
    post
}

fn rebuild(f: &IrFunction, alias: &HashMap<u32, Value>) -> IrFunction {
    let rpo = reverse_postorder(f);
    let reachable: HashSet<u32> = rpo.iter().map(|b| b.0).collect();
    let preds = f.predecessors();

    // --- liveness over aliased values ---
    let mut live: HashSet<u32> = HashSet::new();
    let mut needed: HashSet<u32> = HashSet::new(); // inst indices
    let mut work: VecDeque<Value> = VecDeque::new();

    let mark_live = |v: Value,
                     live: &mut HashSet<u32>,
                     work: &mut VecDeque<Value>| {
        if live.insert(v.0) {
            work.push_back(v);
        }
    };

    // Seed: every side-effecting instruction (incl. terminators) in a reachable block.
    for &b in &rpo {
        for &inst in f.block_insts(b) {
            if f.inst_data(inst).has_side_effects() {
                needed.insert(inst.0);
                let mut data = f.inst_data(inst).clone();
                data.for_each_arg_mut(|a| {
                    let r = resolve(alias, *a);
                    mark_live(r, &mut live, &mut work);
                });
            }
        }
    }

    while let Some(v) = work.pop_front() {
        match f.value_def(v) {
            ValueDef::Result(inst) => {
                if needed.insert(inst.0) {
                    let mut data = f.inst_data(inst).clone();
                    data.for_each_arg_mut(|a| {
                        let r = resolve(alias, *a);
                        mark_live(r, &mut live, &mut work);
                    });
                }
            }
            ValueDef::Param(block, idx) => {
                if reachable.contains(&block.0) && block != f.entry {
                    for &pred in &preds[block.index()] {
                        if reachable.contains(&pred.0) {
                            let arg = incoming_arg(f, pred, block, idx as usize);
                            let r = resolve(alias, arg);
                            mark_live(r, &mut live, &mut work);
                        }
                    }
                }
            }
        }
    }

    // --- rebuild ---
    let mut g = IrFunction::new(f.name.clone(), f.ret_ty);
    let mut block_map: HashMap<u32, Block> = HashMap::new();
    block_map.insert(f.entry.0, g.entry);
    for &b in &rpo {
        if b == f.entry {
            continue;
        }
        let nb = g.new_block();
        block_map.insert(b.0, nb);
    }

    // Stack slots carry over verbatim (addresses are stable).
    let mut slot_map: HashMap<u32, StackSlot> = HashMap::new();
    for s in f.stack_slots() {
        let d = f.stack_slot(s);
        let ns = g.new_stack_slot(d.size, d.space, d.name.clone());
        slot_map.insert(s.0, ns);
    }

    let mut value_map: HashMap<u32, Value> = HashMap::new();
    // Surviving params per block (in order), so terminator args can be rebuilt.
    let mut surviving_params: HashMap<u32, Vec<usize>> = HashMap::new();

    // Pass 1: create block params (entry: keep all; others: only live ones).
    for &b in &rpo {
        let nb = block_map[&b.0];
        let params = f.block_params(b).to_vec();
        let mut kept = Vec::new();
        for (k, &p) in params.iter().enumerate() {
            let keep = b == f.entry || live.contains(&p.0);
            if keep {
                let nv = g.append_block_param(nb, f.value_type(p));
                value_map.insert(p.0, nv);
                kept.push(k);
            }
        }
        surviving_params.insert(b.0, kept);
    }

    // Pass 2: emit needed instructions, applying aliases and folding constants.
    let resolve_op = |v: Value, value_map: &HashMap<u32, Value>| -> Value {
        let r = resolve(alias, v);
        *value_map
            .get(&r.0)
            .unwrap_or_else(|| panic!("operand v{} has no mapping", r.0))
    };

    for &b in &rpo {
        let nb = block_map[&b.0];
        for &inst in f.block_insts(b) {
            if !needed.contains(&inst.0) {
                continue;
            }
            let data = f.inst_data(inst);
            let ty = f.inst_result(inst).map(|v| f.value_type(v)).unwrap_or(IrType::Void);
            let new_data = remap_inst(data, b, &block_map, &slot_map, &surviving_params, f, alias, &value_map, &resolve_op);

            // Constant folding for pure value-producing instructions.
            if let Some(folded) = try_fold(&new_data, ty, &g) {
                let nv = g.append_inst(nb, InstData::Iconst(folded), ty).unwrap();
                if let Some(old) = f.inst_result(inst) {
                    value_map.insert(old.0, nv);
                }
                continue;
            }

            let res = g.append_inst(nb, new_data, ty);
            if let (Some(old), Some(nv)) = (f.inst_result(inst), res) {
                value_map.insert(old.0, nv);
            }
        }
    }

    g
}

#[allow(clippy::too_many_arguments)]
fn remap_inst(
    data: &InstData,
    src: Block,
    block_map: &HashMap<u32, Block>,
    slot_map: &HashMap<u32, StackSlot>,
    surviving_params: &HashMap<u32, Vec<usize>>,
    f: &IrFunction,
    alias: &HashMap<u32, Value>,
    value_map: &HashMap<u32, Value>,
    resolve_op: &dyn Fn(Value, &HashMap<u32, Value>) -> Value,
) -> InstData {
    let _ = alias;
    match data {
        InstData::Iconst(c) => InstData::Iconst(*c),
        InstData::Unary { op, arg } => InstData::Unary {
            op: *op,
            arg: resolve_op(*arg, value_map),
        },
        InstData::Binary { op, lhs, rhs } => InstData::Binary {
            op: *op,
            lhs: resolve_op(*lhs, value_map),
            rhs: resolve_op(*rhs, value_map),
        },
        InstData::Icmp { cond, lhs, rhs } => InstData::Icmp {
            cond: *cond,
            lhs: resolve_op(*lhs, value_map),
            rhs: resolve_op(*rhs, value_map),
        },
        InstData::Cast { op, arg } => InstData::Cast {
            op: *op,
            arg: resolve_op(*arg, value_map),
        },
        InstData::Load { space, addr } => InstData::Load {
            space: *space,
            addr: resolve_op(*addr, value_map),
        },
        InstData::Store { space, addr, val } => InstData::Store {
            space: *space,
            addr: resolve_op(*addr, value_map),
            val: resolve_op(*val, value_map),
        },
        InstData::StackAddr(s) => InstData::StackAddr(slot_map[&s.0]),
        InstData::LoadSlot { slot } => InstData::LoadSlot {
            slot: slot_map[&slot.0],
        },
        InstData::StoreSlot { slot, val } => InstData::StoreSlot {
            slot: slot_map[&slot.0],
            val: resolve_op(*val, value_map),
        },
        InstData::SymbolAddr(n) => InstData::SymbolAddr(n.clone()),
        InstData::HwRead(r) => InstData::HwRead(r.clone()),
        InstData::HwWrite { reg, val } => InstData::HwWrite {
            reg: reg.clone(),
            val: resolve_op(*val, value_map),
        },
        InstData::Call { callee, args } => InstData::Call {
            callee: callee.clone(),
            args: args.iter().map(|a| resolve_op(*a, value_map)).collect(),
        },
        InstData::CallIndirect { ptr, args } => InstData::CallIndirect {
            ptr: resolve_op(*ptr, value_map),
            args: args.iter().map(|a| resolve_op(*a, value_map)).collect(),
        },
        InstData::Jump { target, .. } => {
            let nt = block_map[&target.0];
            let args = surviving_params[&target.0]
                .iter()
                .map(|&k| resolve_op(incoming_arg(f, src, *target, k), value_map))
                .collect();
            InstData::Jump { target: nt, args }
        }
        InstData::Branch {
            cond,
            then_blk,
            else_blk,
            ..
        } => {
            let nt = block_map[&then_blk.0];
            let ne = block_map[&else_blk.0];
            let then_args = surviving_params[&then_blk.0]
                .iter()
                .map(|&k| resolve_op(incoming_arg(f, src, *then_blk, k), value_map))
                .collect();
            let else_args = surviving_params[&else_blk.0]
                .iter()
                .map(|&k| resolve_op(incoming_arg(f, src, *else_blk, k), value_map))
                .collect();
            InstData::Branch {
                cond: resolve_op(*cond, value_map),
                then_blk: nt,
                then_args,
                else_blk: ne,
                else_args,
            }
        }
        InstData::Return { val } => InstData::Return {
            val: val.map(|v| resolve_op(v, value_map)),
        },
    }
}

// ----------------------------------------------------------------------------------
// Constant folding
// ----------------------------------------------------------------------------------

fn const_of(v: Value, g: &IrFunction) -> Option<i64> {
    match g.value_def(v) {
        ValueDef::Result(inst) => match g.inst_data(inst) {
            InstData::Iconst(c) => Some(*c),
            _ => None,
        },
        _ => None,
    }
}

fn try_fold(data: &InstData, ty: IrType, g: &IrFunction) -> Option<i64> {
    match data {
        InstData::Binary { op, lhs, rhs } => {
            let l = const_of(*lhs, g)?;
            let r = const_of(*rhs, g)?;
            let res = fold_binary(*op, l, r, ty)?;
            Some(fit(res, ty))
        }
        InstData::Unary { op, arg } => {
            let x = const_of(*arg, g)?;
            let res = match op {
                UnOp::Neg => x.wrapping_neg(),
                UnOp::Bnot => !x,
                UnOp::LogicalNot => {
                    if x == 0 {
                        1
                    } else {
                        0
                    }
                }
            };
            Some(fit(res, ty))
        }
        InstData::Icmp { cond, lhs, rhs } => {
            let l = const_of(*lhs, g)?;
            let r = const_of(*rhs, g)?;
            let lt = g.value_type(*lhs);
            let res = fold_icmp(*cond, l, r, lt);
            Some(if res { 1 } else { 0 })
        }
        _ => None,
    }
}

fn fold_binary(op: BinOp, l: i64, r: i64, ty: IrType) -> Option<i64> {
    let signed = ty.is_signed();
    let res = match op {
        BinOp::Add => l.wrapping_add(r),
        BinOp::Sub => l.wrapping_sub(r),
        BinOp::Mul => l.wrapping_mul(r),
        BinOp::Div => {
            if r == 0 {
                return None;
            }
            if signed {
                l / r
            } else {
                ((l as u64) / (r as u64)) as i64
            }
        }
        BinOp::Rem => {
            if r == 0 {
                return None;
            }
            if signed {
                l % r
            } else {
                ((l as u64) % (r as u64)) as i64
            }
        }
        BinOp::And => l & r,
        BinOp::Or => l | r,
        BinOp::Xor => l ^ r,
        BinOp::Shl => l.wrapping_shl(r as u32),
        BinOp::Shr => {
            if signed {
                l >> (r as u32)
            } else {
                ((l as u64) >> (r as u32)) as i64
            }
        }
    };
    Some(res)
}

fn fold_icmp(cond: Cond, l: i64, r: i64, ty: IrType) -> bool {
    if ty.is_signed() {
        match cond {
            Cond::Eq => l == r,
            Cond::Ne => l != r,
            Cond::Lt => l < r,
            Cond::Le => l <= r,
            Cond::Gt => l > r,
            Cond::Ge => l >= r,
        }
    } else {
        let (l, r) = (l as u64, r as u64);
        match cond {
            Cond::Eq => l == r,
            Cond::Ne => l != r,
            Cond::Lt => l < r,
            Cond::Le => l <= r,
            Cond::Gt => l > r,
            Cond::Ge => l >= r,
        }
    }
}

/// Truncates a folded constant to the result type width, matching runtime wrapping.
fn fit(v: i64, ty: IrType) -> i64 {
    match ty.width() {
        Width::W8 => {
            if ty.is_signed() {
                v as i8 as i64
            } else {
                (v as u8) as i64
            }
        }
        Width::W16 => {
            if ty.is_signed() {
                v as i16 as i64
            } else {
                (v as u16) as i64
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::build_ast::{all_function_names, lower_program};
    use super::super::print::print_function;
    use super::*;
    use crate::lexer::Lexer;
    use crate::parser::Parser;

    fn compile_to_ir(src: &str) -> Vec<IrFunction> {
        let toks = Lexer::new(src).tokenize().expect("lex");
        let ast = Parser::new(toks).parse().expect("parse");
        lower_program(&ast, &all_function_names(&ast), &mut Vec::new()).expect("lower")
    }

    #[test]
    fn folds_constants_and_dce() {
        let src = "target atmega328p\n@f() -> u8 {\n  ram mut $x: u8 = 2\n  $x + 3 -> $x\n  return $x\n}\n";
        let funcs = compile_to_ir(src);
        let opt = optimize(funcs.into_iter().next().unwrap());
        let txt = print_function(&opt);
        // 2 + 3 should fold to a single constant 5 return.
        assert!(txt.contains("iconst 5"), "expected folded constant:\n{}", txt);
        // No Add instruction should survive.
        assert!(!txt.contains("Add"), "add should be folded away:\n{}", txt);
    }

    #[test]
    fn removes_dead_block() {
        let src = "target atmega328p\n@m($a: u8, $b: u8) -> u8 {\n  ? $a > $b { return $a } : { return $b }\n}\n";
        let funcs = compile_to_ir(src);
        let opt = optimize(funcs.into_iter().next().unwrap());
        let txt = print_function(&opt);
        // The unreachable fall-through block (bb3 with iconst 0) should be gone.
        assert!(!txt.contains("iconst 0"), "dead fallthrough should be removed:\n{}", txt);
    }

    #[test]
    fn loop_phis_preserved() {
        let src = "target atmega328p\n@s($n: u16) -> u16 {\n  ram mut $acc: u16 = 0\n  loop 0..$n -> $i { $acc + $i -> $acc }\n  return $acc\n}\n";
        let funcs = compile_to_ir(src);
        let opt = optimize(funcs.into_iter().next().unwrap());
        // The loop header must still carry its two loop-carried phis.
        let header_has_two = opt
            .blocks()
            .any(|b| b != opt.entry && opt.block_params(b).len() == 2);
        assert!(header_has_two, "loop header should keep 2 phis:\n{}", print_function(&opt));
    }
}
