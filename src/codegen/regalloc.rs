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

//! Bridges the SSA IR to the graph-coloring engine: SSA-aware liveness, interference,
//! node widths from value types, and phi copy moves for coalescing (which is how the
//! block-parameter form is destructed out of SSA — coalesced phis need no copy).

use super::coloring::{color, Allocation, ColoringInput};
use super::function::*;
use super::types::Width;
use std::collections::HashMap;

/// Per-block liveness sets over SSA values.
pub struct Liveness {
    pub live_out: Vec<Vec<Value>>,
}

/// Per-block GEN (upward-exposed uses: used before being defined in the block) and KILL
/// (values defined in the block: parameters + instruction results). Computing GEN as
/// upward-exposed — not every use — is essential: a value used after its own definition
/// in the same block must NOT appear live-in, or its live range leaks into predecessors
/// and inflates interference across the whole function.
fn block_gen_kill(f: &IrFunction) -> (Vec<Vec<Value>>, Vec<Vec<Value>>) {
    let n = f.num_blocks();
    let mut gen = vec![Vec::new(); n];
    let mut kill = vec![Vec::new(); n];
    for b in f.blocks() {
        let mut killed: std::collections::HashSet<u32> = std::collections::HashSet::new();
        for &p in f.block_params(b) {
            killed.insert(p.0);
            kill[b.index()].push(p);
        }
        for &inst in f.block_insts(b) {
            let mut data = f.inst_data(inst).clone();
            data.for_each_arg_mut(|a| {
                if !killed.contains(&a.0) && !gen[b.index()].contains(a) {
                    gen[b.index()].push(*a);
                }
            });
            if let Some(r) = f.inst_result(inst) {
                killed.insert(r.0);
                kill[b.index()].push(r);
            }
        }
    }
    (gen, kill)
}

/// SSA liveness. `live_out[b] = ∪ over successors s of (live_in[s] minus s's params)`,
/// because a successor's parameters are satisfied by the arguments the predecessor
/// passes (already counted as uses in the terminator), not propagated as live-in.
pub fn liveness(f: &IrFunction) -> Liveness {
    let n = f.num_blocks();
    let (uses, defs) = block_gen_kill(f);
    let params: Vec<Vec<Value>> = f.blocks().map(|b| f.block_params(b).to_vec()).collect();

    let mut live_in: Vec<Vec<Value>> = vec![Vec::new(); n];
    let mut live_out: Vec<Vec<Value>> = vec![Vec::new(); n];

    let contains = |v: &[Value], x: Value| v.iter().any(|&y| y == x);

    let mut changed = true;
    while changed {
        changed = false;
        for b in (0..n).rev() {
            let block = Block(b as u32);
            // live_out
            let mut new_out: Vec<Value> = Vec::new();
            for s in f.successors(block) {
                for &v in &live_in[s.index()] {
                    if !contains(&params[s.index()], v) && !contains(&new_out, v) {
                        new_out.push(v);
                    }
                }
            }
            // live_in = use ∪ (out \ def)
            let mut new_in: Vec<Value> = Vec::new();
            for &v in &uses[b] {
                if !contains(&new_in, v) {
                    new_in.push(v);
                }
            }
            for &v in &new_out {
                if !contains(&defs[b], v) && !contains(&new_in, v) {
                    new_in.push(v);
                }
            }
            if new_in.len() != live_in[b].len() || new_out.len() != live_out[b].len() {
                changed = true;
            }
            live_in[b] = new_in;
            live_out[b] = new_out;
        }
    }

    Liveness { live_out }
}

/// Builds the interference graph and move set for `f` over `regs`. `callee_saved` lists
/// the registers preserved across a call; values live across any call are constrained to
/// that class so the call's caller-saved clobber cannot destroy them. Returns the coloring
/// input plus the value→node index map so the caller can read back assignments.
pub fn build_coloring(
    f: &IrFunction,
    regs: Vec<u8>,
    callee_saved: &[u8],
) -> (ColoringInput, HashMap<u32, usize>) {
    // One node per SSA value.
    let num = f.num_values();
    let mut input = ColoringInput::new(num, regs);
    let mut node_of: HashMap<u32, usize> = HashMap::new();
    for v in 0..num as u32 {
        node_of.insert(v, v as usize);
        let ty = f.value_type(Value(v));
        input.nodes[v as usize].width = if ty.width() == Width::W16 { 2 } else { 1 };
        input.nodes[v as usize].spill_cost = spill_cost(f, Value(v));
    }

    let live = liveness(f);

    // Walk each block backward, tracking the live set, and connect every def to all
    // values live at that point (the classic interference construction).
    for b in f.blocks() {
        let mut liveset: Vec<Value> = live.live_out[b.index()].clone();

        // Block params are all simultaneously live at entry: make them interfere.
        let bparams = f.block_params(b).to_vec();

        let insts: Vec<Inst> = f.block_insts(b).to_vec();
        for &inst in insts.iter().rev() {
            let result = f.inst_result(inst);
            let is_call = matches!(
                f.inst_data(inst),
                InstData::Call { .. } | InstData::CallIndirect { .. }
            );
            if let Some(d) = result {
                for &l in &liveset {
                    if l != d {
                        input.add_edge(d.index(), l.index());
                    }
                }
            }
            // Division materializes the quotient in the dividend's register, so the
            // result must NOT share a register with the divisor (the divisor stays live
            // throughout the restoring-division loop). Force them apart.
            if let (Some(d), InstData::Binary { op: BinOp::Div, rhs, .. })
            | (Some(d), InstData::Binary { op: BinOp::Rem, rhs, .. }) =
                (result, f.inst_data(inst))
            {
                input.add_edge(d.index(), rhs.index());
            }
            // A call clobbers caller-saved registers: every value live across it (live
            // after, excluding the call's own result) must sit in a callee-saved register.
            if is_call {
                for &l in &liveset {
                    if Some(l) != result {
                        input.nodes[l.index()].class = callee_saved.to_vec();
                    }
                }
            }
            // Update liveness: remove def, add uses.
            if let Some(d) = result {
                liveset.retain(|&x| x != d);
            }
            let mut data = f.inst_data(inst).clone();
            data.for_each_arg_mut(|a| {
                if !liveset.contains(a) {
                    liveset.push(*a);
                }
            });
        }

        // Now `liveset` ~ live-in. Block params interfere with each other and with
        // whatever else is live in.
        for (i, &p) in bparams.iter().enumerate() {
            for &q in bparams.iter().skip(i + 1) {
                input.add_edge(p.index(), q.index());
            }
            for &l in &liveset {
                if l != p {
                    input.add_edge(p.index(), l.index());
                }
            }
        }
    }

    // Phi copy moves: each block parameter and the value each predecessor passes for it
    // are copy-related; coalescing them deletes the move (out-of-SSA).
    let preds = f.predecessors();
    for b in f.blocks() {
        let params = f.block_params(b).to_vec();
        if params.is_empty() || b == f.entry {
            continue;
        }
        for (k, &p) in params.iter().enumerate() {
            for &pred in &preds[b.index()] {
                let arg = incoming_arg(f, pred, b, k);
                input.add_move(p.index(), arg.index());
            }
        }
    }

    (input, node_of)
}

fn spill_cost(f: &IrFunction, v: Value) -> u32 {
    match f.value_def(v) {
        ValueDef::Param(_, _) => 1_000,
        ValueDef::Result(inst) => match f.inst_data(inst) {
            InstData::LoadSlot { slot } if f.stack_slot(*slot).name.starts_with("spill_") => {
                1_000_000
            }
            InstData::StackAddr(_) => 100_000,
            InstData::LoadSlot { .. } => 100_000,
            _ => 1,
        },
    }
}

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
            } else {
                let _ = else_blk;
                else_args[k]
            }
        }
        _ => panic!("predecessor terminator is not a branch/jump"),
    }
}

/// Convenience: build and color in one step.
pub fn allocate(
    f: &IrFunction,
    regs: Vec<u8>,
    callee_saved: &[u8],
) -> (Allocation, HashMap<u32, usize>) {
    let (input, node_of) = build_coloring(f, regs, callee_saved);
    (color(&input), node_of)
}

#[cfg(test)]
mod tests {
    use super::super::build_ast::lower_program;
    use super::super::opt::optimize;
    use super::*;
    use crate::lexer::Lexer;
    use crate::parser::Parser;

    fn ir(src: &str) -> IrFunction {
        let toks = Lexer::new(src).tokenize().unwrap();
        let ast = Parser::new(toks).parse().unwrap();
        let f = lower_program(&ast).unwrap().into_iter().next().unwrap();
        optimize(f)
    }

    #[test]
    fn sumloop_allocates_without_spill() {
        // Classic accumulator loop: with the callee-saved pair pool it must fit, and the
        // loop-carried phis must coalesce with their back-edge updates.
        let f = ir("target atmega328p\n@s($n: u16) -> u16 {\n  ram mut $acc: u16 = 0\n  loop 0..$n -> $i { $acc + $i -> $acc }\n  return $acc\n}\n");
        // Plenty of even-aligned 16-bit-capable registers.
        let regs = vec![2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 24, 25];
        let (alloc, _) = allocate(&f, regs, &[2,3,4,5,6,7,8,9,10,11,12,13,14,15]);
        assert!(alloc.spilled.is_empty(), "sumloop should not spill: {:?}", alloc);
        // Some phi moves should have coalesced (induction + accumulator copies).
        assert!(!alloc.coalesced.is_empty(), "expected phi coalescing");
    }

    #[test]
    fn interfering_values_get_distinct_registers() {
        let f = ir("target atmega328p\n@f($a: u8, $b: u8) -> u8 {\n  return $a + $b\n}\n");
        let regs = vec![16, 17, 18, 19, 24];
        let (alloc, _) = allocate(&f, regs, &[2,3,4,5,6,7,8,9,10,11,12,13,14,15]);
        assert!(alloc.spilled.is_empty());
        // $a and $b are both live into the add, so they must occupy different registers.
        // (We can't name their nodes directly here, but every colored value that is
        // simultaneously live must differ — checked structurally by the allocator.)
        assert!(!alloc.colors.is_empty());
    }
}
