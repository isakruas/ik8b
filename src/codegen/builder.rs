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

//! On-the-fly SSA construction following Braun et al., "Simple and Efficient
//! Construction of SSA Form" (CC 2013), adapted to a block-parameter IR.
//!
//! Front-end variables (`$name`, induction vars, synthesized temporaries) are
//! interned to dense `VarId`s. `def_var`/`use_var` track the reaching definition per
//! block. At a control-flow merge with an unknown or multi-predecessor reaching
//! definition we materialize a **phi** as a block parameter and record its
//! per-predecessor operands in a side table; the operands are wired into the
//! predecessors' terminator argument lists in `finalize`, after the whole CFG and all
//! definitions exist. Trivial-phi elimination is intentionally deferred to the GVN /
//! copy-propagation pass so the builder stays small and obviously correct.

use super::function::*;
use super::types::IrType;
use std::collections::HashMap;

type VarId = u32;

/// A phi node recorded during construction. It corresponds to a block parameter
/// of `block` standing for variable `var`. Operands are filled either eagerly
/// (sealed block) or at seal time (open block).
struct Phi {
    var: VarId,
    block: Block,
    operands: Vec<(Block, Value)>,
    sealed_operands: bool,
}

pub struct Builder {
    pub f: IrFunction,
    current: Block,

    var_types: Vec<IrType>,
    name_to_var: HashMap<String, VarId>,

    /// reaching definition of (var, block).
    current_def: HashMap<(VarId, u32), Value>,
    sealed: Vec<bool>,
    filled: Vec<bool>,

    /// predecessors recorded incrementally as terminators are emitted.
    preds: Vec<Vec<Block>>,

    /// all phis, indexed implicitly; `incomplete[block]` lists phi indices awaiting seal.
    phis: Vec<Phi>,
    param_to_phi: HashMap<Value, usize>,
    incomplete: HashMap<u32, Vec<usize>>,
}

impl Builder {
    pub fn new(name: impl Into<String>, ret_ty: IrType) -> Self {
        let f = IrFunction::new(name, ret_ty);
        let entry = f.entry;
        let mut b = Builder {
            f,
            current: entry,
            var_types: Vec::new(),
            name_to_var: HashMap::new(),
            current_def: HashMap::new(),
            sealed: Vec::new(),
            filled: Vec::new(),
            preds: Vec::new(),
            phis: Vec::new(),
            param_to_phi: HashMap::new(),
            incomplete: HashMap::new(),
        };
        b.register_block(entry);
        b
    }

    fn register_block(&mut self, block: Block) {
        let idx = block.index();
        if self.sealed.len() <= idx {
            self.sealed.resize(idx + 1, false);
            self.filled.resize(idx + 1, false);
            self.preds.resize(idx + 1, Vec::new());
        }
    }

    pub fn create_block(&mut self) -> Block {
        let b = self.f.new_block();
        self.register_block(b);
        b
    }

    pub fn entry(&self) -> Block {
        self.f.entry
    }

    pub fn current_block(&self) -> Block {
        self.current
    }

    pub fn switch_to_block(&mut self, block: Block) {
        self.current = block;
    }

    /// True once the block has a terminator.
    pub fn is_filled(&self, block: Block) -> bool {
        self.filled[block.index()]
    }

    // ---- variables ----

    pub fn intern_var(&mut self, name: &str, ty: IrType) -> VarId {
        if let Some(&v) = self.name_to_var.get(name) {
            return v;
        }
        let id = self.var_types.len() as VarId;
        self.var_types.push(ty);
        self.name_to_var.insert(name.to_string(), id);
        id
    }

    pub fn def_var(&mut self, var: VarId, value: Value) {
        self.write_var(var, self.current, value);
    }

    fn write_var(&mut self, var: VarId, block: Block, value: Value) {
        self.current_def.insert((var, block.0), value);
    }

    pub fn use_var(&mut self, var: VarId) -> Value {
        self.read_var(var, self.current)
    }

    fn read_var(&mut self, var: VarId, block: Block) -> Value {
        if let Some(&v) = self.current_def.get(&(var, block.0)) {
            return v;
        }
        self.read_var_recursive(var, block)
    }

    fn read_var_recursive(&mut self, var: VarId, block: Block) -> Value {
        let ty = self.var_types[var as usize];
        let val = if !self.sealed[block.index()] {
            // Open block: defer operands until seal.
            let param = self.f.append_block_param(block, ty);
            let phi_idx = self.phis.len();
            self.phis.push(Phi {
                var,
                block,
                operands: Vec::new(),
                sealed_operands: false,
            });
            self.param_to_phi.insert(param, phi_idx);
            self.incomplete.entry(block.0).or_default().push(phi_idx);
            param
        } else {
            let preds = self.preds[block.index()].clone();
            if preds.len() == 1 {
                self.read_var(var, preds[0])
            } else if preds.is_empty() {
                // Read of a value with no reaching def (e.g. uninitialized): define 0.
                let z = self.f.append_inst(block, InstData::Iconst(0), ty);
                z.expect("non-void iconst has a result")
            } else {
                let param = self.f.append_block_param(block, ty);
                let phi_idx = self.phis.len();
                self.phis.push(Phi {
                    var,
                    block,
                    operands: Vec::new(),
                    sealed_operands: false,
                });
                self.param_to_phi.insert(param, phi_idx);
                // Break cycles: register the phi as the definition before recursing.
                self.write_var(var, block, param);
                self.add_phi_operands(phi_idx);
                param
            }
        };
        self.write_var(var, block, val);
        val
    }

    fn add_phi_operands(&mut self, phi_idx: usize) {
        let (var, block) = (self.phis[phi_idx].var, self.phis[phi_idx].block);
        let preds = self.preds[block.index()].clone();
        for pred in preds {
            let op = self.read_var(var, pred);
            self.phis[phi_idx].operands.push((pred, op));
        }
        self.phis[phi_idx].sealed_operands = true;
    }

    /// Marks a block's predecessor set complete; fills any phis that were created
    /// before the block was sealed.
    pub fn seal_block(&mut self, block: Block) {
        if self.sealed[block.index()] {
            return;
        }
        if let Some(list) = self.incomplete.remove(&block.0) {
            for phi_idx in list {
                if !self.phis[phi_idx].sealed_operands {
                    self.add_phi_operands(phi_idx);
                }
            }
        }
        self.sealed[block.index()] = true;
    }

    // ---- instruction emission (into the current block) ----

    fn emit(&mut self, data: InstData, ty: IrType) -> Value {
        self.f
            .append_inst(self.current, data, ty)
            .expect("emit of a value-producing instruction")
    }

    pub fn iconst(&mut self, c: i64, ty: IrType) -> Value {
        self.emit(InstData::Iconst(c), ty)
    }

    pub fn unary(&mut self, op: UnOp, arg: Value, ty: IrType) -> Value {
        self.emit(InstData::Unary { op, arg }, ty)
    }

    pub fn binary(&mut self, op: BinOp, lhs: Value, rhs: Value, ty: IrType) -> Value {
        self.emit(InstData::Binary { op, lhs, rhs }, ty)
    }

    pub fn icmp(&mut self, cond: Cond, lhs: Value, rhs: Value) -> Value {
        self.emit(InstData::Icmp { cond, lhs, rhs }, IrType::Bool)
    }

    pub fn cast(&mut self, op: CastOp, arg: Value, ty: IrType) -> Value {
        self.emit(InstData::Cast { op, arg }, ty)
    }

    pub fn load(&mut self, space: super::types::Space, addr: Value, ty: IrType) -> Value {
        self.emit(InstData::Load { space, addr }, ty)
    }

    pub fn store(&mut self, space: super::types::Space, addr: Value, val: Value) {
        self.f
            .append_inst(self.current, InstData::Store { space, addr, val }, IrType::Void);
    }

    pub fn stack_addr(&mut self, slot: StackSlot, ty: IrType) -> Value {
        self.emit(InstData::StackAddr(slot), ty)
    }

    pub fn symbol_addr(&mut self, name: impl Into<String>, ty: IrType) -> Value {
        self.emit(InstData::SymbolAddr(name.into()), ty)
    }

    pub fn hw_read(&mut self, reg: impl Into<String>, ty: IrType) -> Value {
        self.emit(InstData::HwRead(reg.into()), ty)
    }

    pub fn hw_write(&mut self, reg: impl Into<String>, val: Value) {
        self.f.append_inst(
            self.current,
            InstData::HwWrite {
                reg: reg.into(),
                val,
            },
            IrType::Void,
        );
    }

    pub fn call(&mut self, callee: impl Into<String>, args: Vec<Value>, ret: IrType) -> Option<Value> {
        self.f.append_inst(
            self.current,
            InstData::Call {
                callee: callee.into(),
                args,
            },
            ret,
        )
    }

    pub fn call_indirect(&mut self, ptr: Value, args: Vec<Value>, ret: IrType) -> Option<Value> {
        self.f
            .append_inst(self.current, InstData::CallIndirect { ptr, args }, ret)
    }

    // ---- terminators (also record CFG edges) ----

    fn record_edge(&mut self, from: Block, to: Block) {
        if !self.preds[to.index()].contains(&from) {
            self.preds[to.index()].push(from);
        }
    }

    pub fn jump(&mut self, target: Block) {
        let from = self.current;
        self.record_edge(from, target);
        self.f.append_inst(
            from,
            InstData::Jump {
                target,
                args: Vec::new(),
            },
            IrType::Void,
        );
        self.filled[from.index()] = true;
    }

    pub fn branch(&mut self, cond: Value, then_blk: Block, else_blk: Block) {
        let from = self.current;
        self.record_edge(from, then_blk);
        self.record_edge(from, else_blk);
        self.f.append_inst(
            from,
            InstData::Branch {
                cond,
                then_blk,
                then_args: Vec::new(),
                else_blk,
                else_args: Vec::new(),
            },
            IrType::Void,
        );
        self.filled[from.index()] = true;
    }

    pub fn ret(&mut self, val: Option<Value>) {
        let from = self.current;
        self.f
            .append_inst(from, InstData::Return { val }, IrType::Void);
        self.filled[from.index()] = true;
    }

    /// Declares a function parameter as an entry-block parameter and binds it to `var`.
    pub fn append_param(&mut self, var: VarId, ty: IrType) -> Value {
        let entry = self.f.entry;
        let v = self.f.append_block_param(entry, ty);
        self.write_var(var, entry, v);
        v
    }

    /// Seals any remaining open blocks and wires phi operands into predecessor
    /// terminator argument lists. Must be called exactly once when construction is done.
    pub fn finalize(mut self) -> IrFunction {
        // Seal everything still open (e.g. unreachable or forgotten blocks).
        let nblocks = self.f.num_blocks();
        for b in 0..nblocks as u32 {
            self.seal_block(Block(b));
        }

        // For each block, its params are: (entry only) ABI params, then phis in
        // creation order. Build, per (block, predecessor), the ordered operand list.
        // We rely on the fact that every non-entry block parameter is a phi.
        let mut per_block_phis: Vec<Vec<usize>> = vec![Vec::new(); self.f.num_blocks()];
        for (i, phi) in self.phis.iter().enumerate() {
            per_block_phis[phi.block.index()].push(i);
        }
        // params() order == append order == (entry abi params) then phi creation order.
        // Sort phi indices to match parameter append order for the block.
        for block in self.f.blocks() {
            let params = self.f.block_params(block).to_vec();
            // Map each phi param value to its phi index, in param order.
            let ordered: Vec<usize> = params
                .iter()
                .filter_map(|p| self.param_to_phi.get(p).copied())
                .collect();
            per_block_phis[block.index()] = ordered;
        }

        // Now wire predecessor terminators.
        for block in self.f.blocks() {
            let phi_list = per_block_phis[block.index()].clone();
            if phi_list.is_empty() {
                continue;
            }
            // operand lookup: (phi_idx, pred) -> value
            for &pred in &self.preds[block.index()].clone() {
                let mut args = Vec::with_capacity(phi_list.len());
                for &phi_idx in &phi_list {
                    let v = self.phis[phi_idx]
                        .operands
                        .iter()
                        .find(|(p, _)| *p == pred)
                        .map(|(_, v)| *v)
                        .expect("phi operand for predecessor");
                    args.push(v);
                }
                self.set_terminator_args(pred, block, args);
            }
        }

        self.f
    }

    fn set_terminator_args(&mut self, pred: Block, target: Block, args: Vec<Value>) {
        let term = self
            .f
            .terminator(pred)
            .expect("predecessor must be terminated");
        match self.f.inst_data_mut(term) {
            InstData::Jump {
                target: t,
                args: a,
            } => {
                debug_assert_eq!(*t, target);
                *a = args;
            }
            InstData::Branch {
                then_blk,
                then_args,
                else_blk,
                else_args,
                ..
            } => {
                if *then_blk == target {
                    *then_args = args.clone();
                }
                if *else_blk == target {
                    *else_args = args;
                }
            }
            _ => panic!("predecessor terminator is not a branch/jump"),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::print::print_function;
    use super::*;

    #[test]
    fn straightline_no_phi() {
        // x = 1; x = x + 2; return x
        let mut b = Builder::new("f", IrType::U8);
        let x = b.intern_var("x", IrType::U8);
        let c1 = b.iconst(1, IrType::U8);
        b.def_var(x, c1);
        let xv = b.use_var(x);
        let c2 = b.iconst(2, IrType::U8);
        let sum = b.binary(BinOp::Add, xv, c2, IrType::U8);
        b.def_var(x, sum);
        let r = b.use_var(x);
        b.ret(Some(r));
        b.seal_block(b.entry());
        let f = b.finalize();
        // No block parameters anywhere (single block).
        assert!(f.block_params(f.entry).is_empty());
        let txt = print_function(&f);
        assert!(txt.contains("return"));
    }

    #[test]
    fn if_diamond_creates_phi() {
        // if (c) x = 1 else x = 2; return x   -> merge block gets one phi param.
        let mut b = Builder::new("f", IrType::U8);
        let entry = b.entry();
        let then_b = b.create_block();
        let else_b = b.create_block();
        let merge = b.create_block();
        let x = b.intern_var("x", IrType::U8);

        // entry: branch on c
        let c = b.iconst(1, IrType::Bool);
        b.branch(c, then_b, else_b);
        b.seal_block(entry);

        // then: x = 1; jump merge
        b.switch_to_block(then_b);
        let c1 = b.iconst(1, IrType::U8);
        b.def_var(x, c1);
        b.jump(merge);
        b.seal_block(then_b);

        // else: x = 2; jump merge
        b.switch_to_block(else_b);
        let c2 = b.iconst(2, IrType::U8);
        b.def_var(x, c2);
        b.jump(merge);
        b.seal_block(else_b);

        // merge: return x  (x must resolve to a phi param)
        b.switch_to_block(merge);
        b.seal_block(merge);
        let xv = b.use_var(x);
        b.ret(Some(xv));

        let f = b.finalize();
        // merge should have exactly one block parameter (the phi for x).
        assert_eq!(f.block_params(merge).len(), 1);
        // both predecessors' jumps should carry one argument now.
        for pred in [then_b, else_b] {
            let term = f.terminator(pred).unwrap();
            if let InstData::Jump { args, .. } = f.inst_data(term) {
                assert_eq!(args.len(), 1, "jump should pass the phi operand");
            } else {
                panic!("expected jump");
            }
        }
    }

    #[test]
    fn loop_back_edge_phi() {
        // i = 0; loop { i = i + 1 } back-edge -> header gets a phi for i.
        let mut b = Builder::new("f", IrType::U8);
        let entry = b.entry();
        let header = b.create_block();
        let body = b.create_block();
        let i = b.intern_var("i", IrType::U8);

        let zero = b.iconst(0, IrType::U8);
        b.def_var(i, zero);
        b.jump(header);
        b.seal_block(entry);

        // header is NOT sealed yet (back-edge pending): read i -> incomplete phi
        b.switch_to_block(header);
        let iv = b.use_var(i);
        // header: branch to body or exit; keep simple: jump body
        b.jump(body);

        b.switch_to_block(body);
        let one = b.iconst(1, IrType::U8);
        let next = b.binary(BinOp::Add, iv, one, IrType::U8);
        b.def_var(i, next);
        b.jump(header); // back edge
        b.seal_block(body);

        // now header's predecessors (entry, body) are known -> seal it
        b.seal_block(header);

        let f = b.finalize();
        assert_eq!(
            f.block_params(header).len(),
            1,
            "loop header should have a phi for i"
        );
    }
}
