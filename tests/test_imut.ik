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

# Technical test for ik8b standardized eeprom/ram/flash storage variables
namespace atmega328p
@main {
    ram mut $ok: u8 = 1

    # 1. SRAM immutable (ram imut)
    ram imut $const_ram: u8 = 55
    ram mut $temp_ram: u8 = 0
    $const_ram -> $temp_ram
    ? $temp_ram != 55 {
        0 -> $ok
    }

    # 2. Flash immutable (flash imut)
    flash imut $const_flash: u16 = 45000
    ram mut $temp_flash: u16 = 0
    $const_flash -> $temp_flash
    ? $temp_flash != 45000 {
        0 -> $ok
    }

    # 3. EEPROM mutable (eeprom mut) - Declared and compiled
    # Reserves 3 bytes of persistent storage space.
    eeprom mut $config_u8: u8 = 42
    eeprom mut $config_u16: u16 = 30000

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {
        # End of test
    }
}
