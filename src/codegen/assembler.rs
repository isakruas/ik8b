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

//! Symbolic instruction optimization, label resolution, and Intel HEX emission.

use super::*;
use std::collections::HashMap;

/// Same bit packing as `encode_rd_rr`, kept standalone for peephole rewrites.
pub(super) fn encode_rd_rr_peephole(op: u16, d: u8, r: u8) -> u16 {
    let d_bits = (d as u16) << 4;
    let r_bit9 = ((r & 0x10) as u16) << 5;
    let r_bits3_0 = (r & 0x0F) as u16;
    op | d_bits | r_bit9 | r_bits3_0
}

fn is_two_word_data_op(op: u16) -> bool {
    // LDS/STS carry a raw address in the next word. That address is data, not an
    // instruction, and must never be inspected or optimized as an opcode.
    (op & 0xFE0F) == 0x9000 || (op & 0xFE0F) == 0x9200
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
            // Pattern 1: Redundant relative jump directly to the next label.
            //
            // Safety carve-out: never fold jumps that land on `__start`.
            // The interrupt vector table may intentionally contain many slots
            // that jump to startup, and removing any of them changes vector
            // indices (breaking hardware dispatch addresses).
            if i + 1 < current.len() {
                if let (Pass1Inst::RJumpL(ref label), Pass1Inst::Label(ref target_label)) = 
                    (&current[i], &current[i+1])
                {
                    if label == target_label && target_label != "__start" {
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

            if let Pass1Inst::Op(op) = current[i] {
                if is_two_word_data_op(op) && i + 1 < current.len() {
                    optimized.push(current[i].clone());
                    optimized.push(current[i + 1].clone());
                    i += 2;
                    continue;
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

fn label_addr(label_addresses: &HashMap<String, i64>, label: &str) -> Result<i64, String> {
    label_addresses
        .get(label)
        .copied()
        .ok_or_else(|| format!("unresolved label '{}'", label))
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
pub fn resolve_labels(instructions: &[Pass1Inst]) -> Result<Vec<u16>, String> {
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
                Pass1Inst::Op(_) | Pass1Inst::BrbsL(_, _) | Pass1Inst::BrbcL(_, _) | Pass1Inst::DataWord(_) => addr += 1,
                Pass1Inst::RJumpL(_) | Pass1Inst::RCallL(_) => addr += if is_long[idx] { 2 } else { 1 },
                Pass1Inst::FnAddr16(_, _) | Pass1Inst::FlashAddr16(_, _) => addr += 2, // Two LDI instructions
                Pass1Inst::JmpAbsL(_) => addr += 2, // fixed 2-word JMP
            }
        }
        let mut changed = false;
        let mut addr: i64 = 0;
        for (idx, inst) in instructions.iter().enumerate() {
            match inst {
                Pass1Inst::Label(_) => {}
                Pass1Inst::Op(_) | Pass1Inst::BrbsL(_, _) | Pass1Inst::BrbcL(_, _) | Pass1Inst::DataWord(_) => addr += 1,
                Pass1Inst::RJumpL(label) | Pass1Inst::RCallL(label) => {
                    if !is_long[idx] {
                        let target = label_addr(&label_addresses, label)?;
                        let offset = target - (addr + 1);
                        if offset < -2048 || offset > 2047 {
                            is_long[idx] = true;
                            changed = true;
                        }
                    }
                    addr += if is_long[idx] { 2 } else { 1 };
                }
                Pass1Inst::FnAddr16(_, _) | Pass1Inst::FlashAddr16(_, _) => addr += 2,
                Pass1Inst::JmpAbsL(_) => addr += 2,
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
            Pass1Inst::Op(_) | Pass1Inst::BrbsL(_, _) | Pass1Inst::BrbcL(_, _) | Pass1Inst::DataWord(_) => addr += 1,
            Pass1Inst::RJumpL(_) | Pass1Inst::RCallL(_) => addr += if is_long[idx] { 2 } else { 1 },
            Pass1Inst::FnAddr16(_, _) | Pass1Inst::FlashAddr16(_, _) => addr += 2,
            Pass1Inst::JmpAbsL(_) => addr += 2,
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
            Pass1Inst::DataWord(word) => {
                final_opcodes.push(*word);
                addr += 1;
            }
            Pass1Inst::JmpAbsL(label) => {
                let target = label_addr(&label_addresses, label)? as u32;
                final_opcodes.push(0x940C | ((((target >> 17) & 0x1F) as u16) << 4) | ((target >> 16) & 0x01) as u16); // JMP
                final_opcodes.push((target & 0xFFFF) as u16);
                addr += 2;
            }
            Pass1Inst::RJumpL(label) => {
                let target = label_addr(&label_addresses, label)?;
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
                let target = label_addr(&label_addresses, label)?;
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
                let target = label_addr(&label_addresses, label)?;
                let offset = target - (addr + 1);
                let offset_bits = (offset as u16) & 0x7F;
                final_opcodes.push(0xF000 | (offset_bits << 3) | (*sreg_bit as u16));
                addr += 1;
            }
            Pass1Inst::BrbcL(sreg_bit, label) => {
                let target = label_addr(&label_addresses, label)?;
                let offset = target - (addr + 1);
                let offset_bits = (offset as u16) & 0x7F;
                final_opcodes.push(0xF400 | (offset_bits << 3) | (*sreg_bit as u16));
                addr += 1;
            }
            Pass1Inst::FnAddr16(target_reg, label) => {
                // Resolve the function's WORD address for ICALL via Z.
                let word_addr = label_addr(&label_addresses, label)? as u16;
                let lo = (word_addr & 0xFF) as u8;
                let hi = ((word_addr >> 8) & 0xFF) as u8;
                let d_lo = (*target_reg - 16) as u16;
                let d_hi = (*target_reg + 1 - 16) as u16;
                // LDI target_reg, lo
                final_opcodes.push(0xE000 | (((lo >> 4) as u16) << 8) | (d_lo << 4) | ((lo & 0x0F) as u16));
                // LDI target_reg+1, hi
                final_opcodes.push(0xE000 | (((hi >> 4) as u16) << 8) | (d_hi << 4) | ((hi & 0x0F) as u16));
                addr += 2;
            }
            Pass1Inst::FlashAddr16(target_reg, label) => {
                // Resolve the label's BYTE address (word_addr * 2) for LPM via Z.
                let byte_addr = (label_addr(&label_addresses, label)? as u16).wrapping_mul(2);
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
        }
    }

    Ok(final_opcodes)
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
pub(super) fn make_hex_record(address: u16, data: &[u8]) -> String {
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
pub(super) fn make_eof_record() -> String {
    ":00000001FF".to_string()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn peephole_preserves_two_word_sts_address_operands() {
        let input = vec![
            Pass1Inst::Op(0x9300), // STS k, R16
            Pass1Inst::Op(0x2CFF), // address word; also encodes MOV R15,R15
            Pass1Inst::Op(0xE605), // LDI R16, 0x65
            Pass1Inst::Op(0x9300), // STS k, R16
            Pass1Inst::Op(0x2D00),
        ];

        let ops = |insts: &[Pass1Inst]| {
            insts
                .iter()
                .map(|inst| match inst {
                    Pass1Inst::Op(op) => *op,
                    _ => panic!("test input should contain only op words"),
                })
                .collect::<Vec<_>>()
        };
        assert_eq!(ops(&peephole_optimize(&input)), ops(&input));
    }

    #[test]
    fn resolve_labels_rejects_missing_label() {
        let err = resolve_labels(&[Pass1Inst::RCallL("@missing".to_string())]).unwrap_err();
        assert!(
            err.contains("unresolved label '@missing'"),
            "unexpected error: {}",
            err
        );
    }
}
