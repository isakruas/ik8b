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

//! Low-level symbolic instruction helpers used by the backend pipeline.

use super::*;

impl CodeGenerator {
    /// Constructor with deterministic backend defaults.
    pub fn new() -> Self {
        Self {
            instructions: Vec::new(),
            sram_free_ptr: 0x0100,
            sram_start: 0x0100,
            eeprom_free_ptr: 0,
            target_core: TargetCore::Generic,
            device_name: String::new(),
            regs_used: 0,
            spills: 0,
            warnings: Vec::new(),
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

    /// Records the selected device name (used to resolve ISR vector names).
    pub fn set_device_name(&mut self, name: &str) {
        self.device_name = name.to_string();
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

    /// Peak number of distinct hardware registers occupied by any single
    /// function (out of the 32 GP registers). Populated during `compile`.
    /// Consumed by tooling (the IDE) rather than the compiler binary.
    #[allow(dead_code)]
    pub fn registers_used(&self) -> u32 {
        self.regs_used
    }

    /// Total number of values the register allocator had to spill to memory
    /// across the whole program. Populated during `compile`.
    #[allow(dead_code)]
    pub fn spills(&self) -> u32 {
        self.spills
    }

    /// Appends one symbolic instruction to the pass-1 stream.
    pub(super) fn emit(&mut self, inst: Pass1Inst) {
        self.instructions.push(inst);
    }
}
