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

use std::collections::HashMap;
use crate::parser::{ASTNode, Stmt, Expr};

// -------------------------------------------------------------------------------------------------
// Backend Architecture
// -------------------------------------------------------------------------------------------------
// File organization:
//
// 1) Core model/types
//    - `TargetCore`: feature matrix by AVR family.
//    - `Pass1Inst`: symbolic instructions with unresolved labels.
//    - `CodeGenerator`: frontend-to-backend lowering state.
//
// 2) Phase 1 lowering (`impl CodeGenerator`)
//    - AST rewrites (inlining + constant propagation).
//    - Statement/expression lowering to `Pass1Inst`.
//    - Target-aware instruction selection and stack/register policy.
//
// 3) Phase 2 assembly utilities (outside the impl)
//    - peephole optimization
//    - label resolution + branch relaxation
//    - Intel HEX emission
//
// 4) Analysis/rewrite helpers
//    - liveness and declaration collection
//    - inlining support transforms
//
// Design:
// We emit a symbolic pass first, then resolve physical addresses in a second pass.
// This keeps code generation easier to reason about and makes later optimizations safer.
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Core Target Model
// -------------------------------------------------------------------------------------------------
/// Represents the target AVR core family architecture.
/// 
/// Different AVR families have different feature matrices (e.g., presence of hardware
/// multiply instructions, support for 16-bit word-immediate forms like ADIW/SBIW).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum TargetCore {
    Generic,
    AVRe,
    AVRePlus,
    AVRrc,
    AVRxm,
    AVRxt,
}

impl TargetCore {
    /// True when target core family provides hardware multiply instructions.
    pub fn supports_mul(self) -> bool {
        !matches!(self, TargetCore::AVRe | TargetCore::AVRrc)
    }

    /// True when target supports ADIW/SBIW word-immediate arithmetic forms.
    pub fn supports_adiw_sbiw(self) -> bool {
        !matches!(self, TargetCore::AVRrc)
    }
}

/// Symbolic instruction representation emitted during Phase 1 lowering.
///
/// These pseudo-instructions hold symbolic label targets (e.g., function names, loop
/// entry/exit points) and remain unresolved until label resolution and branch relaxation
/// are performed in Phase 2.
#[derive(Debug, Clone)]
pub enum Pass1Inst {
    // One already-encoded machine word.
    Op(u16),
    // Pseudo-instructions kept until label resolution.
    Label(String),
    RJumpL(String),
    RCallL(String),
    // Conditional branches encoded later with 7-bit relative displacement.
    BrbsL(u8, String),
    BrbcL(u8, String),
    // Load register pair (target, target+1) with the byte address of a flash
    // label plus a constant byte offset. Resolved during label resolution.
    // Fields: (target_register, label_name, byte_offset)
    FlashLdi16(u8, String, u16),
    // Raw data blob to embed in flash (program memory) after all code.
    // Packed as little-endian u16 words during label resolution.
    FlashDataBlob(String, Vec<u8>),
}

// -------------------------------------------------------------------------------------------------
// End of Core Target Model
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Main Lowering State
// -------------------------------------------------------------------------------------------------
pub struct CodeGenerator {
    instructions: Vec<Pass1Inst>,
    constants: HashMap<String, i32>,
    variables: HashMap<String, (u16, String, bool)>, // name -> (address, type, is_mut)
    var_homes: HashMap<String, u8>,                  // scalar $var -> resident register (low byte)
    loop_bound_regs: Vec<u8>,                        // callee-saved reg pairs reserved for loop bounds (by nesting depth)
    loop_depth: usize,                               // current loop nesting depth
    current_saves: Vec<u8>,                          // callee-saved regs to push/pop in this function
    sram_free_ptr: u16,
    sram_start: u16,
    eeprom_free_ptr: u16,
    label_counter: usize,
    functions: HashMap<String, (Vec<String>, String)>,
    pub target_core: TargetCore,
    pub total_registers_used: std::collections::HashSet<u8>,
    
    // Inlining state
    // NOTE: currently only AST-level inlining uses these helper maps/sets.
    inline_return_labels: Vec<String>,
    inline_prefixes: Vec<String>,
    leaf_functions: std::collections::HashSet<String>,
    func_bodies: std::collections::HashMap<String, (Vec<(String, String)>, String, Vec<Stmt>)>,
    imut_constants: HashMap<String, i64>,
    // Names of variables whose declared type is signed (i8/i16/r8/r16). Width is normalized to
    // u8/u16 in `variables`, so signedness is tracked here and consulted only where instruction
    // selection differs (comparisons, division/modulo, sign-extension, constant folding).
    signed_vars: std::collections::HashSet<String>,
    // Functions whose return type is signed.
    signed_funcs: std::collections::HashSet<String>,
    // Fixed-point variables and their fractional-bit count (r8 -> 4, r16 -> 8). Used to apply
    // scale corrections on `*` and `/`. Fixed-point types are also signed (tracked above).
    fixed_vars: HashMap<String, u8>,
    fixed_funcs: HashMap<String, u8>,
    ptr_funcs: HashMap<String, (String, String)>,
    str_funcs: HashMap<String, String>,
    // Pointer variables: name -> (target memory space "ram"/"flash"/"eeprom", pointee type).
    // Width is normalized to u16 (a 16-bit address) in `variables`.
    ptr_vars: HashMap<String, (String, String)>,
    // String variables: name -> storage space ("ram" or "flash").
    str_vars: HashMap<String, String>,
    // Intern pool for string literals materialized in SRAM: literal bytes -> base address.
    string_pool: HashMap<String, u16>,
    // Flash string data: accumulated raw bytes for all flash strings, packed
    // into one contiguous blob emitted after all code.
    flash_data_blob: Vec<u8>,
    // Single label marking the start of `flash_data_blob`. Every flash string
    // is addressed as (this label) + (its byte offset), so all of them share
    // one base label rather than each owning a label only one of which gets
    // an address assigned during resolution.
    flash_blob_label: Option<String>,
    // Flash string dedup pool: string content -> byte offset within the blob.
    flash_string_pool: HashMap<String, u16>,
}

// -------------------------------------------------------------------------------------------------
// End of Main Lowering State
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Phase 1: AST -> Pass1Inst
// -------------------------------------------------------------------------------------------------
impl CodeGenerator {
    /// Constructor with deterministic backend defaults.
    ///
    /// State invariant after return:
    /// - SRAM allocator base and cursor both point to `0x0100`.
    /// - No symbols/functions are registered.
    /// - Instruction stream is empty.
    pub fn new() -> Self {
        Self {
            instructions: Vec::new(),
            constants: HashMap::new(),
            variables: HashMap::new(),
            var_homes: HashMap::new(),
            loop_bound_regs: Vec::new(),
            loop_depth: 0,
            current_saves: Vec::new(),
            sram_free_ptr: 0x0100,
            sram_start: 0x0100,
            eeprom_free_ptr: 0,
            label_counter: 0,
            functions: HashMap::new(),
            target_core: TargetCore::Generic,
            inline_return_labels: Vec::new(),
            inline_prefixes: Vec::new(),
            leaf_functions: std::collections::HashSet::new(),
            func_bodies: std::collections::HashMap::new(),
            total_registers_used: std::collections::HashSet::new(),
            imut_constants: HashMap::new(),
            signed_vars: std::collections::HashSet::new(),
            signed_funcs: std::collections::HashSet::new(),
            fixed_vars: HashMap::new(),
            fixed_funcs: HashMap::new(),
            ptr_funcs: HashMap::new(),
            str_funcs: HashMap::new(),
            ptr_vars: HashMap::new(),
            str_vars: HashMap::new(),
            string_pool: HashMap::new(),
            flash_data_blob: Vec::new(),
            flash_blob_label: None,
            flash_string_pool: HashMap::new(),
        }
    }

    /// Overrides SRAM allocation base.
    ///
    /// Precondition:
    /// - `addr` is a valid data-memory base for the selected target profile.
    ///
    /// Postcondition:
    /// - Existing allocations are discarded by resetting `sram_free_ptr` to `addr`.
    pub fn set_sram_start(&mut self, addr: u16) {
        self.sram_start = addr;
        self.sram_free_ptr = addr;
    }

    /// Feature gate helper for multiplication opcode paths.
    fn has_hw_mul(&self) -> bool {
        self.target_core.supports_mul()
    }

    /// Returns a globally unique label for this codegen instance.
    ///
    /// Postcondition:
    /// - `label_counter` increases monotonically by 1.
    fn new_label(&mut self, prefix: &str) -> String {
        self.label_counter += 1;
        format!("{}_{}", prefix, self.label_counter)
    }

    /// Bytes of SRAM allocated for variables (everything not held in registers), measured
    /// from the sram_start base. Lets the build pick which MCUs have enough SRAM for a program.
    pub fn sram_used(&self) -> u16 {
        if self.sram_free_ptr >= self.sram_start {
            self.sram_free_ptr - self.sram_start
        } else {
            0
        }
    }

    /// Bytes of EEPROM allocated for persistent `imut` variables.
    pub fn eeprom_used(&self) -> u16 {
        self.eeprom_free_ptr
    }

    /// Emits hardware register read protocol to load byte from EEPROM address `addr` into `target`.
    fn emit_eeprom_read(&mut self, addr: u16, target: u8) -> Result<(), String> {
        if matches!(self.target_core, TargetCore::AVRxt | TargetCore::AVRxm | TargetCore::AVRrc) {
            return Err("Memory Error: imut storage is not supported on AVRxt/AVRxm/AVRrc architecture cores".to_string());
        }
        // 1. Wait for completion of previous write: SBIC 0x1F, 1 ; RJMP -2
        self.emit(Pass1Inst::Op(0x99F9)); // SBIC 0x1F, 1
        self.emit(Pass1Inst::Op(0xCFFE)); // RJMP -2

        // 2. Set address in EEARL (0x21) and EEARH (0x22)
        let addr_lo = (addr & 0xFF) as u8;
        let addr_hi = ((addr >> 8) & 0xFF) as u8;

        // Load addr_lo into target
        let k_hi = (addr_lo >> 4) & 0x0F;
        let k_lo = addr_lo & 0x0F;
        let d = target - 16;
        self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI target, addr_lo
        
        // OUT 0x21, target
        let op_out_lo = 0xB800 | ((0x21 & 0x30) << 5) | ((target as u16) << 4) | (0x21 & 0x0F);
        self.emit(Pass1Inst::Op(op_out_lo));

        // Load addr_hi into target
        let k_hi = (addr_hi >> 4) & 0x0F;
        let k_lo = addr_hi & 0x0F;
        self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI target, addr_hi

        // OUT 0x22, target
        let op_out_hi = 0xB800 | ((0x22 & 0x30) << 5) | ((target as u16) << 4) | (0x22 & 0x0F);
        self.emit(Pass1Inst::Op(op_out_hi));

        // 3. Start EEPROM read: SBI 0x1F, 0
        self.emit(Pass1Inst::Op(0x9AF8));

        // 4. Read data from EEDR (0x20) into target
        let op_in = 0xB000 | ((0x20 & 0x30) << 5) | ((target as u16) << 4) | (0x20 & 0x0F);
        self.emit(Pass1Inst::Op(op_in));

        Ok(())
    }

    fn emit_eeprom_write(&mut self, addr: u16, src: u8) -> Result<(), String> {
        if matches!(self.target_core, TargetCore::AVRxt | TargetCore::AVRxm | TargetCore::AVRrc) {
            return Err("Memory Error: imut storage is not supported on AVRxt/AVRxm/AVRrc architecture cores".to_string());
        }
        // 1. Wait for completion of previous write: SBIC 0x1F, 1 ; RJMP -2
        self.emit(Pass1Inst::Op(0x99F9)); // SBIC 0x1F, 1
        self.emit(Pass1Inst::Op(0xCFFE)); // RJMP -2

        let tmp_reg = if src == 18 { 16 } else { 18 };
        let d = tmp_reg - 16;
        
        // Save tmp_reg
        self.emit(Pass1Inst::Op(0x920F | ((tmp_reg as u16) << 4))); // PUSH tmp_reg

        // 2. Set address in EEARL (0x21) and EEARH (0x22)
        let addr_lo = (addr & 0xFF) as u8;
        let addr_hi = ((addr >> 8) & 0xFF) as u8;

        // Load addr_lo into tmp_reg
        let k_hi = (addr_lo >> 4) & 0x0F;
        let k_lo = addr_lo & 0x0F;
        self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI tmp_reg, addr_lo

        // OUT 0x21, tmp_reg
        let op_out_lo = 0xB800 | ((0x21 & 0x30) << 5) | ((tmp_reg as u16) << 4) | (0x21 & 0x0F);
        self.emit(Pass1Inst::Op(op_out_lo));

        // Load addr_hi into tmp_reg
        let k_hi = (addr_hi >> 4) & 0x0F;
        let k_lo = addr_hi & 0x0F;
        self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI tmp_reg, addr_hi

        // OUT 0x22, tmp_reg
        let op_out_hi = 0xB800 | ((0x22 & 0x30) << 5) | ((tmp_reg as u16) << 4) | (0x22 & 0x0F);
        self.emit(Pass1Inst::Op(op_out_hi));

        // Restore tmp_reg
        self.emit(Pass1Inst::Op(0x900F | ((tmp_reg as u16) << 4))); // POP tmp_reg

        // 3. Write data to EEDR (0x20)
        let op_out_eedr = 0xB800 | ((0x20 & 0x30) << 5) | ((src as u16) << 4) | (0x20 & 0x0F);
        self.emit(Pass1Inst::Op(op_out_eedr));

        // 4. Trigger write: SBI 0x1F, 2 (EEMPE) followed immediately by SBI 0x1F, 1 (EEPE)
        self.emit(Pass1Inst::Op(0x9AFA)); // SBI 0x1F, 2
        self.emit(Pass1Inst::Op(0x9AF9)); // SBI 0x1F, 1

        Ok(())
    }

    /// Reads one byte from EEPROM at runtime address in Z (R30:R31) into `target`.
    fn emit_eeprom_read_z(&mut self, target: u8) -> Result<(), String> {
        if matches!(self.target_core, TargetCore::AVRxt | TargetCore::AVRxm | TargetCore::AVRrc) {
            return Err("Memory Error: EEPROM access is not supported on AVRxt/AVRxm/AVRrc architecture cores".to_string());
        }
        // Wait for any previous write to complete.
        self.emit(Pass1Inst::Op(0x99F9)); // SBIC 0x1F, 1
        self.emit(Pass1Inst::Op(0xCFFE)); // RJMP -2

        // EEARL <- ZL (R30), EEARH <- ZH (R31)
        let out_eearl = 0xB800 | ((0x21 & 0x30) << 5) | ((30u16) << 4) | (0x21 & 0x0F);
        let out_eearh = 0xB800 | ((0x22 & 0x30) << 5) | ((31u16) << 4) | (0x22 & 0x0F);
        self.emit(Pass1Inst::Op(out_eearl));
        self.emit(Pass1Inst::Op(out_eearh));

        // Trigger read and fetch byte from EEDR.
        self.emit(Pass1Inst::Op(0x9AF8)); // SBI 0x1F, 0
        let in_eedr = 0xB000 | ((0x20 & 0x30) << 5) | ((target as u16) << 4) | (0x20 & 0x0F);
        self.emit(Pass1Inst::Op(in_eedr));
        Ok(())
    }

    /// Writes one byte from `src` to EEPROM at runtime address in Z (R30:R31).
    fn emit_eeprom_write_z(&mut self, src: u8) -> Result<(), String> {
        if matches!(self.target_core, TargetCore::AVRxt | TargetCore::AVRxm | TargetCore::AVRrc) {
            return Err("Memory Error: EEPROM access is not supported on AVRxt/AVRxm/AVRrc architecture cores".to_string());
        }
        // Wait for any previous write to complete.
        self.emit(Pass1Inst::Op(0x99F9)); // SBIC 0x1F, 1
        self.emit(Pass1Inst::Op(0xCFFE)); // RJMP -2

        // EEARL <- ZL (R30), EEARH <- ZH (R31), EEDR <- src
        let out_eearl = 0xB800 | ((0x21 & 0x30) << 5) | ((30u16) << 4) | (0x21 & 0x0F);
        let out_eearh = 0xB800 | ((0x22 & 0x30) << 5) | ((31u16) << 4) | (0x22 & 0x0F);
        let out_eedr = 0xB800 | ((0x20 & 0x30) << 5) | ((src as u16) << 4) | (0x20 & 0x0F);
        self.emit(Pass1Inst::Op(out_eearl));
        self.emit(Pass1Inst::Op(out_eearh));
        self.emit(Pass1Inst::Op(out_eedr));

        // EEMPE then EEPE.
        self.emit(Pass1Inst::Op(0x9AFA)); // SBI 0x1F, 2
        self.emit(Pass1Inst::Op(0x9AF9)); // SBI 0x1F, 1
        Ok(())
    }

    /// Encodes generic AVR register-register instruction forms that use split `Rr` bits.
    ///
    /// Precondition:
    /// - `d` and `r` are valid AVR register indices (0..31).
    ///
    /// Postcondition:
    /// - Returns a complete 16-bit word for the chosen `op` template.
    fn encode_rd_rr(&self, op: u16, d: u8, r: u8) -> u16 {
        let d_bits = (d as u16) << 4;
        let r_bit9 = ((r & 0x10) as u16) << 5;
        let r_bits3_0 = (r & 0x0F) as u16;
        op | d_bits | r_bit9 | r_bits3_0
    }

    /// Appends one symbolic instruction to the pass-1 stream.
    fn emit(&mut self, inst: Pass1Inst) {
        self.instructions.push(inst);
    }

    /// True only for register pairs legal for ADIW/SBIW destination encoding.
    fn is_adiw_pair(reg: u8) -> bool {
        matches!(reg, 24 | 26 | 28 | 30)
    }

    /// Emits `target += imm` for a u16 register pair.
    ///
    /// Selection policy:
    /// - Use ADIW when legal (`r24/r26/r28/r30`, imm <= 63, core supports it).
    /// - Otherwise synthesize with SUBI/SBCI using two's-complement immediate.
    fn emit_add_u16_imm(&mut self, target: u8, imm: u16) {
        if imm == 0 {
            return;
        }
        if self.target_core.supports_adiw_sbiw() && Self::is_adiw_pair(target) && imm <= 63 {
            let dd = ((target - 24) / 2) as u16;
            let k = imm as u16;
            let op = 0x9600 | ((k & 0x30) << 2) | (dd << 4) | (k & 0x0F);
            self.emit(Pass1Inst::Op(op)); // ADIW
            return;
        }
        let neg = (0u16).wrapping_sub(imm);
        let k_lo = (neg & 0xFF) as u8;
        let k_hi = ((neg >> 8) & 0xFF) as u8;
        self.emit(Pass1Inst::Op(
            0x5000 | (((k_lo >> 4) & 0x0F) as u16) << 8
                | ((target - 16) as u16) << 4
                | (k_lo & 0x0F) as u16,
        )); // SUBI low, -k_lo
        self.emit(Pass1Inst::Op(
            0x4000 | (((k_hi >> 4) & 0x0F) as u16) << 8
                | ((target + 1 - 16) as u16) << 4
                | (k_hi & 0x0F) as u16,
        )); // SBCI high, -k_hi
    }

    /// Emits `target -= imm` for a u16 register pair.
    ///
    /// Selection policy:
    /// - Use SBIW when legal (`r24/r26/r28/r30`, imm <= 63, core supports it).
    /// - Otherwise synthesize with SUBI/SBCI.
    fn emit_sub_u16_imm(&mut self, target: u8, imm: u16) {
        if imm == 0 {
            return;
        }
        if self.target_core.supports_adiw_sbiw() && Self::is_adiw_pair(target) && imm <= 63 {
            let dd = ((target - 24) / 2) as u16;
            let k = imm as u16;
            let op = 0x9700 | ((k & 0x30) << 2) | (dd << 4) | (k & 0x0F);
            self.emit(Pass1Inst::Op(op)); // SBIW
            return;
        }
        let k_lo = (imm & 0xFF) as u8;
        let k_hi = ((imm >> 8) & 0xFF) as u8;
        self.emit(Pass1Inst::Op(
            0x5000 | (((k_lo >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k_lo & 0x0F) as u16,
        )); // SUBI low, k_lo
        self.emit(Pass1Inst::Op(
            0x4000 | (((k_hi >> 4) & 0x0F) as u16) << 8 | ((target + 1 - 16) as u16) << 4 | (k_hi & 0x0F) as u16,
        )); // SBCI high, k_hi
    }

    /// Full backend pipeline from parsed AST to pass-1 symbolic instructions.
    ///
    /// Pipeline overview:
    /// 1) Collect function metadata and leaf candidates.
    /// 2) Apply AST-to-AST inlining for selected leaves.
    /// 3) Propagate constants over the rewritten AST.
    /// 4) Register symbols, emit startup trampoline, and remove unreachable functions.
    /// 5) Lower reachable functions to symbolic instructions.
    /// 6) Validate memory/hardware address safety.
    ///
    /// Important strategy note:
    /// We keep this flow iterative and deterministic instead of recursively emitting code
    /// from call sites. A recursive emitter was intentionally avoided because output order
    /// and branch spans become harder to reason about and debug.
    ///
    /// Output invariant:
    /// - Every control-flow edge in this stage is label-based, never absolute-address based.
    /// - Concrete PC-relative displacement is a phase-2 responsibility.
    pub fn compile(&mut self, ast: &[ASTNode]) -> Result<Vec<Pass1Inst>, String> {
        let mut ast = ast.to_vec();

        // Stage 0A: pre-compute function signatures/bodies once.
        let mut user_funcs = std::collections::HashSet::new();
        for node in &ast {
            if let ASTNode::Func { name, params, ret_ty, body } = node {
                user_funcs.insert(name.clone());
                self.func_bodies.insert(name.clone(), (params.clone(), ret_ty.clone(), body.clone()));
            }
        }

        // Stage 0B: identify leaf functions iteratively to enforce bounded inlining.
        // This limits code growth and branch-distance pressure on AVR targets.
        let mut leaf_functions = std::collections::HashSet::new();
        loop {
            let mut added = false;
            for node in &ast {
                if let ASTNode::Func { name, body, .. } = node {
                    if name != "@main" && !leaf_functions.contains(name) {
                        let mut calls = std::collections::HashSet::new();
                        for stmt in body {
                            collect_calls_stmt(stmt, &mut calls);
                        }
                        let is_leaf = calls.iter().all(|c| {
                            !user_funcs.contains(c) || leaf_functions.contains(c) || c == name
                        });
                        if is_leaf {
                            leaf_functions.insert(name.clone());
                            added = true;
                        }
                    }
                }
            }
            if !added {
                break;
            }
        }
        self.leaf_functions = leaf_functions.clone();
        println!("LEAF FUNCTIONS: {:?}", self.leaf_functions);

        // Stage 0C: AST-to-AST inlining pass (leaf-only policy).
        let mut inline_counter = 0;
        for node in &mut ast {
            if let ASTNode::Func { body, .. } = node {
                inline_block(body, &leaf_functions, &self.func_bodies, &mut inline_counter);
            }
        }

        // Stage 0C.5: lower fractional literals to scaled fixed-point integers before any
        // integer-only constant folding runs.
        for node in &mut ast {
            if let ASTNode::Func { params, ret_ty, body, .. } = node {
                resolve_fixed_literals_func(params, ret_ty, body)?;
            }
        }

        // Stage 0D: constant propagation on rewritten AST.
        for node in &mut ast {
            if let ASTNode::Func { body, .. } = node {
                let mut reassigned = std::collections::HashSet::new();
                collect_reassigned_vars(body, &mut reassigned);
                let mut known = std::collections::HashMap::new();
                propagate_constants_stmts(body, &reassigned, &mut known);
            }
        }

        // Stage 1: register constants and function signatures.
        for node in &ast {
            match node {
                ASTNode::Const { name, ty, value } => {
                    validate_type(ty)?;
                    match ty.as_str() {
                        "u8" if *value < 0 || *value > 255 =>
                            return Err(format!("Constant {} value {} overflows type u8 (0..255)", name, value)),
                        "u16" if *value < 0 || *value > 65535 =>
                            return Err(format!("Constant {} value {} overflows type u16 (0..65535)", name, value)),
                        "i8" if *value < -128 || *value > 127 =>
                            return Err(format!("Constant {} value {} overflows type i8 (-128..127)", name, value)),
                        "i16" if *value < -32768 || *value > 32767 =>
                            return Err(format!("Constant {} value {} overflows type i16 (-32768..32767)", name, value)),
                        _ => {}
                    }
                    if is_signed_type(ty) {
                        self.signed_vars.insert(name.clone());
                    }
                    self.constants.insert(name.clone(), *value);
                }
                ASTNode::Func { name, params, ret_ty, .. } => {
                    for (_, pty) in params {
                        validate_type(pty)?;
                    }
                    validate_type(ret_ty)?;
                    if is_signed_type(ret_ty) {
                        self.signed_funcs.insert(name.clone());
                    }
                    if let Some(f) = fixed_frac_of_type(ret_ty) {
                        self.fixed_funcs.insert(name.clone(), f);
                    }
                    if let Some(rest) = ret_ty.strip_prefix("ptr ") {
                        let mut parts = rest.splitn(2, ' ');
                        let space = parts.next().unwrap_or("ram").to_string();
                        let pointee = parts.next().unwrap_or("u8").to_string();
                        self.ptr_funcs.insert(name.clone(), (space, pointee));
                    }
                    if let Some(space) = ret_ty.strip_prefix("str ") {
                        self.str_funcs.insert(name.clone(), space.to_string());
                    }
                    let param_tys: Vec<String> = params.iter().map(|(_, ty)| normalize_width_type(ty)).collect();
                    self.functions.insert(name.clone(), (param_tys, normalize_width_type(ret_ty)));
                }
            }
        }

        // Stage 2: emit startup trampoline: RCALL @main, then HALT.
        self.emit(Pass1Inst::RCallL("@main".to_string()));
        self.emit(Pass1Inst::Op(0xFFFF));

        // Stage 3: mark reachable functions from @main (DCE frontier).
        let mut call_map = std::collections::HashMap::new();
        for node in &ast {
            if let ASTNode::Func { name, body, .. } = node {
                let mut calls = std::collections::HashSet::new();
                for stmt in body {
                    collect_calls_stmt(stmt, &mut calls);
                }
                call_map.insert(name.clone(), calls);
            }
        }

        let mut reachable = std::collections::HashSet::new();
        reachable.insert("@main".to_string());
        let mut queue = vec!["@main".to_string()];
        while let Some(current) = queue.pop() {
            if let Some(calls) = call_map.get(&current) {
                for call in calls {
                    if !reachable.contains(call) {
                        reachable.insert(call.clone());
                        queue.push(call.clone());
                    }
                }
            }
        }

        // Stage 4: compile reachable functions only.
        // @main goes first to keep the hottest control-flow region close to startup.
        for node in &ast {
            if let ASTNode::Func { name, params, ret_ty, body } = node {
                if name == "@main" && reachable.contains(name) {
                    self.compile_function(name, params, ret_ty, body)?;
                }
            }
        }
        for node in &ast {
            if let ASTNode::Func { name, params, ret_ty, body } = node {
                if name != "@main" && reachable.contains(name) {
                    self.compile_function(name, params, ret_ty, body)?;
                }
            }
        }

        // Stage 5: validate hardware constants against allocated SRAM region.
        for (name, val) in &self.constants {
            if name.starts_with('%') {
                let addr = *val as u16;
                if addr >= self.sram_start && addr < self.sram_free_ptr {
                    return Err(format!(
                        "Memory Error: Hardware conflict: Constant '{}' points to address 0x{:04X}, which overlaps with the compiler-allocated SRAM variable space [0x{:04X}, 0x{:04X})",
                        name, addr, self.sram_start, self.sram_free_ptr
                    ));
                }
            }
        }
        // Stage 6: emit the single accumulated flash string data blob (if any).
        // Every flash string is addressed relative to this one shared label.
        if let Some(label) = self.flash_blob_label.clone() {
            if !self.flash_data_blob.is_empty() {
                self.emit(Pass1Inst::FlashDataBlob(label, self.flash_data_blob.clone()));
            }
        }

        Ok(self.instructions.clone())
    }

    /// Assigns scalar `$` variables (params + locals at any depth) to callee-saved registers
    /// r2..r15, in declaration order, until the pool is exhausted; the rest fall back to SRAM.
    /// Returns the set of registers used (for prologue/epilogue save/restore).
    ///
    /// Allocation strategy:
    /// - We use a lightweight linear-scan allocator over approximate liveness intervals.
    /// - We intentionally do not use graph coloring here: linear scan is deterministic,
    ///   faster for this compiler size, and easier to maintain/debug.
    ///
    /// ABI constraints respected here:
    /// - Scalar homes are selected in callee-saved range r2..r15.
    /// - Argument/return registers (r24:r25 descending for args) are left for call boundary use.
    /// - Loop end-bounds get first claim over homes to avoid per-iteration SRAM reload.
    fn plan_function_registers(&mut self, params: &[(String, String)], body: &[Stmt]) -> Vec<u8> {
        self.var_homes.clear();
        self.loop_bound_regs.clear();
        self.loop_depth = 0;

        let mut saves: Vec<u8> = Vec::new();

        // 1. Allocate loop bound registers first from R2..R15
        let depth = max_loop_depth(body);
        let mut cursor: u8 = 2;
        let limit: u8 = 16;
        for _ in 0..depth {
            if cursor + 1 < limit {
                self.loop_bound_regs.push(cursor);
                saves.push(cursor);
                saves.push(cursor + 1);
                cursor += 2;
            }
        }

        // 2. Collect all variable declarations and their types
        // Types are normalized to their width-equivalent (i16/r16 -> u16, i8/r8 -> u8) so that
        // register allocation and SRAM sizing treat signed/fixed-point vars at the correct width
        // (16-bit vars must receive register *pairs*).
        let mut decl_types: HashMap<String, String> = HashMap::new();
        for (pn, pt) in params {
            decl_types.insert(pn.clone(), normalize_width_type(pt));
        }
        let mut decls_list = Vec::new();
        collect_decls(body, &mut decls_list);
        for (nm, ty) in decls_list {
            decl_types.insert(nm, normalize_width_type(&ty));
        }

        // 3. Construct CFG and Liveness Analysis
        let mut flat_label_counter = 0;
        let flat_stmts = flatten_stmts(body, &mut flat_label_counter);
        let blocks = construct_cfg(&flat_stmts);
        let (_in_sets, out_sets) = run_liveness_analysis(&blocks);

        // 4. Build Interference Graph and Alocate Registers via Graph Coloring
        let graph = build_interference_graph(&blocks, &out_sets);
        
        let mut reserved_regs = std::collections::HashSet::new();
        for &r in &self.loop_bound_regs {
            reserved_regs.insert(r);
            reserved_regs.insert(r + 1);
        }

        let (colors, coloring_saves) = color_graph(&graph, &decl_types, &reserved_regs);
        self.var_homes = colors;

        // Variables whose address is taken must be in SRAM (a register home has no address).
        let mut address_taken = std::collections::HashSet::new();
        collect_address_taken_stmts(body, &mut address_taken);
        for name in &address_taken {
            self.var_homes.remove(name);
        }

        // Pointer operands used by dereference expressions are forced to SRAM as well. Keeping
        // pointer values in memory avoids subtle register-home aliasing across nested expression
        // evaluation and makes `*ptr` semantics stable.
        let mut pointer_operands = std::collections::HashSet::new();
        collect_pointer_operand_vars(body, &mut pointer_operands);
        for name in &pointer_operands {
            self.var_homes.remove(name);
        }
        let has_pointer_ops = !pointer_operands.is_empty();
        if has_pointer_ops {
            self.var_homes.clear();
        }

        // Combine loop bounds and coloring registers to preserve callee-saved registers
        if !has_pointer_ops {
            for r in coloring_saves {
                if !saves.contains(&r) {
                    saves.push(r);
                }
            }
        }

        let mut has_sram_var_in_range = false;
        if self.target_core != TargetCore::AVRrc {
            let mut sim_ptr = self.sram_free_ptr;
            for (name, ty) in &decl_types {
                if ty.contains('[') || !self.var_homes.contains_key(name) {
                    let size = if ty.contains('[') && ty.contains(']') {
                        let parts: Vec<&str> = ty.split('[').collect();
                        let base_ty = parts[0];
                        let size_str = parts[1].trim_end_matches(']');
                        let item_count = size_str.parse::<u16>().unwrap_or(1);
                        let item_sz = if base_ty == "u16" { 2 } else { 1 };
                        item_count * item_sz
                    } else if ty == "u8" {
                        1
                    } else if ty == "u16" {
                        2
                    } else {
                        1
                    };

                    let addr = sim_ptr;
                    sim_ptr += size;

                    if addr < self.sram_start + 64 {
                        has_sram_var_in_range = true;
                    }
                }
            }
        }

        if has_sram_var_in_range {
            if !saves.contains(&28) {
                saves.push(28);
            }
            if !saves.contains(&29) {
                saves.push(29);
            }
        }

        for &r in &saves {
            if r >= 2 && r <= 15 {
                self.total_registers_used.insert(r);
            }
        }

        saves.sort_unstable();
        saves
    }

    /// Lowers one function body with full prologue/body/epilogue handling.
    ///
    /// ABI assumptions encoded here:
    /// - Incoming args start at `r24:r25` and descend by pairs.
    /// - Return value is produced in `r24:r25`.
    fn compile_function(&mut self, name: &str, params: &[(String, String)], _ret_ty: &str, body: &[Stmt]) -> Result<(), String> {
        self.variables.clear();
        self.fixed_vars.clear();
        self.signed_vars.clear();
        self.ptr_vars.clear();
        self.str_vars.clear();
        let saves = self.plan_function_registers(params, body);
        // @main is the root: nothing relies on it preserving registers, and it never returns,
        // so it uses register homes without the save/restore overhead.
        self.current_saves = if name == "@main" { Vec::new() } else { saves.clone() };

        self.emit(Pass1Inst::Label(name.to_string()));

        // Prologue: preserve callee-saved registers this function will reuse.
        for &reg in self.current_saves.clone().iter() {
            self.emit(Pass1Inst::Op(0x920F | ((reg as u16) << 4))); // PUSH reg
        }

        if saves.contains(&28) {
            let sram_lo = (self.sram_start & 0xFF) as u8;
            let sram_hi = ((self.sram_start >> 8) & 0xFF) as u8;
            let op_lo = 0xE000 | (((sram_lo >> 4) as u16) << 8) | (12 << 4) | ((sram_lo & 0x0F) as u16);
            let op_hi = 0xE000 | (((sram_hi >> 4) as u16) << 8) | (13 << 4) | ((sram_hi & 0x0F) as u16);
            self.emit(Pass1Inst::Op(op_lo)); // LDI R28, sram_start_lo
            self.emit(Pass1Inst::Op(op_hi)); // LDI R29, sram_start_hi
        }

        // Move incoming parameters from the argument registers into their homes.
        let mut reg_idx = 24u8;
        for (param_name, param_ty) in params {
            if is_signed_type(param_ty) {
                self.signed_vars.insert(param_name.clone());
            }
            if let Some(f) = fixed_frac_of_type(param_ty) {
                self.fixed_vars.insert(param_name.clone(), f);
            }
            if let Some(rest) = param_ty.strip_prefix("ptr ") {
                let mut parts = rest.splitn(2, ' ');
                let space = parts.next().unwrap_or("ram").to_string();
                let pointee = parts.next().unwrap_or("u8").to_string();
                self.ptr_vars.insert(param_name.clone(), (space, pointee));
            }
            if let Some(space) = param_ty.strip_prefix("str ") {
                self.str_vars.insert(param_name.clone(), space.to_string());
            }
            let norm_param = normalize_width_type(param_ty);
            let param_ty: &str = &norm_param;
            let addr = self.allocate_var(param_name, param_ty, true)?;
            let home = self.var_homes.get(param_name).copied();
            if param_ty == "u8" {
                if let Some(h) = home {
                    let op = self.encode_rd_rr(0x2C00, h, reg_idx);
                    self.emit(Pass1Inst::Op(op)); // MOV home, arg
                } else {
                    self.emit_sts(addr, reg_idx)?;
                }
            } else if param_ty == "u16" {
                if let Some(h) = home {
                    let lo = self.encode_rd_rr(0x2C00, h, reg_idx);
                    let hi = self.encode_rd_rr(0x2C00, h + 1, reg_idx + 1);
                    self.emit(Pass1Inst::Op(lo));
                    self.emit(Pass1Inst::Op(hi));
                } else {
                    self.emit_sts(addr, reg_idx)?;
                    self.emit_sts(addr + 1, reg_idx + 1)?;
                }
            }
            if reg_idx >= 18 {
                reg_idx -= 2;
            }
        }

        self.compile_block(body)?;

        self.emit_return();
        Ok(())
    }

    /// Emits function epilogue and RET.
    ///
    /// Invariant:
    /// - Register pop order is strict reverse of prologue push order.
    fn emit_return(&mut self) {
        for &reg in self.current_saves.clone().iter().rev() {
            self.emit(Pass1Inst::Op(0x900F | ((reg as u16) << 4))); // POP reg
        }
        self.emit(Pass1Inst::Op(0x9508)); // RET
    }

    /// Reads scalar `$` variable `name` into `target`, widening a u8 source to `ctx_ty`.
    ///
    /// Precondition:
    /// - Variable was already declared and registered in `self.variables`.
    ///
    /// Negates an 8-bit two's-complement value in `r`.
    fn emit_neg8(&mut self, r: u8) {
        self.emit(Pass1Inst::Op(0x9401 | ((r as u16) << 4))); // NEG r
    }

    /// Negates a 16-bit two's-complement value held in `lo:hi` (requires hi in r16..r31).
    fn emit_neg16(&mut self, lo: u8, hi: u8) {
        self.emit(Pass1Inst::Op(0x9400 | ((hi as u16) << 4)));       // COM hi
        self.emit(Pass1Inst::Op(0x9401 | ((lo as u16) << 4)));       // NEG lo
        self.emit(Pass1Inst::Op(0x4F0F | (((hi - 16) as u16) << 4))); // SBCI hi, 0xFF
    }

    /// Replaces an 8-bit value in `r` with its absolute value (negate only when bit 7 is set).
    fn emit_abs8(&mut self, r: u8) {
        self.emit(Pass1Inst::Op(0xFC00 | ((r as u16) << 4) | 7)); // SBRC r, 7  (skip NEG if positive)
        self.emit_neg8(r);
    }

    /// Conditionally negates the 8-bit value in `r` when bit 7 of register `sign` is set.
    fn emit_cond_neg8(&mut self, r: u8, sign: u8) {
        let skip = self.new_label("cneg8_skip");
        self.emit(Pass1Inst::Op(0xFE00 | ((sign as u16) << 4) | 7)); // SBRS sign, 7
        self.emit(Pass1Inst::RJumpL(skip.clone()));
        self.emit_neg8(r);
        self.emit(Pass1Inst::Label(skip));
    }

    /// Replaces a 16-bit value in `lo:hi` with its absolute value (negate only when hi bit 7 set).
    fn emit_abs16(&mut self, lo: u8, hi: u8) {
        let skip = self.new_label("abs16_skip");
        self.emit(Pass1Inst::Op(0xFE00 | ((hi as u16) << 4) | 7)); // SBRS hi, 7 (skip RJMP if negative)
        self.emit(Pass1Inst::RJumpL(skip.clone()));
        self.emit_neg16(lo, hi);
        self.emit(Pass1Inst::Label(skip));
    }

    /// Emits a fixed-point multiply `left * right` (both fixed-point, `frac` fractional bits),
    /// leaving the scaled result in `target` (and `target+1` for r16). Requires a hardware
    /// multiplier. r8 is Q4.4 (8x8 signed product, arithmetic `>>4`); r16 is Q8.8 (magnitudes
    /// multiplied to a 32-bit product, `>>8`, sign reapplied).
    fn emit_fixed_mul(&mut self, left: &Expr, right: &Expr, target: u8, ty: &str, frac: u8) -> Result<(), String> {
        if !self.has_hw_mul() {
            return Err("Memory Error: fixed-point multiply requires a hardware multiplier (unavailable on this core)".to_string());
        }
        let is16 = ty == "u16";
        self.compile_expr(left, target, ty)?;
        self.compile_expr(right, target + 2, ty)?;
        if !is16 {
            // r8 / Q4.4: signed 8x8 -> 16-bit product in R1:R0, arithmetic shift right by frac.
            let d = (target - 16) as u16;
            let r = (target + 2 - 16) as u16;
            self.emit(Pass1Inst::Op(0x0200 | (d << 4) | r)); // MULS target, target+2
            for _ in 0..frac {
                self.emit(Pass1Inst::Op(0x9415)); // ASR R1
                self.emit(Pass1Inst::Op(0x9407)); // ROR R0
            }
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target, 0))); // MOV target, R0
            self.emit(Pass1Inst::Op(0x2411));                               // EOR R1, R1
            return Ok(());
        }
        // r16 / Q8.8. Capture result sign, take magnitudes, do an unsigned 16x16 -> 32 multiply,
        // then >>8 keeps bytes 1..2 of the 32-bit product as the 16-bit result.
        let (a0, a1, b0, b1) = (target, target + 1, target + 2, target + 3);
        let (p0, p1, p2, p3) = (target + 4, target + 5, target + 6, target + 7);
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, p0, a1))); // MOV scr, a_hi  (scr = p0)
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2400, p0, b1))); // EOR scr, b_hi
        self.emit(Pass1Inst::Op(0x920F | ((p0 as u16) << 4)));       // PUSH scr
        self.emit(Pass1Inst::Op(0x920F | ((p1 as u16) << 4)));       // PUSH p1
        self.emit(Pass1Inst::Op(0x920F | ((p2 as u16) << 4)));       // PUSH p2
        self.emit(Pass1Inst::Op(0x920F | ((p3 as u16) << 4)));       // PUSH p3

        self.emit_abs16(a0, a1);
        self.emit_abs16(b0, b1);
        // Unsigned 16x16 -> 32: product p3:p2:p1:p0.
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, a0, b0))); // MUL a0,b0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, p0, 0)));  // MOV p0,R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, p1, 1)));  // MOV p1,R1
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, a1, b1))); // MUL a1,b1
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, p2, 0)));  // MOV p2,R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, p3, 1)));  // MOV p3,R1
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, a0, b1))); // MUL a0,b1
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, p1, 0)));  // ADD p1,R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, p2, 1)));  // ADC p2,R1
        self.emit(Pass1Inst::Op(0x2400));                            // CLR R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, p3, 0)));  // ADC p3,R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, a1, b0))); // MUL a1,b0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, p1, 0)));  // ADD p1,R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, p2, 1)));  // ADC p2,R1
        self.emit(Pass1Inst::Op(0x2400));                            // CLR R0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, p3, 0)));  // ADC p3,R0
        self.emit(Pass1Inst::Op(0x2411));                            // EOR R1,R1
        // >>8: result low = p1, result high = p2.
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target, p1)));
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target + 1, p2)));

        self.emit(Pass1Inst::Op(0x900F | ((p3 as u16) << 4)));       // POP p3
        self.emit(Pass1Inst::Op(0x900F | ((p2 as u16) << 4)));       // POP p2
        self.emit(Pass1Inst::Op(0x900F | ((p1 as u16) << 4)));       // POP p1
        self.emit(Pass1Inst::Op(0x900F | ((p0 as u16) << 4)));       // POP scr
        self.emit_cond_neg16(target, target + 1, p0);
        Ok(())
    }

    /// Emits fixed-point division `left / right` for signed fixed-point values.
    ///
    /// Math:
    /// - Q4.4 (`r8`):  result = (left << 4) / right
    /// - Q8.8 (`r16`): result = (left << 8) / right
    ///
    /// Implementation:
    /// - `r8`: promote to 16-bit magnitudes, run restoring 16/16 division, keep low byte.
    /// - `r16`: run restoring 24/16 division over magnitudes, keep low 16 bits.
    /// - Sign is reapplied with two's-complement negation when needed.
    fn emit_fixed_div(&mut self, left: &Expr, right: &Expr, target: u8, ty: &str, frac: u8) -> Result<(), String> {
        let is16 = ty == "u16";
        self.compile_expr(left, target, ty)?;
        self.compile_expr(right, target + 2, ty)?;

        if is16 {
            // q0:q1:q2 is the dividend/quotient register window (24 bits), divisor is d0:d1.
            let q0 = target;
            let q1 = target + 1;
            let d0 = target + 2;
            let d1 = target + 3;
            let q2 = target + 4;
            let rem0 = target + 5;
            let rem1 = target + 6;
            let cnt = target + 7;

            self.emit(Pass1Inst::Op(0x920F | ((q2 as u16) << 4)));   // PUSH q2
            self.emit(Pass1Inst::Op(0x920F | ((rem0 as u16) << 4))); // PUSH rem0
            self.emit(Pass1Inst::Op(0x920F | ((rem1 as u16) << 4))); // PUSH rem1
            self.emit(Pass1Inst::Op(0x920F | ((cnt as u16) << 4)));  // PUSH cnt

            // Preserve quotient sign source across clobbering loop.
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, q2, q1))); // MOV q2, left_hi
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2400, q2, d1))); // EOR q2, right_hi
            self.emit(Pass1Inst::Op(0x920F | ((q2 as u16) << 4)));       // PUSH sign

            // Divide magnitudes.
            self.emit_abs16(q0, q1);
            self.emit_abs16(d0, d1);

            // Build (left << frac) into q0:q1:q2. For Q8.8 we only use frac=8.
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, q2, q1))); // MOV q2, q1
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, q1, q0))); // MOV q1, q0
            self.emit(Pass1Inst::Op(0xE000 | (((q0 - 16) as u16) << 4))); // LDI q0, 0
            if frac > 8 {
                for _ in 0..(frac - 8) {
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, q0, q0))); // LSL q0
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, q1, q1))); // ROL q1
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, q2, q2))); // ROL q2
                }
            }

            // Unsigned restoring 24/16 division (24 iterations).
            self.emit(Pass1Inst::Op(0xE000 | (((rem0 - 16) as u16) << 4))); // LDI rem0, 0
            self.emit(Pass1Inst::Op(0xE000 | (((rem1 - 16) as u16) << 4))); // LDI rem1, 0
            self.emit(Pass1Inst::Op(0xE000 | 0x0108 | (((cnt - 16) as u16) << 4))); // LDI cnt, 24
            let loop_start = self.new_label("fixdiv16_loop");
            let skip_sub = self.new_label("fixdiv16_skip");
            self.emit(Pass1Inst::Label(loop_start.clone()));
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, q0, q0)));   // LSL q0
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, q1, q1)));   // ROL q1
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, q2, q2)));   // ROL q2
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, rem0, rem0))); // ROL rem0
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, rem1, rem1))); // ROL rem1
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1400, rem0, d0))); // CP rem0, d0
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0400, rem1, d1))); // CPC rem1, d1
            self.emit(Pass1Inst::BrbsL(0, skip_sub.clone()));              // BRCS skip
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1800, rem0, d0))); // SUB rem0, d0
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0800, rem1, d1))); // SBC rem1, d1
            self.emit(Pass1Inst::Op(0x6001 | (((q0 - 16) as u16) << 4)));  // ORI q0, 1
            self.emit(Pass1Inst::Label(skip_sub));
            self.emit(Pass1Inst::Op(0x940A | ((cnt as u16) << 4)));        // DEC cnt
            self.emit(Pass1Inst::BrbcL(1, loop_start));                    // BRNE loop

            // Reapply sign on 16-bit result.
            self.emit(Pass1Inst::Op(0x900F | ((q2 as u16) << 4))); // POP sign
            self.emit_cond_neg16(q0, q1, q2);

            self.emit(Pass1Inst::Op(0x900F | ((cnt as u16) << 4)));  // POP cnt
            self.emit(Pass1Inst::Op(0x900F | ((rem1 as u16) << 4))); // POP rem1
            self.emit(Pass1Inst::Op(0x900F | ((rem0 as u16) << 4))); // POP rem0
            self.emit(Pass1Inst::Op(0x900F | ((q2 as u16) << 4)));   // POP q2
            return Ok(());
        }

        // r8/Q4.4 path using promoted 16-bit restoring division.
        let q0 = target;
        let q1 = target + 1;
        let d0 = target + 2;
        let d1 = target + 3;
        let rem0 = target + 4;
        let rem1 = target + 5;
        let cnt = target + 6;

        self.emit(Pass1Inst::Op(0x920F | ((q1 as u16) << 4)));   // PUSH q1
        self.emit(Pass1Inst::Op(0x920F | ((d1 as u16) << 4)));   // PUSH d1
        self.emit(Pass1Inst::Op(0x920F | ((rem0 as u16) << 4))); // PUSH rem0
        self.emit(Pass1Inst::Op(0x920F | ((rem1 as u16) << 4))); // PUSH rem1
        self.emit(Pass1Inst::Op(0x920F | ((cnt as u16) << 4)));  // PUSH cnt

        // Preserve quotient sign source.
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, d1, q0))); // MOV d1, left
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2400, d1, d0))); // EOR d1, right
        self.emit(Pass1Inst::Op(0x920F | ((d1 as u16) << 4)));       // PUSH sign

        // Divide magnitudes.
        self.emit_abs8(q0);
        self.emit_abs8(d0);

        // Promote and scale: q1:q0 = (abs(left) << frac), d1:d0 = abs(right).
        self.emit(Pass1Inst::Op(0xE000 | (((q1 - 16) as u16) << 4))); // LDI q1, 0
        self.emit(Pass1Inst::Op(0xE000 | (((d1 - 16) as u16) << 4))); // LDI d1, 0
        for _ in 0..frac {
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, q0, q0))); // LSL q0
            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, q1, q1))); // ROL q1
        }

        // Unsigned restoring 16/16 division (16 iterations).
        self.emit(Pass1Inst::Op(0xE000 | (((rem0 - 16) as u16) << 4))); // LDI rem0, 0
        self.emit(Pass1Inst::Op(0xE000 | (((rem1 - 16) as u16) << 4))); // LDI rem1, 0
        self.emit(Pass1Inst::Op(0xE000 | 0x0100 | (((cnt - 16) as u16) << 4))); // LDI cnt, 16
        let loop_start = self.new_label("fixdiv8_loop");
        let skip_sub = self.new_label("fixdiv8_skip");
        self.emit(Pass1Inst::Label(loop_start.clone()));
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, q0, q0)));   // LSL q0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, q1, q1)));   // ROL q1
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, rem0, rem0))); // ROL rem0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, rem1, rem1))); // ROL rem1
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1400, rem0, d0))); // CP rem0, d0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0400, rem1, d1))); // CPC rem1, d1
        self.emit(Pass1Inst::BrbsL(0, skip_sub.clone()));              // BRCS skip
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1800, rem0, d0))); // SUB rem0, d0
        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0800, rem1, d1))); // SBC rem1, d1
        self.emit(Pass1Inst::Op(0x6001 | (((q0 - 16) as u16) << 4)));  // ORI q0, 1
        self.emit(Pass1Inst::Label(skip_sub));
        self.emit(Pass1Inst::Op(0x940A | ((cnt as u16) << 4)));        // DEC cnt
        self.emit(Pass1Inst::BrbcL(1, loop_start));                    // BRNE loop

        // Reapply sign on low byte.
        self.emit(Pass1Inst::Op(0x900F | ((d1 as u16) << 4))); // POP sign
        self.emit_cond_neg8(q0, d1);

        self.emit(Pass1Inst::Op(0x900F | ((cnt as u16) << 4)));  // POP cnt
        self.emit(Pass1Inst::Op(0x900F | ((rem1 as u16) << 4))); // POP rem1
        self.emit(Pass1Inst::Op(0x900F | ((rem0 as u16) << 4))); // POP rem0
        self.emit(Pass1Inst::Op(0x900F | ((d1 as u16) << 4)));   // POP d1
        self.emit(Pass1Inst::Op(0x900F | ((q1 as u16) << 4)));   // POP q1

        Ok(())
    }

    /// Conditionally negates the 16-bit value in `lo:hi` when bit 7 of register `sign` is set.
    fn emit_cond_neg16(&mut self, lo: u8, hi: u8, sign: u8) {
        let skip = self.new_label("cneg16_skip");
        self.emit(Pass1Inst::Op(0xFE00 | ((sign as u16) << 4) | 7)); // SBRS sign, 7
        self.emit(Pass1Inst::RJumpL(skip.clone()));
        self.emit_neg16(lo, hi);
        self.emit(Pass1Inst::Label(skip));
    }

    /// Loads a 16-bit immediate into `target:target+1` (both registers must be in r16..r31).
    fn emit_ldi16(&mut self, target: u8, val: u16) {
        let lo = (val & 0xFF) as u8;
        let hi = (val >> 8) as u8;
        let d = (target - 16) as u16;
        self.emit(Pass1Inst::Op(0xE000 | (((lo >> 4) & 0x0F) as u16) << 8 | (d << 4) | ((lo & 0x0F) as u16)));
        let d2 = (target + 1 - 16) as u16;
        self.emit(Pass1Inst::Op(0xE000 | (((hi >> 4) & 0x0F) as u16) << 8 | (d2 << 4) | ((hi & 0x0F) as u16)));
    }

    /// Returns pointer metadata `(space, pointee_type)` for expressions that preserve pointer
    /// identity (variable refs, grouped/unary forms, and +/- integer arithmetic on pointers).
    fn expr_pointer_info(&self, expr: &Expr) -> Option<(String, String)> {
        match expr {
            Expr::VarRef(name) => {
                if let Some((space, pointee)) = self.ptr_vars.get(name) {
                    Some((space.clone(), pointee.clone()))
                } else if let Some(space) = self.str_vars.get(name) {
                    Some((space.clone(), "u8".to_string()))
                } else {
                    None
                }
            }
            Expr::UnaryOp { expr, .. } => self.expr_pointer_info(expr),
            Expr::AddrOf(inner) => {
                match &**inner {
                    Expr::VarRef(name) => {
                        let (_, ty, _) = self.variables.get(name)?;
                        let space = if ty.starts_with("eeprom ") {
                            "eeprom".to_string()
                        } else if ty.starts_with("flash ") {
                            "flash".to_string()
                        } else {
                            "ram".to_string()
                        };
                        let ty_clean = if let Some(rest) = ty.strip_prefix("eeprom ") {
                            rest
                        } else if let Some(rest) = ty.strip_prefix("flash ") {
                            rest
                        } else {
                            ty.as_str()
                        };
                        let width16 = ty_clean.starts_with("u16") || ty_clean.starts_with("i16") || ty_clean.starts_with("r16");
                        let pointee = if let Some(frac) = self.fixed_vars.get(name).copied() {
                            if frac == 8 { "r16".to_string() } else { "r8".to_string() }
                        } else if self.signed_vars.contains(name) {
                            if width16 { "i16".to_string() } else { "i8".to_string() }
                        } else if width16 {
                            "u16".to_string()
                        } else {
                            "u8".to_string()
                        };
                        Some((space, pointee))
                    }
                    Expr::BinOp { left, op, .. } if op == "[]" => {
                        if let Expr::VarRef(name) = &**left {
                            let (_, ty, _) = self.variables.get(name)?;
                            let space = if ty.starts_with("eeprom ") {
                                "eeprom".to_string()
                            } else if ty.starts_with("flash ") {
                                "flash".to_string()
                            } else {
                                "ram".to_string()
                            };
                            let ty_clean = if let Some(rest) = ty.strip_prefix("eeprom ") {
                                rest
                            } else if let Some(rest) = ty.strip_prefix("flash ") {
                                rest
                            } else {
                                ty.as_str()
                            };
                            let width16 = ty_clean.starts_with("u16") || ty_clean.starts_with("i16") || ty_clean.starts_with("r16");
                            let pointee = if let Some(frac) = self.fixed_vars.get(name).copied() {
                                if frac == 8 { "r16".to_string() } else { "r8".to_string() }
                            } else if self.signed_vars.contains(name) {
                                if width16 { "i16".to_string() } else { "i8".to_string() }
                            } else if width16 {
                                "u16".to_string()
                            } else {
                                "u8".to_string()
                            };
                            Some((space, pointee))
                        } else {
                            None
                        }
                    }
                    _ => None,
                }
            }
            Expr::BinOp { left, op, right } if op == "+" || op == "-" => {
                match (self.expr_pointer_info(left), self.expr_pointer_info(right)) {
                    (Some(p), None) => Some(p),
                    (None, Some(p)) => Some(p),
                    _ => None,
                }
            }
            Expr::Call { name, .. } => {
                if let Some((space, pointee)) = self.ptr_funcs.get(name) {
                    Some((space.clone(), pointee.clone()))
                } else if let Some(space) = self.str_funcs.get(name) {
                    Some((space.clone(), "u8".to_string()))
                } else {
                    None
                }
            }
            _ => None,
        }
    }

    /// Resolves the target memory space and pointee type of a dereference operand.
    fn deref_target_info(&self, ptr_expr: &Expr) -> Result<(String, String), String> {
        self.expr_pointer_info(ptr_expr).ok_or_else(|| {
            format!("Cannot dereference expression: expected a pointer/string value, got: {:?}, ptr_vars: {:?}", ptr_expr, self.ptr_vars)
        })
    }

    /// Materializes a string literal as a NUL-terminated byte array in SRAM and returns its base
    /// address. Reuses an existing allocation when the same literal appears again.
    fn materialize_ram_string_literal(&mut self, lit: &str) -> Result<u16, String> {
        if let Some(addr) = self.string_pool.get(lit).copied() {
            return Ok(addr);
        }

        let bytes = lit.as_bytes();
        let len_with_nul = bytes.len() + 1;
        let backing_name = format!("$__strlit_{}", self.new_label("data"));
        let backing_ty = format!("u8[{}]", len_with_nul);
        let base = self.allocate_var(&backing_name, &backing_ty, true)?;

        for (i, b) in bytes.iter().enumerate() {
            self.compile_expr(&Expr::Literal(*b as i32), 16, "u8")?;
            self.emit_sts_abs(base + i as u16, 16);
        }
        self.compile_expr(&Expr::Literal(0), 16, "u8")?;
        self.emit_sts_abs(base + (len_with_nul as u16 - 1), 16);

        self.string_pool.insert(lit.to_string(), base);
        Ok(base)
    }

    /// Fills `target+1` when an 8-bit value is read into a 16-bit context. Unsigned values
    /// zero-extend (`LDI 0`); signed values sign-extend by replicating bit 7 of the low byte.
    fn emit_widen_high(&mut self, target: u8, signed: bool) {
        let d = (target + 1 - 16) as u16;
        self.emit(Pass1Inst::Op(0xE000 | (d << 4))); // LDI target+1, 0
        if signed {
            self.emit(Pass1Inst::Op(0xFC00 | ((target as u16) << 4) | 7)); // SBRC target, 7
            self.emit(Pass1Inst::Op(0xEF0F | (d << 4)));                    // LDI target+1, 0xFF
        }
    }

    /// Postcondition:
    /// - `target` contains low byte; `target+1` is valid when `ctx_ty == "u16"`.
    fn read_var(&mut self, name: &str, target: u8, ctx_ty: &str) -> Result<(), String> {
        if let Some(&val) = self.imut_constants.get(name) {
            let ty_clean = if ctx_ty.starts_with("flash ") { &ctx_ty[6..] } else if ctx_ty.starts_with("eeprom ") { &ctx_ty[7..] } else { ctx_ty };
            return self.compile_expr(&Expr::Literal(val as i32), target, ty_clean);
        }
        let signed = self.signed_vars.contains(name);
        let (addr, var_ty, _) = self.variables.get(name)
            .ok_or_else(|| format!("Undefined variable: {}", name))?;
        let addr = *addr;
        let var_ty = var_ty.clone();

        if var_ty.starts_with("eeprom ") {
            let actual_ty = &var_ty[7..];
            if actual_ty == "u16" {
                self.emit_eeprom_read(addr, target)?;
                self.emit_eeprom_read(addr + 1, target + 1)?;
            } else {
                self.emit_eeprom_read(addr, target)?;
                if ctx_ty == "u16" {
                    self.emit_widen_high(target, signed);
                }
            }
            return Ok(());
        }

        let var_ty_clean = if var_ty.starts_with("flash ") { var_ty[6..].to_string() } else { var_ty.clone() };

        let home = self.var_homes.get(name).copied();
        if let Some(h) = home {
            let lo = self.encode_rd_rr(0x2C00, target, h);
            self.emit(Pass1Inst::Op(lo));
            if var_ty_clean == "u16" {
                let hi = self.encode_rd_rr(0x2C00, target + 1, h + 1);
                self.emit(Pass1Inst::Op(hi));
            } else if ctx_ty == "u16" {
                self.emit_widen_high(target, signed);
            }
        } else if var_ty_clean == "u16" {
            self.emit_lds(target, addr)?;
            self.emit_lds(target + 1, addr + 1)?;
        } else {
            self.emit_lds(target, addr)?;
            if ctx_ty == "u16" {
                self.emit_widen_high(target, signed);
            }
        }
        Ok(())
    }

    /// Stores `src` (and src+1 for u16) into scalar `$` variable `name`.
    ///
    /// Precondition:
    /// - Variable exists and its width matches the generated store sequence.
    fn write_var(&mut self, name: &str, src: u8) -> Result<(), String> {
        let (addr, var_ty, _) = self.variables.get(name)
            .ok_or_else(|| format!("Undefined variable: {}", name))?;
        let addr = *addr;
        let var_ty = var_ty.clone();

        if var_ty.starts_with("eeprom ") {
            let actual_ty = &var_ty[7..];
            if actual_ty == "u16" {
                self.emit_eeprom_write(addr, src)?;
                self.emit_eeprom_write(addr + 1, src + 1)?;
            } else {
                self.emit_eeprom_write(addr, src)?;
            }
            return Ok(());
        }

        let var_ty_clean = if var_ty.starts_with("flash ") { var_ty[6..].to_string() } else { var_ty.clone() };

        let home = self.var_homes.get(name).copied();
        if let Some(h) = home {
            let lo = self.encode_rd_rr(0x2C00, h, src);
            self.emit(Pass1Inst::Op(lo));
            if var_ty_clean == "u16" {
                let hi = self.encode_rd_rr(0x2C00, h + 1, src + 1);
                self.emit(Pass1Inst::Op(hi));
            }
        } else if var_ty_clean == "u16" {
            self.emit_sts(addr, src)?;
            self.emit_sts(addr + 1, src + 1)?;
        } else {
            self.emit_sts(addr, src)?;
        }
        Ok(())
    }

    /// Allocates a general-purpose or array variable in the SRAM unified memory space.
    /// Allocations start at `0x0100` and grow upwards.
    ///
    /// # Safety and Bounds Checking
    /// At compile-time, we track the total allocated memory via `self.sram_free_ptr`.
    /// To prevent stack-heap collision (since the hardware Stack grows downwards from `0x08FF`),
    /// we enforce a strict 64-byte safety margin at the top of SRAM. If variable allocations
    /// exceed `0x08FF - 64` (i.e. `0x08BF`), the compilation fails with an explicit SRAM Overflow error.
    ///
    /// Postcondition:
    /// - `self.variables[name]` is populated even for register-homed scalars (address 0 sentinel).
    fn allocate_var(&mut self, name: &str, ty: &str, is_mut: bool) -> Result<u16, String> {
        if ty.starts_with("eeprom ") {
            if matches!(self.target_core, TargetCore::AVRxt | TargetCore::AVRxm | TargetCore::AVRrc) {
                return Err("Memory Error: EEPROM storage is not supported on this core".to_string());
            }
            let actual_ty = &ty[7..];
            let addr = self.eeprom_free_ptr;
            let size = if actual_ty.contains('[') && actual_ty.contains(']') {
                let parts: Vec<&str> = actual_ty.split('[').collect();
                let base_ty = parts[0];
                let size_str = parts[1].trim_end_matches(']');
                let item_count = size_str.parse::<u16>().unwrap_or(1);
                let item_sz = if base_ty == "u16" { 2 } else { 1 };
                item_count * item_sz
            } else if actual_ty == "u8" {
                1
            } else if actual_ty == "u16" {
                2
            } else {
                1
            };
            self.eeprom_free_ptr += size;
            self.variables.insert(name.to_string(), (addr, ty.to_string(), is_mut));
            return Ok(addr);
        }

        // Register-resident scalars do not occupy SRAM; record only their type/mutability.
        if self.var_homes.contains_key(name) {
            self.variables.insert(name.to_string(), (0, ty.to_string(), is_mut));
            return Ok(0);
        }

        let addr = self.sram_free_ptr;

        let ty_clean = if ty.starts_with("flash ") { &ty[6..] } else { ty };

        let size = if ty_clean.contains('[') && ty_clean.contains(']') {
            let parts: Vec<&str> = ty_clean.split('[').collect();
            let base_ty = parts[0];
            let size_str = parts[1].trim_end_matches(']');
            let item_count = size_str.parse::<u16>().unwrap_or(1);
            let item_sz = if base_ty == "u16" { 2 } else { 1 };
            item_count * item_sz
        } else if ty_clean == "u8" {
            1
        } else if ty_clean == "u16" {
            2
        } else {
            1
        };

        let limit = if self.sram_start == 0x0100 { 0x08FF - 64 } else { 0xFFFF - 64 };
        if self.sram_free_ptr + size > limit {
            return Err(format!(
                "SRAM Overflow: Allocating variable '{}' of size {} bytes would exceed the maximum safe SRAM limit (0x{:04X}) leaving insufficient space for stack",
                name, size, limit
            ));
        }

        self.sram_free_ptr += size;
        self.variables.insert(name.to_string(), (addr, ty.to_string(), is_mut));
        Ok(addr)
    }

    /// Spills the value in a register pair/word or byte by pushing it onto the hardware stack.
    ///
    /// # Rationale
    /// We use the AVR hardware stack (`PUSH`) rather than static SRAM addresses because it automatically
    /// handles nested subroutine frames and deep recursion at runtime with zero risk of variable overlap.
    /// Opcode format: `1001 001r rrrr 1111` (binary). We shift the 5-bit register index left by 4 to map
    /// R0-R31 to bits 8..4 of the instruction word.
    ///
    /// Stack order contract:
    /// - u16 spills are pushed low byte then high byte.
    fn spill_push(&mut self, reg: u8, ty: &str) -> Result<u16, String> {
        if ty == "u8" {
            let op = 0x920F | (((reg & 0x1F) as u16) << 4);
            self.emit(Pass1Inst::Op(op));
        } else {
            // Push low byte first, then high byte
            let op1 = 0x920F | (((reg & 0x1F) as u16) << 4);
            let op2 = 0x920F | ((((reg + 1) & 0x1F) as u16) << 4);
            self.emit(Pass1Inst::Op(op1));
            self.emit(Pass1Inst::Op(op2));
        }
        Ok(0)
    }

    /// Recovers a spilled value from the hardware stack back into a target register.
    ///
    /// # Mechanics
    /// Since the stack is Last-In First-Out (LIFO), for 16-bit values we pop the high byte (`reg + 1`)
    /// first, followed by the low byte (`reg`).
    /// Opcode format: `1001 000d dddd 1111` (binary). We shift the target register index left by 4.
    ///
    /// Postcondition:
    /// - Register contents match pre-spill value for same width/order contract.
    fn spill_pop(&mut self, target_reg: u8, _addr: u16, ty: &str) -> Result<(), String> {
        if ty == "u8" {
            let op = 0x900F | (((target_reg & 0x1F) as u16) << 4);
            self.emit(Pass1Inst::Op(op));
        } else {
            // Pop high byte first, then low byte (LIFO order!)
            let op2 = 0x900F | ((((target_reg + 1) & 0x1F) as u16) << 4);
            let op1 = 0x900F | (((target_reg & 0x1F) as u16) << 4);
            self.emit(Pass1Inst::Op(op2));
            self.emit(Pass1Inst::Op(op1));
        }
        Ok(())
    }

    /// Sequentially lowers a statement list.
    ///
    /// Invariant:
    /// - Emission order strictly follows source statement order.
    fn compile_block(&mut self, block: &[Stmt]) -> Result<(), String> {
        for stmt in block {
            self.compile_stmt(stmt)?;
        }
        Ok(())
    }

    // Store selection policy:
    // 1) I/O space [0x20, 0x5F]  -> OUT (1 word)
    // 2) Y-displacement window    -> STD Y+q (1 word)
    // 3) fallback                 -> STS (2 words)
    //
    // Why this order:
    // - OUT/IN are shortest and avoid address literal words.
    // - Y+q is still 1-word and cheap for near-SRAM locals.
    fn emit_sts(&mut self, addr: u16, reg: u8) -> Result<(), String> {
        if addr >= 0x20 && addr < 0x60 {
            // OUT A, reg -> 0xB800 | (((A & 0x30) as u16) << 5) | ((reg as u16) << 4) | ((A & 0x0F) as u16)
            let io_addr = addr - 0x20;
            let op = 0xB800 | (((io_addr & 0x30) as u16) << 5) | ((reg as u16) << 4) | ((io_addr & 0x0F) as u16);
            self.emit(Pass1Inst::Op(op));
        } else if self.target_core != TargetCore::AVRrc && addr >= self.sram_start && addr <= self.sram_start + 63 {
            // STD Y+q, reg
            let q = (addr - self.sram_start) as u8;
            let op = 0x8208 | ((reg as u16) << 4) | encode_q(q);
            self.emit(Pass1Inst::Op(op));
        } else {
            // Standard STS (2 words)
            self.emit(Pass1Inst::Op(0x9200 | ((reg as u16) << 4)));
            self.emit(Pass1Inst::Op(addr));
        }
        Ok(())
    }

    /// Always emits an absolute STS store (2 words), bypassing OUT/STD-Y addressing modes.
    /// Used for compiler-internal writes that must not depend on Y setup.
    fn emit_sts_abs(&mut self, addr: u16, reg: u8) {
        self.emit(Pass1Inst::Op(0x9200 | ((reg as u16) << 4)));
        self.emit(Pass1Inst::Op(addr));
    }

    // Load selection policy mirrors `emit_sts`:
    // 1) I/O space [0x20, 0x5F]  -> IN (1 word)
    // 2) Y-displacement window   -> LDD Y+q (1 word)
    // 3) fallback                -> LDS (2 words)
    fn emit_lds(&mut self, target: u8, addr: u16) -> Result<(), String> {
        if addr >= 0x20 && addr < 0x60 {
            // IN target, A -> 0xB000 | (((A & 0x30) as u16) << 5) | ((target as u16) << 4) | ((A & 0x0F) as u16)
            let io_addr = addr - 0x20;
            let op = 0xB000 | (((io_addr & 0x30) as u16) << 5) | ((target as u16) << 4) | ((io_addr & 0x0F) as u16);
            self.emit(Pass1Inst::Op(op));
        } else if self.target_core != TargetCore::AVRrc && addr >= self.sram_start && addr <= self.sram_start + 63 {
            // LDD target, Y+q
            let q = (addr - self.sram_start) as u8;
            let op = 0x8008 | ((target as u16) << 4) | encode_q(q);
            self.emit(Pass1Inst::Op(op));
        } else {
            // Standard LDS (2 words)
            self.emit(Pass1Inst::Op(0x9000 | ((target as u16) << 4)));
            self.emit(Pass1Inst::Op(addr));
        }
        Ok(())
    }

    /// Lowers one high-level statement into target-aware symbolic instructions.
    ///
    /// Strategy:
    /// - Keep control-flow explicit through generated labels.
    /// - Prefer flag-based branches over boolean materialization where possible.
    /// - Keep memory I/O paths centralized via `emit_sts`/`emit_lds`.
    ///
    /// Control-flow contract:
    /// - `LoopRange` is lowered as half-open interval: `start <= i < end` (unsigned compare).
    /// - Conditional jumps use "short-skip + RJMP" form to avoid BRxx range overflows.
    fn compile_stmt(&mut self, stmt: &Stmt) -> Result<(), String> {
        match stmt {
            Stmt::VarDecl { name, ty, expr, is_mut } => {
                validate_type(ty)?;
                let signed = is_signed_type(ty);
                if signed {
                    self.signed_vars.insert(name.clone());
                }
                if let Some(f) = fixed_frac_of_type(ty) {
                    self.fixed_vars.insert(name.clone(), f);
                }
                if let Some(rest) = ty.strip_prefix("ptr ") {
                    let mut parts = rest.splitn(2, ' ');
                    let space = parts.next().unwrap_or("ram").to_string();
                    let pointee = parts.next().unwrap_or("u8").to_string();
                    self.ptr_vars.insert(name.clone(), (space, pointee));
                }
                if let Some(space) = ty.strip_prefix("str ") {
                    self.str_vars.insert(name.clone(), space.to_string());
                    if space == "flash" {
                        // Reduced-core (AVRrc) devices lack the LPM instruction and this VM
                        // does not memory-map program memory into the data space, so flash
                        // strings cannot be read there. Reject consistently with imut/EEPROM.
                        if self.target_core == TargetCore::AVRrc {
                            return Err("Memory Error: flash str storage is not supported on AVRrc architecture cores (no LPM instruction)".to_string());
                        }
                        // Flash string: append the bytes to the shared flash data blob.
                        // The variable's stored "address" is its byte offset within the
                        // blob; the real flash address is (blob label) + offset, resolved
                        // at link time via FlashLdi16. Identical literals are deduplicated.
                        if let Expr::StringLit(ref lit) = *expr {
                            // Ensure the single shared blob label exists.
                            if self.flash_blob_label.is_none() {
                                self.flash_blob_label = Some(self.new_label("flash_blob"));
                            }
                            let offset = if let Some(off) = self.flash_string_pool.get(lit) {
                                *off
                            } else {
                                let bytes: Vec<u8> = lit.chars().map(|c| c as u8).collect();
                                let offset = self.flash_data_blob.len() as u16;
                                self.flash_data_blob.extend_from_slice(&bytes);
                                self.flash_string_pool.insert(lit.clone(), offset);
                                offset
                            };
                            // Register the variable: address field stores the byte offset within the
                            // flash data blob. Type is "str flash" so the [] operator can detect it.
                            self.variables.insert(name.clone(), (offset, "str flash".to_string(), false));
                        } else {
                            return Err("flash str variables must be initialized with a string literal".to_string());
                        }
                        return Ok(());
                    }
                }
                let norm_ty = normalize_width_type(ty);
                let ty: &str = &norm_ty;
                let is_scalar_imut = !*is_mut && !ty.contains('[') && !ty.starts_with("eeprom");
                let mut const_val = None;
                if is_scalar_imut {
                    let ty_clean = if ty.starts_with("flash ") { &ty[6..] } else { ty };
                    if let Some(v) = eval_const(expr, ty_clean, signed, &self.imut_constants) {
                        const_val = Some(v);
                    }
                }

                if let Some(v) = const_val {
                    self.imut_constants.insert(name.clone(), v);
                    self.variables.insert(name.clone(), (0, ty.to_string(), false));
                } else {
                    let addr = self.allocate_var(name, ty, *is_mut)?;
                    if ty.contains('[') {
                        let parts: Vec<&str> = ty.split('[').collect();
                        let base_ty = parts[0];
                        let size_str = parts[1].trim_end_matches(']');
                        let size = size_str.parse::<u16>().unwrap_or(1);
                        
                        self.compile_expr(expr, 16, base_ty)?;
                        
                        let item_sz = if base_ty == "u16" { 2 } else { 1 };
                        for i in 0..size {
                            let offset = i * item_sz;
                            if base_ty == "u8" {
                                self.emit_sts(addr + offset, 16)?;
                            } else {
                                self.emit_sts(addr + offset, 16)?;
                                self.emit_sts(addr + offset + 1, 17)?;
                            }
                        }
                    } else {
                        self.compile_expr(expr, 16, ty)?;
                        self.write_var(name, 16)?;
                    }
                }
            }
            Stmt::Assign { expr, target, op } => {
                if let Expr::VarRef(ref target_name) = *target {
                    let is_hw = target_name.starts_with('%');
                    let (addr, ty, is_mut) = if target_name.starts_with('$') {
                        let (a, t, m) = self.variables.get(target_name).ok_or_else(|| format!("Undefined variable: {}", target_name))?;
                        (*a, t.clone(), *m)
                    } else if is_hw {
                        let a = self.constants.get(target_name).ok_or_else(|| format!("Undefined hardware constant: {}", target_name))?;
                        (*a as u16, "u8".to_string(), true)
                    } else {
                        return Err(format!("Invalid assignment target: {}", target_name));
                    };

                    if !is_mut {
                        return Err(format!("Cannot assign to immutable variable: {}", target_name));
                    }

                    if op == "->" {
                        self.compile_expr(expr, 16, &ty)?;
                        if is_hw {
                            self.emit_sts(addr, 16)?;
                            if ty == "u16" {
                                self.emit_sts(addr + 1, 17)?;
                            }
                        } else {
                            self.write_var(target_name, 16)?;
                        }
                    } else {
                        if is_hw {
                            self.emit_lds(16, addr)?;
                            if ty == "u16" {
                                self.emit_lds(17, addr + 1)?;
                            }
                        } else {
                            self.read_var(target_name, 16, &ty)?;
                        }

                        self.compile_expr(expr, 18, &ty)?;

                        match op.as_str() {
                            "->+" => {
                                if ty == "u8" {
                                    let opc = self.encode_rd_rr(0x0C00, 16, 18);
                                    self.emit(Pass1Inst::Op(opc)); // ADD R16, R18
                                } else if ty == "u16" {
                                    let opc1 = self.encode_rd_rr(0x0C00, 16, 18);
                                    let opc2 = self.encode_rd_rr(0x1C00, 17, 19);
                                    self.emit(Pass1Inst::Op(opc1)); // ADD R16, R18
                                    self.emit(Pass1Inst::Op(opc2)); // ADC R17, R19
                                }
                            }
                            "->-" => {
                                if ty == "u8" {
                                    let opc = self.encode_rd_rr(0x1800, 16, 18);
                                    self.emit(Pass1Inst::Op(opc)); // SUB R16, R18
                                } else if ty == "u16" {
                                    let opc1 = self.encode_rd_rr(0x1800, 16, 18);
                                    let opc2 = self.encode_rd_rr(0x0800, 17, 19);
                                    self.emit(Pass1Inst::Op(opc1)); // SUB R16, R18
                                    self.emit(Pass1Inst::Op(opc2)); // SBC R17, R19
                                }
                            }
                            "->&" => {
                                let opc = self.encode_rd_rr(0x2000, 16, 18);
                                self.emit(Pass1Inst::Op(opc)); // AND R16, R18
                            }
                            "->|" => {
                                let opc = self.encode_rd_rr(0x2A00, 16, 18);
                                self.emit(Pass1Inst::Op(opc)); // OR R16, R18
                            }
                            "->^" => {
                                let opc = self.encode_rd_rr(0x2400, 16, 18);
                                self.emit(Pass1Inst::Op(opc)); // EOR R16, R18
                            }
                            _ => return Err(format!("Unknown compound assignment operator: {}", op)),
                        }

                        if is_hw {
                            self.emit_sts(addr, 16)?;
                            if ty == "u16" {
                                self.emit_sts(addr + 1, 17)?;
                            }
                        } else {
                            self.write_var(target_name, 16)?;
                        }
                    }
                } else if let Expr::BinOp { ref left, op: ref idx_op, ref right } = *target {
                    if idx_op == "[]" {
                        if let Expr::VarRef(ref array_name) = **left {
                            let (base_addr, array_ty, is_mut) = self.variables.get(array_name)
                                .ok_or_else(|| format!("Undefined array variable: {}", array_name))?;
                            let base_addr = *base_addr;
                            if !*is_mut {
                                return Err(format!("Cannot assign to elements of immutable array: {}", array_name));
                            }
                            
                            let item_ty = if array_ty.starts_with("u16") || array_ty.starts_with("i16") || array_ty.starts_with("r16") { "u16" } else { "u8" };
                            self.compile_expr(expr, 16, item_ty)?;
                            self.compile_expr(right, 18, "u16")?;
                            
                            if item_ty == "u16" {
                                let opc_lsl = self.encode_rd_rr(0x0C00, 18, 18);
                                let opc_rol = self.encode_rd_rr(0x1C00, 19, 19);
                                self.emit(Pass1Inst::Op(opc_lsl)); // ADD R18, R18
                                self.emit(Pass1Inst::Op(opc_rol)); // ADC R19, R19
                            }
                            
                            let base_lo = (base_addr & 0xFF) as u8;
                            let base_hi = ((base_addr >> 8) & 0xFF) as u8;
                            
                            let k_hi = (base_lo >> 4) & 0x0F;
                            let k_lo = base_lo & 0x0F;
                            let d = 30 - 16;
                            self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI R30, base_lo
                            
                            let k_hi = (base_hi >> 4) & 0x0F;
                            let k_lo = base_hi & 0x0F;
                            let d = 31 - 16;
                            self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI R31, base_hi
                            
                            let opc_add = self.encode_rd_rr(0x0C00, 30, 18);
                            let opc_adc = self.encode_rd_rr(0x1C00, 31, 19);
                            self.emit(Pass1Inst::Op(opc_add)); // ADD R30, R18
                            self.emit(Pass1Inst::Op(opc_adc)); // ADC R31, R19
                            
                            if op == "->" {
                                self.emit(Pass1Inst::Op(0x8200 | (16 << 4))); // ST Z, R16
                                if item_ty == "u16" {
                                    self.emit(Pass1Inst::Op(0x9201 | (16 << 4))); // ST Z+, R16
                                    self.emit(Pass1Inst::Op(0x8200 | (17 << 4))); // ST Z, R17
                                }
                            } else {
                                if item_ty == "u8" {
                                    self.emit(Pass1Inst::Op(0x8000 | (20 << 4))); // LD R20, Z
                                    match op.as_str() {
                                        "->+" => {
                                            let opc = self.encode_rd_rr(0x0C00, 20, 16);
                                            self.emit(Pass1Inst::Op(opc)); // ADD R20, R16
                                        }
                                        "->-" => {
                                            let opc = self.encode_rd_rr(0x1800, 20, 16);
                                            self.emit(Pass1Inst::Op(opc)); // SUB R20, R16
                                        }
                                        "->&" => {
                                            let opc = self.encode_rd_rr(0x2000, 20, 16);
                                            self.emit(Pass1Inst::Op(opc)); // AND R20, R16
                                        }
                                        "->|" => {
                                            let opc = self.encode_rd_rr(0x2A00, 20, 16);
                                            self.emit(Pass1Inst::Op(opc)); // OR R20, R16
                                        }
                                        "->^" => {
                                            let opc = self.encode_rd_rr(0x2400, 20, 16);
                                            self.emit(Pass1Inst::Op(opc)); // EOR R20, R16
                                        }
                                        _ => return Err(format!("Unknown compound assignment operator: {}", op)),
                                    }
                                    self.emit(Pass1Inst::Op(0x8200 | (20 << 4))); // ST Z, R20
                                } else {
                                    self.emit(Pass1Inst::Op(0x9001 | (20 << 4))); // LD R20, Z+
                                    self.emit(Pass1Inst::Op(0x8000 | (21 << 4))); // LD R21, Z
                                    match op.as_str() {
                                        "->+" => {
                                            let opc1 = self.encode_rd_rr(0x0C00, 20, 16);
                                            let opc2 = self.encode_rd_rr(0x1C00, 21, 17);
                                            self.emit(Pass1Inst::Op(opc1)); // ADD R20, R16
                                            self.emit(Pass1Inst::Op(opc2)); // ADC R21, R17
                                        }
                                        "->-" => {
                                            let opc1 = self.encode_rd_rr(0x1800, 20, 16);
                                            let opc2 = self.encode_rd_rr(0x0800, 21, 17);
                                            self.emit(Pass1Inst::Op(opc1)); // SUB R20, R16
                                            self.emit(Pass1Inst::Op(opc2)); // SBC R21, R17
                                        }
                                        "->&" => {
                                            let opc1 = self.encode_rd_rr(0x2000, 20, 16);
                                            let opc2 = self.encode_rd_rr(0x2000, 21, 17);
                                            self.emit(Pass1Inst::Op(opc1)); // AND R20, R16
                                            self.emit(Pass1Inst::Op(opc2)); // AND R21, R17
                                        }
                                        "->|" => {
                                            let opc1 = self.encode_rd_rr(0x2A00, 20, 16);
                                            let opc2 = self.encode_rd_rr(0x2A00, 21, 17);
                                            self.emit(Pass1Inst::Op(opc1)); // OR R20, R16
                                            self.emit(Pass1Inst::Op(opc2)); // OR R21, R17
                                        }
                                        "->^" => {
                                            let opc1 = self.encode_rd_rr(0x2400, 20, 16);
                                            let opc2 = self.encode_rd_rr(0x2400, 21, 17);
                                            self.emit(Pass1Inst::Op(opc1)); // EOR R20, R16
                                            self.emit(Pass1Inst::Op(opc2)); // EOR R21, R17
                                        }
                                        _ => return Err(format!("Unknown compound assignment operator: {}", op)),
                                    }
                                    self.emit(Pass1Inst::Op(0x8200 | (21 << 4))); // ST Z, R21
                                    self.emit(Pass1Inst::Op(0x9202 | (20 << 4))); // ST -Z, R20
                                }
                            }
                        }
                    }
                } else if let Expr::Deref(ref ptr_expr) = *target {
                    // Write through a pointer: `value -> *$p`.
                    if op != "->" {
                        return Err("Compound assignment through a pointer is not supported".to_string());
                    }
                    let (space, pointee) = self.deref_target_info(ptr_expr)?;
                    let pointee_u16 = pointee.starts_with("u16") || pointee.starts_with("i16") || pointee.starts_with("r16");
                    let w = if pointee_u16 { "u16" } else { "u8" };
                    self.compile_expr(expr, 16, w)?;                 // value in R16(:R17)
                    self.compile_expr(ptr_expr, 30, "u16")?;         // address in Z
                    match space.as_str() {
                        "ram" => {
                            if pointee_u16 {
                                self.emit(Pass1Inst::Op(0x9201 | (16 << 4))); // ST Z+, R16
                                self.emit(Pass1Inst::Op(0x8200 | (17 << 4))); // ST Z, R17
                            } else {
                                self.emit(Pass1Inst::Op(0x8200 | (16 << 4))); // ST Z, R16
                            }
                        }
                        "eeprom" => {
                            if pointee_u16 {
                                self.emit_eeprom_write_z(16)?;
                                self.emit_add_u16_imm(30, 1);
                                self.emit_eeprom_write_z(17)?;
                            } else {
                                self.emit_eeprom_write_z(16)?;
                            }
                        }
                        "flash" => {
                            return Err("Cannot write through a flash pointer: program memory is read-only".to_string());
                        }
                        _ => return Err(format!("Unknown pointer space '{}'", space)),
                    }
                } else {
                    return Err("Invalid assignment target expression.".to_string());
                }
            }
            Stmt::LoopInfinite { body } => {
                let start_label = self.new_label("loop_start");
                self.emit(Pass1Inst::Label(start_label.clone()));
                self.compile_block(body)?;
                self.emit(Pass1Inst::RJumpL(start_label));
            }
            Stmt::LoopRange { start, end, var_name, body } => {
                let ty = "u16";
                let _addr = self.allocate_var(var_name, ty, true)?;

                // Prefer a reserved callee-saved register pair for the loop end bound so it is
                // not reloaded from SRAM each iteration; fall back to an SRAM temp otherwise.
                let bound = self.loop_bound_regs.get(self.loop_depth).copied();
                let end_addr = if bound.is_none() {
                    let end_var_name = format!("$loop_end_{}", self.label_counter);
                    self.label_counter += 1;
                    self.allocate_var(&end_var_name, ty, false)?
                } else {
                    0
                };

                // 1. Initialize loop variable
                self.compile_expr(start, 16, ty)?;
                self.write_var(var_name, 16)?;

                // 2. Evaluate and store end bound ONCE before entering the loop
                self.compile_expr(end, 16, ty)?;
                if let Some(b) = bound {
                    let lo = self.encode_rd_rr(0x2C00, b, 16);
                    let hi = self.encode_rd_rr(0x2C00, b + 1, 17);
                    self.emit(Pass1Inst::Op(lo)); // MOV bound_lo, r16
                    self.emit(Pass1Inst::Op(hi)); // MOV bound_hi, r17
                } else {
                    self.emit_sts(end_addr, 16)?;
                    self.emit_sts(end_addr + 1, 17)?;
                }

                let start_label = self.new_label("loop_start");
                let end_label = self.new_label("loop_end");

                // 3. Initial comparison check before executing body
                self.read_var(var_name, 16, ty)?;
                let (blo, bhi) = if let Some(b) = bound {
                    (b, b + 1)
                } else {
                    self.emit_lds(18, end_addr)?;
                    self.emit_lds(19, end_addr + 1)?;
                    (18, 19)
                };
                let opc1 = self.encode_rd_rr(0x1400, 16, blo);
                let opc2 = self.encode_rd_rr(0x0400, 17, bhi);
                self.emit(Pass1Inst::Op(opc1)); // CP R16, bound_lo
                self.emit(Pass1Inst::Op(opc2)); // CPC R17, bound_hi

                // Skip + RJMP pattern to prevent branch overflow
                let enter_body_label = self.new_label("enter_body");
                self.emit(Pass1Inst::BrbsL(0, enter_body_label.clone())); // BRLO/BRCS to enter_body (unsigned <)
                self.emit(Pass1Inst::RJumpL(end_label.clone())); // RJMP to end (12-bit safe jump)
                self.emit(Pass1Inst::Label(enter_body_label));

                self.emit(Pass1Inst::Label(start_label.clone()));

                // 4. Compile loop body
                self.loop_depth += 1;
                self.compile_block(body)?;
                self.loop_depth -= 1;

                // 5. Increment loop variable
                self.read_var(var_name, 16, ty)?;

                self.emit_add_u16_imm(16, 1);

                self.write_var(var_name, 16)?;

                // 6. Compare with stored end bound and loop
                let (blo, bhi) = if let Some(b) = bound {
                    (b, b + 1)
                } else {
                    self.emit_lds(18, end_addr)?;
                    self.emit_lds(19, end_addr + 1)?;
                    (18, 19)
                };
                let opc1 = self.encode_rd_rr(0x1400, 16, blo);
                let opc2 = self.encode_rd_rr(0x0400, 17, bhi);
                self.emit(Pass1Inst::Op(opc1)); // CP R16, bound_lo
                self.emit(Pass1Inst::Op(opc2)); // CPC R17, bound_hi

                // Skip + RJMP pattern to prevent branch overflow back to start
                let skip_rjmp_label = self.new_label("skip_rjmp");
                self.emit(Pass1Inst::BrbcL(0, skip_rjmp_label.clone())); // BRSH/BRCC to skip_rjmp (unsigned >=)
                self.emit(Pass1Inst::RJumpL(start_label)); // RJMP back to start (12-bit safe jump)
                self.emit(Pass1Inst::Label(skip_rjmp_label));

                self.emit(Pass1Inst::Label(end_label));
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                let end_label = self.new_label("cond_end");

                // Branch directly off the condition's flags instead of materializing a 0/1
                // value and re-testing it.
                if let Some(ref block) = else_block {
                    let else_label = self.new_label("else");
                    self.compile_cond_jump_if_false(cond, &else_label)?;
                    self.compile_block(then_block)?;
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));
                    self.emit(Pass1Inst::Label(else_label));
                    self.compile_block(block)?;
                } else {
                    self.compile_cond_jump_if_false(cond, &end_label)?;
                    self.compile_block(then_block)?;
                }
                self.emit(Pass1Inst::Label(end_label));
            }
            Stmt::Switch { expr, cases, default } => {
                let end_label = self.new_label("switch_end");
                
                let ty_str = if let Expr::VarRef(ref name) = expr {
                    if let Some((_, var_ty, _)) = self.variables.get(name) {
                        var_ty.clone()
                    } else {
                        "u8".to_string()
                    }
                } else {
                    "u8".to_string()
                };
                let ty = ty_str.as_str();
                
                self.compile_expr(expr, 16, ty)?;
                
                let mut case_labels = Vec::new();
                for i in 0..cases.len() {
                    case_labels.push(self.new_label(&format!("switch_case_{}", i)));
                }
                let default_label = self.new_label("switch_default");
                
                for (i, (case_expr, _)) in cases.iter().enumerate() {
                    self.compile_expr(case_expr, 18, ty)?;
                    
                    let opc1 = self.encode_rd_rr(0x1400, 16, 18);
                    self.emit(Pass1Inst::Op(opc1)); // CP R16, R18
                    if ty == "u16" {
                        let opc2 = self.encode_rd_rr(0x0400, 17, 19);
                        self.emit(Pass1Inst::Op(opc2)); // CPC R17, R19
                    }
                    
                    // Skip + RJMP pattern to prevent branch overflow to potentially far case bodies
                    let match_label = self.new_label("switch_match");
                    self.emit(Pass1Inst::BrbcL(1, match_label.clone())); // BRNE match_label (Z flag clear)
                    self.emit(Pass1Inst::RJumpL(case_labels[i].clone())); // RJMP to case (12-bit safe jump)
                    self.emit(Pass1Inst::Label(match_label));
                }
                
                if default.is_some() {
                    self.emit(Pass1Inst::RJumpL(default_label.clone()));
                } else {
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));
                }
                
                for (i, (_, body)) in cases.iter().enumerate() {
                    self.emit(Pass1Inst::Label(case_labels[i].clone()));
                    self.compile_block(body)?;
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));
                }
                
                if let Some(ref default_body) = default {
                    self.emit(Pass1Inst::Label(default_label));
                    self.compile_block(default_body)?;
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));
                }
                
                self.emit(Pass1Inst::Label(end_label));
            }
            Stmt::Return { val } => {
                if !self.inline_return_labels.is_empty() {
                    let label = self.inline_return_labels.last().unwrap().clone();
                    if let Some(ref expr) = val {
                        self.compile_expr(expr, 16, "u16")?;
                        let prefix = self.inline_prefixes.last().unwrap().clone();
                        let unique_ret = format!("${}_ret", prefix);
                        self.write_var(&unique_ret, 16)?;
                    }
                    self.emit(Pass1Inst::RJumpL(label));
                } else {
                    if let Some(ref expr) = val {
                        // Evaluate return expressions in low scratch registers to avoid
                        // expensive stack spilling when target is near the top register bank.
                        self.compile_expr(expr, 16, "u16")?;
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, 24, 16))); // MOV R24, R16
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, 25, 17))); // MOV R25, R17
                    }
                    self.emit_return();
                }
            }
            Stmt::ExprStmt { expr } => {
                self.compile_expr(expr, 16, "u16")?;
            }
            Stmt::Goto(label) => {
                self.emit(Pass1Inst::RJumpL(label.clone()));
            }
            Stmt::Label(label) => {
                self.emit(Pass1Inst::Label(label.clone()));
            }
        }
        Ok(())
    }

    /// Best-effort static type inference: returns "u16" if the expression's value width is
    /// 16-bit (from a u16 variable, array element, function return, or wide literal), else "u8".
    ///
    /// Scope note:
    /// - This is a lowering heuristic, not a full type checker.
    /// - Unknown cases intentionally default to "u8" to avoid over-widening codegen paths.
    fn infer_type(&self, expr: &Expr) -> String {
        match expr {
            Expr::Literal(v) => if *v > 255 || *v < 0 { "u16".to_string() } else { "u8".to_string() },
            Expr::FloatLiteral(_) => "u16".to_string(),
            // An address and a string handle are both 16-bit; a dereference has the pointee's width.
            Expr::AddrOf(_) | Expr::StringLit(_) => "u16".to_string(),
            Expr::Deref(inner) => {
                if let Some((_, pointee)) = self.expr_pointer_info(inner) {
                    if pointee.starts_with("u16") || pointee.starts_with("i16") || pointee.starts_with("r16") {
                        return "u16".to_string();
                    }
                }
                "u8".to_string()
            }
            Expr::VarRef(name) => {
                if name.starts_with('$') {
                    if let Some((_, t, _)) = self.variables.get(name) {
                        let t_clean = if t.starts_with("eeprom ") { &t[7..] } else if t.starts_with("flash ") { &t[6..] } else { t };
                        if t_clean.starts_with("u16") || t_clean.starts_with("i16") || t_clean.starts_with("r16") { return "u16".to_string(); }
                    }
                }
                "u8".to_string()
            }
            Expr::BinOp { left, op, right } => {
                if op == "[]" {
                    if let Expr::VarRef(name) = &**left {
                        if let Some((_, t, _)) = self.variables.get(name) {
                            let t_clean = if t.starts_with("eeprom ") { &t[7..] } else if t.starts_with("flash ") { &t[6..] } else { t };
                            if t_clean.starts_with("u16") || t_clean.starts_with("i16") || t_clean.starts_with("r16") { return "u16".to_string(); }
                        }
                    }
                    return "u8".to_string();
                }
                if matches!(op.as_str(), "==" | "!=" | "<" | ">" | "<=" | ">=" | "&&" | "||") {
                    return "u8".to_string();
                }
                if self.infer_type(left) == "u16" || self.infer_type(right) == "u16" {
                    "u16".to_string()
                } else {
                    "u8".to_string()
                }
            }
            Expr::UnaryOp { expr, .. } => self.infer_type(expr),
            Expr::Call { name, .. } => {
                if let Some((_, ret)) = self.functions.get(name) {
                    if ret.starts_with("u16") || ret.starts_with("i16") || ret.starts_with("r16") { return "u16".to_string(); }
                }
                "u8".to_string()
            }
        }
    }

    /// Structurally determines whether an expression evaluates to a signed value, so that the
    /// backend can pick signed instruction variants (S-flag branches, signed division) without
    /// threading sign through the width-typed `ty` string. An operation is signed if any operand
    /// is signed (a signed variable, a signed array element, or a call to a signed-returning
    /// function). Literals and hardware-register reads are unsigned.
    fn expr_is_signed(&self, expr: &Expr) -> bool {
        match expr {
            Expr::VarRef(name) => name.starts_with('$') && self.signed_vars.contains(name),
            Expr::UnaryOp { expr, .. } => self.expr_is_signed(expr),
            Expr::BinOp { left, op, right } => {
                if op == "[]" {
                    if let Expr::VarRef(arr) = &**left {
                        self.signed_vars.contains(arr)
                    } else {
                        false
                    }
                } else {
                    self.expr_is_signed(left) || self.expr_is_signed(right)
                }
            }
            Expr::Call { name, .. } => self.signed_funcs.contains(name),
            Expr::Deref(inner) => {
                if let Some((_, pointee)) = self.expr_pointer_info(inner) {
                    return is_signed_type(&pointee);
                }
                false
            }
            _ => false,
        }
    }

    /// Returns the fractional-bit count if an expression evaluates to a fixed-point value.
    /// `+`/`-` preserve the operands' scale; `*`/`/` of two fixed operands also produce that scale
    /// (the backend inserts the corresponding shift). A non-fixed operand makes the result non-fixed
    /// for `+`/`-`, but `*`/`/` of fixed-by-scalar keeps the fixed scale.
    fn expr_fixed_bits(&self, expr: &Expr) -> Option<u8> {
        match expr {
            Expr::VarRef(name) => self.fixed_vars.get(name).copied(),
            Expr::Call { name, .. } => self.fixed_funcs.get(name).copied(),
            Expr::Deref(inner) => {
                if let Some((_, pointee)) = self.expr_pointer_info(inner) {
                    return fixed_frac_of_type(&pointee);
                }
                None
            }
            Expr::UnaryOp { expr, .. } => self.expr_fixed_bits(expr),
            Expr::BinOp { left, op, right } => {
                if op == "[]" {
                    if let Expr::VarRef(arr) = &**left {
                        self.fixed_vars.get(arr).copied()
                    } else {
                        None
                    }
                } else if op == "*" || op == "/" {
                    // fixed*fixed / fixed/fixed keep the scale; fixed-by-scalar also keeps it.
                    self.expr_fixed_bits(left).or_else(|| self.expr_fixed_bits(right))
                } else {
                    // +, -, etc.: only fixed if both sides agree (use either side's scale).
                    self.expr_fixed_bits(left).or_else(|| self.expr_fixed_bits(right))
                }
            }
            _ => None,
        }
    }

    /// Emits a comparison of `left <op> right`, leaving the result only in flags.
    /// Returns `(sreg_bit, true_when_set)`: branching when that SREG bit equals `true_when_set`
    /// is taken exactly when the comparison is TRUE. Operands are evaluated into r16/r18.
    /// Relational operators select the unsigned carry flag (bit 0) or the signed flag
    /// (bit 4, `N xor V`) depending on operand signedness.
    ///
    /// Postcondition:
    /// - No boolean value is materialized in general-purpose registers.
    /// - Caller may branch immediately using the returned `(bit,set)` pair.
    fn emit_comparison(&mut self, left: &Expr, op: &str, right: &Expr, ty: &str) -> Result<(u8, bool), String> {
        // Relational ops branch on the carry flag (bit 0) for unsigned operands or the signed
        // flag (bit 4, N xor V) for signed operands. Equality (==/!=) uses the zero flag either way.
        let signed = self.expr_is_signed(left) || self.expr_is_signed(right);
        let rel_bit = if signed { 4u8 } else { 0u8 };
        // Fast-path zero-comparison for u16: == 0 and != 0
        if ty == "u16" && matches!(op, "==" | "!=") {
            if let Expr::Literal(0) = right {
                self.compile_expr(left, 16, ty)?;
                let opc = self.encode_rd_rr(0x2800, 16, 17);
                self.emit(Pass1Inst::Op(opc)); // OR r16, r17 (sets Z flag)
                return Ok(match op {
                    "==" => (1, true),   // BREQ
                    "!=" => (1, false),  // BRNE
                    _ => unreachable!(),
                });
            } else if let Expr::Literal(0) = left {
                self.compile_expr(right, 16, ty)?;
                let opc = self.encode_rd_rr(0x2800, 16, 17);
                self.emit(Pass1Inst::Op(opc)); // OR r16, r17 (sets Z flag)
                return Ok(match op {
                    "==" => (1, true),   // BREQ
                    "!=" => (1, false),  // BRNE
                    _ => unreachable!(),
                });
            }
        }

        // CPI fast path: u8, literal RHS, ops that need no operand swap.
        if ty == "u8" {
            if let Expr::Literal(val) = right {
                if matches!(op, "==" | "!=" | "<" | ">=") {
                    self.compile_expr(left, 16, ty)?;
                    let k = (*val & 0xFF) as u8;
                    self.emit(Pass1Inst::Op(0x3000 | (((k >> 4) & 0x0F) as u16) << 8 | (k & 0x0F) as u16)); // CPI r16, k
                    return Ok(match op {
                        "==" => (1, true),         // BREQ
                        "!=" => (1, false),        // BRNE
                        "<"  => (rel_bit, true),   // BRLO/BRCS (unsigned) or BRLT (signed)
                        ">=" => (rel_bit, false),  // BRSH/BRCC (unsigned) or BRGE (signed)
                        _ => unreachable!(),
                    });
                }
            }
        }
        // General register/register path. `>` and `<=` are computed by swapping operands.
        let (do_swap, base_op) = match op {
            ">"  => (true, "<"),
            "<=" => (true, ">="),
            _    => (false, op),
        };
        if do_swap {
            self.compile_expr(right, 16, ty)?;
            self.compile_expr(left, 18, ty)?;
        } else {
            self.compile_expr(left, 16, ty)?;
            self.compile_expr(right, 18, ty)?;
        }
        let opc1 = self.encode_rd_rr(0x1400, 16, 18);
        self.emit(Pass1Inst::Op(opc1)); // CP r16, r18
        if ty == "u16" {
            let opc2 = self.encode_rd_rr(0x0400, 17, 19);
            self.emit(Pass1Inst::Op(opc2)); // CPC r17, r19
        }
        Ok(match base_op {
            "==" => (1, true),
            "!=" => (1, false),
            "<"  => (rel_bit, true),
            ">=" => (rel_bit, false),
            _ => return Err(format!("Unsupported comparison operator: {}", op)),
        })
    }

    /// Emits one symbolic conditional branch against a specific SREG bit state.
    fn emit_flag_branch(&mut self, bit: u8, set: bool, label: &str) {
        if set {
            self.emit(Pass1Inst::BrbsL(bit, label.to_string()));
        } else {
            self.emit(Pass1Inst::BrbcL(bit, label.to_string()));
        }
    }

    /// Generates control flow that jumps to `false_label` when `cond` is false and falls
    /// through when it is true. Uses a short skip + long RJMP so the jump target may be far.
    ///
    /// Control-flow shape invariant:
    /// - Any far jump is represented as `BRxx skip ; RJMP false_label ; skip:`.
    fn compile_cond_jump_if_false(&mut self, cond: &Expr, false_label: &str) -> Result<(), String> {
        match cond {
            Expr::BinOp { left, op, right } if matches!(op.as_str(), "==" | "!=" | "<" | ">" | "<=" | ">=") => {
                let cty = if self.infer_type(left) == "u16" || self.infer_type(right) == "u16" { "u16" } else { "u8" };
                let (bit, true_set) = self.emit_comparison(left, op, right, cty)?;
                let skip = self.new_label("cskip");
                self.emit_flag_branch(bit, true_set, &skip); // if TRUE, skip the jump
                self.emit(Pass1Inst::RJumpL(false_label.to_string()));
                self.emit(Pass1Inst::Label(skip));
            }
            Expr::BinOp { left, op, right } if op == "&&" => {
                self.compile_cond_jump_if_false(left, false_label)?;
                self.compile_cond_jump_if_false(right, false_label)?;
            }
            Expr::BinOp { left, op, right } if op == "||" => {
                let true_label = self.new_label("ctrue");
                self.compile_cond_jump_if_true(left, &true_label)?;
                self.compile_cond_jump_if_false(right, false_label)?;
                self.emit(Pass1Inst::Label(true_label));
            }
            Expr::UnaryOp { op, expr } if op == "!" => {
                self.compile_cond_jump_if_true(expr, false_label)?;
            }
            _ => {
                self.compile_expr(cond, 16, "u8")?;
                let opc = self.encode_rd_rr(0x2000, 16, 16);
                self.emit(Pass1Inst::Op(opc)); // TST r16
                let skip = self.new_label("cskip");
                self.emit(Pass1Inst::BrbcL(1, skip.clone())); // BRNE: if nonzero (true), skip
                self.emit(Pass1Inst::RJumpL(false_label.to_string()));
                self.emit(Pass1Inst::Label(skip));
            }
        }
        Ok(())
    }

    /// Generates control flow that jumps to `true_label` when `cond` is true and falls
    /// through when it is false.
    ///
    /// Control-flow shape invariant:
    /// - Any far jump is represented as `BRxx skip ; RJMP true_label ; skip:`.
    fn compile_cond_jump_if_true(&mut self, cond: &Expr, true_label: &str) -> Result<(), String> {
        match cond {
            Expr::BinOp { left, op, right } if matches!(op.as_str(), "==" | "!=" | "<" | ">" | "<=" | ">=") => {
                let cty = if self.infer_type(left) == "u16" || self.infer_type(right) == "u16" { "u16" } else { "u8" };
                let (bit, true_set) = self.emit_comparison(left, op, right, cty)?;
                let skip = self.new_label("cskip");
                self.emit_flag_branch(bit, !true_set, &skip); // if FALSE, skip the jump
                self.emit(Pass1Inst::RJumpL(true_label.to_string()));
                self.emit(Pass1Inst::Label(skip));
            }
            Expr::BinOp { left, op, right } if op == "&&" => {
                let skip = self.new_label("cskip");
                self.compile_cond_jump_if_false(left, &skip)?;
                self.compile_cond_jump_if_true(right, true_label)?;
                self.emit(Pass1Inst::Label(skip));
            }
            Expr::BinOp { left, op, right } if op == "||" => {
                self.compile_cond_jump_if_true(left, true_label)?;
                self.compile_cond_jump_if_true(right, true_label)?;
            }
            Expr::UnaryOp { op, expr } if op == "!" => {
                self.compile_cond_jump_if_false(expr, true_label)?;
            }
            _ => {
                self.compile_expr(cond, 16, "u8")?;
                let opc = self.encode_rd_rr(0x2000, 16, 16);
                self.emit(Pass1Inst::Op(opc)); // TST r16
                let skip = self.new_label("cskip");
                self.emit(Pass1Inst::BrbsL(1, skip.clone())); // BREQ: if zero (false), skip
                self.emit(Pass1Inst::RJumpL(true_label.to_string()));
                self.emit(Pass1Inst::Label(skip));
            }
        }
        Ok(())
    }

    /// Lowers one expression into `target` (and `target+1` for u16 when needed).
    ///
    /// Codegen policy:
    /// - Try constant folding and immediate-specialized patterns first.
    /// - Prefer ISA fast paths (MUL/ADIW/SBIW/CPI) when core supports them.
    /// - Fall back to portable software sequences when hardware support is absent.
    ///
    /// Arithmetic semantics:
    /// - Unsigned wrapping arithmetic (u8/u16) is preserved by construction.
    /// - Constant folding mirrors runtime width masking via `fit_ty`.
    ///
    /// Register contract:
    /// - Result low byte is in `target`.
    /// - Result high byte is in `target+1` when `ty == "u16"`.
    fn compile_expr(&mut self, expr: &Expr, target: u8, ty: &str) -> Result<(), String> {
        let ty = if ty.starts_with("eeprom ") { &ty[7..] } else if ty.starts_with("flash ") { &ty[6..] } else { ty };
        // Constant folding: collapse a fully literal arithmetic/bitwise subtree into a
        // single immediate, matching the runtime's type-width wrapping semantics.
        if !matches!(expr, Expr::Literal(_)) {
            let signed = self.expr_is_signed(expr);
            if let Some(v) = eval_const(expr, ty, signed, &self.imut_constants) {
                return self.compile_expr(&Expr::Literal(v as i32), target, ty);
            }
        }
        match expr {
            Expr::FloatLiteral(_) => {
                return Err("Type Error: fractional literal is only valid as a fixed-point (r8/r16) initializer, assignment value, or comparison operand".to_string());
            }
            Expr::StringLit(lit) => {
                if ty != "u16" {
                    return Err("Type Error: string literal requires a 16-bit address context (u16/pointer/string handle)".to_string());
                }
                let addr = self.materialize_ram_string_literal(lit)?;
                self.emit_ldi16(target, addr);
                return Ok(());
            }
            Expr::AddrOf(inner) => {
                // Materialize the 16-bit SRAM address of a scalar variable or array element.
                match &**inner {
                    Expr::VarRef(name) => {
                        let (addr, _, _) = self.variables.get(name)
                            .ok_or_else(|| format!("Cannot take address of unknown variable: {}", name))?;
                        if self.var_homes.contains_key(name) {
                            return Err(format!("Internal error: address-taken variable {} was register-homed", name));
                        }
                        let addr = *addr;
                        self.emit_ldi16(target, addr);
                    }
                    Expr::BinOp { left, op, right } if op == "[]" => {
                        if let Expr::VarRef(arr) = &**left {
                            let (base, aty, _) = self.variables.get(arr)
                                .ok_or_else(|| format!("Cannot take address of unknown array: {}", arr))?;
                            let base = *base;
                            let item_sz = if aty.starts_with("u16") || aty.starts_with("i16") || aty.starts_with("r16") { 2u16 } else { 1u16 };
                            self.compile_expr(right, target, "u16")?;       // index in target:target+1
                            if item_sz == 2 {
                                self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target)));         // LSL lo
                                self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, target + 1, target + 1))); // ROL hi
                            }
                            self.emit_add_u16_imm(target, base);
                        } else {
                            return Err("Address-of array indexing is only supported on direct array variables".to_string());
                        }
                    }
                    _ => return Err("'&' (address-of) requires a variable or array element".to_string()),
                }
                return Ok(());
            }
            Expr::Deref(inner) => {
                let (space, pointee) = self.deref_target_info(inner)?;
                let pointee_u16 = pointee.starts_with("u16") || pointee.starts_with("i16") || pointee.starts_with("r16");
                let pointee_signed = is_signed_type(&pointee);
                // Load the pointer's 16-bit address into Z (R30:R31).
                self.compile_expr(inner, 30, "u16")?;
                match space.as_str() {
                    "ram" => {
                        if pointee_u16 {
                            self.emit(Pass1Inst::Op(0x9001 | ((target as u16) << 4)));       // LD target, Z+
                            self.emit(Pass1Inst::Op(0x8000 | (((target + 1) as u16) << 4))); // LD target+1, Z
                        } else {
                            self.emit(Pass1Inst::Op(0x8000 | ((target as u16) << 4)));        // LD target, Z
                            if ty == "u16" {
                                self.emit_widen_high(target, pointee_signed);
                            }
                        }
                    }
                    "flash" => {
                        if pointee_u16 {
                            self.emit(Pass1Inst::Op(0x9005 | ((target as u16) << 4)));       // LPM target, Z+
                            self.emit(Pass1Inst::Op(0x9004 | (((target + 1) as u16) << 4))); // LPM target+1, Z
                        } else {
                            self.emit(Pass1Inst::Op(0x9004 | ((target as u16) << 4)));        // LPM target, Z
                            if ty == "u16" {
                                self.emit_widen_high(target, pointee_signed);
                            }
                        }
                    }
                    "eeprom" => {
                        if pointee_u16 {
                            self.emit_eeprom_read_z(target)?;
                            self.emit_add_u16_imm(30, 1);
                            self.emit_eeprom_read_z(target + 1)?;
                        } else {
                            self.emit_eeprom_read_z(target)?;
                            if ty == "u16" {
                                self.emit_widen_high(target, pointee_signed);
                            }
                        }
                    }
                    _ => return Err(format!("Unknown pointer space '{}'", space)),
                }
                return Ok(());
            }
            Expr::Literal(val) => {
                let val_lo = (val & 0xFF) as u8;
                let val_hi = ((val >> 8) & 0xFF) as u8;

                let k_hi = (val_lo >> 4) & 0x0F;
                let k_lo = val_lo & 0x0F;
                let d = target - 16;
                self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16)));
                
                if ty == "u16" {
                    let k_hi = (val_hi >> 4) & 0x0F;
                    let k_lo = val_hi & 0x0F;
                    let d = (target + 1) - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16)));
                }
            }
            Expr::VarRef(ref name) => {
                if name.starts_with('$') {
                    self.read_var(name, target, ty)?;
                } else if name.starts_with('%') {
                    let addr = *self.constants.get(name).ok_or_else(|| format!("Undefined hardware constant: {}", name))? as u16;
                    self.emit_lds(target, addr)?;
                    if ty == "u16" {
                        let d = (target + 1) - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target+1, 0
                    }
                }
            }
            Expr::UnaryOp { op, expr } => {
                self.compile_expr(expr, target, ty)?;
                match op.as_str() {
                    "-" => {
                        if ty == "u8" {
                            self.emit(Pass1Inst::Op(0x9401 | ((target as u16) << 4))); // NEG target
                        } else if ty == "u16" {
                            // In-place 16-bit negation: COM target+1, NEG target, SBCI target+1, 0xFF.
                            self.emit_neg16(target, target + 1);
                        }
                    }
                    "~" => {
                        if ty == "u8" {
                            self.emit(Pass1Inst::Op(0x9400 | ((target as u16) << 4))); // COM target
                        } else if ty == "u16" {
                            self.emit(Pass1Inst::Op(0x9400 | ((target as u16) << 4))); // COM target
                            self.emit(Pass1Inst::Op(0x9400 | (((target + 1) as u16) << 4))); // COM target+1
                        }
                    }
                    "!" => {
                        let true_label = self.new_label("not_true");
                        let end_label = self.new_label("not_end");
                        
                        // Compare target with 0 using CPI / SBCI for u8, or OR target, target+1 for u16
                        if ty == "u16" {
                            let opc = self.encode_rd_rr(0x2800, target, target + 1);
                            self.emit(Pass1Inst::Op(opc)); // OR target, target+1 (1 cycle, sets Z flag)
                        } else {
                            self.emit(Pass1Inst::Op(0x3000 | (((target - 16) as u16) << 4))); // CPI target, 0
                        }
                        
                        self.emit(Pass1Inst::BrbsL(1, true_label.clone())); // BREQ true_label (Z flag set)
                        
                        // False case (result of !non-zero is 0)
                        let d = target - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target, 0
                        if ty == "u16" {
                            let d_hi = target + 1 - 16;
                            self.emit(Pass1Inst::Op(0xE000 | ((d_hi as u16) << 4))); // LDI target+1, 0
                        }
                        self.emit(Pass1Inst::RJumpL(end_label.clone()));
                        
                        // True case (result of !zero is 1)
                        self.emit(Pass1Inst::Label(true_label));
                        let d = target - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4) | 1)); // LDI target, 1
                        if ty == "u16" {
                            let d_hi = target + 1 - 16;
                            self.emit(Pass1Inst::Op(0xE000 | ((d_hi as u16) << 4))); // LDI target+1, 0
                        }
                        
                        self.emit(Pass1Inst::Label(end_label));
                    }
                    _ => return Err(format!("Unknown unary operator: {}", op)),
                }
            }
            Expr::BinOp { left, op, right } => {
                if op == "[]" {
                    if let Expr::VarRef(ref array_name) = **left {
                        let (base_addr, array_ty, _) = self.variables.get(array_name)
                            .ok_or_else(|| format!("Undefined array variable: {}", array_name))?;
                        let base_addr = *base_addr;
                        let array_ty = array_ty.clone();

                        // Flash string path: use LPM instead of LD
                        if array_ty == "str flash" {
                            // All flash strings share one blob label; this variable's
                            // base_addr is its byte offset within that blob.
                            let label = self.flash_blob_label.clone()
                                .ok_or_else(|| format!("Internal error: flash blob label missing for {}", array_name))?;
                            let byte_offset = base_addr;

                            // Compute index into target:target+1
                            self.compile_expr(right, target, "u16")?;

                            // Load Z with flash data byte address + byte offset
                            // FlashLdi16 emits two LDI instructions that resolve to
                            // (label_word_address * 2 + byte_offset) at link time
                            self.emit(Pass1Inst::FlashLdi16(30, label, byte_offset));

                            // ADD Z, index
                            let opc_add = self.encode_rd_rr(0x0C00, 30, target);
                            let opc_adc = self.encode_rd_rr(0x1C00, 31, target + 1);
                            self.emit(Pass1Inst::Op(opc_add)); // ADD R30, idx_lo
                            self.emit(Pass1Inst::Op(opc_adc)); // ADC R31, idx_hi

                            // LPM target, Z
                            self.emit(Pass1Inst::Op(0x9004 | ((target as u16) << 4))); // LPM target, Z
                            if ty == "u16" {
                                self.emit_widen_high(target, false);
                            }
                        } else {
                            // SRAM array/string path (existing logic)
                            let item_ty = if array_ty.starts_with("u16") || array_ty.starts_with("i16") || array_ty.starts_with("r16") { "u16" } else { "u8" };
                            self.compile_expr(right, target, "u16")?;
                        
                            if item_ty == "u16" {
                                let opc_lsl = self.encode_rd_rr(0x0C00, target, target);
                                let opc_rol = self.encode_rd_rr(0x1C00, target + 1, target + 1);
                                self.emit(Pass1Inst::Op(opc_lsl)); // ADD idx, idx
                                self.emit(Pass1Inst::Op(opc_rol)); // ADC idx+1, idx+1
                            }
                        
                            let base_lo = (base_addr & 0xFF) as u8;
                            let base_hi = ((base_addr >> 8) & 0xFF) as u8;
                        
                            let k_hi = (base_lo >> 4) & 0x0F;
                            let k_lo = base_lo & 0x0F;
                            let d = 30 - 16;
                            self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI R30, base_lo
                        
                            let k_hi = (base_hi >> 4) & 0x0F;
                            let k_lo = base_hi & 0x0F;
                            let d = 31 - 16;
                            self.emit(Pass1Inst::Op(0xE000 | ((k_hi as u16) << 8) | ((d as u16) << 4) | (k_lo as u16))); // LDI R31, base_hi
                        
                            let opc_add = self.encode_rd_rr(0x0C00, 30, target);
                            let opc_adc = self.encode_rd_rr(0x1C00, 31, target + 1);
                            self.emit(Pass1Inst::Op(opc_add)); // ADD R30, idx
                            self.emit(Pass1Inst::Op(opc_adc)); // ADC R31, idx+1
                        
                            self.emit(Pass1Inst::Op(0x8000 | ((target as u16) << 4))); // LD target, Z
                            if ty == "u16" && item_ty == "u16" {
                                self.emit(Pass1Inst::Op(0x9001 | ((target as u16) << 4))); // LD target, Z+
                                self.emit(Pass1Inst::Op(0x8000 | (((target + 1) as u16) << 4))); // LD target+1, Z
                            } else if ty == "u16" && item_ty == "u8" {
                                let d = (target + 1) - 16;
                                self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target+1, 0
                            }
                        }
                    } else {
                        return Err("Array indexing is only supported on direct variables.".to_string());
                    }
                    return Ok(());
                } else if op == "&&" {
                    let false_label = self.new_label("and_false");
                    let end_label = self.new_label("and_end");
                    
                    self.compile_expr(left, target, "u8")?;
                    let opc_tst = self.encode_rd_rr(0x2000, target, target);
                    self.emit(Pass1Inst::Op(opc_tst)); // TST target
                    self.emit(Pass1Inst::BrbsL(1, false_label.clone())); // BREQ to false
                    
                    self.compile_expr(right, target, "u8")?;
                    let opc_tst = self.encode_rd_rr(0x2000, target, target);
                    self.emit(Pass1Inst::Op(opc_tst)); // TST target
                    self.emit(Pass1Inst::BrbsL(1, false_label.clone())); // BREQ to false
                    
                    let d = target - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4) | 1)); // LDI target, 1
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));
                    
                    self.emit(Pass1Inst::Label(false_label));
                    let d = target - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target, 0
                    
                    self.emit(Pass1Inst::Label(end_label));
                    return Ok(());
                } else if op == "||" {
                    let true_label = self.new_label("or_true");
                    let end_label = self.new_label("or_end");
                    
                    self.compile_expr(left, target, "u8")?;
                    let opc_tst = self.encode_rd_rr(0x2000, target, target);
                    self.emit(Pass1Inst::Op(opc_tst)); // TST target
                    self.emit(Pass1Inst::BrbcL(1, true_label.clone())); // BRNE to true
                    
                    self.compile_expr(right, target, "u8")?;
                    let opc_tst = self.encode_rd_rr(0x2000, target, target);
                    self.emit(Pass1Inst::Op(opc_tst)); // TST target
                    self.emit(Pass1Inst::BrbcL(1, true_label.clone())); // BRNE to true
                    
                    let d = target - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target, 0
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));
                    
                    self.emit(Pass1Inst::Label(true_label));
                    let d = target - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4) | 1)); // LDI target, 1
                    
                    self.emit(Pass1Inst::Label(end_label));
                    return Ok(());
                }

                // Signedness of this operation, used to select signed division/comparison forms.
                let signed = self.expr_is_signed(left) || self.expr_is_signed(right);
                let rel_bit = if signed { 4u8 } else { 0u8 };

                // Fixed-point: a `*`/`/` between two fixed-point operands carries a scale correction
                // (>>frac after multiply, <<frac before divide). Fixed-by-scalar is plain arithmetic.
                let fixed_scale: Option<u8> = if op == "*" || op == "/" {
                    match (self.expr_fixed_bits(left), self.expr_fixed_bits(right)) {
                        (Some(f), Some(_)) => Some(f),
                        _ => None,
                    }
                } else {
                    None
                };
                if let Some(frac) = fixed_scale {
                    if op == "*" {
                        self.emit_fixed_mul(left, right, target, ty, frac)?;
                        return Ok(());
                    } else {
                        self.emit_fixed_div(left, right, target, ty, frac)?;
                        return Ok(());
                    }
                }

                if let Expr::Literal(val) = **right {
                    if op == "+" {
                        self.compile_expr(left, target, ty)?;
                        if ty == "u8" {
                            let k = (-(val & 0xFF)) as u8;
                            self.emit(Pass1Inst::Op(0x5000 | (((k >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k & 0x0F) as u16)); // SUBI target, -val
                        } else {
                            let imm = (val as i64 & 0xFFFF) as u16;
                            self.emit_add_u16_imm(target, imm);
                        }
                        return Ok(());
                    } else if op == "-" {
                        self.compile_expr(left, target, ty)?;
                        if ty == "u8" {
                            let k = (val & 0xFF) as u8;
                            self.emit(Pass1Inst::Op(0x5000 | (((k >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k & 0x0F) as u16)); // SUBI target, val
                        } else {
                            let imm = (val as i64 & 0xFFFF) as u16;
                            self.emit_sub_u16_imm(target, imm);
                        }
                        return Ok(());
                    } else if op == "&" {
                        self.compile_expr(left, target, ty)?;
                        if ty == "u8" {
                            let k = (val & 0xFF) as u8;
                            self.emit(Pass1Inst::Op(0x7000 | (((k >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k & 0x0F) as u16)); // ANDI target, val
                        } else {
                            let k_lo = (val & 0xFF) as u8;
                            let k_hi = ((val >> 8) & 0xFF) as u8;
                            self.emit(Pass1Inst::Op(0x7000 | (((k_lo >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k_lo & 0x0F) as u16)); // ANDI target, val_lo
                            self.emit(Pass1Inst::Op(0x7000 | (((k_hi >> 4) & 0x0F) as u16) << 8 | ((target + 1 - 16) as u16) << 4 | (k_hi & 0x0F) as u16)); // ANDI target+1, val_hi
                        }
                        return Ok(());
                    } else if op == "|" {
                        self.compile_expr(left, target, ty)?;
                        if ty == "u8" {
                            let k = (val & 0xFF) as u8;
                            self.emit(Pass1Inst::Op(0x6000 | (((k >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k & 0x0F) as u16)); // ORI target, val
                        } else {
                            let k_lo = (val & 0xFF) as u8;
                            let k_hi = ((val >> 8) & 0xFF) as u8;
                            self.emit(Pass1Inst::Op(0x6000 | (((k_lo >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k_lo & 0x0F) as u16)); // ORI target, val_lo
                            self.emit(Pass1Inst::Op(0x6000 | (((k_hi >> 4) & 0x0F) as u16) << 8 | ((target + 1 - 16) as u16) << 4 | (k_hi & 0x0F) as u16)); // ORI target+1, val_hi
                        }
                        return Ok(());
                    } else if op == "*" {
                        let uv = if ty == "u16" { (val as i64) & 0xFFFF } else { (val as i64) & 0xFF };
                        if uv == 1 {
                            self.compile_expr(left, target, ty)?;
                            return Ok(());
                        } else if uv == 0 {
                            self.compile_expr(left, target, ty)?;
                            self.emit(Pass1Inst::Op(0xE000 | (((target - 16) as u16) << 4))); // LDI target, 0
                            if ty == "u16" {
                                self.emit(Pass1Inst::Op(0xE000 | (((target + 1 - 16) as u16) << 4)));
                            }
                            return Ok(());
                        } else if uv > 0 {
                            let mut factor = uv;
                            let shifts = factor.trailing_zeros();
                            factor >>= shifts;
                            if factor == 1 {
                                // Power of 2
                                self.compile_expr(left, target, ty)?;
                                for _ in 0..shifts {
                                    if ty == "u8" {
                                        let opc = self.encode_rd_rr(0x0C00, target, target);
                                        self.emit(Pass1Inst::Op(opc)); // LSL target
                                    } else {
                                        let opc1 = self.encode_rd_rr(0x0C00, target, target);
                                        let opc2 = self.encode_rd_rr(0x1C00, target + 1, target + 1);
                                        self.emit(Pass1Inst::Op(opc1)); // LSL low
                                        self.emit(Pass1Inst::Op(opc2)); // ROL high
                                    }
                                }
                                return Ok(());
                            } else if matches!(factor, 3 | 5 | 9) {
                                // Decomposable constant multiplication (e.g. 6 = 3*2, 10 = 5*2, 12 = 3*4, 18 = 9*2, 24 = 3*8, etc.)
                                self.compile_expr(left, target, ty)?;
                                if ty == "u8" {
                                    let tmp = target + 2;
                                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, tmp, target))); // MOV tmp, x
                                    let f_shifts = if factor == 3 { 1 } else if factor == 5 { 2 } else { 3 };
                                    for _ in 0..f_shifts {
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target))); // LSL x
                                    }
                                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, tmp))); // ADD x, tmp
                                    
                                    // Now apply the power of 2 shifts
                                    for _ in 0..shifts {
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target))); // LSL x
                                    }
                                } else {
                                    let tmp_lo = target + 2;
                                    let tmp_hi = target + 3;
                                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, tmp_lo, target))); // MOV tmp_lo, x_lo
                                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, tmp_hi, target + 1))); // MOV tmp_hi, x_hi
                                    let f_shifts = if factor == 3 { 1 } else if factor == 5 { 2 } else { 3 };
                                    for _ in 0..f_shifts {
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target))); // LSL lo
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, target + 1, target + 1))); // ROL hi
                                    }
                                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, tmp_lo))); // ADD lo
                                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, target + 1, tmp_hi))); // ADC hi
                                    
                                    // Now apply the power of 2 shifts
                                    for _ in 0..shifts {
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target))); // LSL lo
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, target + 1, target + 1))); // ROL hi
                                    }
                                }
                                return Ok(());
                            }
                        }
                    } else if op == "/" && !signed {
                        let uv = if ty == "u16" { (val as i64) & 0xFFFF } else { (val as i64) & 0xFF };
                        if uv == 1 {
                            self.compile_expr(left, target, ty)?;
                            return Ok(());
                        } else if uv > 0 && (uv & (uv - 1)) == 0 {
                            let shifts = uv.trailing_zeros();
                            self.compile_expr(left, target, ty)?;
                            for _ in 0..shifts {
                                if ty == "u8" {
                                    self.emit(Pass1Inst::Op(0x9406 | ((target as u16) << 4))); // LSR target
                                } else {
                                    self.emit(Pass1Inst::Op(0x9406 | (((target + 1) as u16) << 4))); // LSR high
                                    self.emit(Pass1Inst::Op(0x9407 | ((target as u16) << 4)));       // ROR low
                                }
                            }
                            return Ok(());
                        }
                    } else if op == "%" && !signed {
                        let uv = if ty == "u16" { (val as i64) & 0xFFFF } else { (val as i64) & 0xFF };
                        if uv == 1 {
                            self.compile_expr(left, target, ty)?;
                            self.emit(Pass1Inst::Op(0xE000 | (((target - 16) as u16) << 4))); // LDI target, 0
                            if ty == "u16" {
                                self.emit(Pass1Inst::Op(0xE000 | (((target + 1 - 16) as u16) << 4)));
                            }
                            return Ok(());
                        } else if uv > 0 && (uv & (uv - 1)) == 0 {
                            let mask = (uv - 1) as u16;
                            self.compile_expr(left, target, ty)?;
                            let k_lo = (mask & 0xFF) as u8;
                            self.emit(Pass1Inst::Op(0x7000 | (((k_lo >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k_lo & 0x0F) as u16)); // ANDI low
                            if ty == "u16" {
                                let k_hi = ((mask >> 8) & 0xFF) as u8;
                                self.emit(Pass1Inst::Op(0x7000 | (((k_hi >> 4) & 0x0F) as u16) << 8 | ((target + 1 - 16) as u16) << 4 | (k_hi & 0x0F) as u16)); // ANDI high
                            }
                            return Ok(());
                        }
                    } else if ["==", "!=", "<", ">", "<=", ">="].contains(&op.as_str()) && ty == "u8" && !signed {
                        self.compile_expr(left, target, ty)?;
                        let k = (val & 0xFF) as u8;
                        self.emit(Pass1Inst::Op(0x3000 | (((k >> 4) & 0x0F) as u16) << 8 | ((target - 16) as u16) << 4 | (k & 0x0F) as u16)); // CPI target, val

                        let true_label = self.new_label("cmp_true");
                        let end_label = self.new_label("cmp_end");
                        
                        let br_op = match op.as_str() {
                            "==" => op.as_str(),
                            "!=" => op.as_str(),
                            "<" | ">" => "<",
                            ">=" | "<=" => ">=",
                            _ => unreachable!(),
                        };

                        match br_op {
                            "==" => self.emit(Pass1Inst::BrbsL(1, true_label.clone())), // BREQ
                            "!=" => self.emit(Pass1Inst::BrbcL(1, true_label.clone())), // BRNE
                            "<" => self.emit(Pass1Inst::BrbsL(0, true_label.clone())),  // BRLO/BRCS
                            ">=" => self.emit(Pass1Inst::BrbcL(0, true_label.clone())), // BRSH/BRCC
                            _ => unreachable!(),
                        }

                        // False case
                        let d = target - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target, 0
                        self.emit(Pass1Inst::RJumpL(end_label.clone()));
                        
                        // True case
                        self.emit(Pass1Inst::Label(true_label));
                        let d = target - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4) | 1)); // LDI target, 1
                        
                        self.emit(Pass1Inst::Label(end_label));
                        return Ok(());
                    }
                }

                // Spill only when the operation's temporary register footprint would exceed R31.
                // For binary ops we need target..target+3 at most (u16 path).
                let use_spill = target > 28;

                if op == ">" || op == "<=" {
                    if use_spill {
                        self.compile_expr(right, target, ty)?;
                        let addr = self.spill_push(target, ty)?;
                        self.compile_expr(left, target, ty)?;
                        self.spill_pop(target + 2, addr, ty)?;
                    } else {
                        self.compile_expr(right, target, ty)?;
                        self.compile_expr(left, target + 2, ty)?;
                    }
                } else {
                    if use_spill {
                        self.compile_expr(left, target, ty)?;
                        let addr = self.spill_push(target, ty)?;
                        self.compile_expr(right, target, ty)?;
                        if ty == "u8" {
                            let opc = self.encode_rd_rr(0x2C00, target + 2, target);
                            self.emit(Pass1Inst::Op(opc));
                        } else {
                            let opc1 = self.encode_rd_rr(0x2C00, target + 2, target);
                            let opc2 = self.encode_rd_rr(0x2C00, target + 3, target + 1);
                            self.emit(Pass1Inst::Op(opc1));
                            self.emit(Pass1Inst::Op(opc2));
                        }
                        self.spill_pop(target, addr, ty)?;
                    } else {
                        self.compile_expr(left, target, ty)?;
                        self.compile_expr(right, target + 2, ty)?;
                    }
                }
                
                if op == "+" {
                    if ty == "u8" {
                        let opc = self.encode_rd_rr(0x0C00, target, target + 2);
                        self.emit(Pass1Inst::Op(opc));
                    } else {
                        let opc1 = self.encode_rd_rr(0x0C00, target, target + 2);
                        let opc2 = self.encode_rd_rr(0x1C00, target + 1, target + 3);
                        self.emit(Pass1Inst::Op(opc1));
                        self.emit(Pass1Inst::Op(opc2));
                    }
                } else if op == "-" {
                    if ty == "u8" {
                        let opc = self.encode_rd_rr(0x1800, target, target + 2);
                        self.emit(Pass1Inst::Op(opc));
                    } else {
                        let opc1 = self.encode_rd_rr(0x1800, target, target + 2);
                        let opc2 = self.encode_rd_rr(0x0800, target + 1, target + 3);
                        self.emit(Pass1Inst::Op(opc1));
                        self.emit(Pass1Inst::Op(opc2));
                    }
                } else if op == "*" {
                    if ty == "u16" && self.has_hw_mul() {
                        // Hardware 16x16 -> low 16 bits.
                        // a = target:target+1, b = target+2:target+3, tmp = target+4.
                        let tmp = target + 4;
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, target + 1, target + 2))); // MUL a_hi, b_lo
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, tmp, 0)));                 // MOV tmp, R0
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, target, target + 3)));     // MUL a_lo, b_hi
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, tmp, 0)));                 // ADD tmp, R0
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x9C00, target, target + 2)));     // MUL a_lo, b_lo
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target, 0)));              // MOV res_lo, R0
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, 1, tmp)));                 // ADD R1, tmp
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target + 1, 1)));          // MOV res_hi, R1
                        self.emit(Pass1Inst::Op(0x2411));                                            // EOR R1, R1
                    } else if ty == "u16" {
                        // Software 16x16 -> low 16 bits (shift-and-add, 16 iterations).
                        let loop_label = self.new_label("mul16_loop");
                        let skip_label = self.new_label("mul16_skip");
                        let res_lo = target + 4;
                        let res_hi = target + 5;
                        let cnt = target + 6;

                        self.emit(Pass1Inst::Op(0x920F | ((res_lo as u16) << 4))); // PUSH res_lo
                        self.emit(Pass1Inst::Op(0x920F | ((res_hi as u16) << 4))); // PUSH res_hi
                        self.emit(Pass1Inst::Op(0x920F | ((cnt as u16) << 4)));    // PUSH cnt

                        self.emit(Pass1Inst::Op(0xE000 | (((res_lo - 16) as u16) << 4)));    // LDI res_lo, 0
                        self.emit(Pass1Inst::Op(0xE000 | (((res_hi - 16) as u16) << 4)));    // LDI res_hi, 0
                        self.emit(Pass1Inst::Op(0xE000 | 0x0100 | (((cnt - 16) as u16) << 4))); // LDI cnt, 16
                        self.emit(Pass1Inst::Label(loop_label.clone()));
                        self.emit(Pass1Inst::Op(0x9406 | (((target + 3) as u16) << 4)));     // LSR b_hi
                        self.emit(Pass1Inst::Op(0x9407 | (((target + 2) as u16) << 4)));     // ROR b_lo (C = LSB of b)
                        self.emit(Pass1Inst::BrbcL(0, skip_label.clone()));                  // BRCC skip
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, res_lo, target))); // ADD res_lo, a_lo
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, res_hi, target + 1))); // ADC res_hi, a_hi
                        self.emit(Pass1Inst::Label(skip_label));
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target))); // LSL a_lo
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, target + 1, target + 1))); // ROL a_hi
                        self.emit(Pass1Inst::Op(0x940A | ((cnt as u16) << 4)));              // DEC cnt
                        self.emit(Pass1Inst::BrbcL(1, loop_label));                          // BRNE loop
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target, res_lo))); // MOV res
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target + 1, res_hi)));

                        self.emit(Pass1Inst::Op(0x900F | ((cnt as u16) << 4)));    // POP cnt
                        self.emit(Pass1Inst::Op(0x900F | ((res_hi as u16) << 4))); // POP res_hi
                        self.emit(Pass1Inst::Op(0x900F | ((res_lo as u16) << 4))); // POP res_lo
                    } else if self.has_hw_mul() {
                        // Hardware multiplication: target * target+2 -> R1:R0
                        let opc_mul = 0x9C00 | ((((target + 2) & 0x10) as u16) << 5) | ((target as u16) << 4) | (((target + 2) & 0x0F) as u16);
                        self.emit(Pass1Inst::Op(opc_mul));

                        // Move R0 to target
                        let opc_mov = self.encode_rd_rr(0x2C00, target, 0);
                        self.emit(Pass1Inst::Op(opc_mov));

                        // Clear R1
                        self.emit(Pass1Inst::Op(0x2411)); // EOR R1, R1
                    } else {
                        // Optimized Universal Software Multiplier (8 opcodes)
                        let loop_start_label = self.new_label("mul_loop");
                        let skip_add_label = self.new_label("mul_skip");
                        
                        let res_reg = target + 4;
                        let cnt_reg = target + 5;

                        self.emit(Pass1Inst::Op(0x920F | ((res_reg as u16) << 4))); // PUSH res_reg
                        self.emit(Pass1Inst::Op(0x920F | ((cnt_reg as u16) << 4))); // PUSH cnt_reg
    
                        // LDI res_reg, 0 (result)
                        self.emit(Pass1Inst::Op(0xE000 | (((res_reg - 16) as u16) << 4)));
                        // LDI cnt_reg, 8 (counter)
                        self.emit(Pass1Inst::Op(0xE008 | (((cnt_reg - 16) as u16) << 4)));
                        
                        self.emit(Pass1Inst::Label(loop_start_label.clone()));
                        // LSR target+2 -> shift right by 1 bit, moving LSB to Carry flag
                        self.emit(Pass1Inst::Op(0x9406 | (((target + 2) as u16) << 4)));
                        
                        // BRCC skip_add_label (Branch if Carry Clear)
                        self.emit(Pass1Inst::BrbcL(0, skip_add_label.clone()));
                        
                        // ADD res_reg, target (add left operand to result)
                        let opc_add = self.encode_rd_rr(0x0C00, res_reg, target);
                        self.emit(Pass1Inst::Op(opc_add));
                        
                        self.emit(Pass1Inst::Label(skip_add_label));
                        // LSL target -> shift left (ADD target, target)
                        let opc_lsl = self.encode_rd_rr(0x0C00, target, target);
                        self.emit(Pass1Inst::Op(opc_lsl));
                        
                        // DEC cnt_reg (decrement loop counter)
                        self.emit(Pass1Inst::Op(0x940A | ((cnt_reg as u16) << 4)));
                        
                        // BRNE loop_start_label (Branch if Not Equal - i.e., counter > 0)
                        self.emit(Pass1Inst::BrbcL(1, loop_start_label));
                        
                        // MOV target, res_reg (move result to target register)
                        let opc_mov = self.encode_rd_rr(0x2C00, target, res_reg);
                        self.emit(Pass1Inst::Op(opc_mov));

                        self.emit(Pass1Inst::Op(0x900F | ((cnt_reg as u16) << 4))); // POP cnt_reg
                        self.emit(Pass1Inst::Op(0x900F | ((res_reg as u16) << 4))); // POP res_reg
                    }
                } else if (op == "/" || op == "%") && ty == "u16" {
                    // Restoring division, 16-bit. For signed operands the magnitudes are divided
                    // and the result sign is fixed up: quotient sign = sign(a) xor sign(b),
                    // remainder sign = sign(a). The sign source is preserved on the stack across
                    // the division because all scratch registers are clobbered.
                    if signed {
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target + 4, target + 1))); // MOV scr, a_hi
                        if op == "/" {
                            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2400, target + 4, target + 3))); // EOR scr, b_hi
                        }
                        self.emit(Pass1Inst::Op(0x920F | (((target + 4) as u16) << 4))); // PUSH scr
                        self.emit_abs16(target, target + 1);
                        self.emit_abs16(target + 2, target + 3);
                    }
                    // numerator a = target:target+1, denominator b = target+2:target+3.
                    let loop_start_label = self.new_label("div16_loop");
                    let skip_sub_label = self.new_label("div16_skip");
                    let rem_lo = target + 4;
                    let rem_hi = target + 5;
                    let cnt = target + 6;
                    self.emit(Pass1Inst::Op(0x920F | ((rem_lo as u16) << 4))); // PUSH rem_lo
                    self.emit(Pass1Inst::Op(0x920F | ((rem_hi as u16) << 4))); // PUSH rem_hi
                    self.emit(Pass1Inst::Op(0x920F | ((cnt as u16) << 4)));    // PUSH cnt
                    self.emit(Pass1Inst::Op(0xE000 | (((rem_lo - 16) as u16) << 4)));    // LDI rem_lo, 0
                    self.emit(Pass1Inst::Op(0xE000 | (((rem_hi - 16) as u16) << 4)));    // LDI rem_hi, 0
                    self.emit(Pass1Inst::Op(0xE000 | 0x0100 | (((cnt - 16) as u16) << 4))); // LDI cnt, 16
                    self.emit(Pass1Inst::Label(loop_start_label.clone()));
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, target, target)));         // LSL a_lo (C = bit15 after ROL)
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, target + 1, target + 1))); // ROL a_hi
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, rem_lo, rem_lo)));         // ROL rem_lo
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, rem_hi, rem_hi)));         // ROL rem_hi
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1400, rem_lo, target + 2)));     // CP rem_lo, b_lo
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0400, rem_hi, target + 3)));     // CPC rem_hi, b_hi
                    self.emit(Pass1Inst::BrbsL(0, skip_sub_label.clone()));                      // BRCS skip (rem < b)
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1800, rem_lo, target + 2)));     // SUB rem_lo, b_lo
                    self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0800, rem_hi, target + 3)));     // SBC rem_hi, b_hi
                    self.emit(Pass1Inst::Op(0x6001 | (((target - 16) as u16) << 4)));            // ORI a_lo, 1 (quotient bit)
                    self.emit(Pass1Inst::Label(skip_sub_label));
                    self.emit(Pass1Inst::Op(0x940A | ((cnt as u16) << 4)));                      // DEC cnt
                    self.emit(Pass1Inst::BrbcL(1, loop_start_label));                            // BRNE loop
                    if op == "%" {
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target, rem_lo)));     // MOV target, rem_lo
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target + 1, rem_hi))); // MOV target+1, rem_hi
                    }
                    self.emit(Pass1Inst::Op(0x900F | ((cnt as u16) << 4)));    // POP cnt
                    self.emit(Pass1Inst::Op(0x900F | ((rem_hi as u16) << 4))); // POP rem_hi
                    self.emit(Pass1Inst::Op(0x900F | ((rem_lo as u16) << 4))); // POP rem_lo
                    if signed {
                        self.emit(Pass1Inst::Op(0x900F | (((target + 4) as u16) << 4))); // POP scr
                        self.emit_cond_neg16(target, target + 1, target + 4);
                    }
                } else if op == "/" || op == "%" {
                    // Restoring Division 8-bit Software Loop. For signed operands, divide the
                    // magnitudes and fix the result sign. The sign source lives in target+3, which
                    // the unsigned loop (scratch target+4/target+5) leaves untouched.
                    if signed {
                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, target + 3, target))); // MOV scr, a
                        if op == "/" {
                            self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2400, target + 3, target + 2))); // EOR scr, b
                        }
                        self.emit_abs8(target);
                        self.emit_abs8(target + 2);
                    }
                    let loop_start_label = self.new_label("div_loop");
                    let skip_sub_label = self.new_label("div_skip");

                    let rem_reg = target + 4;
                    let cnt_reg = target + 5;

                    self.emit(Pass1Inst::Op(0x920F | ((rem_reg as u16) << 4))); // PUSH rem_reg
                    self.emit(Pass1Inst::Op(0x920F | ((cnt_reg as u16) << 4))); // PUSH cnt_reg

                    // LDI rem_reg, 0 (remainder)
                    self.emit(Pass1Inst::Op(0xE000 | (((rem_reg - 16) as u16) << 4)));
                    // LDI cnt_reg, 8 (counter)
                    self.emit(Pass1Inst::Op(0xE008 | (((cnt_reg - 16) as u16) << 4)));

                    self.emit(Pass1Inst::Label(loop_start_label.clone()));
                    // LSL target (shift numerator left, MSB to Carry)
                    let opc_lsl = self.encode_rd_rr(0x0C00, target, target);
                    self.emit(Pass1Inst::Op(opc_lsl));
                    // ROL rem_reg (rotate Carry into remainder)
                    let opc_rol = self.encode_rd_rr(0x1C00, rem_reg, rem_reg);
                    self.emit(Pass1Inst::Op(opc_rol));
                    // CP rem_reg, target+2 (compare remainder with denominator)
                    let opc_cp = self.encode_rd_rr(0x1400, rem_reg, target + 2);
                    self.emit(Pass1Inst::Op(opc_cp));

                    // BRCS skip_sub_label (Branch if Carry Set - i.e., remainder < denominator)
                    self.emit(Pass1Inst::BrbsL(0, skip_sub_label.clone()));

                    // SUB rem_reg, target+2 (subtract denominator)
                    let opc_sub = self.encode_rd_rr(0x1800, rem_reg, target + 2);
                    self.emit(Pass1Inst::Op(opc_sub));
                    // SUBI target, 0xFF (set Quotient LSB to 1)
                    self.emit(Pass1Inst::Op(0x5F0F | (((target - 16) as u16) << 4)));

                    self.emit(Pass1Inst::Label(skip_sub_label));
                    // DEC cnt_reg
                    self.emit(Pass1Inst::Op(0x940A | ((cnt_reg as u16) << 4)));

                    // BRNE loop_start_label (Branch if Zero flag is clear - counter > 0)
                    self.emit(Pass1Inst::BrbcL(1, loop_start_label));

                    if op == "%" {
                        // MOV target, rem_reg (move remainder to target register)
                        let opc_mov = self.encode_rd_rr(0x2C00, target, rem_reg);
                        self.emit(Pass1Inst::Op(opc_mov));
                    }
                    self.emit(Pass1Inst::Op(0x900F | ((cnt_reg as u16) << 4))); // POP cnt_reg
                    self.emit(Pass1Inst::Op(0x900F | ((rem_reg as u16) << 4))); // POP rem_reg

                    if signed {
                        self.emit(Pass1Inst::Op(0xFC00 | (((target + 3) as u16) << 4) | 7)); // SBRC scr, 7
                        self.emit_neg8(target);                                              // NEG result
                    }
                } else if op == "&" {
                    if ty == "u8" {
                        let opc = self.encode_rd_rr(0x2000, target, target + 2);
                        self.emit(Pass1Inst::Op(opc));
                    } else {
                        let opc1 = self.encode_rd_rr(0x2000, target, target + 2);
                        let opc2 = self.encode_rd_rr(0x2000, target + 1, target + 3);
                        self.emit(Pass1Inst::Op(opc1));
                        self.emit(Pass1Inst::Op(opc2));
                    }
                } else if op == "|" {
                    if ty == "u8" {
                        let opc = self.encode_rd_rr(0x2A00, target, target + 2);
                        self.emit(Pass1Inst::Op(opc));
                    } else {
                        let opc1 = self.encode_rd_rr(0x2A00, target, target + 2);
                        let opc2 = self.encode_rd_rr(0x2A00, target + 1, target + 3);
                        self.emit(Pass1Inst::Op(opc1));
                        self.emit(Pass1Inst::Op(opc2));
                    }
                } else if op == "^" {
                    if ty == "u8" {
                        let opc = self.encode_rd_rr(0x2400, target, target + 2);
                        self.emit(Pass1Inst::Op(opc));
                    } else {
                        let opc1 = self.encode_rd_rr(0x2400, target, target + 2);
                        let opc2 = self.encode_rd_rr(0x2400, target + 1, target + 3);
                        self.emit(Pass1Inst::Op(opc1));
                        self.emit(Pass1Inst::Op(opc2));
                    }
                } else if ["==", "!=", "<", ">", "<=", ">="].contains(&op.as_str()) {
                    let opc1 = self.encode_rd_rr(0x1400, target, target + 2);
                    self.emit(Pass1Inst::Op(opc1)); // CP
                    if ty == "u16" {
                        let opc2 = self.encode_rd_rr(0x0400, target + 1, target + 3);
                        self.emit(Pass1Inst::Op(opc2)); // CPC
                    }
                    
                    let true_label = self.new_label("cmp_true");
                    let end_label = self.new_label("cmp_end");
                    
                    let br_op = match op.as_str() {
                        "==" => op.as_str(),
                        "!=" => op.as_str(),
                        "<" | ">" => "<",
                        ">=" | "<=" => ">=",
                        _ => return Err(format!("Unsupported comparative operator in backend: {}", op)),
                    };

                    match br_op {
                        "==" => self.emit(Pass1Inst::BrbsL(1, true_label.clone())),       // BREQ
                        "!=" => self.emit(Pass1Inst::BrbcL(1, true_label.clone())),       // BRNE
                        "<" => self.emit(Pass1Inst::BrbsL(rel_bit, true_label.clone())),  // BRLO/BRCS or BRLT
                        ">=" => self.emit(Pass1Inst::BrbcL(rel_bit, true_label.clone())), // BRSH/BRCC or BRGE
                        _ => unreachable!(),
                    }

                    // False case
                    let d = target - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target, 0
                    if ty == "u16" {
                        let d = (target + 1) - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target+1, 0
                    }
                    self.emit(Pass1Inst::RJumpL(end_label.clone()));

                    // True case
                    self.emit(Pass1Inst::Label(true_label));
                    let d = target - 16;
                    self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4) | 1)); // LDI target, 1
                    if ty == "u16" {
                        let d = (target + 1) - 16;
                        self.emit(Pass1Inst::Op(0xE000 | ((d as u16) << 4))); // LDI target+1, 0
                    }
                    self.emit(Pass1Inst::Label(end_label));
                }
            }
            Expr::Call { name, args } => {
                // Intrinsics are encoded directly as opcodes to avoid function-call overhead.
                // This path is intentionally strict about argument forms to keep assembly output
                // deterministic and prevent hidden ABI assumptions.
                // Rejected approach: auto-coercing arbitrary expressions into intrinsic register
                // arguments. It simplifies syntax but obscures register ownership and side effects.
                if name.starts_with('@') {
                    let intrinsic = &name[1..];
                    match intrinsic {
                        "nop" => {
                            self.emit(Pass1Inst::Op(0x0000));
                            return Ok(());
                        }
                        "sleep" => {
                            self.emit(Pass1Inst::Op(0x9588));
                            return Ok(());
                        }
                        "wdr" => {
                            self.emit(Pass1Inst::Op(0x95A8));
                            return Ok(());
                        }
                        "break" => {
                            self.emit(Pass1Inst::Op(0x9598));
                            return Ok(());
                        }
                        "reti" => {
                            self.emit(Pass1Inst::Op(0x9518));
                            return Ok(());
                        }
                        "lpm" => {
                            self.emit(Pass1Inst::Op(0x95C8));
                            return Ok(());
                        }
                        "elpm" => {
                            self.emit(Pass1Inst::Op(0x95D8));
                            return Ok(());
                        }
                        "spm" => {
                            self.emit(Pass1Inst::Op(0x95E8));
                            return Ok(());
                        }
                        "ijmp" => {
                            self.emit(Pass1Inst::Op(0x9409));
                            return Ok(());
                        }
                        "icall" => {
                            self.emit(Pass1Inst::Op(0x9509));
                            return Ok(());
                        }
                        "eijmp" => {
                            self.emit(Pass1Inst::Op(0x9419));
                            return Ok(());
                        }
                        "eicall" => {
                            self.emit(Pass1Inst::Op(0x9519));
                            return Ok(());
                        }
                        "des" => {
                            if args.len() == 1 {
                                if let Expr::Literal(k) = args[0] {
                                    self.emit(Pass1Inst::Op(0x940B | ((k as u16) << 4)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @des expects exactly 1 literal argument (0..15)".to_string());
                        }
                        "swap" => {
                            if args.len() == 1 {
                                if let Expr::Literal(reg) = args[0] {
                                    self.emit(Pass1Inst::Op(0x9402 | ((reg as u16) << 4)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @swap expects exactly 1 literal register argument (0..31)".to_string());
                        }
                        "movw" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    if self.target_core == TargetCore::AVRrc {
                                        let op1 = self.encode_rd_rr(0x2C00, *rd as u8, *rr as u8);
                                        let op2 = self.encode_rd_rr(0x2C00, (*rd + 1) as u8, (*rr + 1) as u8);
                                        self.emit(Pass1Inst::Op(op1));
                                        self.emit(Pass1Inst::Op(op2));
                                    } else {
                                        self.emit(Pass1Inst::Op(0x0100 | (((rd >> 1) as u16) << 4) | ((rr >> 1) as u16)));
                                    }
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @movw expects exactly 2 literal register arguments (0..30)".to_string());
                        }
                        "mul" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    if !self.has_hw_mul() {
                                        // Virtualized 8-bit software multiplication: Rd * Rr -> R1:R0
                                        let op_mov1 = self.encode_rd_rr(0x2C00, 19, *rd as u8);
                                        self.emit(Pass1Inst::Op(op_mov1)); // MOV R19, Rd (multiplicand low)
                                        
                                        self.emit(Pass1Inst::Op(0xE040)); // LDI R20, 0 (multiplicand high)
                                        
                                        let op_mov2 = self.encode_rd_rr(0x2C00, 21, *rr as u8);
                                        self.emit(Pass1Inst::Op(op_mov2)); // MOV R21, Rr (multiplier)
                                        
                                        self.emit(Pass1Inst::Op(0xE000)); // LDI R16, 0 (zero register helper)
                                        
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, 0, 16))); // MOV R0, R16 (clear low result)
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x2C00, 1, 16))); // MOV R1, R16 (clear high result)
                                        
                                        self.emit(Pass1Inst::Op(0xE068)); // LDI R22, 8 (loop counter)
                                        
                                        let loop_label = self.new_label("soft_mul_loop");
                                        let skip_label = self.new_label("soft_mul_skip");
                                        
                                        self.emit(Pass1Inst::Label(loop_label.clone()));
                                        
                                        self.emit(Pass1Inst::Op(0x9406 | (21 << 4))); // LSR R21 (shift multiplier right, LSB to Carry)
                                        
                                        self.emit(Pass1Inst::BrbcL(0, skip_label.clone())); // BRCC soft_mul_skip
                                        
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x0C00, 0, 19))); // ADD R0, R19
                                        self.emit(Pass1Inst::Op(self.encode_rd_rr(0x1C00, 1, 20))); // ADC R1, R20
                                        
                                        self.emit(Pass1Inst::Label(skip_label));
                                        
                                        let opc_lsl = self.encode_rd_rr(0x0C00, 19, 19);
                                        self.emit(Pass1Inst::Op(opc_lsl)); // LSL R19 (shift multiplicand low left)
                                        
                                        let opc_rol = self.encode_rd_rr(0x1C00, 20, 20);
                                        self.emit(Pass1Inst::Op(opc_rol)); // ROL R20 (rotate multiplicand high left)
                                        
                                        self.emit(Pass1Inst::Op(0x940A | (22 << 4))); // DEC R22 (decrement loop counter)
                                        
                                        self.emit(Pass1Inst::BrbcL(1, loop_label)); // BRNE soft_mul_loop
                                    } else {
                                        self.emit(Pass1Inst::Op(0x9C00 | (((rr & 0x10) as u16) << 5) | ((*rd as u16) << 4) | ((*rr & 0x0F) as u16)));
                                    }
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @mul expects exactly 2 literal register arguments (0..31)".to_string());
                        }
                        "muls" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    self.emit(Pass1Inst::Op(0x0200 | (((rd - 16) as u16) << 4) | ((rr - 16) as u16)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @muls expects exactly 2 literal register arguments (16..31)".to_string());
                        }
                        "mulsu" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    self.emit(Pass1Inst::Op(0x0300 | (((rd - 16) as u16) << 4) | ((rr - 16) as u16)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @mulsu expects exactly 2 literal register arguments (16..23)".to_string());
                        }
                        "fmul" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    self.emit(Pass1Inst::Op(0x0308 | (((rd - 16) as u16) << 4) | ((rr - 16) as u16)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @fmul expects exactly 2 literal register arguments (16..23)".to_string());
                        }
                        "fmuls" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    self.emit(Pass1Inst::Op(0x0380 | (((rd - 16) as u16) << 4) | ((rr - 16) as u16)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @fmuls expects exactly 2 literal register arguments (16..23)".to_string());
                        }
                        "fmulsu" => {
                            if args.len() == 2 {
                                if let (Expr::Literal(rd), Expr::Literal(rr)) = (&args[0], &args[1]) {
                                    self.emit(Pass1Inst::Op(0x0388 | (((rd - 16) as u16) << 4) | ((rr - 16) as u16)));
                                    return Ok(());
                                }
                            }
                            return Err("Intrinsic @fmulsu expects exactly 2 literal register arguments (16..23)".to_string());
                        }
                        _ => {}
                    }
                }

                // Standard non-intrinsic function call
                let mut reg_idx = 24u8;
                let expected_tys = if let Some((param_tys, _)) = self.functions.get(name) {
                    Some(param_tys.clone())
                } else {
                    None
                };

                for (idx, arg) in args.iter().enumerate() {
                    let arg_ty = if let Some(ref tys) = expected_tys {
                        if idx < tys.len() {
                            tys[idx].as_str()
                        } else {
                            "u16"
                        }
                    } else {
                        "u16"
                    };
                    
                    self.compile_expr(arg, reg_idx, arg_ty)?;
                    
                    if reg_idx >= 18 {
                        reg_idx -= 2;
                    }
                }
                self.emit(Pass1Inst::RCallL(name.clone()));
                if target != 24 {
                    let opc1 = self.encode_rd_rr(0x2C00, target, 24);
                    self.emit(Pass1Inst::Op(opc1)); // MOV target, R24
                    if ty == "u16" {
                        let opc2 = self.encode_rd_rr(0x2C00, target + 1, 25);
                        self.emit(Pass1Inst::Op(opc2)); // MOV target+1, R25
                    }
                }
            }
        }
        Ok(())
    }
}

// -------------------------------------------------------------------------------------------------
// End of Phase 1
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Phase 2: Post-Lowering Utilities
// -------------------------------------------------------------------------------------------------
/// Validates that a declared type is something the code generator can actually lower.
///
/// Supported families:
/// - integer: `u8`, `u16`, `i8`, `i16`
/// - fixed-point: `r8`, `r16`
/// - aliases: `bool`, `char` (byte-wide; lowered as `u8`)
/// - pointer/string wrappers: `ptr <space> <type>`, `str ram`
///
/// Storage qualifiers (`flash `/`eeprom `) and array suffixes (`[N]`) are stripped before
/// inspecting the underlying base type.
fn validate_type(ty: &str) -> Result<(), String> {
    // Pointer types: "ptr <space> <pointee>"; string types: "str <space>".
    if let Some(rest) = ty.strip_prefix("ptr ") {
        let mut parts = rest.splitn(2, ' ');
        let space = parts.next().unwrap_or("");
        let pointee = parts.next().unwrap_or("");
        if !matches!(space, "ram" | "flash" | "eeprom") {
            return Err(format!("Type Error: pointer space must be ram/flash/eeprom, got '{}'", space));
        }
        return validate_type(pointee);
    }
    if let Some(space) = ty.strip_prefix("str ") {
        if !matches!(space, "ram" | "flash") {
            return Err(format!("Type Error: string space must be ram or flash, got '{}'", space));
        }
        return Ok(());
    }
    let base = if let Some(rest) = ty.strip_prefix("flash ") {
        rest
    } else if let Some(rest) = ty.strip_prefix("eeprom ") {
        rest
    } else {
        ty
    };
    let base = base.split('[').next().unwrap_or(base).trim();
    match base {
        "u8" | "u16" | "bool" | "char" | "void" | "i8" | "i16" | "r8" | "r16" => Ok(()),
        other => Err(format!("Type Error: unknown or unsupported type '{}'", other)),
    }
}

/// Returns the number of fractional bits of a fixed-point type (`r8` -> Q4.4 -> 4,
/// `r16` -> Q8.8 -> 8), or `None` for non-fixed-point types. Storage qualifiers and array
/// suffixes are ignored.
fn fixed_frac_of_type(ty: &str) -> Option<u8> {
    let core = if let Some(r) = ty.strip_prefix("flash ") {
        r
    } else if let Some(r) = ty.strip_prefix("eeprom ") {
        r
    } else {
        ty
    };
    match core.split('[').next().unwrap_or(core).trim() {
        "r8" => Some(4),
        "r16" => Some(8),
        _ => None,
    }
}

/// True when the declared type is a signed type (signed integer or signed fixed-point).
/// Storage qualifiers and array suffixes are ignored. Width is irrelevant here.
fn is_signed_type(ty: &str) -> bool {
    let core = if let Some(r) = ty.strip_prefix("flash ") {
        r
    } else if let Some(r) = ty.strip_prefix("eeprom ") {
        r
    } else {
        ty
    };
    let base = core.split('[').next().unwrap_or(core).trim();
    matches!(base, "i8" | "i16" | "r8" | "r16")
}

/// Maps a declared type to the width-equivalent unsigned integer type used throughout the
/// backend's storage/load/store logic. The bit patterns of signed and fixed-point values are
/// identical to their unsigned-integer counterparts for move/add/sub/and/or operations, so the
/// whole width layer can treat `i16`/`r16` as `u16` and `i8`/`r8` as `u8`. Storage qualifiers
/// (`flash `/`eeprom `) and array suffixes (`[N]`) are preserved.
fn normalize_width_type(ty: &str) -> String {
    // Pointers and string handles are 16-bit addresses regardless of pointee/space.
    if ty.starts_with("ptr ") || ty.starts_with("str ") {
        return "u16".to_string();
    }
    let (prefix, core) = if let Some(r) = ty.strip_prefix("flash ") {
        ("flash ", r)
    } else if let Some(r) = ty.strip_prefix("eeprom ") {
        ("eeprom ", r)
    } else {
        ("", ty)
    };
    let normalized = if let Some(rest) = core.strip_prefix("i16") {
        format!("u16{}", rest)
    } else if let Some(rest) = core.strip_prefix("r16") {
        format!("u16{}", rest)
    } else if let Some(rest) = core.strip_prefix("i8") {
        format!("u8{}", rest)
    } else if let Some(rest) = core.strip_prefix("r8") {
        format!("u8{}", rest)
    } else {
        core.to_string()
    };
    format!("{}{}", prefix, normalized)
}


/// Evaluates an expression to a compile-time constant, but only when the entire subtree
/// is literal-computable (no variable, hardware, or call leaves). Wrapping mirrors the
/// runtime's per-type-width unsigned arithmetic. Comparisons and logical operators are
/// intentionally not folded here to avoid the backend's signed-branch semantics.
/// Wraps an intermediate value to the target width. Unsigned types mask to `[0,2^w)`; signed
/// types reduce modulo 2^w with sign extension (an `i8`/`i16` cast), so that folded `/` and `%`
/// match the runtime's signed division semantics.
fn fit_ty(v: i64, ty: &str, signed: bool) -> i64 {
    let ty_clean = if ty.starts_with("eeprom ") { &ty[7..] } else if ty.starts_with("flash ") { &ty[6..] } else { ty };
    // This may run before width normalization (the AST pre-pass sees raw i16/r16), so recognize
    // every 16-bit-wide spelling here, not just u16.
    let w16 = matches!(ty_clean, "u16" | "i16" | "r16");
    if signed {
        if w16 { v as i16 as i64 } else { v as i8 as i64 }
    } else if w16 {
        v & 0xFFFF
    } else {
        v & 0xFF
    }
}

fn eval_const(expr: &Expr, ty: &str, signed: bool, imut_constants: &HashMap<String, i64>) -> Option<i64> {
    match expr {
        Expr::Literal(v) => Some(fit_ty(*v as i64, ty, signed)),
        Expr::VarRef(ref name) => {
            if name.starts_with('$') {
                imut_constants.get(name).copied()
            } else {
                None
            }
        }
        Expr::UnaryOp { op, expr } => {
            let x = eval_const(expr, ty, signed, imut_constants)?;
            match op.as_str() {
                "-" => Some(fit_ty(x.wrapping_neg(), ty, signed)),
                "~" => Some(fit_ty(!x, ty, signed)),
                _ => None,
            }
        }
        Expr::BinOp { left, op, right } => {
            let l = eval_const(left, ty, signed, imut_constants)?;
            let r = eval_const(right, ty, signed, imut_constants)?;
            let res = match op.as_str() {
                "+" => l.wrapping_add(r),
                "-" => l.wrapping_sub(r),
                "*" => l.wrapping_mul(r),
                "/" => { if r == 0 { return None; } l / r }
                "%" => { if r == 0 { return None; } l % r }
                "&" => l & r,
                "|" => l | r,
                "^" => l ^ r,
                _ => return None,
            };
            Some(fit_ty(res, ty, signed))
        }
        _ => None,
    }
}

/// Same bit packing as `encode_rd_rr`, kept standalone for peephole rewrites.
fn encode_rd_rr_peephole(op: u16, d: u8, r: u8) -> u16 {
    let d_bits = (d as u16) << 4;
    let r_bit9 = ((r & 0x10) as u16) << 5;
    let r_bits3_0 = (r & 0x0F) as u16;
    op | d_bits | r_bit9 | r_bits3_0
}

/// Peephole pass over symbolic instructions.
///
/// Design note:
/// We iterate until fixpoint. This was preferred over a single pass because some rewrites
/// unlock later adjacent patterns.
///
/// Safety contract:
/// - Rewrites must be semantics-preserving with respect to flags/observable memory.
/// - No rule may introduce or remove labels.
pub fn peephole_optimize(instructions: &[Pass1Inst]) -> Vec<Pass1Inst> {
    let mut current = instructions.to_vec();
    loop {
        let mut optimized = Vec::new();
        let mut i = 0;
        let mut changed = false;
        while i < current.len() {
            // Pattern 1: Redundant relative jump directly to the next label
            if i + 1 < current.len() {
                if let (Pass1Inst::RJumpL(ref label), Pass1Inst::Label(ref target_label)) = 
                    (&current[i], &current[i+1])
                {
                    if label == target_label {
                        optimized.push(current[i+1].clone());
                        i += 2;
                        changed = true;
                        continue;
                    }
                }
            }

            // Pattern 2: STS followed by LDS (2-word memory operations)
            if i + 3 < current.len() {
                if let (Pass1Inst::Op(op1), Pass1Inst::Op(addr1), Pass1Inst::Op(op2), Pass1Inst::Op(addr2)) = 
                    (&current[i], &current[i+1], &current[i+2], &current[i+3]) 
                {
                    let is_sts = (op1 & 0xFE0F) == 0x9200;
                    let is_lds = (op2 & 0xFE0F) == 0x9000;
                    if is_sts && is_lds && addr1 == addr2 {
                        let reg_sts = ((op1 >> 4) & 0x1F) as u8;
                        let reg_lds = ((op2 >> 4) & 0x1F) as u8;
                        if reg_sts == reg_lds {
                            optimized.push(Pass1Inst::Op(*op1));
                            optimized.push(Pass1Inst::Op(*addr1));
                            i += 4;
                            changed = true;
                            continue;
                        } else {
                            optimized.push(Pass1Inst::Op(*op1));
                            optimized.push(Pass1Inst::Op(*addr1));
                            optimized.push(Pass1Inst::Op(encode_rd_rr_peephole(0x2C00, reg_lds, reg_sts)));
                            i += 4;
                            changed = true;
                            continue;
                        }
                    }
                }
            }

            // Pattern 3: OUT followed by IN (1-word I/O space operations)
            if i + 1 < current.len() {
                if let (Pass1Inst::Op(op1), Pass1Inst::Op(op2)) = (&current[i], &current[i+1]) {
                    let is_out = (op1 & 0xF800) == 0xB800;
                    let is_in = (op2 & 0xF800) == 0xB000;
                    if is_out && is_in {
                        let io_addr1 = (((op1 >> 5) & 0x30) | (op1 & 0x0F)) as u8;
                        let io_addr2 = (((op2 >> 5) & 0x30) | (op2 & 0x0F)) as u8;
                        if io_addr1 == io_addr2 {
                            let reg_out = ((op1 >> 4) & 0x1F) as u8;
                            let reg_in = ((op2 >> 4) & 0x1F) as u8;
                            if reg_out == reg_in {
                                optimized.push(Pass1Inst::Op(*op1));
                                i += 2;
                                changed = true;
                                continue;
                            } else {
                                optimized.push(Pass1Inst::Op(*op1));
                                optimized.push(Pass1Inst::Op(encode_rd_rr_peephole(0x2C00, reg_in, reg_out)));
                                i += 2;
                                changed = true;
                                continue;
                            }
                        }
                    }
                }
            }

            // Pattern 3.5: STD followed by LDD (1-word Y-displacement space operations)
            if i + 1 < current.len() {
                if let (Pass1Inst::Op(op1), Pass1Inst::Op(op2)) = (&current[i], &current[i+1]) {
                    let is_std = (op1 & 0xD208) == 0x8208;
                    let is_ldd = (op2 & 0xD208) == 0x8008;
                    if is_std && is_ldd {
                        let q1 = (((op1 >> 8) & 0x20) | ((op1 >> 7) & 0x18) | (op1 & 0x07)) as u8;
                        let q2 = (((op2 >> 8) & 0x20) | ((op2 >> 7) & 0x18) | (op2 & 0x07)) as u8;
                        if q1 == q2 {
                            let reg_std = ((op1 >> 4) & 0x1F) as u8;
                            let reg_ldd = ((op2 >> 4) & 0x1F) as u8;
                            if reg_std == reg_ldd {
                                optimized.push(Pass1Inst::Op(*op1));
                                i += 2;
                                changed = true;
                                continue;
                            } else {
                                optimized.push(Pass1Inst::Op(*op1));
                                optimized.push(Pass1Inst::Op(encode_rd_rr_peephole(0x2C00, reg_ldd, reg_std)));
                                i += 2;
                                changed = true;
                                continue;
                            }
                        }
                    }
                }
            }

            // Pattern 4: Tail-call optimization. A relative call immediately followed by RET
            // returns to the original caller anyway, so jump instead of call+return.
            if i + 1 < current.len() {
                if let (Pass1Inst::RCallL(ref label), Pass1Inst::Op(0x9508)) =
                    (&current[i], &current[i+1])
                {
                    optimized.push(Pass1Inst::RJumpL(label.clone()));
                    i += 2;
                    changed = true;
                    continue;
                }
            }

            // Pattern 5: Remove a register move to itself (MOV Rd, Rd is a no-op).
            if let Pass1Inst::Op(op) = &current[i] {
                if (op & 0xFC00) == 0x2C00 {
                    let d = ((op >> 4) & 0x1F) as u8;
                    let r = (((op >> 5) & 0x10) | (op & 0x0F)) as u8;
                    if d == r {
                        i += 1;
                        changed = true;
                        continue;
                    }
                }
            }

            // Pattern 6: Dead LDI. Two consecutive LDI to the same register: the first
            // result is overwritten before any use (LDI reads nothing, touches no flags).
            if i + 1 < current.len() {
                if let (Pass1Inst::Op(op1), Pass1Inst::Op(op2)) = (&current[i], &current[i+1]) {
                    if (op1 & 0xF000) == 0xE000 && (op2 & 0xF000) == 0xE000 {
                        let d1 = (op1 >> 4) & 0x0F;
                        let d2 = (op2 >> 4) & 0x0F;
                        if d1 == d2 {
                            i += 1;
                            changed = true;
                            continue;
                        }
                    }
                }
            }

            optimized.push(current[i].clone());
            i += 1;
        }
        if !changed {
            break;
        }
        current = optimized;
    }
    current
}

/// Resolves symbolic labels and relative branches into final opcodes.
///
/// Strategy:
/// - First run peephole optimization.
/// - Then perform monotonic branch relaxation (short -> long only) to guarantee convergence.
/// - Finally encode concrete machine words.
///
/// Branch-range engineering detail:
/// - BRBS/BRBC remain short branches (7-bit signed).
/// - Frontend emits "BRxx skip; RJMP target" patterns when target distance can grow.
/// - RJMP/RCALL are promoted to JMP/CALL only when 12-bit signed range is exceeded.
pub fn resolve_labels(instructions: &[Pass1Inst]) -> Vec<u16> {
    let optimized_instructions = peephole_optimize(instructions);
    let instructions = &optimized_instructions;
    let n = instructions.len();

    // Branch relaxation: RJMP/RCALL encode a 12-bit signed relative offset (±2K words).
    // When the target is farther, fall back to the 2-word absolute JMP/CALL. Sizing is
    // iterated to a fixpoint because promoting one jump shifts every later address. Flips
    // are monotonic (short -> long only), which guarantees termination.
    let mut is_long = vec![false; n];
    loop {
        let mut label_addresses: HashMap<String, i64> = HashMap::new();
        let mut addr: i64 = 0;
        for (idx, inst) in instructions.iter().enumerate() {
            match inst {
                Pass1Inst::Label(name) => { label_addresses.insert(name.clone(), addr); }
                Pass1Inst::Op(_) | Pass1Inst::BrbsL(_, _) | Pass1Inst::BrbcL(_, _) => addr += 1,
                Pass1Inst::RJumpL(_) | Pass1Inst::RCallL(_) => addr += if is_long[idx] { 2 } else { 1 },
                Pass1Inst::FlashLdi16(_, _, _) => addr += 2, // Two LDI instructions
                Pass1Inst::FlashDataBlob(name, data) => {
                    label_addresses.insert(name.clone(), addr);
                    addr += ((data.len() + 1) / 2) as i64; // Ceiling division: pack bytes into u16 words
                }
            }
        }
        let mut changed = false;
        let mut addr: i64 = 0;
        for (idx, inst) in instructions.iter().enumerate() {
            match inst {
                Pass1Inst::Label(_) => {}
                Pass1Inst::Op(_) | Pass1Inst::BrbsL(_, _) | Pass1Inst::BrbcL(_, _) => addr += 1,
                Pass1Inst::RJumpL(label) | Pass1Inst::RCallL(label) => {
                    if !is_long[idx] {
                        let target = *label_addresses.get(label).unwrap_or(&0);
                        let offset = target - (addr + 1);
                        if offset < -2048 || offset > 2047 {
                            is_long[idx] = true;
                            changed = true;
                        }
                    }
                    addr += if is_long[idx] { 2 } else { 1 };
                }
                Pass1Inst::FlashLdi16(_, _, _) => addr += 2,
                Pass1Inst::FlashDataBlob(_, data) => {
                    addr += ((data.len() + 1) / 2) as i64;
                }
            }
        }
        if !changed { break; }
    }

    // Final label addresses with settled instruction sizes.
    let mut label_addresses: HashMap<String, i64> = HashMap::new();
    let mut addr: i64 = 0;
    for (idx, inst) in instructions.iter().enumerate() {
        match inst {
            Pass1Inst::Label(name) => { label_addresses.insert(name.clone(), addr); }
            Pass1Inst::Op(_) | Pass1Inst::BrbsL(_, _) | Pass1Inst::BrbcL(_, _) => addr += 1,
            Pass1Inst::RJumpL(_) | Pass1Inst::RCallL(_) => addr += if is_long[idx] { 2 } else { 1 },
            Pass1Inst::FlashLdi16(_, _, _) => addr += 2,
            Pass1Inst::FlashDataBlob(name, data) => {
                label_addresses.insert(name.clone(), addr);
                addr += ((data.len() + 1) / 2) as i64;
            }
        }
    }

    let mut final_opcodes = Vec::new();
    let mut addr: i64 = 0;
    for (idx, inst) in instructions.iter().enumerate() {
        match inst {
            Pass1Inst::Label(_) => {}
            Pass1Inst::Op(opcode) => {
                final_opcodes.push(*opcode);
                addr += 1;
            }
            Pass1Inst::RJumpL(label) => {
                let target = *label_addresses.get(label).unwrap_or(&0);
                if is_long[idx] {
                    let k = target as u32;
                    final_opcodes.push(0x940C | ((((k >> 17) & 0x1F) as u16) << 4) | ((k >> 16) & 0x01) as u16); // JMP
                    final_opcodes.push((k & 0xFFFF) as u16);
                    addr += 2;
                } else {
                    let offset = target - (addr + 1);
                    final_opcodes.push(0xC000 | ((offset as u16) & 0x0FFF)); // RJMP
                    addr += 1;
                }
            }
            Pass1Inst::RCallL(label) => {
                let target = *label_addresses.get(label).unwrap_or(&0);
                if is_long[idx] {
                    let k = target as u32;
                    final_opcodes.push(0x940E | ((((k >> 17) & 0x1F) as u16) << 4) | ((k >> 16) & 0x01) as u16); // CALL
                    final_opcodes.push((k & 0xFFFF) as u16);
                    addr += 2;
                } else {
                    let offset = target - (addr + 1);
                    final_opcodes.push(0xD000 | ((offset as u16) & 0x0FFF)); // RCALL
                    addr += 1;
                }
            }
            Pass1Inst::BrbsL(sreg_bit, label) => {
                let target = *label_addresses.get(label).unwrap_or(&0);
                let offset = target - (addr + 1);
                let offset_bits = (offset as u16) & 0x7F;
                final_opcodes.push(0xF000 | (offset_bits << 3) | (*sreg_bit as u16));
                addr += 1;
            }
            Pass1Inst::BrbcL(sreg_bit, label) => {
                let target = *label_addresses.get(label).unwrap_or(&0);
                let offset = target - (addr + 1);
                let offset_bits = (offset as u16) & 0x7F;
                final_opcodes.push(0xF400 | (offset_bits << 3) | (*sreg_bit as u16));
                addr += 1;
            }
            Pass1Inst::FlashLdi16(target_reg, label, byte_offset) => {
                // Resolve the flash data byte address: label_word_addr * 2 + byte_offset
                let label_word_addr = *label_addresses.get(label).unwrap_or(&0) as u16;
                let byte_addr = label_word_addr.wrapping_mul(2).wrapping_add(*byte_offset);
                let lo = (byte_addr & 0xFF) as u8;
                let hi = ((byte_addr >> 8) & 0xFF) as u8;
                let d_lo = (*target_reg - 16) as u16;
                let d_hi = (*target_reg + 1 - 16) as u16;
                // LDI target_reg, lo
                final_opcodes.push(0xE000 | (((lo >> 4) as u16) << 8) | (d_lo << 4) | ((lo & 0x0F) as u16));
                // LDI target_reg+1, hi
                final_opcodes.push(0xE000 | (((hi >> 4) as u16) << 8) | (d_hi << 4) | ((hi & 0x0F) as u16));
                addr += 2;
            }
            Pass1Inst::FlashDataBlob(_name, data) => {
                // Pack raw bytes as little-endian u16 words
                let mut i = 0;
                while i < data.len() {
                    let lo = data[i];
                    let hi = if i + 1 < data.len() { data[i + 1] } else { 0x00 };
                    final_opcodes.push((lo as u16) | ((hi as u16) << 8));
                    i += 2;
                }
                addr += ((data.len() + 1) / 2) as i64;
            }
        }
    }

    final_opcodes
}

/// Encodes machine words as Intel HEX records.
///
/// Output contract:
/// - Data records use 16-byte payloads (8 words) except possibly final partial record.
/// - Addresses are byte addresses, little-endian payload per AVR word order.
pub fn generate_intel_hex(opcodes: &[u16]) -> String {
    let mut hex = String::new();
    let mut address = 0u16;
    
    let chunks = opcodes.chunks(8);
    for chunk in chunks {
        let mut data = Vec::new();
        for &op in chunk {
            // Little-endian: low byte first, then high byte
            data.push((op & 0xFF) as u8);
            data.push((op >> 8) as u8);
        }
        
        let record = make_hex_record(address, &data);
        hex.push_str(&record);
        hex.push('\n');
        
        address += data.len() as u16;
    }
    
    hex.push_str(&make_eof_record());
    hex.push('\n');
    
    hex
}

/// Builds one Intel HEX data record (record type 00) with two's-complement checksum.
fn make_hex_record(address: u16, data: &[u8]) -> String {
    let byte_count = data.len() as u8;
    let addr_hi = (address >> 8) as u8;
    let addr_lo = (address & 0xFF) as u8;
    let record_type = 0x00u8;
    
    let mut sum = byte_count as u32 + addr_hi as u32 + addr_lo as u32 + record_type as u32;
    for &b in data {
        sum += b as u32;
    }
    
    let checksum = (((!sum) + 1) & 0xFF) as u8;
    
    let mut record = format!(":{:02X}{:02X}{:02X}{:02X}", byte_count, addr_hi, addr_lo, record_type);
    for &b in data {
        record.push_str(&format!("{:02X}", b));
    }
    record.push_str(&format!("{:02X}", checksum));
    record
}

/// End-of-file Intel HEX sentinel record.
fn make_eof_record() -> String {
    ":00000001FF".to_string()
}

// -------------------------------------------------------------------------------------------------
// End of Phase 2
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Shared Analysis and AST Rewrite Helpers
// -------------------------------------------------------------------------------------------------

/// Returns the maximum nesting depth of range loops in a function body.
/// This value pre-reserves end-bound register pairs to reduce loop-memory traffic.
fn max_loop_depth(body: &[Stmt]) -> usize {
    let mut max = 0;
    for stmt in body {
        let d = match stmt {
            Stmt::LoopRange { body, .. } => 1 + max_loop_depth(body),
            Stmt::LoopInfinite { body } => max_loop_depth(body),
            Stmt::Conditional { then_block, else_block, .. } => {
                let t = max_loop_depth(then_block);
                let e = else_block.as_ref().map(|b| max_loop_depth(b)).unwrap_or(0);
                t.max(e)
            }
            Stmt::Switch { cases, default, .. } => {
                let mut m = 0;
                for (_, b) in cases { m = m.max(max_loop_depth(b)); }
                if let Some(db) = default { m = m.max(max_loop_depth(db)); }
                m
            }
            _ => 0,
        };
        if d > max { max = d; }
    }
    max
}

/// Collects every scalar variable declaration (name, type) reachable in a function body,
/// recursing into loops, conditionals and switches. Used to plan register homes.
fn collect_decls(body: &[Stmt], out: &mut Vec<(String, String)>) {
    for stmt in body {
        match stmt {
            Stmt::VarDecl { name, ty, .. } => out.push((name.clone(), ty.clone())),
            Stmt::LoopInfinite { body } => collect_decls(body, out),
            Stmt::LoopRange { var_name, body, .. } => {
                out.push((var_name.clone(), "u16".to_string()));
                collect_decls(body, out);
            }
            Stmt::Conditional { then_block, else_block, .. } => {
                collect_decls(then_block, out);
                if let Some(eb) = else_block {
                    collect_decls(eb, out);
                }
            }
            Stmt::Switch { cases, default, .. } => {
                for (_, b) in cases {
                    collect_decls(b, out);
                }
                if let Some(db) = default {
                    collect_decls(db, out);
                }
            }
            _ => {}
        }
    }
}

/// Collects call names found inside an expression tree.
/// Used by call-graph/reachability and leaf-function heuristics.
fn collect_calls_expr(expr: &Expr, calls: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::Literal(_) => {}
        Expr::FloatLiteral(_) => {}
        Expr::StringLit(_) => {}
        Expr::AddrOf(e) | Expr::Deref(e) => collect_calls_expr(e, calls),
        Expr::VarRef(_) => {}
        Expr::BinOp { left, right, .. } => {
            collect_calls_expr(left, calls);
            collect_calls_expr(right, calls);
        }
        Expr::UnaryOp { expr, .. } => {
            collect_calls_expr(expr, calls);
        }
        Expr::Call { name, args } => {
            if name.starts_with('@') {
                calls.insert(name.clone());
            }
            for arg in args {
                collect_calls_expr(arg, calls);
            }
        }
    }
}

/// Collects call names from a statement subtree.
///
/// Current policy detail:
/// - Intrinsics (`@...`) are tracked too, because some passes treat them as call-like edges.
fn collect_calls_stmt(stmt: &Stmt, calls: &mut std::collections::HashSet<String>) {
    match stmt {
        Stmt::VarDecl { expr, .. } => {
            collect_calls_expr(expr, calls);
        }
        Stmt::Assign { expr, target, .. } => {
            collect_calls_expr(expr, calls);
            collect_calls_expr(target, calls);
        }
        Stmt::LoopInfinite { body } => {
            for s in body {
                collect_calls_stmt(s, calls);
            }
        }
        Stmt::LoopRange { start, end, body, .. } => {
            collect_calls_expr(start, calls);
            collect_calls_expr(end, calls);
            for s in body {
                collect_calls_stmt(s, calls);
            }
        }
        Stmt::Conditional { cond, then_block, else_block } => {
            collect_calls_expr(cond, calls);
            for s in then_block {
                collect_calls_stmt(s, calls);
            }
            if let Some(eb) = else_block {
                for s in eb {
                    collect_calls_stmt(s, calls);
                }
            }
        }
        Stmt::Switch { expr, cases, default } => {
            collect_calls_expr(expr, calls);
            for (case_expr, body) in cases {
                collect_calls_expr(case_expr, calls);
                for s in body {
                    collect_calls_stmt(s, calls);
                }
            }
            if let Some(db) = default {
                for s in db {
                    collect_calls_stmt(s, calls);
                }
            }
        }
        Stmt::Return { val } => {
            if let Some(v) = val {
                collect_calls_expr(v, calls);
            }
        }
        Stmt::ExprStmt { expr } => {
            collect_calls_expr(expr, calls);
        }
        Stmt::Goto(_) => {}
        Stmt::Label(_) => {}
    }
}

#[derive(Debug, Clone)]
#[allow(dead_code)]
enum FlatStmt {
    VarDecl { name: String, ty: String, expr: Expr, is_mut: bool },
    Assign { target: Expr, expr: Expr, op: String },
    ExprStmt { expr: Expr },
    Label(String),
    Goto(String),
    CondJump { cond: Expr, target: String },
    Return { val: Option<Expr> },
}

struct BasicBlock {
    id: usize,
    stmts: Vec<FlatStmt>,
    successors: Vec<usize>,
    predecessors: Vec<usize>,
}

struct InterferenceGraph {
    nodes: std::collections::HashSet<String>,
    adj: HashMap<String, std::collections::HashSet<String>>,
}

impl InterferenceGraph {
    fn new() -> Self {
        Self {
            nodes: std::collections::HashSet::new(),
            adj: HashMap::new(),
        }
    }

    fn add_node(&mut self, node: String) {
        if node.starts_with('$') {
            self.nodes.insert(node.clone());
            self.adj.entry(node).or_insert_with(std::collections::HashSet::new);
        }
    }

    fn add_edge(&mut self, u: &str, v: &str) {
        if u != v && u.starts_with('$') && v.starts_with('$') {
            self.add_node(u.to_string());
            self.add_node(v.to_string());
            self.adj.get_mut(u).unwrap().insert(v.to_string());
            self.adj.get_mut(v).unwrap().insert(u.to_string());
        }
    }
}

fn flatten_stmts(stmts: &[Stmt], label_counter: &mut usize) -> Vec<FlatStmt> {
    let mut flat = Vec::new();
    for stmt in stmts {
        match stmt {
            Stmt::VarDecl { name, ty, expr, is_mut } => {
                flat.push(FlatStmt::VarDecl {
                    name: name.clone(),
                    ty: ty.clone(),
                    expr: expr.clone(),
                    is_mut: *is_mut,
                });
            }
            Stmt::Assign { target, expr, op } => {
                flat.push(FlatStmt::Assign {
                    target: target.clone(),
                    expr: expr.clone(),
                    op: op.clone(),
                });
            }
            Stmt::ExprStmt { expr } => {
                flat.push(FlatStmt::ExprStmt { expr: expr.clone() });
            }
            Stmt::Goto(lbl) => {
                flat.push(FlatStmt::Goto(lbl.clone()));
            }
            Stmt::Label(lbl) => {
                flat.push(FlatStmt::Label(lbl.clone()));
            }
            Stmt::Return { val } => {
                flat.push(FlatStmt::Return { val: val.clone() });
            }
            Stmt::LoopInfinite { body } => {
                *label_counter += 1;
                let start_lbl = format!("flat_loop_start_{}", label_counter);
                flat.push(FlatStmt::Label(start_lbl.clone()));
                flat.extend(flatten_stmts(body, label_counter));
                flat.push(FlatStmt::Goto(start_lbl));
            }
            Stmt::LoopRange { start, end, var_name, body } => {
                *label_counter += 1;
                let loop_id = *label_counter;
                let start_lbl = format!("flat_loop_start_{}", loop_id);
                let body_lbl = format!("flat_loop_body_{}", loop_id);
                let end_lbl = format!("flat_loop_end_{}", loop_id);
                let end_tmp = format!("$loop_end_tmp_{}", loop_id);

                flat.push(FlatStmt::VarDecl {
                    name: var_name.clone(),
                    ty: "u16".to_string(),
                    expr: start.clone(),
                    is_mut: true,
                });
                flat.push(FlatStmt::VarDecl {
                    name: end_tmp.clone(),
                    ty: "u16".to_string(),
                    expr: end.clone(),
                    is_mut: false,
                });
                flat.push(FlatStmt::Label(start_lbl.clone()));
                flat.push(FlatStmt::CondJump {
                    cond: Expr::BinOp {
                        left: Box::new(Expr::VarRef(var_name.clone())),
                        op: "<".to_string(),
                        right: Box::new(Expr::VarRef(end_tmp.clone())),
                    },
                    target: body_lbl.clone(),
                });
                flat.push(FlatStmt::Goto(end_lbl.clone()));
                flat.push(FlatStmt::Label(body_lbl));
                flat.extend(flatten_stmts(body, label_counter));
                flat.push(FlatStmt::Assign {
                    target: Expr::VarRef(var_name.clone()),
                    expr: Expr::BinOp {
                        left: Box::new(Expr::VarRef(var_name.clone())),
                        op: "+".to_string(),
                        right: Box::new(Expr::Literal(1)),
                    },
                    op: "->".to_string(),
                });
                flat.push(FlatStmt::Goto(start_lbl));
                flat.push(FlatStmt::Label(end_lbl));
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                *label_counter += 1;
                let cond_id = *label_counter;
                let then_lbl = format!("flat_cond_then_{}", cond_id);
                let else_lbl = format!("flat_cond_else_{}", cond_id);
                let end_lbl = format!("flat_cond_end_{}", cond_id);

                flat.push(FlatStmt::CondJump {
                    cond: cond.clone(),
                    target: then_lbl.clone(),
                });
                if else_block.is_some() {
                    flat.push(FlatStmt::Goto(else_lbl.clone()));
                } else {
                    flat.push(FlatStmt::Goto(end_lbl.clone()));
                }
                flat.push(FlatStmt::Label(then_lbl));
                flat.extend(flatten_stmts(then_block, label_counter));
                flat.push(FlatStmt::Goto(end_lbl.clone()));
                if let Some(eb) = else_block {
                    flat.push(FlatStmt::Label(else_lbl));
                    flat.extend(flatten_stmts(eb, label_counter));
                }
                flat.push(FlatStmt::Label(end_lbl));
            }
            Stmt::Switch { expr, cases, default } => {
                *label_counter += 1;
                let sw_id = *label_counter;
                let end_lbl = format!("flat_switch_end_{}", sw_id);
                let default_lbl = format!("flat_switch_default_{}", sw_id);
                
                let mut case_lbls = Vec::new();
                for i in 0..cases.len() {
                    case_lbls.push(format!("flat_switch_case_{}_{}", sw_id, i));
                }

                for (i, (case_expr, _)) in cases.iter().enumerate() {
                    flat.push(FlatStmt::CondJump {
                        cond: Expr::BinOp {
                            left: Box::new(expr.clone()),
                            op: "==".to_string(),
                            right: Box::new(case_expr.clone()),
                        },
                        target: case_lbls[i].clone(),
                    });
                }
                if default.is_some() {
                    flat.push(FlatStmt::Goto(default_lbl.clone()));
                } else {
                    flat.push(FlatStmt::Goto(end_lbl.clone()));
                }

                for (i, (_, body)) in cases.iter().enumerate() {
                    flat.push(FlatStmt::Label(case_lbls[i].clone()));
                    flat.extend(flatten_stmts(body, label_counter));
                    flat.push(FlatStmt::Goto(end_lbl.clone()));
                }

                if let Some(db) = default {
                    flat.push(FlatStmt::Label(default_lbl));
                    flat.extend(flatten_stmts(db, label_counter));
                }
                flat.push(FlatStmt::Label(end_lbl));
            }
        }
    }
    flat
}

fn construct_cfg(flat_stmts: &[FlatStmt]) -> Vec<BasicBlock> {
    if flat_stmts.is_empty() {
        return Vec::new();
    }

    let mut is_leader = vec![false; flat_stmts.len()];
    is_leader[0] = true;

    for (i, stmt) in flat_stmts.iter().enumerate() {
        match stmt {
            FlatStmt::Goto(_) | FlatStmt::CondJump { .. } | FlatStmt::Return { .. } => {
                if i + 1 < flat_stmts.len() {
                    is_leader[i + 1] = true;
                }
            }
            FlatStmt::Label(_) => {
                is_leader[i] = true;
            }
            _ => {}
        }
    }

    let mut blocks = Vec::new();
    let mut current_block = Vec::new();

    for (i, stmt) in flat_stmts.iter().enumerate() {
        if is_leader[i] && i > 0 {
            blocks.push(BasicBlock {
                id: blocks.len(),
                stmts: current_block,
                successors: Vec::new(),
                predecessors: Vec::new(),
            });
            current_block = Vec::new();
        }
        current_block.push(stmt.clone());
    }
    if !current_block.is_empty() {
        blocks.push(BasicBlock {
            id: blocks.len(),
            stmts: current_block,
            successors: Vec::new(),
            predecessors: Vec::new(),
        });
    }

    let mut label_to_block = HashMap::new();
    for block in &blocks {
        if let Some(FlatStmt::Label(name)) = block.stmts.first() {
            label_to_block.insert(name.clone(), block.id);
        }
    }

    let n_blocks = blocks.len();
    for id in 0..n_blocks {
        let last_stmt = blocks[id].stmts.last().unwrap();
        match last_stmt {
            FlatStmt::Goto(lbl) => {
                if let Some(&target_id) = label_to_block.get(lbl) {
                    blocks[id].successors.push(target_id);
                }
            }
            FlatStmt::CondJump { target, .. } => {
                if let Some(&target_id) = label_to_block.get(target) {
                    blocks[id].successors.push(target_id);
                }
                if id + 1 < n_blocks {
                    blocks[id].successors.push(id + 1);
                }
            }
            FlatStmt::Return { .. } => {}
            _ => {
                if id + 1 < n_blocks {
                    blocks[id].successors.push(id + 1);
                }
            }
        }
    }

    for id in 0..n_blocks {
        let successors = blocks[id].successors.clone();
        for succ_id in successors {
            if !blocks[succ_id].predecessors.contains(&id) {
                blocks[succ_id].predecessors.push(id);
            }
        }
    }

    blocks
}

/// Collects names of scalar variables whose address is taken (`&$x`). Such variables must live in
/// SRAM (not a register home) so that `&$x` has a real address to materialize.
fn collect_address_taken_expr(expr: &Expr, set: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::AddrOf(inner) => {
            if let Expr::VarRef(n) = &**inner {
                set.insert(n.clone());
            }
            collect_address_taken_expr(inner, set);
        }
        Expr::Deref(e) | Expr::UnaryOp { expr: e, .. } => collect_address_taken_expr(e, set),
        Expr::BinOp { left, right, .. } => {
            collect_address_taken_expr(left, set);
            collect_address_taken_expr(right, set);
        }
        Expr::Call { args, .. } => {
            for a in args {
                collect_address_taken_expr(a, set);
            }
        }
        _ => {}
    }
}

fn collect_address_taken_stmts(stmts: &[Stmt], set: &mut std::collections::HashSet<String>) {
    for stmt in stmts {
        match stmt {
            Stmt::VarDecl { expr, .. } => collect_address_taken_expr(expr, set),
            Stmt::Assign { expr, target, .. } => {
                collect_address_taken_expr(expr, set);
                collect_address_taken_expr(target, set);
            }
            Stmt::LoopInfinite { body } => collect_address_taken_stmts(body, set),
            Stmt::LoopRange { start, end, body, .. } => {
                collect_address_taken_expr(start, set);
                collect_address_taken_expr(end, set);
                collect_address_taken_stmts(body, set);
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                collect_address_taken_expr(cond, set);
                collect_address_taken_stmts(then_block, set);
                if let Some(eb) = else_block {
                    collect_address_taken_stmts(eb, set);
                }
            }
            Stmt::Switch { expr, cases, default } => {
                collect_address_taken_expr(expr, set);
                for (ce, b) in cases {
                    collect_address_taken_expr(ce, set);
                    collect_address_taken_stmts(b, set);
                }
                if let Some(db) = default {
                    collect_address_taken_stmts(db, set);
                }
            }
            Stmt::Return { val } => {
                if let Some(v) = val {
                    collect_address_taken_expr(v, set);
                }
            }
            Stmt::ExprStmt { expr } => collect_address_taken_expr(expr, set),
            Stmt::Goto(_) | Stmt::Label(_) => {}
        }
    }
}

fn collect_var_refs(expr: &Expr, out: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::VarRef(n) => {
            if n.starts_with('$') {
                out.insert(n.clone());
            }
        }
        Expr::UnaryOp { expr, .. } | Expr::AddrOf(expr) | Expr::Deref(expr) => {
            collect_var_refs(expr, out);
        }
        Expr::BinOp { left, right, .. } => {
            collect_var_refs(left, out);
            collect_var_refs(right, out);
        }
        Expr::Call { args, .. } => {
            for a in args {
                collect_var_refs(a, out);
            }
        }
        Expr::Literal(_) | Expr::FloatLiteral(_) | Expr::StringLit(_) => {}
    }
}

/// Collects variables used as operands inside dereference expressions (`*expr`).
fn collect_pointer_operand_expr(expr: &Expr, out: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::Deref(inner) => {
            collect_var_refs(inner, out);
            collect_pointer_operand_expr(inner, out);
        }
        Expr::UnaryOp { expr, .. } | Expr::AddrOf(expr) => collect_pointer_operand_expr(expr, out),
        Expr::BinOp { left, right, .. } => {
            collect_pointer_operand_expr(left, out);
            collect_pointer_operand_expr(right, out);
        }
        Expr::Call { args, .. } => {
            for a in args {
                collect_pointer_operand_expr(a, out);
            }
        }
        Expr::Literal(_) | Expr::FloatLiteral(_) | Expr::StringLit(_) | Expr::VarRef(_) => {}
    }
}

fn collect_pointer_operand_vars(stmts: &[Stmt], out: &mut std::collections::HashSet<String>) {
    for stmt in stmts {
        match stmt {
            Stmt::VarDecl { expr, .. } => collect_pointer_operand_expr(expr, out),
            Stmt::Assign { expr, target, .. } => {
                collect_pointer_operand_expr(expr, out);
                collect_pointer_operand_expr(target, out);
            }
            Stmt::LoopInfinite { body } => collect_pointer_operand_vars(body, out),
            Stmt::LoopRange { start, end, body, .. } => {
                collect_pointer_operand_expr(start, out);
                collect_pointer_operand_expr(end, out);
                collect_pointer_operand_vars(body, out);
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                collect_pointer_operand_expr(cond, out);
                collect_pointer_operand_vars(then_block, out);
                if let Some(eb) = else_block {
                    collect_pointer_operand_vars(eb, out);
                }
            }
            Stmt::Switch { expr, cases, default } => {
                collect_pointer_operand_expr(expr, out);
                for (ce, b) in cases {
                    collect_pointer_operand_expr(ce, out);
                    collect_pointer_operand_vars(b, out);
                }
                if let Some(db) = default {
                    collect_pointer_operand_vars(db, out);
                }
            }
            Stmt::Return { val } => {
                if let Some(v) = val {
                    collect_pointer_operand_expr(v, out);
                }
            }
            Stmt::ExprStmt { expr } => collect_pointer_operand_expr(expr, out),
            Stmt::Goto(_) | Stmt::Label(_) => {}
        }
    }
}

fn collect_expr_uses(expr: &Expr, uses: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::Literal(_) => {}
        Expr::FloatLiteral(_) => {}
        Expr::StringLit(_) => {}
        Expr::AddrOf(e) | Expr::Deref(e) => collect_expr_uses(e, uses),
        Expr::VarRef(name) => {
            if name.starts_with('$') {
                uses.insert(name.clone());
            }
        }
        Expr::UnaryOp { expr, .. } => {
            collect_expr_uses(expr, uses);
        }
        Expr::BinOp { left, right, .. } => {
            collect_expr_uses(left, uses);
            collect_expr_uses(right, uses);
        }
        Expr::Call { args, .. } => {
            for arg in args {
                collect_expr_uses(arg, uses);
            }
        }
    }
}

fn compute_gen_kill(
    block: &BasicBlock,
    gen: &mut std::collections::HashSet<String>,
    kill: &mut std::collections::HashSet<String>,
) {
    for stmt in &block.stmts {
        let mut stmt_uses = std::collections::HashSet::new();
        let mut stmt_defs = std::collections::HashSet::new();

        match stmt {
            FlatStmt::VarDecl { name, expr, .. } => {
                collect_expr_uses(expr, &mut stmt_uses);
                if name.starts_with('$') {
                    stmt_defs.insert(name.clone());
                }
            }
            FlatStmt::Assign { target, expr, .. } => {
                collect_expr_uses(expr, &mut stmt_uses);
                match target {
                    Expr::VarRef(name) => {
                        if name.starts_with('$') {
                            stmt_defs.insert(name.clone());
                        }
                    }
                    _ => {
                        collect_expr_uses(target, &mut stmt_uses);
                    }
                }
            }
            FlatStmt::ExprStmt { expr } => {
                collect_expr_uses(expr, &mut stmt_uses);
            }
            FlatStmt::CondJump { cond, .. } => {
                collect_expr_uses(cond, &mut stmt_uses);
            }
            FlatStmt::Return { val } => {
                if let Some(expr) = val {
                    collect_expr_uses(expr, &mut stmt_uses);
                }
            }
            _ => {}
        }

        for u in stmt_uses {
            if !kill.contains(&u) {
                gen.insert(u);
            }
        }
        for d in stmt_defs {
            kill.insert(d);
        }
    }
}

fn run_liveness_analysis(
    blocks: &[BasicBlock],
) -> (Vec<std::collections::HashSet<String>>, Vec<std::collections::HashSet<String>>) {
    let n = blocks.len();
    let mut gen = vec![std::collections::HashSet::new(); n];
    let mut kill = vec![std::collections::HashSet::new(); n];

    for i in 0..n {
        compute_gen_kill(&blocks[i], &mut gen[i], &mut kill[i]);
    }

    let mut in_sets: Vec<std::collections::HashSet<String>> = vec![std::collections::HashSet::new(); n];
    let mut out_sets: Vec<std::collections::HashSet<String>> = vec![std::collections::HashSet::new(); n];

    let mut changed = true;
    while changed {
        changed = false;
        for i in (0..n).rev() {
            let old_in = in_sets[i].clone();
            let old_out = out_sets[i].clone();

            let mut new_out = std::collections::HashSet::new();
            for &succ in &blocks[i].successors {
                for v in &in_sets[succ] {
                    new_out.insert(v.clone());
                }
            }
            out_sets[i] = new_out;

            let mut new_in = gen[i].clone();
            for v in &out_sets[i] {
                if !kill[i].contains(v) {
                    new_in.insert(v.clone());
                }
            }
            in_sets[i] = new_in;

            if in_sets[i] != old_in || out_sets[i] != old_out {
                changed = true;
            }
        }
    }

    (in_sets, out_sets)
}

fn build_interference_graph(
    blocks: &[BasicBlock],
    out_sets: &[std::collections::HashSet<String>],
) -> InterferenceGraph {
    let mut graph = InterferenceGraph::new();

    for block in blocks {
        for stmt in &block.stmts {
            match stmt {
                FlatStmt::VarDecl { name, .. } => {
                    graph.add_node(name.clone());
                }
                _ => {}
            }
        }
    }

    for i in 0..blocks.len() {
        let block = &blocks[i];
        let mut live = out_sets[i].clone();

        for stmt in block.stmts.iter().rev() {
            let mut stmt_uses = std::collections::HashSet::new();
            let mut stmt_defs = std::collections::HashSet::new();

            match stmt {
                FlatStmt::VarDecl { name, expr, .. } => {
                    collect_expr_uses(expr, &mut stmt_uses);
                    if name.starts_with('$') {
                        stmt_defs.insert(name.clone());
                    }
                }
                FlatStmt::Assign { target, expr, .. } => {
                    collect_expr_uses(expr, &mut stmt_uses);
                    match target {
                        Expr::VarRef(name) => {
                            if name.starts_with('$') {
                                stmt_defs.insert(name.clone());
                            }
                        }
                        _ => {
                            collect_expr_uses(target, &mut stmt_uses);
                        }
                    }
                }
                FlatStmt::ExprStmt { expr } => {
                    collect_expr_uses(expr, &mut stmt_uses);
                }
                FlatStmt::CondJump { cond, .. } => {
                    collect_expr_uses(cond, &mut stmt_uses);
                }
                FlatStmt::Return { val } => {
                    if let Some(expr) = val {
                        collect_expr_uses(expr, &mut stmt_uses);
                    }
                }
                _ => {}
            }

            for d in &stmt_defs {
                for l in &live {
                    graph.add_edge(d, l);
                }
            }

            for d in stmt_defs {
                live.remove(&d);
            }
            for u in stmt_uses {
                live.insert(u);
            }

            let live_vec: Vec<String> = live.iter().cloned().collect();
            for j in 0..live_vec.len() {
                for k in j+1..live_vec.len() {
                    graph.add_edge(&live_vec[j], &live_vec[k]);
                }
            }
        }
    }

    graph
}

fn color_graph(
    graph: &InterferenceGraph,
    decl_types: &HashMap<String, String>,
    reserved_regs: &std::collections::HashSet<u8>,
) -> (HashMap<String, u8>, Vec<u8>) {
    let mut colors: HashMap<String, u8> = HashMap::new();
    let mut used_regs = std::collections::HashSet::new();

    let mut nodes: Vec<String> = graph.nodes.iter()
        .filter(|node| {
            let ty = decl_types.get(*node).cloned().unwrap_or_else(|| "u8".to_string());
            !ty.contains('[') && !ty.starts_with("eeprom ")
        })
        .cloned()
        .collect();
    nodes.sort_by(|a, b| {
        let deg_a = graph.adj.get(a).map_or(0, |neighbors| neighbors.len());
        let deg_b = graph.adj.get(b).map_or(0, |neighbors| neighbors.len());
        deg_b.cmp(&deg_a)
    });

    for node in &nodes {
        let ty = decl_types.get(node).cloned().unwrap_or_else(|| "u8".to_string());
        let is_u16 = ty == "u16";

        let mut neighbors_regs = std::collections::HashSet::new();
        if let Some(neighbors) = graph.adj.get(node) {
            for neighbor in neighbors {
                if let Some(&color) = colors.get(neighbor) {
                    let neighbor_ty = decl_types.get(neighbor).cloned().unwrap_or_else(|| "u8".to_string());
                    neighbors_regs.insert(color);
                    if neighbor_ty == "u16" {
                        neighbors_regs.insert(color + 1);
                    }
                }
            }
        }

        let mut assigned_reg = None;
        if is_u16 {
            for reg in (2..15).step_by(2) {
                if !reserved_regs.contains(&reg) && !reserved_regs.contains(&(reg + 1))
                   && !neighbors_regs.contains(&reg) && !neighbors_regs.contains(&(reg + 1)) {
                    assigned_reg = Some(reg);
                    break;
                }
            }
            if assigned_reg.is_none() {
                for reg in 2..15 {
                    if !reserved_regs.contains(&reg) && !reserved_regs.contains(&(reg + 1))
                       && !neighbors_regs.contains(&reg) && !neighbors_regs.contains(&(reg + 1)) {
                        assigned_reg = Some(reg);
                        break;
                    }
                }
            }
        } else {
            for reg in 2..16 {
                if !reserved_regs.contains(&reg) && !neighbors_regs.contains(&reg) {
                    assigned_reg = Some(reg);
                    break;
                }
            }
        }

        if let Some(reg) = assigned_reg {
            colors.insert(node.clone(), reg);
            used_regs.insert(reg);
            if is_u16 {
                used_regs.insert(reg + 1);
            }
        }
    }

    let mut saves: Vec<u8> = used_regs.into_iter().collect();
    saves.sort_unstable();
    (colors, saves)
}

/// Encodes `q` field for `LDD/STD Y+q` forms.
///
/// Precondition:
/// - `q` fits architectural displacement range `0..=63`.
fn encode_q(q: u8) -> u16 {
    let q_5 = ((q & 0x20) as u16) << 8;   // bit 13
    let q_4_3 = ((q & 0x18) as u16) << 7; // bits 11, 10
    let q_2_0 = (q & 0x07) as u16;        // bits 2..0
    q_5 | q_4_3 | q_2_0
}

// -------------------------------------------------------------------------------------------------
// End of Shared Analysis and AST Rewrite Helpers
// -------------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------------
// Inlining + Constant-Propagation Rewrite Helpers
// -------------------------------------------------------------------------------------------------
// Inlining strategy notes:
// - Only leaf functions are inlined by policy.
// - Calls are replaced one at a time using placeholders to preserve expression structure.
// - Returns are rewritten to a single exit label with optional synthesized return slot.

/// Renames `$`-prefixed variables inside one expression with an inline-unique prefix.
fn rename_vars_expr(expr: &mut Expr, prefix: &str) {
    match expr {
        Expr::VarRef(name) => {
            if name.starts_with('$') {
                *name = format!("${}_{}", prefix, &name[1..]);
            }
        }
        Expr::BinOp { left, right, .. } => {
            rename_vars_expr(left, prefix);
            rename_vars_expr(right, prefix);
        }
        Expr::UnaryOp { expr, .. } => {
            rename_vars_expr(expr, prefix);
        }
        Expr::AddrOf(inner) => {
            rename_vars_expr(inner, prefix);
        }
        Expr::Deref(inner) => {
            rename_vars_expr(inner, prefix);
        }
        Expr::Call { args, .. } => {
            for arg in args {
                rename_vars_expr(arg, prefix);
            }
        }
        _ => {}
    }
}

/// Renames `$`-prefixed variables throughout one statement subtree.
///
/// Invariant:
/// - Label identifiers are not renamed here; only variable names are rewritten.
fn rename_vars_stmt(stmt: &mut Stmt, prefix: &str) {
    match stmt {
        Stmt::VarDecl { name, expr, .. } => {
            if name.starts_with('$') {
                *name = format!("${}_{}", prefix, &name[1..]);
            }
            rename_vars_expr(expr, prefix);
        }
        Stmt::Assign { expr, target, .. } => {
            rename_vars_expr(expr, prefix);
            rename_vars_expr(target, prefix);
        }
        Stmt::LoopInfinite { body } => {
            for s in body {
                rename_vars_stmt(s, prefix);
            }
        }
        Stmt::LoopRange { start, end, var_name, body } => {
            rename_vars_expr(start, prefix);
            rename_vars_expr(end, prefix);
            if var_name.starts_with('$') {
                *var_name = format!("${}_{}", prefix, &var_name[1..]);
            }
            for s in body {
                rename_vars_stmt(s, prefix);
            }
        }
        Stmt::Conditional { cond, then_block, else_block } => {
            rename_vars_expr(cond, prefix);
            for s in then_block {
                rename_vars_stmt(s, prefix);
            }
            if let Some(eb) = else_block {
                for s in eb {
                    rename_vars_stmt(s, prefix);
                }
            }
        }
        Stmt::Switch { expr, cases, default } => {
            rename_vars_expr(expr, prefix);
            for (case_expr, b) in cases {
                rename_vars_expr(case_expr, prefix);
                for s in b {
                    rename_vars_stmt(s, prefix);
                }
            }
            if let Some(db) = default {
                for s in db {
                    rename_vars_stmt(s, prefix);
                }
            }
        }
        Stmt::Return { val } => {
            if let Some(v) = val {
                rename_vars_expr(v, prefix);
            }
        }
        Stmt::ExprStmt { expr } => {
            rename_vars_expr(expr, prefix);
        }
        Stmt::Goto(_) => {}
        Stmt::Label(_) => {}
    }
}

/// Traverses expression to discover nested references that may imply reassignment contexts.
fn collect_reassigned_expr(expr: &Expr, reassigned: &mut std::collections::HashSet<String>) {
    match expr {
        Expr::BinOp { left, right, .. } => {
            collect_reassigned_expr(left, reassigned);
            collect_reassigned_expr(right, reassigned);
        }
        Expr::UnaryOp { expr, .. } => {
            collect_reassigned_expr(expr, reassigned);
        }
        Expr::Call { args, .. } => {
            for arg in args {
                collect_reassigned_expr(arg, reassigned);
            }
        }
        _ => {}
    }
}

/// Marks variables that are written after declaration, preventing unsafe constant substitution.
fn collect_reassigned_vars(stmts: &[Stmt], reassigned: &mut std::collections::HashSet<String>) {
    for stmt in stmts {
        match stmt {
            Stmt::Assign { target, expr, .. } => {
                if let Expr::VarRef(ref name) = *target {
                    if name.starts_with('$') {
                        reassigned.insert(name.clone());
                    }
                }
                collect_reassigned_expr(expr, reassigned);
            }
            Stmt::VarDecl { expr, .. } => {
                collect_reassigned_expr(expr, reassigned);
            }
            Stmt::LoopInfinite { body } => {
                collect_reassigned_vars(body, reassigned);
            }
            Stmt::LoopRange { start, end, var_name, body } => {
                collect_reassigned_expr(start, reassigned);
                collect_reassigned_expr(end, reassigned);
                if var_name.starts_with('$') {
                    reassigned.insert(var_name.clone());
                }
                collect_reassigned_vars(body, reassigned);
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                collect_reassigned_expr(cond, reassigned);
                collect_reassigned_vars(then_block, reassigned);
                if let Some(eb) = else_block {
                    collect_reassigned_vars(eb, reassigned);
                }
            }
            Stmt::Switch { expr, cases, default } => {
                collect_reassigned_expr(expr, reassigned);
                for (case_expr, b) in cases {
                    collect_reassigned_expr(case_expr, reassigned);
                    collect_reassigned_vars(b, reassigned);
                }
                if let Some(db) = default {
                    collect_reassigned_vars(db, reassigned);
                }
            }
            Stmt::Return { val } => {
                if let Some(v) = val {
                    collect_reassigned_expr(v, reassigned);
                }
            }
            Stmt::ExprStmt { expr } => {
                collect_reassigned_expr(expr, reassigned);
            }
            Stmt::Goto(_) => {}
            Stmt::Label(_) => {}
        }
    }
}

/// Replaces variable references with known literal values in-place.
fn propagate_constants_expr(expr: &mut Expr, known: &std::collections::HashMap<String, i32>) {
    match expr {
        Expr::VarRef(name) => {
            if let Some(&val) = known.get(name) {
                *expr = Expr::Literal(val);
            }
        }
        Expr::BinOp { left, right, .. } => {
            propagate_constants_expr(left, known);
            propagate_constants_expr(right, known);
        }
        Expr::UnaryOp { expr, .. } => {
            propagate_constants_expr(expr, known);
        }
        Expr::Call { args, .. } => {
            for arg in args {
                propagate_constants_expr(arg, known);
            }
        }
        _ => {}
    }
}

/// Replaces every fractional literal in `expr` with its scaled fixed-point integer for the given
/// fractional-bit count. A fractional literal may not be a direct operand of `*`/`/` (that would be
/// fixed-by-fixed and require a scale correction the literal cannot carry); the user must name it.
fn scale_floats(expr: &mut Expr, frac: u8) -> Result<(), String> {
    match expr {
        Expr::FloatLiteral(v) => {
            let scaled = (*v * f64::from(1u32 << frac)).round() as i64;
            *expr = Expr::Literal(scaled as i32);
            Ok(())
        }
        Expr::Literal(_) | Expr::VarRef(_) => Ok(()),
        Expr::UnaryOp { expr, .. } => scale_floats(expr, frac),
        Expr::BinOp { left, op, right } => {
            if (op == "*" || op == "/")
                && (matches!(**left, Expr::FloatLiteral(_)) || matches!(**right, Expr::FloatLiteral(_)))
            {
                return Err(format!(
                    "Type Error: a fractional literal cannot be a direct operand of '{}'; assign it to a fixed-point variable first",
                    op
                ));
            }
            scale_floats(left, frac)?;
            scale_floats(right, frac)
        }
        Expr::Call { args, .. } => {
            for a in args.iter() {
                forbid_floats(a)?;
            }
            Ok(())
        }
        Expr::StringLit(_) => Ok(()),
        Expr::AddrOf(e) | Expr::Deref(e) => scale_floats(e, frac),
    }
}

/// Errors if any fractional literal appears in a non-fixed-point context.
fn forbid_floats(expr: &Expr) -> Result<(), String> {
    match expr {
        Expr::FloatLiteral(_) => Err(
            "Type Error: fractional literal used outside a fixed-point (r8/r16) context".to_string(),
        ),
        Expr::Literal(_) | Expr::VarRef(_) | Expr::StringLit(_) => Ok(()),
        Expr::UnaryOp { expr, .. } => forbid_floats(expr),
        Expr::AddrOf(e) | Expr::Deref(e) => forbid_floats(e),
        Expr::BinOp { left, right, .. } => {
            forbid_floats(left)?;
            forbid_floats(right)
        }
        Expr::Call { args, .. } => {
            for a in args {
                forbid_floats(a)?;
            }
            Ok(())
        }
    }
}

/// Static (pre-codegen) variant of `expr_fixed_bits` over an explicit fixed-var map.
fn expr_fixed_frac_static(expr: &Expr, fixed: &HashMap<String, u8>) -> Option<u8> {
    match expr {
        Expr::VarRef(n) => fixed.get(n).copied(),
        Expr::UnaryOp { expr, .. } => expr_fixed_frac_static(expr, fixed),
        Expr::BinOp { left, op, right } => {
            if op == "[]" {
                if let Expr::VarRef(arr) = &**left {
                    fixed.get(arr).copied()
                } else {
                    None
                }
            } else {
                expr_fixed_frac_static(left, fixed).or_else(|| expr_fixed_frac_static(right, fixed))
            }
        }
        _ => None,
    }
}

/// Resolves fractional literals inside a boolean condition, scaling them to match a fixed-point
/// operand of the same comparison.
fn resolve_cond_floats(cond: &mut Expr, fixed: &HashMap<String, u8>) -> Result<(), String> {
    match cond {
        Expr::BinOp { left, op, right }
            if matches!(op.as_str(), "==" | "!=" | "<" | ">" | "<=" | ">=") =>
        {
            let f = expr_fixed_frac_static(left, fixed).or_else(|| expr_fixed_frac_static(right, fixed));
            if let Some(fr) = f {
                scale_floats(left, fr)?;
                scale_floats(right, fr)
            } else {
                forbid_floats(left)?;
                forbid_floats(right)
            }
        }
        Expr::BinOp { left, op, right } if op == "&&" || op == "||" => {
            resolve_cond_floats(left, fixed)?;
            resolve_cond_floats(right, fixed)
        }
        Expr::UnaryOp { op, expr } if op == "!" => resolve_cond_floats(expr, fixed),
        _ => forbid_floats(cond),
    }
}

/// Per-function pass that lowers fractional literals to fixed-point integers using the declared
/// r8/r16 types of variables, parameters, and the return value.
fn resolve_fixed_literals_func(
    params: &[(String, String)],
    ret_ty: &str,
    body: &mut [Stmt],
) -> Result<(), String> {
    let mut fixed: HashMap<String, u8> = HashMap::new();
    for (pn, pt) in params {
        if let Some(f) = fixed_frac_of_type(pt) {
            fixed.insert(pn.clone(), f);
        }
    }
    let ret_frac = fixed_frac_of_type(ret_ty);
    resolve_fixed_literals_stmts(body, &mut fixed, ret_frac)
}

fn resolve_fixed_literals_stmts(
    stmts: &mut [Stmt],
    fixed: &mut HashMap<String, u8>,
    ret_frac: Option<u8>,
) -> Result<(), String> {
    for stmt in stmts {
        match stmt {
            Stmt::VarDecl { name, ty, expr, .. } => {
                if let Some(f) = fixed_frac_of_type(ty) {
                    scale_floats(expr, f)?;
                    fixed.insert(name.clone(), f);
                } else {
                    forbid_floats(expr)?;
                }
            }
            Stmt::Assign { expr, target, .. } => {
                let tf = match &*target {
                    Expr::VarRef(n) => fixed.get(n).copied(),
                    Expr::BinOp { left, op, .. } if op == "[]" => {
                        if let Expr::VarRef(arr) = &**left {
                            fixed.get(arr).copied()
                        } else {
                            None
                        }
                    }
                    _ => None,
                };
                if let Some(f) = tf {
                    scale_floats(expr, f)?;
                } else {
                    forbid_floats(expr)?;
                    forbid_floats(target)?;
                }
            }
            Stmt::LoopInfinite { body } => resolve_fixed_literals_stmts(body, fixed, ret_frac)?,
            Stmt::LoopRange { start, end, body, .. } => {
                forbid_floats(start)?;
                forbid_floats(end)?;
                resolve_fixed_literals_stmts(body, fixed, ret_frac)?;
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                resolve_cond_floats(cond, fixed)?;
                resolve_fixed_literals_stmts(then_block, fixed, ret_frac)?;
                if let Some(eb) = else_block {
                    resolve_fixed_literals_stmts(eb, fixed, ret_frac)?;
                }
            }
            Stmt::Switch { expr, cases, default } => {
                let sf = expr_fixed_frac_static(expr, fixed);
                for (ce, b) in cases.iter_mut() {
                    if let Some(f) = sf {
                        scale_floats(ce, f)?;
                    } else {
                        forbid_floats(ce)?;
                    }
                    resolve_fixed_literals_stmts(b, fixed, ret_frac)?;
                }
                if sf.is_none() {
                    forbid_floats(expr)?;
                }
                if let Some(db) = default {
                    resolve_fixed_literals_stmts(db, fixed, ret_frac)?;
                }
            }
            Stmt::Return { val } => {
                if let Some(v) = val {
                    if let Some(f) = ret_frac {
                        scale_floats(v, f)?;
                    } else {
                        forbid_floats(v)?;
                    }
                }
            }
            Stmt::ExprStmt { expr } => forbid_floats(expr)?,
            Stmt::Goto(_) | Stmt::Label(_) => {}
        }
    }
    Ok(())
}

/// Propagates constant literals through statement lists using a conservative known-value map.
///
/// Contract:
/// - Never promotes a variable to constant if it may be reassigned in the same function body.
/// - Rewrites are local and in-place over AST nodes.
fn propagate_constants_stmts(
    stmts: &mut [Stmt],
    reassigned: &std::collections::HashSet<String>,
    known: &mut std::collections::HashMap<String, i32>
) {
    // Conservative rule:
    // `known` is updated only for scalars proven not to be reassigned in current function body.
    for stmt in stmts {
        match stmt {
            Stmt::VarDecl { name, ty, expr, .. } => {
                propagate_constants_expr(expr, known);
                if !ty.contains('[') {
                    if let Some(v) = eval_const(expr, ty, is_signed_type(ty), &HashMap::new()) {
                        *expr = Expr::Literal(v as i32);
                        // Do not propagate signed variables as bare literals: a substituted literal
                        // loses its signedness, so later comparisons/divisions would be lowered as
                        // unsigned. Keep them as variable reads to preserve signed instruction
                        // selection (they remain in `imut_constants` folding at codegen instead).
                        if !reassigned.contains(name) && !is_signed_type(ty) {
                            known.insert(name.clone(), v as i32);
                        }
                    }
                }
            }
            Stmt::Assign { expr, target, .. } => {
                propagate_constants_expr(expr, known);
                propagate_constants_expr(target, known);
                match target {
                    Expr::VarRef(name) => {
                        known.remove(name);
                    }
                    Expr::Deref(_) => {
                        // Unknown alias write through pointer: invalidate all known values.
                        known.clear();
                    }
                    Expr::BinOp { left, op, .. } if op == "[]" => {
                        if let Expr::VarRef(name) = &**left {
                            known.remove(name);
                        } else {
                            // Non-trivial index target: be conservative.
                            known.clear();
                        }
                    }
                    _ => {}
                }
            }
            Stmt::LoopInfinite { body } => {
                propagate_constants_stmts(body, reassigned, known);
            }
            Stmt::LoopRange { start, end, body, .. } => {
                propagate_constants_expr(start, known);
                propagate_constants_expr(end, known);
                propagate_constants_stmts(body, reassigned, known);
            }
            Stmt::Conditional { cond, then_block, else_block } => {
                propagate_constants_expr(cond, known);
                propagate_constants_stmts(then_block, reassigned, known);
                if let Some(eb) = else_block {
                    propagate_constants_stmts(eb, reassigned, known);
                }
            }
            Stmt::Switch { expr, cases, default } => {
                propagate_constants_expr(expr, known);
                for (case_expr, b) in cases {
                    propagate_constants_expr(case_expr, known);
                    propagate_constants_stmts(b, reassigned, known);
                }
                if let Some(db) = default {
                    propagate_constants_stmts(db, reassigned, known);
                }
            }
            Stmt::Return { val } => {
                if let Some(v) = val {
                    propagate_constants_expr(v, known);
                }
            }
            Stmt::ExprStmt { expr } => {
                propagate_constants_expr(expr, known);
            }
            Stmt::Goto(_) => {}
            Stmt::Label(_) => {}
        }
    }
}

/// Rewrites `return` into assignment-to-synthesized-slot (optional) + goto single epilogue label.
///
/// Postcondition:
/// - Structured body has no raw `Stmt::Return` nodes.
fn rewrite_returns(stmts: &mut Vec<Stmt>, unique_ret: &str, end_label: &str, has_ret: bool) {
    let mut new_stmts = Vec::new();
    for stmt in std::mem::take(stmts) {
        match stmt {
            Stmt::Return { val } => {
                if has_ret {
                    if let Some(v) = val {
                        new_stmts.push(Stmt::Assign {
                            expr: v,
                            target: Expr::VarRef(unique_ret.to_string()),
                            op: "->".to_string(),
                        });
                    }
                }
                new_stmts.push(Stmt::Goto(end_label.to_string()));
            }
            Stmt::LoopInfinite { mut body } => {
                rewrite_returns(&mut body, unique_ret, end_label, has_ret);
                new_stmts.push(Stmt::LoopInfinite { body });
            }
            Stmt::LoopRange { start, end, var_name, mut body } => {
                rewrite_returns(&mut body, unique_ret, end_label, has_ret);
                new_stmts.push(Stmt::LoopRange { start, end, var_name, body });
            }
            Stmt::Conditional { cond, mut then_block, else_block } => {
                rewrite_returns(&mut then_block, unique_ret, end_label, has_ret);
                let new_else = else_block.map(|mut eb| {
                    rewrite_returns(&mut eb, unique_ret, end_label, has_ret);
                    eb
                });
                new_stmts.push(Stmt::Conditional { cond, then_block, else_block: new_else });
            }
            Stmt::Switch { expr, cases, default } => {
                let mut new_cases = Vec::new();
                for (case_expr, mut b) in cases {
                    rewrite_returns(&mut b, unique_ret, end_label, has_ret);
                    new_cases.push((case_expr, b));
                }
                let new_default = default.map(|mut db| {
                    rewrite_returns(&mut db, unique_ret, end_label, has_ret);
                    db
                });
                new_stmts.push(Stmt::Switch { expr, cases: new_cases, default: new_default });
            }
            other => new_stmts.push(other),
        }
    }
    *stmts = new_stmts;
}

/// Replaces one placeholder variable reference inside an expression tree.
fn replace_placeholder(expr: &mut Expr, placeholder: &str, replacement: Expr) {
    match expr {
        Expr::VarRef(name) if name == placeholder => {
            *expr = replacement;
        }
        Expr::BinOp { left, right, .. } => {
            replace_placeholder(left, placeholder, replacement.clone());
            replace_placeholder(right, placeholder, replacement);
        }
        Expr::UnaryOp { expr, .. } => {
            replace_placeholder(expr, placeholder, replacement);
        }
        Expr::Call { args, .. } => {
            for arg in args {
                replace_placeholder(arg, placeholder, replacement.clone());
            }
        }
        _ => {}
    }
}

/// Statement-level placeholder replacement adapter.
fn replace_placeholder_stmt(stmt: &mut Stmt, placeholder: &str, replacement: Expr) {
    match stmt {
        Stmt::VarDecl { expr, .. } => {
            replace_placeholder(expr, placeholder, replacement);
        }
        Stmt::Assign { expr, target, .. } => {
            replace_placeholder(expr, placeholder, replacement.clone());
            replace_placeholder(target, placeholder, replacement);
        }
        Stmt::ExprStmt { expr } => {
            replace_placeholder(expr, placeholder, replacement);
        }
        Stmt::Return { val } => {
            if let Some(v) = val {
                replace_placeholder(v, placeholder, replacement);
            }
        }
        _ => {}
    }
}

/// Finds first inline-eligible call in expression order and rewrites it to a placeholder slot.
///
/// Postcondition on `Some(...)`:
/// - Returned placeholder name is present in `expr` as `Expr::VarRef`.
fn find_and_replace_first_call(
    expr: &mut Expr,
    leaf_functions: &std::collections::HashSet<String>,
    placeholder_counter: usize,
) -> Option<(String, Vec<Expr>, String)> {
    match expr {
        Expr::Call { name, args } => {
            if leaf_functions.contains(name) {
                let name_cloned = name.clone();
                let args_cloned = args.clone();
                let placeholder = format!("$__placeholder_{}", placeholder_counter);
                *expr = Expr::VarRef(placeholder.clone());
                return Some((name_cloned, args_cloned, placeholder));
            }
            for arg in args {
                if let Some(res) = find_and_replace_first_call(arg, leaf_functions, placeholder_counter) {
                    return Some(res);
                }
            }
            None
        }
        Expr::BinOp { left, right, .. } => {
            if let Some(res) = find_and_replace_first_call(left, leaf_functions, placeholder_counter) {
                return Some(res);
            }
            find_and_replace_first_call(right, leaf_functions, placeholder_counter)
        }
        Expr::UnaryOp { expr, .. } => {
            find_and_replace_first_call(expr, leaf_functions, placeholder_counter)
        }
        _ => None,
    }
}

/// Statement adapter for `find_and_replace_first_call`.
fn find_and_replace_call_in_stmt(
    stmt: &mut Stmt,
    leaf_functions: &std::collections::HashSet<String>,
    placeholder_counter: usize,
) -> Option<(String, Vec<Expr>, String)> {
    match stmt {
        Stmt::VarDecl { expr, .. } => {
            find_and_replace_first_call(expr, leaf_functions, placeholder_counter)
        }
        Stmt::Assign { expr, target, .. } => {
            if let Some(res) = find_and_replace_first_call(expr, leaf_functions, placeholder_counter) {
                return Some(res);
            }
            find_and_replace_first_call(target, leaf_functions, placeholder_counter)
        }
        Stmt::ExprStmt { expr } => {
            find_and_replace_first_call(expr, leaf_functions, placeholder_counter)
        }
        Stmt::Return { val } => {
            if let Some(v) = val {
                find_and_replace_first_call(v, leaf_functions, placeholder_counter)
            } else {
                None
            }
        }
        _ => None,
    }
}

/// Performs leaf-function AST inlining inside a statement block.
///
/// Invariants after return:
/// - Fresh names prevent collisions with caller locals.
/// - Inlined returns are canonicalized to one synthetic end label per inlined call.
fn inline_block(
    body: &mut Vec<Stmt>,
    leaf_functions: &std::collections::HashSet<String>,
    func_bodies: &std::collections::HashMap<String, (Vec<(String, String)>, String, Vec<Stmt>)>,
    inline_counter: &mut usize,
) {
    for stmt in body.iter_mut() {
        match stmt {
            Stmt::LoopInfinite { body } => {
                inline_block(body, leaf_functions, func_bodies, inline_counter);
            }
            Stmt::LoopRange { body, .. } => {
                inline_block(body, leaf_functions, func_bodies, inline_counter);
            }
            Stmt::Conditional { then_block, else_block, .. } => {
                inline_block(then_block, leaf_functions, func_bodies, inline_counter);
                if let Some(eb) = else_block {
                    inline_block(eb, leaf_functions, func_bodies, inline_counter);
                }
            }
            Stmt::Switch { cases, default, .. } => {
                for (_, b) in cases {
                    inline_block(b, leaf_functions, func_bodies, inline_counter);
                }
                if let Some(db) = default {
                    inline_block(db, leaf_functions, func_bodies, inline_counter);
                }
            }
            _ => {}
        }
    }

    let mut new_stmts = Vec::new();
    let mut placeholder_counter = 0;

    for mut stmt in std::mem::take(body) {
        loop {
            placeholder_counter += 1;
            if let Some((name, args, placeholder)) = find_and_replace_call_in_stmt(&mut stmt, leaf_functions, placeholder_counter) {
                let inline_id = *inline_counter;
                *inline_counter += 1;
                let prefix = format!("__inline_{}_{}", name.replace("@", ""), inline_id);
                
                let (params, ret_ty, leaf_body) = func_bodies.get(&name).cloned().unwrap();
                
                for (idx, (param_name, param_ty)) in params.iter().enumerate() {
                    let arg = &args[idx];
                    let unique_param = format!("${}_{}", prefix, &param_name[1..]);
                    new_stmts.push(Stmt::VarDecl {
                        name: unique_param,
                        ty: param_ty.clone(),
                        expr: arg.clone(),
                        is_mut: true,
                    });
                }
                
                let unique_ret = format!("${}_ret", prefix);
                if ret_ty != "void" {
                    new_stmts.push(Stmt::VarDecl {
                        name: unique_ret.clone(),
                        ty: ret_ty.clone(),
                        expr: Expr::Literal(0),
                        is_mut: true,
                    });
                }
                
                let end_label = format!("{}_end", prefix);
                
                let mut rewritten_body = Vec::new();
                for mut leaf_stmt in leaf_body {
                    rename_vars_stmt(&mut leaf_stmt, &prefix);
                    rewritten_body.push(leaf_stmt);
                }
                rewrite_returns(&mut rewritten_body, &unique_ret, &end_label, ret_ty != "void");
                
                new_stmts.extend(rewritten_body);
                new_stmts.push(Stmt::Label(end_label));
                
                let replacement = if ret_ty != "void" {
                    Expr::VarRef(unique_ret)
                } else {
                    Expr::Literal(0)
                };
                replace_placeholder_stmt(&mut stmt, &placeholder, replacement);
            } else {
                break;
            }
        }
        new_stmts.push(stmt);
    }
    *body = new_stmts;
}

// -------------------------------------------------------------------------------------------------
// End of Inlining + Constant-Propagation Rewrite Helpers
// -------------------------------------------------------------------------------------------------
