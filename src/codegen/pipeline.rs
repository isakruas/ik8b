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

//! Top-level compiler pipeline orchestration from parsed AST to symbolic instructions.

use super::*;
use super::model::InterruptBinding;
use crate::parser::{Expr, Stmt};
use crate::vectors::device_vectors;
use std::collections::{HashMap, HashSet, VecDeque};

impl CodeGenerator {
    /// Clears compilation products while preserving target configuration.
    pub(super) fn reset_for_compile(&mut self) {
        self.instructions.clear();
        self.sram_free_ptr = self.sram_start;
        self.eeprom_free_ptr = 0;
        self.warnings.clear();
    }

    /// Validates interrupt declarations and maps them to vector-table labels.
    pub(super) fn collect_interrupt_bindings(
        &self,
        ast: &[ASTNode],
    ) -> Result<Vec<InterruptBinding>, String> {
        let mut bindings = Vec::new();
        for node in ast {
            let ASTNode::Isr { vector, .. } = node else {
                continue;
            };
            let index = vector_index(&self.device_name, vector).ok_or_else(|| {
                format!(
                    "Interrupt Error: device '{}' has no interrupt vector '{}'. Use a vector name supported by this device (per its datasheet), or a numeric index within range.",
                    self.device_name, vector
                )
            })?;
            if index == 0 {
                return Err(format!(
                    "Interrupt Error: 'isr {}' targets RESET (vector 0). RESET is reserved for startup and cannot be bound as an ISR.",
                    vector
                ));
            }
            if bindings.iter().any(|binding: &InterruptBinding| binding.index == index) {
                return Err(format!(
                    "Interrupt Error: duplicate ISR binding for vector index {} on device '{}'.",
                    index, self.device_name
                ));
            }
            bindings.push(InterruptBinding {
                index,
                label: format!("__isr_{}", vector),
            });
        }
        Ok(bindings)
    }

    /// Emits one vector-table slot using the instruction width required by the core family.
    pub(super) fn emit_vector_jump(&mut self, label: &str) {
        if self.target_core == TargetCore::AVRrc {
            self.emit(Pass1Inst::RJumpL(label.to_string()));
        } else {
            self.emit(Pass1Inst::JmpAbsL(label.to_string()));
        }
    }

    /// Emits the reset stack-pointer initialisation (SP = RAMEND through r16).
    /// Modern cores reset SP to RAMEND in hardware, but classic AT90S parts
    /// reset it to 0, so every image sets it explicitly — SPL/SPH sit at I/O
    /// 0x3D/0x3E on every AVR core family. SPH is written only when RAMEND
    /// needs more than eight bits; parts with no SRAM (hardware stack) skip it.
    fn emit_sp_init(&mut self) {
        let Some(dev) = crate::devices::lookup_device(&self.device_name) else {
            return;
        };
        if dev.sram_size == 0 {
            return;
        }
        let ramend = dev.sram_start as u32 + dev.sram_size - 1;
        let lo = (ramend & 0xFF) as u16;
        self.emit(Pass1Inst::Op(0xE000 | ((lo & 0xF0) << 4) | (lo & 0x0F))); // LDI r16, lo(RAMEND)
        self.emit(Pass1Inst::Op(0xBF0D)); // OUT SPL (0x3D), r16
        if ramend > 0xFF {
            let hi = ((ramend >> 8) & 0xFF) as u16;
            self.emit(Pass1Inst::Op(0xE000 | ((hi & 0xF0) << 4) | (hi & 0x0F))); // LDI r16, hi(RAMEND)
            self.emit(Pass1Inst::Op(0xBF0E)); // OUT SPH (0x3E), r16
        }
    }

    /// Emits reset/interrupt vectors plus the startup trampoline.
    pub(super) fn emit_startup(&mut self, bindings: &[InterruptBinding]) {
        if let Some(total_slots) = vector_slot_count(&self.device_name) {
            let mut needs_default_isr = false;

            self.emit_vector_jump("__start");
            for slot in 1..total_slots {
                if let Some(binding) = bindings.iter().find(|binding| binding.index as usize == slot)
                {
                    self.emit_vector_jump(&binding.label);
                } else {
                    self.emit_vector_jump("__default_isr");
                    needs_default_isr = true;
                }
            }

            self.emit(Pass1Inst::Label("__start".to_string()));
            self.emit_sp_init();
            self.emit(Pass1Inst::RCallL("@main".to_string()));
            self.emit(Pass1Inst::Op(0xFFFF));
            if needs_default_isr {
                self.emit(Pass1Inst::Label("__default_isr".to_string()));
                self.emit(Pass1Inst::Op(0x9518)); // RETI
            }
        } else {
            self.emit_sp_init();
            self.emit(Pass1Inst::RCallL("@main".to_string()));
            self.emit(Pass1Inst::Op(0xFFFF));
        }
    }

    /// Computes the callable frontier rooted at `@main` and all ISR bodies.
    pub(super) fn compute_reachable_functions(&self, ast: &[ASTNode]) -> HashSet<String> {
        let mut call_map: HashMap<String, HashSet<String>> = HashMap::new();
        for node in ast {
            if let ASTNode::Func { name, body, .. } = node {
                let mut calls = HashSet::new();
                for stmt in body {
                    collect_calls_stmt(stmt, &mut calls);
                }
                call_map.insert(name.clone(), calls);
            }
        }

        let mut reachable = HashSet::new();
        let mut queue = VecDeque::new();
        reachable.insert("@main".to_string());
        queue.push_back("@main".to_string());

        for node in ast {
            if let ASTNode::Isr { vector, body } = node {
                // The ISR itself is a root: it is reached by the hardware vector table, not
                // by any call, so seed it (and everything it calls) into the frontier.
                reachable.insert(format!("__isr_{}", vector));
                let mut calls = HashSet::new();
                for stmt in body {
                    collect_calls_stmt(stmt, &mut calls);
                }
                for call in calls {
                    if reachable.insert(call.clone()) {
                        queue.push_back(call);
                    }
                }
            }
        }

        while let Some(current) = queue.pop_front() {
            if let Some(calls) = call_map.get(&current) {
                for call in calls {
                    if reachable.insert(call.clone()) {
                        queue.push_back(call.clone());
                    }
                }
            }
        }

        reachable
    }

    /// Rejects hardware constants that alias compiler-owned SRAM.
    pub(super) fn validate_hardware_aliases(&self, ast: &[ASTNode]) -> Result<(), String> {
        for node in ast {
            let ASTNode::Const { name, value, .. } = node else {
                continue;
            };
            if !name.starts_with('%') {
                continue;
            }
            let addr = *value as u16;
            if addr >= self.sram_start && addr < self.sram_free_ptr {
                return Err(format!(
                    "Memory Error: Hardware conflict: Constant '{}' points to address 0x{:04X}, which overlaps with the compiler-allocated SRAM variable space [0x{:04X}, 0x{:04X})",
                    name, addr, self.sram_start, self.sram_free_ptr
                ));
            }
        }
        Ok(())
    }

    /// Full backend pipeline from parsed AST to pass-1 symbolic instructions.
    pub fn compile(&mut self, ast: &[ASTNode]) -> Result<Vec<Pass1Inst>, String> {
        self.reset_for_compile();
        let ast = ast.to_vec();

        // Collect named constant / hardware-register addresses (name without `%`).
        let mut consts: HashMap<String, u16> = HashMap::new();
        for node in &ast {
            if let ASTNode::Const { name, value, .. } = node {
                let key = name.strip_prefix('%').unwrap_or(name).to_string();
                consts.insert(key, *value as u16);
            }
        }

        let interrupt_bindings = self.collect_interrupt_bindings(&ast)?;
        self.emit_startup(&interrupt_bindings);

        let reachable = self.compute_reachable_functions(&ast);

        // Lower only the reachable functions (type inference still has full context via
        // ProgramInfo, which is built from the whole AST), then optimize each.
        let lowered = build_ast::lower_program(&ast, &reachable, &mut self.warnings)?;
        let mut ir_funcs: HashMap<String, function::IrFunction> = HashMap::new();
        for f in lowered {
            let name = f.name.clone();
            ir_funcs.insert(name, opt::optimize(f));
        }

        // Allocate RAM string literals (`$str:`) in SRAM (initialized by @main at startup),
        // and collect flash-resident strings (`$fstr:`) for emission into the flash image
        // (read on demand via LPM, never copied to SRAM). Scan functions in a deterministic
        // (sorted) order so the resulting layout — and the whole build — is reproducible.
        let mut str_data: HashMap<String, u16> = HashMap::new();
        let mut flash_strings: Vec<String> = Vec::new();
        let mut sram_cursor = self.sram_start;
        let mut eeprom_cursor = 0u16;
        let mut fn_names: Vec<&String> = ir_funcs.keys().collect();
        fn_names.sort();
        for fname in fn_names {
            let f = &ir_funcs[fname];
            for b in f.blocks() {
                for &inst in f.block_insts(b) {
                    if let function::InstData::SymbolAddr(name) = f.inst_data(inst) {
                        if let Some(content) = name.strip_prefix("$str:") {
                            if !str_data.contains_key(name) {
                                str_data.insert(name.clone(), sram_cursor);
                                sram_cursor += content.chars().count() as u16 + 1;
                            }
                        } else if name.starts_with("$fstr:") && !flash_strings.contains(name) {
                            flash_strings.push(name.clone());
                        }
                    }
                }
            }
        }

        // Emit @main first, then the rest, each in a disjoint SRAM region. The `bool` marks
        // ISR functions, which get an interrupt-safe prologue/epilogue and return via RETI.
        let mut order: Vec<(String, bool)> = Vec::new();
        if reachable.contains("@main") {
            order.push(("@main".to_string(), false));
        }
        for node in &ast {
            if let ASTNode::Func { name, .. } = node {
                if name != "@main" && reachable.contains(name) {
                    order.push((name.clone(), false));
                }
            }
        }
        for node in &ast {
            if let ASTNode::Isr { vector, .. } = node {
                order.push((format!("__isr_{}", vector), true));
            }
        }

        // Return-address bytes a CALL leaves on the stack; the callee needs this
        // to locate stack-passed arguments above the frame. ik8bvm stacks a
        // 16-bit return address for every core, so 2 is the whole-toolchain
        // convention today. Real parts with >128 KB flash (22-bit PC) push 3
        // bytes — when ik8bvm models that, switch on flash_size here too.
        let ret_addr_bytes = 2u8;

        for (idx, (name, is_isr)) in order.iter().enumerate() {
            let f = ir_funcs
                .get(name)
                .ok_or_else(|| format!("no IR for {}", name))?;
            let emitted = emit_avr::emit_function(
                f,
                name,
                self.target_core,
                sram_cursor,
                eeprom_cursor,
                name == "@main",
                *is_isr,
                idx,
                &consts,
                &str_data,
                ret_addr_bytes,
            )?;
            // Reserve the SRAM region the function actually used, including spill slots.
            sram_cursor += emitted.sram_used;
            eeprom_cursor += emitted.eeprom_used;
            // Peak register pressure across functions; total spills program-wide.
            self.regs_used = self.regs_used.max(emitted.regs_used);
            self.spills += emitted.spills;
            for inst in emitted.insts {
                self.emit(inst);
            }
        }

        // Emit fixed-point runtime routines if any function calls them.
        let uses_fmul = ir_funcs.values().any(|f| {
            f.blocks().any(|b| {
                f.block_insts(b).iter().any(|&i| {
                    matches!(
                        f.inst_data(i),
                        function::InstData::Call { callee, .. }
                        if callee == "@__fmul16"
                    )
                })
            })
        });
        let uses_fdiv = ir_funcs.values().any(|f| {
            f.blocks().any(|b| {
                f.block_insts(b).iter().any(|&i| {
                    matches!(
                        f.inst_data(i),
                        function::InstData::Call { callee, .. }
                        if callee == "@__fdiv16"
                    )
                })
            })
        });
        if (uses_fmul || uses_fdiv) && self.target_core == TargetCore::AVRrc {
            return Err(
                "Memory Error: fixed-point runtime is not supported on AVRrc architecture cores"
                    .to_string(),
            );
        }
        if uses_fmul && !self.target_core.supports_mul() {
            return Err(
                "Memory Error: fixed-point multiply requires a hardware multiplier".to_string(),
            );
        }
        if uses_fmul || uses_fdiv {
            for inst in emit_avr::fixed_point_runtime() {
                self.emit(inst);
            }
        }

        // Flash data section: emit each flash-resident string's bytes (NUL-terminated, packed
        // two-per-word little-endian) behind a label that the LPM byte address resolves to.
        // Placed after all code so it is never executed; `flash str` data lives here, not SRAM.
        for name in &flash_strings {
            let content = name.strip_prefix("$fstr:").unwrap_or(name);
            self.emit(Pass1Inst::Label(name.clone()));
            let mut bytes: Vec<u8> = content.chars().map(|c| c as u8).collect();
            bytes.push(0);
            for pair in bytes.chunks(2) {
                let lo = pair[0] as u16;
                let hi = *pair.get(1).unwrap_or(&0) as u16;
                self.emit(Pass1Inst::DataWord(lo | (hi << 8)));
            }
        }

        self.sram_free_ptr = sram_cursor;
        self.eeprom_free_ptr = eeprom_cursor;
        self.validate_hardware_aliases(&ast)?;

        // Refuse layouts with no headroom for the call stack. The stack grows down from
        // RAMEND; if static SRAM data fills (almost) all of SRAM, the first calls silently
        // clobber that data. Turn that into a clear compile error instead of corruption.
        if let Some(dev) = crate::devices::lookup_device(&self.device_name) {
            if dev.sram_size > 0 {
                const MIN_STACK_BYTES: u32 = 32;
                let used = sram_cursor.saturating_sub(self.sram_start) as u32;
                if used + MIN_STACK_BYTES > dev.sram_size {
                    return Err(format!(
                        "Memory Error: static SRAM data ({} B) leaves under {} B for the call stack on '{}' ({} B SRAM). Move large constant tables to flash (e.g. `flash str`) or target a device with more SRAM.",
                        used, MIN_STACK_BYTES, self.device_name, dev.sram_size
                    ));
                }
            }
        }

        Ok(self.instructions.clone())
    }
}

fn collect_calls_stmt(stmt: &Stmt, out: &mut HashSet<String>) {
    match stmt {
        Stmt::VarDecl { expr, .. } => collect_calls_expr(expr, out),
        Stmt::Assign { expr, target, .. } => {
            collect_calls_expr(target, out);
            collect_calls_expr(expr, out);
        }
        Stmt::LoopInfinite { body } => collect_calls_stmts(body, out),
        Stmt::LoopRange {
            start, end, body, ..
        } => {
            collect_calls_expr(start, out);
            collect_calls_expr(end, out);
            collect_calls_stmts(body, out);
        }
        Stmt::Conditional {
            cond,
            then_block,
            else_block,
        } => {
            collect_calls_expr(cond, out);
            collect_calls_stmts(then_block, out);
            if let Some(block) = else_block {
                collect_calls_stmts(block, out);
            }
        }
        Stmt::Switch {
            expr,
            cases,
            default,
        } => {
            collect_calls_expr(expr, out);
            for (case_expr, body) in cases {
                collect_calls_expr(case_expr, out);
                collect_calls_stmts(body, out);
            }
            if let Some(body) = default {
                collect_calls_stmts(body, out);
            }
        }
        Stmt::Return { val } => {
            if let Some(expr) = val {
                collect_calls_expr(expr, out);
            }
        }
        Stmt::ExprStmt { expr } => collect_calls_expr(expr, out),
    }
}

fn collect_calls_stmts(stmts: &[Stmt], out: &mut HashSet<String>) {
    for stmt in stmts {
        collect_calls_stmt(stmt, out);
    }
}

fn collect_calls_expr(expr: &Expr, out: &mut HashSet<String>) {
    match expr {
        Expr::AddrOf(inner) => {
            if let Expr::VarRef(name) = inner.as_ref() {
                if name.starts_with('@') {
                    out.insert(name.clone());
                }
            }
            collect_calls_expr(inner, out);
        }
        Expr::Deref(inner) | Expr::UnaryOp { expr: inner, .. } => collect_calls_expr(inner, out),
        Expr::BinOp { left, right, .. } => {
            collect_calls_expr(left, out);
            collect_calls_expr(right, out);
        }
        Expr::Call { name, args } => {
            out.insert(name.clone());
            for arg in args {
                collect_calls_expr(arg, out);
            }
        }
        Expr::Literal(_) | Expr::FloatLiteral(_) | Expr::StringLit(_) | Expr::VarRef(_) => {}
    }
}

fn vector_slot_count(device: &str) -> Option<usize> {
    device_vectors(device).map(|vectors| vectors.len())
}

fn vector_index(device: &str, vector: &str) -> Option<u8> {
    device_vectors(device)?
        .iter()
        .position(|names| names.iter().any(|name| *name == vector))
        .map(|idx| idx as u8)
}
