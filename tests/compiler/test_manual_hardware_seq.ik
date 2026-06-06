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

# Technical test for AVR hardware sequences
# Validates EEPROM, SPM, and WDT operations strictly against manual

import std/wdt
import std/eeprom
import std/boot

const %TCNT1: u16 = 0x0084

@main {
    ram mut $ok: u8 = 1

    # 1. EEPROM Write Example
    @eeprom_write(0x0000, 55)
    
    # 2. Watchdog Timer Configuration Example
    @wdt_enable(6)
    
    # 3. SPM (Flash Write) Example — uses the per-device SPMCSR address that
    # std/boot.ik selects for the active target (0x57, 0x68, 0x5C, ...).
    @cli()
    @boot_page_fill(0x0000, 0x1234)

    # 4. 16-bit Timer/Counter register access (TCNT1)
    0xABCD -> %TCNT1
    
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]
    loop * {
        # End of test
    }
}
