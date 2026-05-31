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
# EEPROM Hardware Interface Driver
# -------------------------------------------------------------

# Standard AVR EEPROM register offsets (absolute I/O addresses)
const %EECR: u8  = 0x003F
const %EEDR: u8  = 0x0040
const %EEARL: u8 = 0x0041
const %EEARH: u8 = 0x0042

# Blocks execution until the EEPROM Write Enable (EEPE) flag is cleared, signaling the hardware programming is complete.
@_eeprom_wait() {
    loop * {
        ram imut $eecr: u8 = %EECR
        ? ($eecr & 2) == 0 { return } # EEPE (bit 1)
    }
}

# Reads a single byte from the EEPROM at the specified address.
@eeprom_read($addr: u16) -> u8 {
    @_eeprom_wait()

    # Set EEPROM Address
    $addr & 255 -> %EEARL
    ($addr / 256) & 3 -> %EEARH

    # Trigger read cycle by setting EERE (bit 0)
    ram imut $curr: u8 = %EECR
    $curr | 1 -> %EECR

    # Read and return data
    return %EEDR
}

# Writes a single byte to the EEPROM at the specified address.
@eeprom_write($addr: u16, $val: u8) {
    @_eeprom_wait()

    # Set EEPROM Address and Data
    $addr & 255 -> %EEARL
    ($addr / 256) & 3 -> %EEARH
    $val -> %EEDR

    # 1. Set EEMPE (bit 2) master write enable while clearing EEPE (bit 1)
    ram imut $curr1: u8 = %EECR
    ($curr1 | 4) & 253 -> %EECR

    # 2. Set EEPE (bit 1) to initiate programming cycle
    ram imut $curr2: u8 = %EECR
    $curr2 | 2 -> %EECR
}
