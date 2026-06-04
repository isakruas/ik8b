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

//! Dense-arena SSA IR in the style of Cranelift/MLIR.
//!
//! Values, blocks, and instructions are interned as dense `u32` indices so analyses
//! can use bitsets and flat vectors instead of `HashMap<String, _>`. Control flow
//! uses **block parameters** rather than phi nodes: a branch supplies an argument per
//! successor-block parameter, which keeps SSA destruction (out-of-SSA) a local,
//! per-edge parallel-copy problem.

use super::types::{IrType, Space};

/// An SSA value: the result of an instruction or a block parameter.
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub struct Value(pub u32);

/// A basic block.
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub struct Block(pub u32);

/// An instruction.
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub struct Inst(pub u32);

/// A function-local stack slot (a non-register local or array backing store).
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub struct StackSlot(pub u32);

impl Value {
    pub fn index(self) -> usize {
        self.0 as usize
    }
}
impl Block {
    pub fn index(self) -> usize {
        self.0 as usize
    }
}
impl Inst {
    pub fn index(self) -> usize {
        self.0 as usize
    }
}
impl StackSlot {
    pub fn index(self) -> usize {
        self.0 as usize
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum UnOp {
    Neg,
    Bnot,
    /// Logical not on a `Bool`.
    LogicalNot,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum BinOp {
    Add,
    Sub,
    Mul,
    /// Division; signedness comes from the result type.
    Div,
    /// Remainder; signedness comes from the result type.
    Rem,
    And,
    Or,
    Xor,
    Shl,
    /// Right shift; arithmetic when the operand type is signed, else logical.
    Shr,
}

/// Integer comparison condition.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Cond {
    Eq,
    Ne,
    /// Less-than; signedness taken from operand type.
    Lt,
    Le,
    Gt,
    Ge,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum CastOp {
    /// Narrow to a smaller width (drop high bits).
    Trunc,
    /// Widen, zero-extending.
    Zext,
    /// Widen, sign-extending.
    Sext,
}

/// The payload of an instruction. The result type is stored separately
/// (`IrFunction::value_types`) so passes can read a value's type uniformly whether
/// it is an instruction result or a block parameter.
#[derive(Clone, Debug)]
pub enum InstData {
    /// A typed integer/bool/pointer constant.
    Iconst(i64),
    Unary {
        op: UnOp,
        arg: Value,
    },
    Binary {
        op: BinOp,
        lhs: Value,
        rhs: Value,
    },
    Icmp {
        cond: Cond,
        lhs: Value,
        rhs: Value,
    },
    Cast {
        op: CastOp,
        arg: Value,
    },
    /// Load a scalar from `addr` in `space`.
    Load {
        space: Space,
        addr: Value,
    },
    /// Store `val` to `addr` in `space`. No result.
    Store {
        space: Space,
        addr: Value,
        val: Value,
    },
    /// The address of a stack slot (yields a `ptr<Ram>`).
    StackAddr(StackSlot),
    /// Load/store a stack slot directly. Spill rewriting uses these forms so reload
    /// addresses do not become extra SSA values competing for registers.
    LoadSlot {
        slot: StackSlot,
    },
    StoreSlot {
        slot: StackSlot,
        val: Value,
    },
    /// The address of a named symbol: a global, string literal, or function.
    SymbolAddr(String),
    /// Read a hardware/IO register named by the front end (`%NAME`).
    HwRead(String),
    /// Write `val` to a hardware/IO register. No result.
    HwWrite {
        reg: String,
        val: Value,
    },
    /// Direct call. Result is the callee return value (absent for `void`).
    Call {
        callee: String,
        args: Vec<Value>,
    },
    /// Indirect call through a function-pointer value.
    CallIndirect {
        ptr: Value,
        args: Vec<Value>,
    },
    // ---- terminators ----
    /// Unconditional jump, passing `args` to `target`'s block parameters.
    Jump {
        target: Block,
        args: Vec<Value>,
    },
    /// Conditional branch on a `Bool` value.
    Branch {
        cond: Value,
        then_blk: Block,
        then_args: Vec<Value>,
        else_blk: Block,
        else_args: Vec<Value>,
    },
    /// Return, optionally carrying a value.
    Return {
        val: Option<Value>,
    },
}

impl InstData {
    pub fn is_terminator(&self) -> bool {
        matches!(
            self,
            InstData::Jump { .. } | InstData::Branch { .. } | InstData::Return { .. }
        )
    }

    /// Calls/loads/hardware reads/stores have effects and must not be eliminated as
    /// dead even when their result is unused.
    pub fn has_side_effects(&self) -> bool {
        matches!(
            self,
            InstData::Store { .. }
                | InstData::StoreSlot { .. }
                | InstData::HwWrite { .. }
                | InstData::HwRead(_)
                | InstData::Load { .. }
                | InstData::LoadSlot { .. }
                | InstData::Call { .. }
                | InstData::CallIndirect { .. }
                | InstData::Jump { .. }
                | InstData::Branch { .. }
                | InstData::Return { .. }
        )
    }

    /// Visits each value operand, allowing in-place rewriting (used by copy/const
    /// propagation). Block-parameter argument lists are included.
    pub fn for_each_arg_mut(&mut self, mut f: impl FnMut(&mut Value)) {
        match self {
            InstData::Iconst(_)
            | InstData::StackAddr(_)
            | InstData::LoadSlot { .. }
            | InstData::SymbolAddr(_)
            | InstData::HwRead(_) => {}
            InstData::Unary { arg, .. } | InstData::Cast { arg, .. } => f(arg),
            InstData::Binary { lhs, rhs, .. } | InstData::Icmp { lhs, rhs, .. } => {
                f(lhs);
                f(rhs);
            }
            InstData::Load { addr, .. } => f(addr),
            InstData::Store { addr, val, .. } => {
                f(addr);
                f(val);
            }
            InstData::StoreSlot { val, .. } => f(val),
            InstData::HwWrite { val, .. } => f(val),
            InstData::Call { args, .. } => args.iter_mut().for_each(&mut f),
            InstData::CallIndirect { ptr, args } => {
                f(ptr);
                args.iter_mut().for_each(&mut f);
            }
            InstData::Jump { args, .. } => args.iter_mut().for_each(&mut f),
            InstData::Branch {
                cond,
                then_args,
                else_args,
                ..
            } => {
                f(cond);
                then_args.iter_mut().for_each(&mut f);
                else_args.iter_mut().for_each(&mut f);
            }
            InstData::Return { val } => {
                if let Some(v) = val {
                    f(v);
                }
            }
        }
    }

    /// Visits successor blocks (empty for non-terminators).
    pub fn for_each_succ(&self, mut f: impl FnMut(Block)) {
        match self {
            InstData::Jump { target, .. } => f(*target),
            InstData::Branch {
                then_blk, else_blk, ..
            } => {
                f(*then_blk);
                f(*else_blk);
            }
            _ => {}
        }
    }
}

/// How a value came to be (for printing and def-use queries).
#[derive(Clone, Copy, Debug)]
pub enum ValueDef {
    /// Result of an instruction.
    Result(Inst),
    /// The `n`th parameter of a block.
    Param(Block, u32),
}

#[derive(Clone, Debug)]
pub struct StackSlotData {
    pub size: u16,
    pub space: Space,
    /// Source name (for debugging/printing).
    pub name: String,
}

#[derive(Clone, Debug)]
struct BlockData {
    params: Vec<Value>,
    insts: Vec<Inst>,
}

/// A function in SSA form.
pub struct IrFunction {
    pub name: String,
    pub ret_ty: IrType,
    pub entry: Block,

    insts: Vec<InstData>,
    inst_result: Vec<Option<Value>>,

    value_types: Vec<IrType>,
    value_def: Vec<ValueDef>,

    blocks: Vec<BlockData>,
    stack_slots: Vec<StackSlotData>,
}

impl IrFunction {
    pub fn new(name: impl Into<String>, ret_ty: IrType) -> Self {
        let mut f = IrFunction {
            name: name.into(),
            ret_ty,
            entry: Block(0),
            insts: Vec::new(),
            inst_result: Vec::new(),
            value_types: Vec::new(),
            value_def: Vec::new(),
            blocks: Vec::new(),
            stack_slots: Vec::new(),
        };
        f.entry = f.new_block();
        f
    }

    // ---- arena construction ----

    pub fn new_block(&mut self) -> Block {
        let b = Block(self.blocks.len() as u32);
        self.blocks.push(BlockData {
            params: Vec::new(),
            insts: Vec::new(),
        });
        b
    }

    /// Adds a typed parameter to a block and returns its value.
    pub fn append_block_param(&mut self, block: Block, ty: IrType) -> Value {
        let idx = self.blocks[block.index()].params.len() as u32;
        let v = self.make_value(ty, ValueDef::Param(block, idx));
        self.blocks[block.index()].params.push(v);
        v
    }

    pub fn new_stack_slot(
        &mut self,
        size: u16,
        space: Space,
        name: impl Into<String>,
    ) -> StackSlot {
        let s = StackSlot(self.stack_slots.len() as u32);
        self.stack_slots.push(StackSlotData {
            size,
            space,
            name: name.into(),
        });
        s
    }

    fn make_value(&mut self, ty: IrType, def: ValueDef) -> Value {
        let v = Value(self.value_types.len() as u32);
        self.value_types.push(ty);
        self.value_def.push(def);
        v
    }

    /// Appends an instruction to `block`. Returns its result value when `ty != Void`.
    pub fn append_inst(&mut self, block: Block, data: InstData, ty: IrType) -> Option<Value> {
        let inst = Inst(self.insts.len() as u32);
        let has_result = !matches!(ty, IrType::Void) && !data.is_terminator();
        self.insts.push(data);
        let result = if has_result {
            Some(self.make_value(ty, ValueDef::Result(inst)))
        } else {
            None
        };
        self.inst_result.push(result);
        self.blocks[block.index()].insts.push(inst);
        result
    }

    // ---- accessors ----

    pub fn num_blocks(&self) -> usize {
        self.blocks.len()
    }
    pub fn num_values(&self) -> usize {
        self.value_types.len()
    }

    pub fn blocks(&self) -> impl Iterator<Item = Block> {
        (0..self.blocks.len() as u32).map(Block)
    }

    pub fn block_params(&self, block: Block) -> &[Value] {
        &self.blocks[block.index()].params
    }

    pub fn block_insts(&self, block: Block) -> &[Inst] {
        &self.blocks[block.index()].insts
    }

    pub fn inst_data(&self, inst: Inst) -> &InstData {
        &self.insts[inst.index()]
    }
    pub fn inst_data_mut(&mut self, inst: Inst) -> &mut InstData {
        &mut self.insts[inst.index()]
    }
    pub fn inst_result(&self, inst: Inst) -> Option<Value> {
        self.inst_result[inst.index()]
    }

    pub fn value_type(&self, v: Value) -> IrType {
        self.value_types[v.index()]
    }
    pub fn value_def(&self, v: Value) -> ValueDef {
        self.value_def[v.index()]
    }

    pub fn stack_slot(&self, s: StackSlot) -> &StackSlotData {
        &self.stack_slots[s.index()]
    }
    pub fn stack_slots(&self) -> impl Iterator<Item = StackSlot> {
        (0..self.stack_slots.len() as u32).map(StackSlot)
    }

    /// The terminator instruction of a block, if the block has been finished.
    pub fn terminator(&self, block: Block) -> Option<Inst> {
        self.blocks[block.index()]
            .insts
            .last()
            .copied()
            .filter(|&i| self.insts[i.index()].is_terminator())
    }

    pub fn successors(&self, block: Block) -> Vec<Block> {
        let mut succs = Vec::new();
        if let Some(term) = self.terminator(block) {
            self.insts[term.index()].for_each_succ(|b| succs.push(b));
        }
        succs
    }

    /// Predecessor blocks of every block, computed on demand.
    pub fn predecessors(&self) -> Vec<Vec<Block>> {
        let mut preds = vec![Vec::new(); self.blocks.len()];
        for b in self.blocks() {
            for s in self.successors(b) {
                if !preds[s.index()].contains(&b) {
                    preds[s.index()].push(b);
                }
            }
        }
        preds
    }
}
