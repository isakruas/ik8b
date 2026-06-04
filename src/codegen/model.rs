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

//! Core backend data model and target feature definitions.

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

}

/// Compiler intrinsics that are valid direct call targets even though they have no
/// user-declared function body or symbolic label.
pub(super) fn is_intrinsic_function(name: &str) -> bool {
    matches!(
        name,
        "@nop" | "@cli" | "@sei" | "@swap" | "@movw" | "@mul" | "@burn"
    )
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
    // Absolute 2-word JMP to a label. Always two words (never relaxed), so it is
    // safe inside the fixed-stride interrupt vector table.
    JmpAbsL(String),
    // Conditional branches encoded later with 7-bit relative displacement.
    BrbsL(u8, String),
    BrbcL(u8, String),
    // Load register pair (target, target+1) with the WORD address of a function
    // label (suitable for ICALL via Z). Resolved during label resolution.
    // Fields: (target_register, function_label)
    FnAddr16(u8, String),
    // Load register pair (target, target+1) with the BYTE address of a label
    // (word_addr * 2), suitable for LPM reads of flash-resident data via Z.
    // Fields: (target_register, data_label)
    FlashAddr16(u8, String),
    // One raw data word emitted into the flash image (two bytes, little-endian: the
    // low byte is at the lower flash byte address). Never executed; placed after all
    // code so flash-resident constants (e.g. `flash str`) can be read on demand by LPM.
    DataWord(u16),
}

/// Validated interrupt-vector binding for the selected device.
///
/// Vector labels are resolved once before startup emission. This makes duplicate-vector and
/// unknown-vector diagnostics deterministic and prevents late lowering failures after code has
/// already been emitted.
#[derive(Debug, Clone, PartialEq, Eq)]
pub(super) struct InterruptBinding {
    pub(super) index: u8,
    pub(super) label: String,
}

// -------------------------------------------------------------------------------------------------
// Main Backend State
// -------------------------------------------------------------------------------------------------
pub struct CodeGenerator {
    pub(super) instructions: Vec<Pass1Inst>,
    pub(super) sram_free_ptr: u16,
    pub(super) sram_start: u16,
    pub(super) eeprom_free_ptr: u16,
    pub target_core: TargetCore,
    // Selected device name, used to resolve interrupt vector names to indices.
    pub(super) device_name: String,
}
