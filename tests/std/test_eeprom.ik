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
# EEPROM Hardware Interface Test
# -------------------------------------------------------------

import std/eeprom

@main {
    ram mut $ok: u8 = 1

    # Declare a dummy eeprom variable to trigger capacity verification.
    # MCUs without EEPROM support will be safely skipped by the compiler.
    eeprom mut $ee_dummy: u8 = 0

    ? %EEPROM_CTRL_REG != 0 {
        # 1. eeprom_write & eeprom_read (safe low address)
        @eeprom_write(0x0002, 0x99)
        ram imut $ee_val: u8 = @eeprom_read(0x0002)
        ? $ee_val != 0x99 { 0 -> $ok }

        # Test another safe address
        @eeprom_write(0x0004, 0xAA)
        ram imut $ee_val2: u8 = @eeprom_read(0x0004)
        ? $ee_val2 != 0xAA { 0 -> $ok }
    }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
