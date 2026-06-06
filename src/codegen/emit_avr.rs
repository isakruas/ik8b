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

//! AVR instruction selection: turns an allocated `IrFunction` into
//! symbolic `Pass1Inst`s consumed by the existing assembler (label resolution, branch
//! relaxation, Intel HEX). This is the machine-dependent tail of the pipeline.

use super::coloring::Allocation;
use super::function::*;
use super::regalloc;
use super::spill;
use super::types::{Space, Width};
use crate::codegen::{Pass1Inst, TargetCore};
use std::collections::HashMap;

/// Registers the allocator may use, in preference order. r0/r1 are reserved (r1 == 0),
/// r16/r17 are immediate/store scratch, r26..r31 are X/Y/Z addressing scratch.
const ALLOC_POOL: &[u8] = &[
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 18, 19, 20, 21, 22, 23, 24, 25,
];
const ALLOC_POOL_RC: &[u8] = &[18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28];

/// Registers preserved across a call (the AVR callee-saved set that is also in our pool).
/// Values live across a call are constrained to these so the call's clobber is harmless.
const CALLEE_SAVED: &[u8] = &[2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const CALLEE_SAVED_RC: &[u8] = &[26, 27, 28];

/// Scratch register for materializing immediates into low registers and routing store
/// sources (so `$ok` lands in r16 at program end, matching the test observation point).
const SCR_LO: u8 = 16;
const SCR_HI: u8 = 17;

/// Emits a function's prologue, body, and epilogue. `is_main` suppresses callee-saved
/// preservation (the root never returns to a caller that needs registers preserved) and
/// `label_base` keeps generated block labels unique across functions.
/// Emits a function, returning its instructions and the number of SRAM bytes it reserved
/// for stack slots (including any spill slots, which the caller must not overlap).
pub fn emit_function(
    f: &IrFunction,
    name: &str,
    target_core: TargetCore,
    sram_base: u16,
    eeprom_base: u16,
    is_main: bool,
    is_isr: bool,
    label_base: usize,
    consts: &HashMap<String, u16>,
    str_data: &HashMap<String, u16>,
) -> Result<EmittedFunction, String> {
    // Allocate; on spill, rewrite the function to materialize spilled values through stack
    // slots and re-allocate, iterating to a fixpoint (the classic Chaitin spill loop).
    let mut owned: Option<IrFunction> = None;
    let alloc;
    let mut iters = 0;
    // Distinct values spilled to memory across all spill iterations (a usage stat).
    let mut spill_nodes: std::collections::HashSet<usize> = std::collections::HashSet::new();
    loop {
        let fref: &IrFunction = owned.as_ref().unwrap_or(f);
        let (alloc_pool, callee_saved) = register_sets(target_core);
        let (a, _) = regalloc::allocate(fref, alloc_pool.to_vec(), callee_saved);
        if a.spilled.is_empty() {
            alloc = a;
            break;
        }
        for &n in &a.spilled {
            spill_nodes.insert(n);
        }
        iters += 1;
        if iters > 10 {
            return Err(format!("backend: spilling did not converge in {}", name));
        }
        let spilled: std::collections::HashSet<u32> =
            a.spilled.iter().map(|&n| n as u32).collect();
        owned = Some(spill::rewrite(fref, &spilled));
    }

    let fref: &IrFunction = owned.as_ref().unwrap_or(f);
    let (_, callee_saved) = register_sets(target_core);
    let mut e = Emitter::new(
        fref,
        alloc,
        target_core,
        sram_base,
        eeprom_base,
        label_base,
        consts,
        str_data,
        callee_saved,
        is_isr,
    );
    e.run(name, is_main)?;
    let sram_used = e.sram_used;
    let eeprom_used = e.eeprom_used;

    // Distinct hardware registers occupied by this function. A 16-bit value
    // holds both its color register and the next one, so count the high half.
    let mut regs: std::collections::HashSet<u8> = std::collections::HashSet::new();
    for (&node, &reg) in &e.alloc.colors {
        regs.insert(reg);
        if fref.value_type(Value(node as u32)).width() == Width::W16 {
            regs.insert(reg + 1);
        }
    }

    Ok(EmittedFunction {
        insts: e.out,
        sram_used,
        eeprom_used,
        regs_used: regs.len() as u32,
        spills: spill_nodes.len() as u32,
    })
}

/// What `emit_function` produces: the instruction stream plus the resource and
/// register-allocation usage figures the IDE's stats panel reports.
pub struct EmittedFunction {
    pub insts: Vec<Pass1Inst>,
    pub sram_used: u16,
    pub eeprom_used: u16,
    pub regs_used: u32,
    pub spills: u32,
}

fn register_sets(target_core: TargetCore) -> (&'static [u8], &'static [u8]) {
    if target_core == TargetCore::AVRrc {
        (ALLOC_POOL_RC, CALLEE_SAVED_RC)
    } else {
        (ALLOC_POOL, CALLEE_SAVED)
    }
}

struct Emitter<'a> {
    f: &'a IrFunction,
    alloc: Allocation,
    target_core: TargetCore,
    sram_base: u16,
    eeprom_base: u16,
    label_base: usize,
    out: Vec<Pass1Inst>,
    /// Stack slot -> SRAM byte address.
    slot_addr: HashMap<u32, u16>,
    /// Callee-saved registers actually used (push/pop set).
    used_callee: Vec<u8>,
    /// Monotonic counter for locally-generated labels (division loops, branch trampolines).
    next_lbl: usize,
    /// Hardware/IO register and named-constant addresses (name without `%` -> data addr).
    consts: &'a HashMap<String, u16>,
    /// String-literal symbol name (`$str:...`) -> SRAM base address.
    str_data: &'a HashMap<String, u16>,
    callee_saved: &'static [u8],
    /// SRAM bytes reserved for this function's stack slots (incl. spill slots).
    sram_used: u16,
    /// EEPROM bytes reserved for this function's EEPROM-backed slots.
    eeprom_used: u16,
    /// This function is an interrupt service routine: it must preserve every register it
    /// clobbers plus SREG, and return via RETI instead of RET.
    is_isr: bool,
    /// Registers pushed by the ISR prologue (in ascending order); the epilogue pops them in
    /// reverse. r0/r1/SREG are handled separately and are not listed here.
    isr_saved: Vec<u8>,
    /// True when the ISR prologue saved the full interrupt frame (r0, SREG, r1). A trivial
    /// ISR (no body instructions) skips the frame and returns with a bare RETI.
    isr_full_frame: bool,
}

impl<'a> Emitter<'a> {
    fn new(
        f: &'a IrFunction,
        alloc: Allocation,
        target_core: TargetCore,
        sram_base: u16,
        eeprom_base: u16,
        label_base: usize,
        consts: &'a HashMap<String, u16>,
        str_data: &'a HashMap<String, u16>,
        callee_saved: &'static [u8],
        is_isr: bool,
    ) -> Self {
        Emitter {
            f,
            alloc,
            target_core,
            sram_base,
            eeprom_base,
            label_base,
            out: Vec::new(),
            slot_addr: HashMap::new(),
            used_callee: Vec::new(),
            next_lbl: 0,
            consts,
            str_data,
            callee_saved,
            sram_used: 0,
            eeprom_used: 0,
            is_isr,
            isr_saved: Vec::new(),
            isr_full_frame: false,
        }
    }

    fn uniq(&mut self, tag: &str) -> String {
        self.next_lbl += 1;
        format!("__nb_{}_{}_{}", self.label_base, tag, self.next_lbl)
    }

    fn emit(&mut self, op: u16) {
        self.out.push(Pass1Inst::Op(op));
    }

    /// PUSH Rr  (1001 001r rrrr 1111).
    fn emit_push(&mut self, r: u8) {
        self.emit(0x920F | ((r as u16) << 4));
    }

    /// POP Rr  (1001 000r rrrr 1111).
    fn emit_pop(&mut self, r: u8) {
        self.emit(0x900F | ((r as u16) << 4));
    }

    fn block_label(&self, b: Block) -> String {
        format!("__nb_{}_{}", self.label_base, b.0)
    }

    /// Physical low register assigned to a value.
    fn reg(&self, v: Value) -> Result<u8, String> {
        self.alloc
            .colors
            .get(&v.index())
            .copied()
            .ok_or_else(|| format!("value v{} has no register", v.0))
    }

    fn is_pair(&self, v: Value) -> bool {
        self.f.value_type(v).width() == Width::W16
    }

    fn run(&mut self, name: &str, is_main: bool) -> Result<(), String> {
        // Assign SRAM addresses to stack slots.
        let mut sram_cursor = self.sram_base;
        let mut eeprom_cursor = self.eeprom_base;
        for s in self.f.stack_slots() {
            let data = self.f.stack_slot(s);
            let cursor = match data.space {
                Space::Eeprom => &mut eeprom_cursor,
                Space::Ram | Space::Flash => &mut sram_cursor,
            };
            self.slot_addr.insert(s.0, *cursor);
            *cursor += data.size.max(1);
        }
        self.sram_used = sram_cursor - self.sram_base;
        self.eeprom_used = eeprom_cursor - self.eeprom_base;

        if self.is_isr {
            self.run_isr_prologue(name);
        } else {
            // Determine callee-saved registers used by the allocation (r2..r17). A 16-bit
            // value occupies BOTH its color register and the next one, so the high byte must
            // be preserved too — otherwise a pair like r6:r7 only pushes r6 and clobbers r7.
            let mut used: Vec<u8> = Vec::new();
            for (&node, &reg) in &self.alloc.colors {
                let pair = self.f.value_type(Value(node as u32)).width() == Width::W16;
                for r in [reg, reg + 1].iter().take(if pair { 2 } else { 1 }) {
                    if self.callee_saved.contains(r) {
                        used.push(*r);
                    }
                }
            }
            used.sort_unstable();
            used.dedup();
            self.used_callee = if is_main { Vec::new() } else { used };

            self.out.push(Pass1Inst::Label(name.to_string()));

            // Prologue: clear r1 (codegen assumes r1==0), push callee-saved.
            self.emit(0x2411); // CLR R1 (EOR R1,R1)
            let callee = self.used_callee.clone();
            for &r in &callee {
                self.emit(0x920F | ((r as u16) << 4)); // PUSH
            }
        }

        // @main initializes string literals in SRAM before any code can read them.
        if is_main {
            self.emit_string_inits();
        }

        // Bind ABI parameters (entry block params) to their assigned registers.
        self.emit_param_moves()?;

        // Emit blocks in layout order (entry first, then numeric order).
        let blocks: Vec<Block> = self.f.blocks().collect();
        for &b in &blocks {
            self.out.push(Pass1Inst::Label(self.block_label(b)));
            self.emit_block(b)?;
        }

        Ok(())
    }

    /// Emits the entry label and prologue for an interrupt service routine.
    ///
    /// Unlike a normal function (which only preserves the callee-saved subset and relies on
    /// its caller having saved the scratch registers), an ISR can fire between any two
    /// instructions of arbitrary code, so it must leave EVERY register and the status
    /// register exactly as it found them. The saved set is therefore the union of every
    /// register the allocator assigned (with 16-bit pairs counted in full) and the fixed
    /// scratch registers the emitter may clobber (immediate/store scratch r16:r17 and the
    /// X/Y/Z addressing and mul/div scratch r26..r31). r0, SREG and r1 are saved explicitly.
    ///
    /// A trivial ISR with no body instructions clobbers nothing and returns with a bare RETI.
    fn run_isr_prologue(&mut self, name: &str) {
        let has_work = self
            .f
            .blocks()
            .any(|b| self.f.block_insts(b).iter().any(|&i| !self.f.inst_data(i).is_terminator()));

        let mut saved: Vec<u8> = Vec::new();
        if has_work {
            for (&node, &reg) in &self.alloc.colors {
                let pair = self.f.value_type(Value(node as u32)).width() == Width::W16;
                for r in [reg, reg + 1].iter().take(if pair { 2 } else { 1 }) {
                    saved.push(*r);
                }
            }
            // Conservatively preserve the fixed scratch registers the emitter may touch.
            saved.extend_from_slice(&[16, 17, 26, 27, 28, 29, 30, 31]);
            saved.sort_unstable();
            saved.dedup();
        }
        self.isr_saved = saved;
        self.isr_full_frame = has_work;

        self.out.push(Pass1Inst::Label(name.to_string()));
        if !has_work {
            return;
        }

        // Save r0 and SREG (via r0), then r1; re-establish the r1==0 invariant.
        self.emit(0x920F); // PUSH R0
        self.emit(0xB60F); // IN R0, SREG (0x3F)
        self.emit(0x920F); // PUSH R0  (saved SREG)
        self.emit(0x921F); // PUSH R1
        self.emit(0x2411); // CLR R1
        let saved = self.isr_saved.clone();
        for &r in &saved {
            self.emit(0x920F | ((r as u16) << 4)); // PUSH r
        }
    }

    /// Move incoming ABI argument registers (r24:r25 descending) into the registers the
    /// allocator assigned to the entry block parameters.
    fn emit_param_moves(&mut self) -> Result<(), String> {
        let params: Vec<Value> = self.f.block_params(self.f.entry).to_vec();
        let mut arg = 24u8;
        let mut pairs: Vec<(u8, u8)> = Vec::new();
        for p in params {
            if arg < 16 {
                return Err("backend: more than 5 function parameters not yet supported".to_string());
            }
            let dst = self.reg(p)?;
            pairs.push((dst, arg));
            if self.is_pair(p) {
                pairs.push((dst + 1, arg + 1));
            }
            if arg >= 18 {
                arg -= 2;
            } else {
                arg = 0;
            }
        }
        self.emit_parallel_move(pairs);
        Ok(())
    }

    fn emit_block(&mut self, b: Block) -> Result<(), String> {
        let insts: Vec<Inst> = self.f.block_insts(b).to_vec();
        for (i, &inst) in insts.iter().enumerate() {
            let is_last = i + 1 == insts.len();
            self.emit_inst(b, inst, is_last)?;
        }
        Ok(())
    }

    fn emit_inst(&mut self, b: Block, inst: Inst, _is_last: bool) -> Result<(), String> {
        let data = self.f.inst_data(inst).clone();
        let result = self.f.inst_result(inst);
        match &data {
            InstData::Iconst(c) => {
                let v = result.unwrap();
                self.load_imm(v, *c)?;
            }
            InstData::Binary { op, lhs, rhs } => {
                self.emit_binary(result.unwrap(), *op, *lhs, *rhs)?;
            }
            InstData::Unary { op, arg } => {
                self.emit_unary(result.unwrap(), *op, *arg)?;
            }
            InstData::Icmp { cond, lhs, rhs } => {
                self.emit_icmp(result.unwrap(), *cond, *lhs, *rhs)?;
            }
            InstData::Cast { op, arg } => {
                self.emit_cast(result.unwrap(), *op, *arg)?;
            }
            InstData::StackAddr(s) => {
                let v = result.unwrap();
                let addr = *self.slot_addr.get(&s.0).ok_or("unknown stack slot")?;
                self.load_imm16_reg(self.reg(v)?, addr);
            }
            InstData::LoadSlot { slot } => {
                self.emit_load_slot(result.unwrap(), *slot)?;
            }
            InstData::StoreSlot { slot, val } => {
                self.emit_store_slot(*slot, *val)?;
            }
            InstData::SymbolAddr(name) => {
                let v = result.unwrap();
                let dr = self.reg(v)?;
                if name.starts_with('@') {
                    // Function pointer: load the function's word address (for ICALL).
                    // FnAddr16 expands to LDI instructions, which can only target
                    // r16..r31. If the allocator placed the pointer in a low pair,
                    // materialize through the reserved scratch pair and copy it out.
                    if dr >= 16 {
                        self.out.push(Pass1Inst::FnAddr16(dr, name.clone()));
                    } else {
                        self.out.push(Pass1Inst::FnAddr16(SCR_LO, name.clone()));
                        self.movw_or_pair(dr, SCR_LO);
                    }
                } else if name.starts_with("$fstr:") {
                    // Flash-resident string: load the data's flash BYTE address for LPM.
                    // Like FnAddr16, the LDI expansion can only target r16..r31.
                    if dr >= 16 {
                        self.out.push(Pass1Inst::FlashAddr16(dr, name.clone()));
                    } else {
                        self.out.push(Pass1Inst::FlashAddr16(SCR_LO, name.clone()));
                        self.movw_or_pair(dr, SCR_LO);
                    }
                } else {
                    let addr = *self
                        .str_data
                        .get(name)
                        .ok_or_else(|| format!("backend: unresolved symbol {}", name))?;
                    self.load_imm16_reg(dr, addr);
                }
            }
            InstData::Load { space, addr } => {
                self.emit_load(result.unwrap(), *space, *addr)?;
            }
            InstData::Store { space, addr, val } => {
                self.emit_store(*space, *addr, *val)?;
            }
            InstData::Jump { target, args } => {
                self.emit_edge_copies(b, *target, args)?;
                self.out.push(Pass1Inst::RJumpL(self.block_label(*target)));
            }
            InstData::Branch {
                cond,
                then_blk,
                then_args,
                else_blk,
                else_args,
            } => {
                self.emit_branch(b, *cond, *then_blk, then_args, *else_blk, else_args)?;
            }
            InstData::Return { val } => {
                self.emit_return(*val)?;
            }
            InstData::HwRead(reg) => {
                self.emit_hw_read(result.unwrap(), reg)?;
            }
            InstData::HwWrite { reg, val } => {
                self.emit_hw_write(reg, *val)?;
            }
            InstData::Call { callee, args } => {
                self.emit_call(result, Some(callee.clone()), None, args)?;
            }
            InstData::CallIndirect { ptr, args } => {
                self.emit_call(result, None, Some(*ptr), args)?;
            }
        }
        Ok(())
    }

    // ---- moves and immediates ----

    fn mov(&mut self, d: u8, r: u8) {
        if d == r {
            return;
        }
        self.emit(0x2C00 | ((d as u16) << 4) | ((r & 0x10) as u16) << 5 | (r & 0x0F) as u16);
    }

    /// LDI into a high register, or LDI scratch + MOV for a low one.
    fn ldi(&mut self, d: u8, k: u8) {
        if d >= 16 {
            let dd = (d - 16) as u16;
            self.emit(0xE000 | (((k >> 4) & 0x0F) as u16) << 8 | (dd << 4) | (k & 0x0F) as u16);
        } else {
            self.emit(0xE000 | (((k >> 4) & 0x0F) as u16) << 8 | (((SCR_LO - 16) as u16) << 4) | (k & 0x0F) as u16);
            self.mov(d, SCR_LO);
        }
    }

    fn load_imm(&mut self, v: Value, c: i64) -> Result<(), String> {
        let r = self.reg(v)?;
        if self.is_pair(v) {
            self.load_imm16_reg(r, c as u16);
        } else {
            self.ldi(r, c as u8);
        }
        Ok(())
    }

    fn load_imm16_reg(&mut self, lo: u8, val: u16) {
        self.ldi(lo, (val & 0xFF) as u8);
        self.ldi(lo + 1, (val >> 8) as u8);
    }

    // ---- arithmetic ----

    fn emit_binary(&mut self, dst: Value, op: BinOp, lhs: Value, rhs: Value) -> Result<(), String> {
        let dr = self.reg(dst)?;
        let lr = self.reg(lhs)?;
        let rr = self.reg(rhs)?;
        let pair = self.is_pair(dst);

        // Multiply does not follow the two-address pattern (result comes from R1:R0), so
        // handle it before the dst<-lhs move the other ops need.
        if op == BinOp::Mul {
            if !self.target_core.supports_mul() {
                return self.emit_soft_mul(dr, lr, rr, pair);
            }
            return self.emit_mul(dr, lr, rr, pair);
        }

        // Two-address arithmetic, emitted alias-safe (handles dst register == rhs).
        if let Some((lo, hi, comm)) = arith_opcodes(op) {
            self.emit_arith(dr, lr, rr, pair, lo, hi, comm);
            return Ok(());
        }

        // Div/Rem/Shl/Shr need the dividend/operand in dst first.
        if pair {
            self.movw_or_pair(dr, lr);
        } else {
            self.mov(dr, lr);
        }

        match op {
            BinOp::Div | BinOp::Rem => {
                // Signed div/rem: divide magnitudes, fix the sign afterward. The result
                // sign is sign(lhs)^sign(rhs) for `/` and sign(lhs) for `%`; we save it on
                // the stack (abs destroys it) and conditionally negate the result.
                let signed = self.f.value_type(dst).is_signed();
                if signed {
                    let hi_d = if pair { dr + 1 } else { dr };
                    let hi_r = if pair { rr + 1 } else { rr };
                    self.mov(0, hi_d); // r0 = high byte of dividend (sign in bit7)
                    if matches!(op, BinOp::Div) {
                        self.emit(Self::rdrr(0x2400, 0, hi_r)); // EOR r0, hi(divisor)
                    }
                    self.emit(0x920F); // PUSH r0 (saved sign)
                    self.emit_abs(dr, pair);
                    self.emit_abs(rr, pair);
                }
                let loop_lbl = self.uniq("divloop");
                let skip_lbl = self.uniq("divskip");
                if !pair {
                    // Unsigned 8-bit restoring division. dr holds the dividend and becomes
                    // the quotient; the remainder accumulates in r0; r16 is the counter.
                    let mut vv = rr;
                    if vv == dr {
                        self.mov(SCR_HI, vv); // r17 = divisor copy
                        vv = SCR_HI;
                    }
                    self.emit(Self::rdrr(0x2400, 0, 0)); // CLR r0 (remainder)
                    self.ldi(SCR_LO, 8); // counter = 8
                    self.out.push(Pass1Inst::Label(loop_lbl.clone()));
                    self.emit(Self::rdrr(0x0C00, dr, dr)); // LSL quotient
                    self.emit(Self::rdrr(0x1C00, 0, 0)); // ROL r0 (remainder)
                    self.emit(Self::rdrr(0x1400, 0, vv)); // CP r0, vv
                    self.out.push(Pass1Inst::BrbsL(0, skip_lbl.clone())); // BRLO skip
                    self.emit(Self::rdrr(0x1800, 0, vv)); // SUB r0, vv
                    self.emit(0x9403 | ((dr as u16) << 4)); // INC quotient
                    self.out.push(Pass1Inst::Label(skip_lbl));
                    self.emit(0x940A | ((SCR_LO as u16) << 4)); // DEC counter
                    self.out.push(Pass1Inst::BrbcL(1, loop_lbl)); // BRNE loop
                    if matches!(op, BinOp::Rem) {
                        self.mov(dr, 0);
                    }
                } else {
                    // Unsigned 16-bit restoring division. dr:dr+1 = dividend->quotient,
                    // rr:rr+1 = divisor (interferes with the result, so it never aliases
                    // dr), remainder in r16:r17, counter in r0.
                    self.ldi(SCR_LO, 16);
                    self.mov(0, SCR_LO); // r0 = counter (16)
                    self.emit(Self::rdrr(0x2400, SCR_LO, SCR_LO)); // CLR r16 (rem lo)
                    self.emit(Self::rdrr(0x2400, SCR_HI, SCR_HI)); // CLR r17 (rem hi)
                    self.out.push(Pass1Inst::Label(loop_lbl.clone()));
                    self.emit(Self::rdrr(0x0C00, dr, dr)); // LSL q.lo
                    self.emit(Self::rdrr(0x1C00, dr + 1, dr + 1)); // ROL q.hi
                    self.emit(Self::rdrr(0x1C00, SCR_LO, SCR_LO)); // ROL rem.lo
                    self.emit(Self::rdrr(0x1C00, SCR_HI, SCR_HI)); // ROL rem.hi
                    self.emit(Self::rdrr(0x1400, SCR_LO, rr)); // CP rem.lo, div.lo
                    self.emit(Self::rdrr(0x0400, SCR_HI, rr + 1)); // CPC rem.hi, div.hi
                    self.out.push(Pass1Inst::BrbsL(0, skip_lbl.clone())); // BRLO skip
                    self.emit(Self::rdrr(0x1800, SCR_LO, rr)); // SUB rem.lo, div.lo
                    self.emit(Self::rdrr(0x0800, SCR_HI, rr + 1)); // SBC rem.hi, div.hi
                    self.emit(0x9403 | ((dr as u16) << 4)); // INC q.lo (set bit0)
                    self.out.push(Pass1Inst::Label(skip_lbl));
                    self.emit(0x940A); // DEC r0 (counter)
                    self.out.push(Pass1Inst::BrbcL(1, loop_lbl)); // BRNE loop
                    if matches!(op, BinOp::Rem) {
                        self.movw_or_pair(dr, SCR_LO); // remainder r16:r17 -> dst
                    }
                }
                if signed {
                    self.emit(0x900F); // POP r0 (saved sign)
                    let skip = self.uniq("sgnskip");
                    self.emit(Self::rdrr(0x2000, 0, 0)); // TST r0 (N = sign bit)
                    self.out.push(Pass1Inst::BrbcL(2, skip.clone())); // BRPL -> skip (positive)
                    self.emit_neg(dr, pair);
                    self.out.push(Pass1Inst::Label(skip));
                }
            }
            BinOp::Shl | BinOp::Shr => {
                let k = self.const_amount(rhs).ok_or_else(|| {
                    "backend: shift by a non-constant amount not yet implemented".to_string()
                })?;
                let signed = self.f.value_type(dst).is_signed();
                for _ in 0..k.min(64) {
                    if matches!(op, BinOp::Shl) {
                        // LSL low (= ADD dr,dr); ROL high.
                        self.emit(Self::rdrr(0x0C00, dr, dr));
                        if pair {
                            self.emit(Self::rdrr(0x1C00, dr + 1, dr + 1)); // ROL = ADC dr+1,dr+1
                        }
                    } else if pair {
                        // High byte first, then rotate into low.
                        if signed {
                            self.emit(0x9405 | (((dr + 1) as u16) << 4)); // ASR high
                        } else {
                            self.emit(0x9406 | (((dr + 1) as u16) << 4)); // LSR high
                        }
                        self.emit(0x9407 | ((dr as u16) << 4)); // ROR low
                    } else if signed {
                        self.emit(0x9405 | ((dr as u16) << 4)); // ASR
                    } else {
                        self.emit(0x9406 | ((dr as u16) << 4)); // LSR
                    }
                }
            }
            _ => {
                return Err(format!("backend: binary op {:?} not yet implemented", op));
            }
        }
        Ok(())
    }

    /// Width conversions. Zext/Sext widen an 8-bit value to a 16-bit pair; Trunc narrows.
    fn emit_cast(&mut self, dst: Value, op: CastOp, arg: Value) -> Result<(), String> {
        let dr = self.reg(dst)?;
        let ar = self.reg(arg)?;
        match op {
            CastOp::Zext => {
                // dst(pair) = zero-extend arg(byte): low = arg, high = 0.
                self.mov(dr, ar);
                self.emit(Self::rdrr(0x2400, dr + 1, dr + 1)); // CLR dr+1
            }
            CastOp::Sext => {
                self.mov(dr, ar);
                self.emit(Self::rdrr(0x2400, dr + 1, dr + 1)); // CLR dr+1
                self.emit(0xFC00 | ((dr as u16) << 4) | 7); // SBRC dr, 7
                self.emit(0x9400 | (((dr + 1) as u16) << 4)); // COM dr+1 (-> 0xFF if sign set)
            }
            CastOp::Trunc => {
                // dst(byte) = low byte of arg(pair).
                self.mov(dr, ar);
            }
        }
        Ok(())
    }

    /// Two's-complement negate of a register (8-bit) or aligned pair (16-bit), in place.
    /// The 16-bit form uses the r16:r17 scratch pair so it works for any destination.
    fn emit_neg(&mut self, reg: u8, pair: bool) {
        if !pair {
            self.emit(0x9401 | ((reg as u16) << 4)); // NEG
        } else {
            self.movw_or_pair(SCR_LO, reg); // r16:r17 = X
            self.emit(Self::rdrr(0x2400, reg, reg)); // CLR lo
            self.emit(Self::rdrr(0x2400, reg + 1, reg + 1)); // CLR hi
            self.emit(Self::rdrr(0x1800, reg, SCR_LO)); // SUB lo, r16
            self.emit(Self::rdrr(0x0800, reg + 1, SCR_HI)); // SBC hi, r17  (reg = 0 - X)
        }
    }

    /// Replaces a register/pair with its absolute value (negate iff the sign bit is set).
    fn emit_abs(&mut self, reg: u8, pair: bool) {
        let hi = if pair { reg + 1 } else { reg };
        let skip = self.uniq("absskip");
        self.emit(Self::rdrr(0x2000, hi, hi)); // TST hi (N = sign bit)
        self.out.push(Pass1Inst::BrbcL(2, skip.clone())); // BRPL -> skip (non-negative)
        self.emit_neg(reg, pair);
        self.out.push(Pass1Inst::Label(skip));
    }

    /// Copies lhs into dst (pair-aware).
    fn copy_reg(&mut self, dr: u8, sr: u8, pair: bool) {
        if pair {
            self.movw_or_pair(dr, sr);
        } else {
            self.mov(dr, sr);
        }
    }

    /// Emits `dst = lhs <op> rhs` for a two-address op given its low/high opcodes and
    /// commutativity, without clobbering an operand that aliases the destination.
    fn emit_arith(&mut self, dr: u8, lr: u8, rr: u8, pair: bool, lo: u16, hi: u16, comm: bool) {
        let second;
        if dr == lr {
            // dst already holds lhs.
            second = rr;
        } else if comm && dr == rr {
            // dst already holds rhs; commute (rhs op lhs == lhs op rhs).
            second = lr;
        } else if dr == rr {
            // Non-commutative with dst aliasing rhs: stage rhs in r16:r17 first.
            self.mov(SCR_LO, rr);
            if pair {
                self.mov(SCR_HI, rr + 1);
            }
            self.copy_reg(dr, lr, pair);
            second = SCR_LO;
        } else {
            self.copy_reg(dr, lr, pair);
            second = rr;
        }
        self.emit(Self::rdrr(lo, dr, second));
        if pair {
            self.emit(Self::rdrr(hi, dr + 1, second + 1));
        }
    }

    /// The constant value of an operand defined by an `iconst`, if any.
    fn const_amount(&self, v: Value) -> Option<i64> {
        match self.f.value_def(v) {
            ValueDef::Result(inst) => match self.f.inst_data(inst) {
                InstData::Iconst(c) => Some(*c),
                _ => None,
            },
            _ => None,
        }
    }

    /// Encodes a generic `Rd, Rr` instruction word.
    fn rdrr(op: u16, d: u8, r: u8) -> u16 {
        op | ((d as u16) << 4) | (((r & 0x10) as u16) << 5) | (r & 0x0F) as u16
    }

    /// `dst = lhs * rhs` using hardware MUL (result in R1:R0). For 16-bit, computes the
    /// low 16 bits of the product via the standard three-multiply expansion, accumulating
    /// in the r16/r17 scratch pair to stay safe against dst/operand aliasing. Always
    /// restores R1 == 0 afterwards.
    fn emit_mul(&mut self, dr: u8, lr: u8, rr: u8, pair: bool) -> Result<(), String> {
        if !pair {
            self.emit(Self::rdrr(0x9C00, lr, rr)); // MUL lr, rr -> R1:R0
            self.mov(dr, 0); // mov dst, R0
            self.emit(0x2411); // CLR R1
            return Ok(());
        }
        // 16-bit low word: (llo*rlo) + ((llo*rhi + lhi*rlo) << 8).
        self.emit(Self::rdrr(0x9C00, lr, rr)); // MUL llo, rlo
        self.mov(SCR_LO, 0); // r16 = R0
        self.mov(SCR_HI, 1); // r17 = R1
        self.emit(Self::rdrr(0x9C00, lr, rr + 1)); // MUL llo, rhi
        self.emit(Self::rdrr(0x0C00, SCR_HI, 0)); // ADD r17, R0
        self.emit(Self::rdrr(0x9C00, lr + 1, rr)); // MUL lhi, rlo
        self.emit(Self::rdrr(0x0C00, SCR_HI, 0)); // ADD r17, R0
        self.emit(0x2411); // CLR R1
        self.mov(dr, SCR_LO);
        self.mov(dr + 1, SCR_HI);
        Ok(())
    }

    /// `dst = lhs * rhs` without hardware MUL. The low byte/word of unsigned
    /// shift-add multiplication is also correct for two's-complement signed values.
    fn emit_soft_mul(&mut self, dr: u8, lr: u8, rr: u8, pair: bool) -> Result<(), String> {
        let loop_lbl = self.uniq("softmul");
        let skip_lbl = self.uniq("softmulskip");
        if !pair {
            self.mov(SCR_LO, lr); // multiplicand
            self.mov(30, rr); // multiplier
            self.emit(Self::rdrr(0x2400, dr, dr)); // CLR result
            self.ldi(29, 8);
            self.out.push(Pass1Inst::Label(loop_lbl.clone()));
            self.emit(0x9406 | (30u16 << 4)); // LSR multiplier
            self.out.push(Pass1Inst::BrbcL(0, skip_lbl.clone())); // BRCC skip
            self.emit(Self::rdrr(0x0C00, dr, SCR_LO)); // ADD result, multiplicand
            self.out.push(Pass1Inst::Label(skip_lbl));
            self.emit(Self::rdrr(0x0C00, SCR_LO, SCR_LO)); // LSL multiplicand
            self.emit(0x940A | (29u16 << 4)); // DEC counter
            self.out.push(Pass1Inst::BrbcL(1, loop_lbl)); // BRNE loop
            return Ok(());
        }

        self.movw_or_pair(SCR_LO, lr); // multiplicand r16:r17
        self.movw_or_pair(30, rr); // multiplier r30:r31
        self.emit(Self::rdrr(0x2400, dr, dr)); // CLR result lo
        self.emit(Self::rdrr(0x2400, dr + 1, dr + 1)); // CLR result hi
        self.ldi(29, 16);
        self.out.push(Pass1Inst::Label(loop_lbl.clone()));
        self.emit(0x9406 | (31u16 << 4)); // LSR multiplier hi
        self.emit(0x9407 | (30u16 << 4)); // ROR multiplier lo (C = old bit0)
        self.out.push(Pass1Inst::BrbcL(0, skip_lbl.clone())); // BRCC skip
        self.emit(Self::rdrr(0x0C00, dr, SCR_LO)); // ADD result lo
        self.emit(Self::rdrr(0x1C00, dr + 1, SCR_HI)); // ADC result hi
        self.out.push(Pass1Inst::Label(skip_lbl));
        self.emit(Self::rdrr(0x0C00, SCR_LO, SCR_LO)); // LSL multiplicand lo
        self.emit(Self::rdrr(0x1C00, SCR_HI, SCR_HI)); // ROL multiplicand hi
        self.emit(0x940A | (29u16 << 4)); // DEC counter
        self.out.push(Pass1Inst::BrbcL(1, loop_lbl)); // BRNE loop
        Ok(())
    }

    /// 16-bit register-pair copy: MOVW when available, else two MOVs.
    fn movw_or_pair(&mut self, d: u8, r: u8) {
        if d == r {
            return;
        }
        if !matches!(self.target_core, TargetCore::AVRe | TargetCore::AVRrc)
            && d % 2 == 0
            && r % 2 == 0
        {
            self.emit(0x0100 | (((d / 2) as u16) << 4) | (r / 2) as u16); // MOVW
        } else {
            self.mov(d, r);
            self.mov(d + 1, r + 1);
        }
    }

    fn emit_unary(&mut self, dst: Value, op: UnOp, arg: Value) -> Result<(), String> {
        let dr = self.reg(dst)?;
        let ar = self.reg(arg)?;
        let pair = self.is_pair(dst);
        match op {
            UnOp::Bnot => {
                if pair {
                    self.movw_or_pair(dr, ar);
                    self.emit(0x9400 | ((dr as u16) << 4)); // COM low
                    self.emit(0x9400 | (((dr + 1) as u16) << 4)); // COM high
                } else {
                    self.mov(dr, ar);
                    self.emit(0x9400 | ((dr as u16) << 4)); // COM
                }
            }
            UnOp::Neg => {
                if pair {
                    return Err("backend: 16-bit neg not yet implemented".to_string());
                }
                self.mov(dr, ar);
                self.emit(0x9401 | ((dr as u16) << 4)); // NEG
            }
            UnOp::LogicalNot => {
                // arg is a 0/1 boolean; logical-not flips bit 0: result = arg ^ 1.
                self.mov(dr, ar);
                self.ldi(SCR_LO, 1);
                self.emit(Self::rdrr(0x2400, dr, SCR_LO)); // EOR dr, r16
            }
        }
        Ok(())
    }

    // ---- memory ----

    /// Load a value's address into Z (r30:r31).
    fn load_addr_into_z(&mut self, addr: Value) -> Result<(), String> {
        let ar = self.reg(addr)?;
        self.movw_or_pair(30, ar);
        Ok(())
    }

    fn emit_load(&mut self, dst: Value, space: Space, addr: Value) -> Result<(), String> {
        self.load_addr_into_z(addr)?;
        let dr = self.reg(dst)?;
        match space {
            Space::Ram => {
                if self.is_pair(dst) {
                    self.emit(0x9001 | ((dr as u16) << 4)); // LD dr, Z+
                    self.emit(0x8000 | (((dr + 1) as u16) << 4)); // LD dr+1, Z
                } else {
                    self.emit(0x8000 | ((dr as u16) << 4)); // LD dr, Z
                }
            }
            Space::Flash => {
                if self.target_core == TargetCore::AVRrc {
                    return Err(
                        "Memory Error: flash loads are not supported on AVRrc architecture cores"
                            .to_string(),
                    );
                }
                if self.is_pair(dst) {
                    self.emit(0x9005 | ((dr as u16) << 4)); // LPM dr, Z+
                    self.emit(0x9004 | (((dr + 1) as u16) << 4)); // LPM dr+1, Z
                } else {
                    self.emit(0x9004 | ((dr as u16) << 4)); // LPM dr, Z
                }
            }
            Space::Eeprom => {
                if self.is_pair(dst) {
                    self.emit_eeprom_read_z(dr)?;
                    self.emit_adiw(30, 1);
                    self.emit_eeprom_read_z(dr + 1)?;
                } else {
                    self.emit_eeprom_read_z(dr)?;
                }
            }
        }
        Ok(())
    }

    fn emit_store(&mut self, space: Space, addr: Value, val: Value) -> Result<(), String> {
        // Route the stored value through r16(:r17) so the last store in @main leaves the
        // value observable in R16 (test convention).
        let vr = self.reg(val)?;
        self.load_addr_into_z(addr)?;
        match space {
            Space::Ram => {
                if self.is_pair(val) {
                    self.mov(SCR_LO, vr);
                    self.mov(SCR_HI, vr + 1);
                    self.emit(0x9201 | ((SCR_LO as u16) << 4)); // ST Z+, R16
                    self.emit(0x8200 | ((SCR_HI as u16) << 4)); // ST Z, R17
                } else {
                    self.mov(SCR_LO, vr);
                    self.emit(0x8200 | ((SCR_LO as u16) << 4)); // ST Z, R16
                }
            }
            Space::Eeprom => {
                if self.is_pair(val) {
                    self.mov(SCR_LO, vr);
                    self.mov(SCR_HI, vr + 1);
                    self.emit_eeprom_write_z(SCR_LO)?;
                    self.emit_adiw(30, 1);
                    self.emit_eeprom_write_z(SCR_HI)?;
                } else {
                    self.mov(SCR_LO, vr);
                    self.emit_eeprom_write_z(SCR_LO)?;
                }
            }
            Space::Flash => {
                return Err("Cannot write through a flash pointer: program memory is read-only".to_string());
            }
        }
        Ok(())
    }

    fn load_slot_addr_into_z(&mut self, slot: StackSlot) -> Result<(), String> {
        let addr = *self.slot_addr.get(&slot.0).ok_or("unknown stack slot")?;
        self.load_imm16_reg(30, addr);
        Ok(())
    }

    fn emit_load_slot(&mut self, dst: Value, slot: StackSlot) -> Result<(), String> {
        self.load_slot_addr_into_z(slot)?;
        let dr = self.reg(dst)?;
        if self.is_pair(dst) {
            self.emit(0x9001 | ((dr as u16) << 4)); // LD dr, Z+
            self.emit(0x8000 | (((dr + 1) as u16) << 4)); // LD dr+1, Z
        } else {
            self.emit(0x8000 | ((dr as u16) << 4)); // LD dr, Z
        }
        Ok(())
    }

    fn emit_store_slot(&mut self, slot: StackSlot, val: Value) -> Result<(), String> {
        let vr = self.reg(val)?;
        self.load_slot_addr_into_z(slot)?;
        if self.is_pair(val) {
            self.mov(SCR_LO, vr);
            self.mov(SCR_HI, vr + 1);
            self.emit(0x9201 | ((SCR_LO as u16) << 4)); // ST Z+, R16
            self.emit(0x8200 | ((SCR_HI as u16) << 4)); // ST Z, R17
        } else {
            self.mov(SCR_LO, vr);
            self.emit(0x8200 | ((SCR_LO as u16) << 4)); // ST Z, R16
        }
        Ok(())
    }

    fn ensure_eeprom_supported(&self) -> Result<(), String> {
        if matches!(self.target_core, TargetCore::AVRxt | TargetCore::AVRxm | TargetCore::AVRrc) {
            return Err("Memory Error: EEPROM access is not supported on AVRxt/AVRxm/AVRrc architecture cores".to_string());
        }
        Ok(())
    }

    fn emit_adiw(&mut self, lo: u8, imm: u8) {
        let k = imm as u16;
        let dd = ((lo - 24) / 2) as u16;
        self.emit(0x9600 | ((k & 0x30) << 2) | (dd << 4) | (k & 0x0F));
    }

    fn emit_eeprom_read_z(&mut self, target: u8) -> Result<(), String> {
        self.ensure_eeprom_supported()?;
        self.emit(0x99F9); // SBIC 0x1F, 1
        self.emit(0xCFFE); // RJMP -2
        self.emit(0xB800 | ((0x21 & 0x30) << 5) | (30u16 << 4) | (0x21 & 0x0F)); // OUT EEARL, ZL
        self.emit(0xB800 | ((0x22 & 0x30) << 5) | (31u16 << 4) | (0x22 & 0x0F)); // OUT EEARH, ZH
        self.emit(0x9AF8); // SBI 0x1F, 0
        self.emit(0xB000 | ((0x20 & 0x30) << 5) | ((target as u16) << 4) | (0x20 & 0x0F)); // IN target, EEDR
        Ok(())
    }

    fn emit_eeprom_write_z(&mut self, src: u8) -> Result<(), String> {
        self.ensure_eeprom_supported()?;
        self.emit(0x99F9); // SBIC 0x1F, 1
        self.emit(0xCFFE); // RJMP -2
        self.emit(0xB800 | ((0x21 & 0x30) << 5) | (30u16 << 4) | (0x21 & 0x0F)); // OUT EEARL, ZL
        self.emit(0xB800 | ((0x22 & 0x30) << 5) | (31u16 << 4) | (0x22 & 0x0F)); // OUT EEARH, ZH
        self.emit(0xB800 | ((0x20 & 0x30) << 5) | ((src as u16) << 4) | (0x20 & 0x0F)); // OUT EEDR, src
        self.emit(0x9AFA); // SBI 0x1F, 2
        self.emit(0x9AF9); // SBI 0x1F, 1
        Ok(())
    }

    // ---- control flow ----

    /// Emits a parallel register move (all destinations distinct) safely: it never
    /// clobbers a source that is still needed, breaking cycles (e.g. a swap) through r0.
    /// Operates at byte granularity so register pairs are handled uniformly.
    fn emit_parallel_move(&mut self, byte_pairs: Vec<(u8, u8)>) {
        let mut moves: Vec<(u8, u8)> = byte_pairs.into_iter().filter(|(d, s)| d != s).collect();
        while !moves.is_empty() {
            let srcs: std::collections::HashSet<u8> = moves.iter().map(|(_, s)| *s).collect();
            if let Some(pos) = moves.iter().position(|(d, _)| !srcs.contains(d)) {
                let (d, s) = moves.remove(pos);
                self.mov(d, s);
            } else {
                // Every destination is also a needed source: a pure cycle. Park one
                // value in r0 (a true scratch) and redirect readers of it to r0.
                let (d, _s) = moves[0];
                self.mov(0, d);
                for m in moves.iter_mut() {
                    if m.1 == d {
                        m.1 = 0;
                    }
                }
            }
        }
    }

    /// Builds the byte-level move list for an out-of-SSA CFG edge and emits it in parallel.
    fn emit_edge_copies(&mut self, _from: Block, target: Block, args: &[Value]) -> Result<(), String> {
        let params: Vec<Value> = self.f.block_params(target).to_vec();
        let mut pairs: Vec<(u8, u8)> = Vec::new();
        for (p, a) in params.iter().zip(args.iter()) {
            let dst = self.reg(*p)?;
            let src = self.reg(*a)?;
            pairs.push((dst, src));
            if self.is_pair(*p) {
                pairs.push((dst + 1, src + 1));
            }
        }
        self.emit_parallel_move(pairs);
        Ok(())
    }

    fn emit_branch(
        &mut self,
        from: Block,
        cond: Value,
        then_blk: Block,
        then_args: &[Value],
        else_blk: Block,
        else_args: &[Value],
    ) -> Result<(), String> {
        // A constant condition collapses to an unconditional jump (with its edge copies).
        if let ValueDef::Result(inst) = self.f.value_def(cond) {
            if let InstData::Iconst(k) = self.f.inst_data(inst) {
                let (tb, ta) = if *k != 0 {
                    (then_blk, then_args)
                } else {
                    (else_blk, else_args)
                };
                self.emit_edge_copies(from, tb, ta)?;
                self.out.push(Pass1Inst::RJumpL(self.block_label(tb)));
                return Ok(());
            }
        }

        // Otherwise `cond` is a materialized boolean (0/1) in a register: test it and
        // branch to the then-trampoline when nonzero; fall through to the else edge.
        let cr = self.reg(cond)?;
        let then_lbl = self.block_label(then_blk);
        let else_lbl = self.block_label(else_blk);
        let taken_then = self.uniq(&format!("t{}_{}", from.0, then_blk.0));

        self.emit(Self::rdrr(0x2000, cr, cr)); // AND cr, cr (test for zero)
        self.out.push(Pass1Inst::BrbcL(1, taken_then.clone())); // BRNE -> then (nonzero)

        self.emit_edge_copies(from, else_blk, else_args)?;
        self.out.push(Pass1Inst::RJumpL(else_lbl));

        self.out.push(Pass1Inst::Label(taken_then));
        self.emit_edge_copies(from, then_blk, then_args)?;
        self.out.push(Pass1Inst::RJumpL(then_lbl));
        Ok(())
    }

    /// Materializes a comparison into a 0/1 byte in the result register.
    fn emit_icmp(&mut self, dst: Value, cond: Cond, lhs: Value, rhs: Value) -> Result<(), String> {
        // Normalize Gt/Le to Lt/Ge by swapping operands.
        let (c, l, r) = match cond {
            Cond::Gt => (Cond::Lt, rhs, lhs),
            Cond::Le => (Cond::Ge, rhs, lhs),
            other => (other, lhs, rhs),
        };
        let lr = self.reg(l)?;
        let rr = self.reg(r)?;
        let pair = self.is_pair(l);
        let signed = self.f.value_type(l).is_signed();
        let dr = self.reg(dst)?;

        // CP (+ CPC for 16-bit) sets the flags the conditional branch consumes.
        self.emit(Self::rdrr(0x1400, lr, rr));
        if pair {
            self.emit(Self::rdrr(0x0400, lr + 1, rr + 1));
        }
        let set = self.uniq("bset");
        let done = self.uniq("bdone");
        self.emit_cond_branch(c, signed, &set); // condition true -> set
        self.emit(Self::rdrr(0x2400, dr, dr)); // CLR dr (false = 0)
        self.out.push(Pass1Inst::RJumpL(done.clone()));
        self.out.push(Pass1Inst::Label(set));
        self.ldi(dr, 1); // true = 1
        self.out.push(Pass1Inst::Label(done));
        Ok(())
    }

    /// Emits a conditional branch taken when `cond` (with `signed` operands) holds, to
    /// `label`, using SREG flags left by a preceding CP/CPC.
    fn emit_cond_branch(&mut self, cond: Cond, signed: bool, label: &str) {
        // SREG bit indices: C=0, Z=1, N=2, S=4.
        match cond {
            Cond::Eq => self.out.push(Pass1Inst::BrbsL(1, label.to_string())), // BREQ
            Cond::Ne => self.out.push(Pass1Inst::BrbcL(1, label.to_string())), // BRNE
            Cond::Lt => {
                if signed {
                    self.out.push(Pass1Inst::BrbsL(4, label.to_string())); // BRLT (S set)
                } else {
                    self.out.push(Pass1Inst::BrbsL(0, label.to_string())); // BRLO (C set)
                }
            }
            Cond::Ge => {
                if signed {
                    self.out.push(Pass1Inst::BrbcL(4, label.to_string())); // BRGE (S clear)
                } else {
                    self.out.push(Pass1Inst::BrbcL(0, label.to_string())); // BRSH (C clear)
                }
            }
            Cond::Gt | Cond::Le => unreachable!("Gt/Le are normalized to Lt/Ge before branching"),
        }
    }

    /// Stores each string literal's NUL-terminated bytes into its SRAM home. Names are
    /// `$str:<content>`; the content's bytes plus a trailing NUL are written via STS.
    fn emit_string_inits(&mut self) {
        let mut entries: Vec<(String, u16)> =
            self.str_data.iter().map(|(k, v)| (k.clone(), *v)).collect();
        entries.sort_by_key(|(_, a)| *a);
        for (name, addr) in entries {
            let content = name.strip_prefix("$str:").unwrap_or(&name);
            let mut bytes: Vec<u8> = content.chars().map(|c| c as u8).collect();
            bytes.push(0);
            for (i, b) in bytes.iter().enumerate() {
                self.ldi(SCR_LO, *b);
                self.emit_out_or_sts(addr + i as u16, SCR_LO);
            }
        }
    }

    /// Resolves a hardware/IO register name to its data-space address.
    fn hw_addr(&self, reg: &str) -> Result<u16, String> {
        self.consts
            .get(reg)
            .copied()
            .ok_or_else(|| format!("backend: unknown hardware register %{}", reg))
    }

    /// Reads one byte (or word) from a hardware register: IN from low I/O space
    /// (data addr 0x20..0x5F), else LDS from the data address.
    fn emit_hw_read(&mut self, dst: Value, reg: &str) -> Result<(), String> {
        let addr = self.hw_addr(reg)?;
        let dr = self.reg(dst)?;
        let pair = self.is_pair(dst);
        self.emit_in_or_lds(dr, addr);
        if pair {
            self.emit_in_or_lds(dr + 1, addr + 1);
        }
        Ok(())
    }

    fn emit_hw_write(&mut self, reg: &str, val: Value) -> Result<(), String> {
        let addr = self.hw_addr(reg)?;
        let vr = self.reg(val)?;
        let pair = self.is_pair(val);
        if pair {
            self.emit_out_or_sts(addr + 1, vr + 1);
            self.emit_out_or_sts(addr, vr);
        } else {
            self.emit_out_or_sts(addr, vr);
        }
        Ok(())
    }

    /// IN Rd, io  when the data address is in the low I/O window, else LDS Rd, addr.
    fn emit_in_or_lds(&mut self, dr: u8, data_addr: u16) {
        if (0x20..=0x5F).contains(&data_addr) {
            let io = data_addr - 0x20;
            self.emit(0xB000 | ((io & 0x30) << 5) | ((dr as u16) << 4) | (io & 0x0F));
        } else {
            self.emit(0x9000 | ((dr as u16) << 4)); // LDS Rd, k (2-word)
            self.emit(data_addr);
        }
    }

    /// OUT io, Rr  when the data address is in the low I/O window, else STS addr, Rr.
    fn emit_out_or_sts(&mut self, data_addr: u16, rr: u8) {
        if (0x20..=0x5F).contains(&data_addr) {
            let io = data_addr - 0x20;
            self.emit(0xB800 | ((io & 0x30) << 5) | ((rr as u16) << 4) | (io & 0x0F));
        } else {
            self.emit(0x9200 | ((rr as u16) << 4)); // STS k, Rr (2-word)
            self.emit(data_addr);
        }
    }

    /// Emits a direct or indirect call. Arguments are marshaled into the ABI registers
    /// r24:r25 (descending pairs) with a safe parallel move; the result is taken from
    /// r24:r25. Caller-saved clobbering is already handled by the allocator (values live
    /// across the call were constrained to callee-saved registers).
    fn emit_call(
        &mut self,
        result: Option<Value>,
        callee: Option<String>,
        ptr: Option<Value>,
        args: &[Value],
    ) -> Result<(), String> {
        if let Some(name) = callee.as_deref() {
            if self.emit_intrinsic_call(name, args, result)? {
                return Ok(());
            }
        }

        // Marshal arguments: arg i occupies r(24 - 2*i) (low) and +1 for a 16-bit arg.
        // The fifth argument uses r16:r17, our reserved scratch pair; no allocated value
        // can live there, so this is safe immediately before CALL/ICALL. Stack arguments
        // are still out of scope for this backend bring-up.
        let mut pairs: Vec<(u8, u8)> = Vec::new();
        let mut abi = 24u8;
        for &a in args {
            if abi < 16 {
                return Err("backend: more than 5 call arguments not yet supported".to_string());
            }
            let src = self.reg(a)?;
            pairs.push((abi, src));
            if self.is_pair(a) {
                pairs.push((abi + 1, src + 1));
            }
            if abi >= 18 {
                abi -= 2;
            } else {
                abi = 0;
            }
        }
        self.emit_parallel_move(pairs);

        match (callee, ptr) {
            (Some(name), None) => {
                self.out.push(Pass1Inst::RCallL(name));
            }
            (None, Some(p)) => {
                // Load the callee word address into Z, then ICALL.
                let pr = self.reg(p)?;
                self.movw_or_pair(30, pr);
                self.emit(0x9509); // ICALL
            }
            _ => return Err("backend: malformed call".to_string()),
        }

        // Move the return value out of r24:r25 into its allocated register.
        if let Some(v) = result {
            let dr = self.reg(v)?;
            if self.is_pair(v) {
                self.movw_or_pair(dr, 24);
            } else {
                self.mov(dr, 24);
            }
        }
        Ok(())
    }

    fn emit_intrinsic_call(
        &mut self,
        name: &str,
        args: &[Value],
        result: Option<Value>,
    ) -> Result<bool, String> {
        if !name.starts_with('@') {
            return Ok(false);
        }
        let intrinsic = &name[1..];
        match intrinsic {
            "nop" => {
                if !args.is_empty() {
                    return Err("Intrinsic @nop expects no arguments".to_string());
                }
                if result.is_some() {
                    return Err("Intrinsic @nop does not return a value".to_string());
                }
                self.emit(0x0000);
                Ok(true)
            }
            "cli" => {
                if !args.is_empty() {
                    return Err("Intrinsic @cli expects no arguments".to_string());
                }
                if result.is_some() {
                    return Err("Intrinsic @cli does not return a value".to_string());
                }
                self.emit(0x94F8); // CLI (clear global interrupt enable)
                Ok(true)
            }
            "sei" => {
                if !args.is_empty() {
                    return Err("Intrinsic @sei expects no arguments".to_string());
                }
                if result.is_some() {
                    return Err("Intrinsic @sei does not return a value".to_string());
                }
                self.emit(0x9478); // SEI (set global interrupt enable)
                Ok(true)
            }
            // Single-opcode, no-operand instructions.
            "wdr" | "sleep" | "break" => {
                if !args.is_empty() {
                    return Err(format!("Intrinsic @{} expects no arguments", intrinsic));
                }
                if result.is_some() {
                    return Err(format!("Intrinsic @{} does not return a value", intrinsic));
                }
                self.emit(match intrinsic {
                    "wdr" => 0x95A8,   // WDR   (watchdog reset)
                    "sleep" => 0x9588, // SLEEP (enter sleep mode)
                    _ => 0x9598,       // BREAK (on-chip debug breakpoint)
                });
                Ok(true)
            }
            "swap" => {
                if result.is_some() {
                    return Err("Intrinsic @swap does not return a value".to_string());
                }
                let reg = self.intrinsic_reg_arg(args, 0, "@swap")?;
                if args.len() != 1 {
                    return Err("Intrinsic @swap expects exactly 1 literal register argument".to_string());
                }
                self.emit(0x9402 | ((reg as u16) << 4));
                Ok(true)
            }
            "movw" => {
                if result.is_some() {
                    return Err("Intrinsic @movw does not return a value".to_string());
                }
                if args.len() != 2 {
                    return Err("Intrinsic @movw expects exactly 2 literal register arguments".to_string());
                }
                let rd = self.intrinsic_reg_arg(args, 0, "@movw")?;
                let rr = self.intrinsic_reg_arg(args, 1, "@movw")?;
                self.movw_or_pair(rd, rr);
                Ok(true)
            }
            "mul" => {
                if result.is_some() {
                    return Err("Intrinsic @mul does not return a value".to_string());
                }
                if args.len() != 2 {
                    return Err("Intrinsic @mul expects exactly 2 literal register arguments".to_string());
                }
                if !self.target_core.supports_mul() {
                    return Err("Memory Error: @mul requires a hardware multiplier on this backend".to_string());
                }
                let rd = self.intrinsic_reg_arg(args, 0, "@mul")?;
                let rr = self.intrinsic_reg_arg(args, 1, "@mul")?;
                self.emit(0x9C00 | (((rr & 0x10) as u16) << 5) | ((rd as u16) << 4) | ((rr & 0x0F) as u16));
                Ok(true)
            }
            "goto" => {
                // @goto(word_addr) — unconditional JMP to an absolute flash
                // word address. Mainly for a bootloader to start the
                // application at 0 (`@goto(0)`). The address is explicit, so it
                // is never adjusted by the boot origin.
                if result.is_some() {
                    return Err("Intrinsic @goto does not return a value".to_string());
                }
                if args.len() != 1 {
                    return Err("Intrinsic @goto expects exactly 1 literal address".to_string());
                }
                let target = self.intrinsic_literal_arg(args, 0, "@goto")? as u32;
                self.emit(
                    0x940C
                        | ((((target >> 17) & 0x1F) as u16) << 4)
                        | ((target >> 16) & 0x01) as u16,
                ); // JMP
                self.emit((target & 0xFFFF) as u16);
                Ok(true)
            }
            "spm" => {
                // @spm(spmcsr_addr, cmd, zaddr, word) — self-program flash.
                //
                // Runs the timed Store-Program-Memory sequence: wait for any
                // previous SPM to finish, write `cmd` to SPMCSR, then SPM with
                // Z = zaddr (byte address) and R1:R0 = word as the data. The
                // exact `cmd` (page erase / fill buffer / page write / RWWSRE)
                // is the caller's; see std/boot.ik. Call with interrupts off.
                //
                // All clobbered fixed registers (R0, R1, Z, two temps) are
                // saved/restored via the stack, and the operands are routed
                // through the stack too, so this never disturbs the register
                // allocator regardless of where the operands live.
                if result.is_some() {
                    return Err("Intrinsic @spm does not return a value".to_string());
                }
                if args.len() != 4 {
                    return Err(
                        "Intrinsic @spm expects (spmcsr_addr, cmd, zaddr, word)".to_string(),
                    );
                }
                if !self.target_core.supports_spm() {
                    return Err(
                        "Memory Error: @spm requires SPM self-programming on this target"
                            .to_string(),
                    );
                }
                let spmcsr = self.intrinsic_literal_arg(args, 0, "@spm")? as u16;
                let cmd = self.reg(args[1])?;
                if !self.is_pair(args[2]) || !self.is_pair(args[3]) {
                    return Err(
                        "Intrinsic @spm: zaddr and word must be 16-bit values".to_string(),
                    );
                }
                let z = self.reg(args[2])?;
                let w = self.reg(args[3])?;

                const T_CMD: u8 = 18;
                const T_POLL: u8 = 19;

                // Save everything we touch.
                self.emit_push(T_CMD);
                self.emit_push(T_POLL);
                self.emit_push(0);
                self.emit_push(1);
                self.emit_push(30);
                self.emit_push(31);

                // Route operands through the stack to dodge any aliasing with
                // the destination registers (all reads happen before writes).
                self.emit_push(w + 1); // word hi
                self.emit_push(w); // word lo
                self.emit_push(z + 1); // Z hi
                self.emit_push(z); // Z lo
                self.emit_push(cmd); // command
                self.emit_pop(T_CMD);
                self.emit_pop(30);
                self.emit_pop(31);
                self.emit_pop(0);
                self.emit_pop(1);

                // Wait for a previous SPM to complete (SPMCSR bit0 = SPMEN).
                let load_words: u16 = if (0x20..=0x5F).contains(&spmcsr) { 1 } else { 2 };
                self.emit_in_or_lds(T_POLL, spmcsr);
                self.emit(0xFC00 | ((T_POLL as u16) << 4)); // SBRC T_POLL, 0
                let back = (-(load_words as i32 + 2)) as u16 & 0x0FFF;
                self.emit(0xC000 | back); // RJMP wait

                // Timed sequence: arm SPMCSR then SPM with no gap.
                self.emit_out_or_sts(spmcsr, T_CMD);
                self.emit(0x95E8); // SPM

                // Restore.
                self.emit_pop(31);
                self.emit_pop(30);
                self.emit_pop(1);
                self.emit_pop(0);
                self.emit_pop(T_POLL);
                self.emit_pop(T_CMD);
                Ok(true)
            }
            "burn" => {
                if result.is_some() {
                    return Err("Intrinsic @burn does not return a value".to_string());
                }
                if args.len() != 1 {
                    return Err("Intrinsic @burn expects exactly 1 argument".to_string());
                }
                if let Ok(cycles) = self.intrinsic_literal_arg(args, 0, "@burn") {
                    if cycles > 0 {
                        self.emit_burn(cycles as u32);
                    }
                } else {
                    let r = self.reg(args[0])?;
                    if self.is_pair(args[0]) {
                        self.emit(0x93EF); // push r30
                        self.emit(0x93FF); // push r31
                        self.mov(30, r);
                        self.mov(31, r + 1);
                        if self.target_core == TargetCore::AVRrc {
                            // The reduced core has no SBIW: test-for-zero and the
                            // pair decrement are done with byte ops (SUBI/SBCI).
                            self.emit(0x2E0E); // mov r0, r30
                            self.emit(0x2A0F); // or  r0, r31
                            self.emit(0xF019); // breq .+3 words (skip the loop if 0)
                            self.emit(0x50E1); // subi r30, 1
                            self.emit(0x40F0); // sbci r31, 0
                            self.emit(0xF7E9); // brne .-3 words
                        } else {
                            self.emit(0x9730); // sbiw r30, 0
                            self.emit(0xF011); // breq .+2 words
                            self.emit(0x9731); // sbiw r30, 1
                            self.emit(0xF7F1); // brne .-2 words
                        }
                        self.emit(0x91FF); // pop r31
                        self.emit(0x91EF); // pop r30
                    } else {
                        self.emit(0x93EF); // push r30
                        self.mov(30, r);
                        self.emit(0x23EE); // and r30, r30
                        self.emit(0xF011); // breq .+2 words
                        self.emit(0x95EA); // dec r30
                        self.emit(0xF7F1); // brne .-2 words
                        self.emit(0x91EF); // pop r30
                    }
                }
                Ok(true)
            }
            _ => Ok(false),
        }
    }

    fn intrinsic_reg_arg(&self, args: &[Value], idx: usize, name: &str) -> Result<u8, String> {
        let v = args
            .get(idx)
            .copied()
            .ok_or_else(|| format!("Intrinsic {} missing register argument {}", name, idx + 1))?;
        let ValueDef::Result(inst) = self.f.value_def(v) else {
            return Err(format!("Intrinsic {} expects literal register arguments", name));
        };
        let InstData::Iconst(k) = self.f.inst_data(inst) else {
            return Err(format!("Intrinsic {} expects literal register arguments", name));
        };
        if !(0..=31).contains(k) {
            return Err(format!("Intrinsic {} register argument out of range: {}", name, k));
        }
        Ok(*k as u8)
    }

    fn intrinsic_literal_arg(&self, args: &[Value], idx: usize, name: &str) -> Result<i32, String> {
        let v = args
            .get(idx)
            .copied()
            .ok_or_else(|| format!("Intrinsic {} missing literal argument {}", name, idx + 1))?;
        let ValueDef::Result(inst) = self.f.value_def(v) else {
            return Err(format!("Intrinsic {} expects a constant literal argument", name));
        };
        let InstData::Iconst(k) = self.f.inst_data(inst) else {
            return Err(format!("Intrinsic {} expects a constant literal argument", name));
        };
        Ok(*k as i32)
    }

    /// Decrement the r24:r25 counter by one and loop back while it is non-zero.
    /// Uses SBIW on cores that have it, or SUBI/SBCI on the reduced core (which
    /// lacks SBIW); both bodies are 4 cycles per iteration, so the surrounding
    /// burn-cycle arithmetic is unchanged.
    fn emit_burn_loop16(&mut self) {
        if self.target_core == TargetCore::AVRrc {
            self.emit(0x5081); // subi r24, 1
            self.emit(0x4090); // sbci r25, 0
            self.emit(0xF7E9); // brne .-3 words
        } else {
            self.emit(0x9701); // sbiw r24, 1
            self.emit(0xF7F1); // brne .-2 words
        }
    }

    fn emit_burn(&mut self, mut cycles: u32) {
        // Large delays: chunk into 16-bit loops of max 65000 * 4 = 260000 cycles
        while cycles >= 260009 {
            self.emit(0x938F); // push r24
            self.emit(0x939F); // push r25
            self.ldi(24, (65000 & 0xFF) as u8);
            self.ldi(25, (65000 >> 8) as u8);
            self.emit_burn_loop16();
            self.emit(0x919F); // pop r25
            self.emit(0x918F); // pop r24
            cycles -= 260009;
        }

        // 16-bit loop for cycles >= 13
        if cycles >= 13 {
            let x = (cycles - 9) / 4;
            if x > 0 && x <= 65535 {
                self.emit(0x938F); // push r24
                self.emit(0x939F); // push r25
                self.ldi(24, (x & 0xFF) as u8);
                self.ldi(25, (x >> 8) as u8);
                self.emit_burn_loop16();
                self.emit(0x919F); // pop r25
                self.emit(0x918F); // pop r24
                cycles -= 4 * x + 9;
            }
        }
        // 8-bit loop for remaining >= 7
        else if cycles >= 7 {
            let x = (cycles - 4) / 3;
            if x > 0 && x <= 255 {
                self.emit(0x938F); // push r24
                self.ldi(24, x as u8);
                self.emit(0x958A); // dec r24
                self.emit(0xF7F1); // brne .-2 words
                self.emit(0x918F); // pop r24
                cycles -= 3 * x + 4;
            }
        }
        
        // Exact padding for remaining cycles (<= 6)
        while cycles >= 2 {
            self.emit(0xC000); // rjmp .+0 (2 cycles)
            cycles -= 2;
        }
        if cycles == 1 {
            self.emit(0x0000); // nop (1 cycle)
        }
    }

    fn emit_return(&mut self, val: Option<Value>) -> Result<(), String> {
        if self.is_isr {
            // ISR epilogue: restore the saved set in reverse, then SREG/r1/r0, and RETI.
            let saved = self.isr_saved.clone();
            for &r in saved.iter().rev() {
                self.emit(0x900F | ((r as u16) << 4)); // POP r
            }
            if self.isr_full_frame {
                self.emit(0x901F); // POP R1
                self.emit(0x900F); // POP R0  (saved SREG)
                self.emit(0xBE0F); // OUT SREG, R0 (0x3F)
                self.emit(0x900F); // POP R0
            }
            self.emit(0x9518); // RETI
            return Ok(());
        }
        if let Some(v) = val {
            let r = self.reg(v)?;
            if self.is_pair(v) {
                self.movw_or_pair(24, r);
            } else {
                self.mov(24, r);
            }
        }
        // Epilogue: pop callee-saved in reverse, RET.
        let callee = self.used_callee.clone();
        for &r in callee.iter().rev() {
            self.emit(0x900F | ((r as u16) << 4)); // POP
        }
        self.emit(0x9508); // RET
        Ok(())
    }
}

/// Emits the signed Q8.8 fixed-point runtime routines (`@__fmul16`, `@__fdiv16`) that the
/// SSA lowering calls for fixed-point `*`/`/`. ABI: a in r24:r25, b in r22:r23, result in
/// r24:r25. They use only caller-saved scratch (r18..r26, r0, r1), so no save/restore.
/// Fixed-point runtime helpers (requires hardware MUL for multiplication).
pub fn fixed_point_runtime() -> Vec<Pass1Inst> {
    let mut o: Vec<Pass1Inst> = Vec::new();
    let rr = |op: u16, d: u8, r: u8| -> u16 {
        op | ((d as u16) << 4) | (((r & 0x10) as u16) << 5) | (r & 0x0F) as u16
    };
    // --- helpers operating on the local vector ---
    macro_rules! op { ($w:expr) => { o.push(Pass1Inst::Op($w)); } }
    macro_rules! lbl { ($s:expr) => { o.push(Pass1Inst::Label($s.to_string())); } }
    macro_rules! rjmp { ($s:expr) => { o.push(Pass1Inst::RJumpL($s.to_string())); } }

    // abs16(lo,hi) with a uniquely-named skip label.
    macro_rules! abs16 {
        ($lo:expr, $hi:expr, $skip:expr) => {{
            op!(0xFE00 | (($hi as u16) << 4) | 7); // SBRS hi,7
            rjmp!($skip);
            op!(0x9400 | (($hi as u16) << 4)); // COM hi
            op!(0x9401 | (($lo as u16) << 4)); // NEG lo
            op!(0x4F0F | ((($hi - 16) as u16) << 4)); // SBCI hi,0xFF
            lbl!($skip);
        }};
    }
    macro_rules! cneg16 {
        ($lo:expr, $hi:expr, $sign:expr, $skip:expr) => {{
            op!(0xFE00 | (($sign as u16) << 4) | 7); // SBRS sign,7
            rjmp!($skip);
            op!(0x9400 | (($hi as u16) << 4));
            op!(0x9401 | (($lo as u16) << 4));
            op!(0x4F0F | ((($hi - 16) as u16) << 4));
            lbl!($skip);
        }};
    }

    // ---------------- @__fmul16: signed Q8.8 multiply ----------------
    // a0=24,a1=25, b0=22,b1=23, product p0..3 = 18..21, sign = 26.
    lbl!("@__fmul16");
    op!(rr(0x2C00, 26, 25)); // mov r26, a_hi
    op!(rr(0x2400, 26, 23)); // eor r26, b_hi  (sign in bit7)
    abs16!(24u8, 25u8, "__fmul16_absa");
    abs16!(22u8, 23u8, "__fmul16_absb");
    op!(rr(0x9C00, 24, 22)); // mul a0,b0
    op!(rr(0x2C00, 18, 0));
    op!(rr(0x2C00, 19, 1));
    op!(rr(0x9C00, 25, 23)); // mul a1,b1
    op!(rr(0x2C00, 20, 0));
    op!(rr(0x2C00, 21, 1));
    op!(rr(0x9C00, 24, 23)); // mul a0,b1
    op!(rr(0x0C00, 19, 0));
    op!(rr(0x1C00, 20, 1));
    op!(rr(0x2400, 0, 0)); // clr r0
    op!(rr(0x1C00, 21, 0));
    op!(rr(0x9C00, 25, 22)); // mul a1,b0
    op!(rr(0x0C00, 19, 0));
    op!(rr(0x1C00, 20, 1));
    op!(rr(0x2400, 0, 0));
    op!(rr(0x1C00, 21, 0));
    op!(0x2411); // clr r1
    op!(rr(0x2C00, 24, 19)); // result lo = p1
    op!(rr(0x2C00, 25, 20)); // result hi = p2
    cneg16!(24u8, 25u8, 26u8, "__fmul16_sgn");
    op!(0x9508); // ret

    // ---------------- @__fdiv16: signed Q8.8 divide ----------------
    // q0=24,q1=25, d0=22,d1=23, q2=18, rem0=19, rem1=20, cnt=21, sign=26.
    lbl!("@__fdiv16");
    op!(rr(0x2C00, 26, 25)); // mov r26, a_hi
    op!(rr(0x2400, 26, 23)); // eor r26, b_hi
    abs16!(24u8, 25u8, "__fdiv16_absa");
    abs16!(22u8, 23u8, "__fdiv16_absb");
    op!(rr(0x2C00, 18, 25)); // q2 = a_hi
    op!(rr(0x2C00, 25, 24)); // q1 = a_lo
    op!(rr(0x2400, 24, 24)); // q0 = 0  (a << 8)
    op!(rr(0x2400, 19, 19)); // clr rem0
    op!(rr(0x2400, 20, 20)); // clr rem1
    op!(0xE000 | (1 << 8) | (((21 - 16) as u16) << 4) | 8); // ldi r21, 24
    lbl!("__fdiv16_loop");
    op!(rr(0x0C00, 24, 24)); // lsl q0
    op!(rr(0x1C00, 25, 25)); // rol q1
    op!(rr(0x1C00, 18, 18)); // rol q2
    op!(rr(0x1C00, 19, 19)); // rol rem0
    op!(rr(0x1C00, 20, 20)); // rol rem1
    op!(rr(0x1400, 19, 22)); // cp rem0,d0
    op!(rr(0x0400, 20, 23)); // cpc rem1,d1
    o.push(Pass1Inst::BrbsL(0, "__fdiv16_skip".to_string())); // brcs skip
    op!(rr(0x1800, 19, 22)); // sub rem0,d0
    op!(rr(0x0800, 20, 23)); // sbc rem1,d1
    op!(0x6001 | (((24 - 16) as u16) << 4)); // ori q0,1
    lbl!("__fdiv16_skip");
    op!(0x940A | ((21u16) << 4)); // dec r21
    o.push(Pass1Inst::BrbcL(1, "__fdiv16_loop".to_string())); // brne loop
    cneg16!(24u8, 25u8, 26u8, "__fdiv16_sgn");
    op!(0x9508); // ret

    o
}

/// (low-byte opcode, high-byte/carry opcode, commutative) for two-address arithmetic
/// and bitwise ops, or None for ops handled specially (mul/div/rem/shifts).
fn arith_opcodes(op: BinOp) -> Option<(u16, u16, bool)> {
    Some(match op {
        BinOp::Add => (0x0C00, 0x1C00, true),  // ADD / ADC
        BinOp::Sub => (0x1800, 0x0800, false), // SUB / SBC
        BinOp::And => (0x2000, 0x2000, true),  // AND
        BinOp::Or => (0x2800, 0x2800, true),   // OR
        BinOp::Xor => (0x2400, 0x2400, true),  // EOR
        _ => return None,
    })
}
