# Copyright 2026 The ik8b Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -------------------------------------------------------------
# Atomic Operations and Critical Sections Library
# -------------------------------------------------------------

# CPU Status Register absolute address
const %SREG: u8 = 0x005F

# Disables global interrupts and returns the previous state of the Status Register.
# Used to initiate a critical code block.
@atomic_start() -> u8 {
    ram imut $sreg_val: u8 = %SREG
    ram imut $disabled: u8 = $sreg_val & 0x7F # clear bit 7 (I flag)
    $disabled -> %SREG
    return $sreg_val
}

# Restores the global interrupt status to the specified register state.
# Used to terminate a critical code block.
@atomic_end($sreg_val: u8) {
    $sreg_val -> %SREG
}
