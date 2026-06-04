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

//! Textual dump of the SSA IR, for `--emit-ir` and unit-test snapshots.

use super::function::*;
use std::fmt::Write;

fn fmt_val(v: Value) -> String {
    format!("v{}", v.0)
}

fn fmt_block(b: Block) -> String {
    format!("bb{}", b.0)
}

fn fmt_args(vals: &[Value]) -> String {
    vals.iter()
        .map(|v| fmt_val(*v))
        .collect::<Vec<_>>()
        .join(", ")
}

pub fn print_function(f: &IrFunction) -> String {
    let mut out = String::new();
    let _ = writeln!(out, "fn {}() -> {} {{", f.name, f.ret_ty);

    for slot in f.stack_slots() {
        let d = f.stack_slot(slot);
        let _ = writeln!(out, "  ss{} = stack_slot {} ; {}", slot.0, d.size, d.name);
    }

    for b in f.blocks() {
        let params = f.block_params(b);
        if params.is_empty() {
            let _ = writeln!(out, "{}:", fmt_block(b));
        } else {
            let plist = params
                .iter()
                .map(|v| format!("{}: {}", fmt_val(*v), f.value_type(*v)))
                .collect::<Vec<_>>()
                .join(", ");
            let _ = writeln!(out, "{}({}):", fmt_block(b), plist);
        }
        for &inst in f.block_insts(b) {
            let _ = writeln!(out, "  {}", fmt_inst(f, inst));
        }
    }
    let _ = writeln!(out, "}}");
    out
}

fn fmt_inst(f: &IrFunction, inst: Inst) -> String {
    let data = f.inst_data(inst);
    let prefix = match f.inst_result(inst) {
        Some(v) => format!("{}: {} = ", fmt_val(v), f.value_type(v)),
        None => String::new(),
    };
    let body = match data {
        InstData::Iconst(c) => format!("iconst {}", c),
        InstData::Unary { op, arg } => format!("{:?} {}", op, fmt_val(*arg)),
        InstData::Binary { op, lhs, rhs } => {
            format!("{:?} {}, {}", op, fmt_val(*lhs), fmt_val(*rhs))
        }
        InstData::Icmp { cond, lhs, rhs } => {
            format!("icmp.{:?} {}, {}", cond, fmt_val(*lhs), fmt_val(*rhs))
        }
        InstData::Cast { op, arg } => format!("{:?} {}", op, fmt_val(*arg)),
        InstData::Load { space, addr } => format!("load.{:?} {}", space, fmt_val(*addr)),
        InstData::Store { space, addr, val } => {
            format!("store.{:?} {}, {}", space, fmt_val(*addr), fmt_val(*val))
        }
        InstData::StackAddr(s) => format!("stack_addr ss{}", s.0),
        InstData::LoadSlot { slot } => format!("load_slot ss{}", slot.0),
        InstData::StoreSlot { slot, val } => {
            format!("store_slot ss{}, {}", slot.0, fmt_val(*val))
        }
        InstData::SymbolAddr(name) => format!("symbol_addr {}", name),
        InstData::HwRead(reg) => format!("hw_read {}", reg),
        InstData::HwWrite { reg, val } => format!("hw_write {}, {}", reg, fmt_val(*val)),
        InstData::Call { callee, args } => format!("call {}({})", callee, fmt_args(args)),
        InstData::CallIndirect { ptr, args } => {
            format!("call_indirect {}({})", fmt_val(*ptr), fmt_args(args))
        }
        InstData::Jump { target, args } => {
            if args.is_empty() {
                format!("jump {}", fmt_block(*target))
            } else {
                format!("jump {}({})", fmt_block(*target), fmt_args(args))
            }
        }
        InstData::Branch {
            cond,
            then_blk,
            then_args,
            else_blk,
            else_args,
        } => format!(
            "branch {}, {}({}), {}({})",
            fmt_val(*cond),
            fmt_block(*then_blk),
            fmt_args(then_args),
            fmt_block(*else_blk),
            fmt_args(else_args)
        ),
        InstData::Return { val } => match val {
            Some(v) => format!("return {}", fmt_val(*v)),
            None => "return".to_string(),
        },
    };
    format!("{}{}", prefix, body)
}
