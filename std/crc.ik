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
# Cyclic Redundancy Check (CRC) Library
# -------------------------------------------------------------

# Computes CRC-8 Dallas/Maxim (polynomial 0x31, reversed 0x8C) over $len bytes in SRAM.
@crc8($data: ptr ram u8, $len: u16) -> u8 {
    ram mut $crc: u8 = 0
    loop 0..$len -> $i {
        ram imut $val: u8 = *($data + $i)
        $crc ^ $val -> $crc
        loop 0..8 -> $bit {
            ram imut $odd: u8 = $crc & 1
            $crc / 2 -> $crc
            ? $odd != 0 {
                $crc ^ 0x8C -> $crc
            }
        }
    }
    return $crc
}

# Computes CRC-16 IBM/ANSI (polynomial 0x8005, reversed 0xA001) over $len bytes in SRAM.
@crc16($data: ptr ram u8, $len: u16) -> u16 {
    ram mut $crc: u16 = 0
    loop 0..$len -> $i {
        ram imut $val: u8 = *($data + $i)
        $crc ^ $val -> $crc
        loop 0..8 -> $bit {
            ram imut $odd: u16 = $crc & 1
            $crc / 2 -> $crc
            ? $odd != 0 {
                $crc ^ 0xA001 -> $crc
            }
        }
    }
    return $crc
}
