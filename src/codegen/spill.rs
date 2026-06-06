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

//! Spill rewriting: when the allocator cannot color some values, rewrite the function so
//! each spilled value lives in a fresh stack slot — store it right after its definition,
//! and reload it into a fresh short-lived value right before each use. The reloaded
//! values have tiny live ranges that color trivially, so re-running allocation converges.
//!
//! This is the classic Chaitin "spill everywhere" rewrite. It keeps the SSA shape (each
//! reload is a new SSA value) and reuses the ordinary `stack_addr`/`load`/`store`
//! instructions, so instruction selection needs no spill-specific paths.

use super::function::*;
use super::types::{IrType, Space};
use std::collections::{HashMap, HashSet};

/// Rewrites `f` so every value in `spilled` is materialized through a stack slot.
/// Spilled block parameters are not supported (returns the function unchanged for them,
/// which keeps the caller's spill loop from looping forever only if none are params).
pub fn rewrite(f: &IrFunction, spilled: &HashSet<u32>) -> IrFunction {
    let mut g = IrFunction::new(f.name.clone(), f.ret_ty);

    // Carry over existing stack slots.
    let mut slot_map: HashMap<u32, StackSlot> = HashMap::new();
    for s in f.stack_slots() {
        let d = f.stack_slot(s);
        slot_map.insert(s.0, g.new_stack_slot(d.size, d.space, d.name.clone()));
    }
    // One new slot per spilled value (sized to its type). Iterate the spilled set
    // in a fixed (sorted) order so slot creation — and thus the whole stack layout
    // and emitted code — is deterministic; `spilled` is a HashSet, whose iteration
    // order would otherwise vary between runs and make builds non-reproducible.
    let mut spill_slot: HashMap<u32, StackSlot> = HashMap::new();
    let mut spilled_sorted: Vec<u32> = spilled.iter().copied().collect();
    spilled_sorted.sort_unstable();
    for &v in &spilled_sorted {
        let slot = previous_spill_slot(f, Value(v), &slot_map).unwrap_or_else(|| {
            let ty = f.value_type(Value(v));
            g.new_stack_slot(ty.bytes().max(1), Space::Ram, format!("spill_v{}", v))
        });
        spill_slot.insert(v, slot);
    }

    // Blocks map 1:1 (entry already exists in g as block 0).
    let mut block_map: HashMap<u32, Block> = HashMap::new();
    block_map.insert(f.entry.0, g.entry);
    for b in f.blocks() {
        if b != f.entry {
            block_map.insert(b.0, g.new_block());
        }
    }

    // value_map carries NON-spilled values old->new (spilled values flow only through
    // the stack, so they are never looked up here).
    let mut value_map: HashMap<u32, Value> = HashMap::new();

    // Recreate block parameters, dropping spilled ones in non-entry blocks. A spilled
    // parameter becomes a stack slot: each predecessor stores its incoming argument to the
    // slot on the edge (handled in the terminator remap), and uses reload from the slot.
    //
    // Entry-block parameters are special: they carry the ABI-passed argument values, so a
    // spilled entry parameter is KEPT as a parameter (to receive its register) and stored
    // to its slot at function entry (below), since entry has no predecessor edge to do so.
    for b in f.blocks() {
        let nb = block_map[&b.0];
        let is_entry = b == f.entry;
        for &p in f.block_params(b) {
            if spill_slot.contains_key(&p.0) && !is_entry {
                continue;
            }
            let np = g.append_block_param(nb, f.value_type(p));
            value_map.insert(p.0, np);
        }
    }

    // Spill the ABI values of spilled entry parameters into their slots up front.
    let entry_spilled_params: Vec<Value> = f
        .block_params(f.entry)
        .iter()
        .copied()
        .filter(|p| spill_slot.contains_key(&p.0))
        .collect();
    let g_entry = g.entry;
    for p in entry_spilled_params {
        let slot = spill_slot[&p.0];
        let val = value_map[&p.0];
        g.append_inst(g_entry, InstData::StoreSlot { slot, val }, IrType::Void);
    }

    for b in f.blocks() {
        let nb = block_map[&b.0];
        for &inst in f.block_insts(b) {
            let data = f.inst_data(inst).clone();
            let ty = f
                .inst_result(inst)
                .map(|v| f.value_type(v))
                .unwrap_or(IrType::Void);

            // Reload each spilled operand into a fresh value just before the instruction.
            let new_data = remap_with_reloads(&mut g, nb, &data, &block_map, &slot_map, &spill_slot, &mut value_map, f);

            let res = g.append_inst(nb, new_data, ty);
            if let Some(old_res) = f.inst_result(inst) {
                if let Some(nv) = res {
                    if let Some(&slot) = spill_slot.get(&old_res.0) {
                        // Spilled result: store it immediately; do NOT publish to value_map.
                        let reloads_same_spill_slot = matches!(
                            data,
                            InstData::LoadSlot { slot: old_slot }
                                if slot_map[&old_slot.0] == slot
                        );
                        if !reloads_same_spill_slot {
                            g.append_inst(nb, InstData::StoreSlot { slot, val: nv }, IrType::Void);
                        }
                    } else {
                        value_map.insert(old_res.0, nv);
                    }
                }
            }
        }
    }

    g
}

fn previous_spill_slot(
    f: &IrFunction,
    v: Value,
    slot_map: &HashMap<u32, StackSlot>,
) -> Option<StackSlot> {
    let ValueDef::Result(inst) = f.value_def(v) else {
        return None;
    };
    let InstData::LoadSlot { slot } = f.inst_data(inst) else {
        return None;
    };
    if f.stack_slot(*slot).name.starts_with("spill_") {
        Some(slot_map[&slot.0])
    } else {
        None
    }
}

#[allow(clippy::too_many_arguments)]
fn remap_with_reloads(
    g: &mut IrFunction,
    nb: Block,
    data: &InstData,
    block_map: &HashMap<u32, Block>,
    slot_map: &HashMap<u32, StackSlot>,
    spill_slot: &HashMap<u32, StackSlot>,
    value_map: &mut HashMap<u32, Value>,
    f: &IrFunction,
) -> InstData {
    // Resolve an operand: reload from its slot if spilled, else map old->new.
    let mut resolve = |g: &mut IrFunction, v: Value| -> Value {
        if let Some(&slot) = spill_slot.get(&v.0) {
            let ty = f.value_type(v);
            g.append_inst(nb, InstData::LoadSlot { slot }, ty).unwrap()
        } else {
            value_map[&v.0]
        }
    };

    match data {
        InstData::Iconst(c) => InstData::Iconst(*c),
        InstData::Unary { op, arg } => InstData::Unary { op: *op, arg: resolve(g, *arg) },
        InstData::Binary { op, lhs, rhs } => {
            let l = resolve(g, *lhs);
            let r = resolve(g, *rhs);
            InstData::Binary { op: *op, lhs: l, rhs: r }
        }
        InstData::Icmp { cond, lhs, rhs } => {
            let l = resolve(g, *lhs);
            let r = resolve(g, *rhs);
            InstData::Icmp { cond: *cond, lhs: l, rhs: r }
        }
        InstData::Cast { op, arg } => InstData::Cast { op: *op, arg: resolve(g, *arg) },
        InstData::Load { space, addr } => InstData::Load { space: *space, addr: resolve(g, *addr) },
        InstData::Store { space, addr, val } => {
            let a = resolve(g, *addr);
            let v = resolve(g, *val);
            InstData::Store { space: *space, addr: a, val: v }
        }
        InstData::StackAddr(s) => InstData::StackAddr(slot_map[&s.0]),
        InstData::LoadSlot { slot } => InstData::LoadSlot { slot: slot_map[&slot.0] },
        InstData::StoreSlot { slot, val } => InstData::StoreSlot {
            slot: slot_map[&slot.0],
            val: resolve(g, *val),
        },
        InstData::SymbolAddr(n) => InstData::SymbolAddr(n.clone()),
        InstData::HwRead(r) => InstData::HwRead(r.clone()),
        InstData::HwWrite { reg, val } => InstData::HwWrite { reg: reg.clone(), val: resolve(g, *val) },
        InstData::Call { callee, args } => {
            let a = args.iter().map(|x| resolve(g, *x)).collect();
            InstData::Call { callee: callee.clone(), args: a }
        }
        InstData::CallIndirect { ptr, args } => {
            let p = resolve(g, *ptr);
            let a = args.iter().map(|x| resolve(g, *x)).collect();
            InstData::CallIndirect { ptr: p, args: a }
        }
        InstData::Jump { target, args } => {
            let a = edge_args(g, *target, args, nb, spill_slot, f, &mut resolve);
            InstData::Jump { target: block_map[&target.0], args: a }
        }
        InstData::Branch { cond, then_blk, then_args, else_blk, else_args } => {
            let c = resolve(g, *cond);
            let ta = edge_args(g, *then_blk, then_args, nb, spill_slot, f, &mut resolve);
            let ea = edge_args(g, *else_blk, else_args, nb, spill_slot, f, &mut resolve);
            InstData::Branch {
                cond: c,
                then_blk: block_map[&then_blk.0],
                then_args: ta,
                else_blk: block_map[&else_blk.0],
                else_args: ea,
            }
        }
        InstData::Return { val } => InstData::Return { val: val.map(|v| resolve(g, v)) },
    }
}

/// Builds a successor edge's argument list. For a spilled target block parameter, the
/// incoming value is stored to that parameter's stack slot here (on the edge) instead of
/// being passed as a block argument, and is therefore omitted from the returned list.
fn edge_args<R: FnMut(&mut IrFunction, Value) -> Value>(
    g: &mut IrFunction,
    target: Block,
    args: &[Value],
    nb: Block,
    spill_slot: &HashMap<u32, StackSlot>,
    f: &IrFunction,
    resolve: &mut R,
) -> Vec<Value> {
    let params = f.block_params(target).to_vec();
    let mut out = Vec::new();
    for (i, a) in args.iter().enumerate() {
        let rv = resolve(g, *a);
        match params.get(i).and_then(|p| spill_slot.get(&p.0)) {
            Some(&slot) => {
                g.append_inst(nb, InstData::StoreSlot { slot, val: rv }, IrType::Void);
            }
            None => out.push(rv),
        }
    }
    out
}
