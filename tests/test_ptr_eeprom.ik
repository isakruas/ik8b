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

# Regression for EEPROM pointer dereference/load/store semantics.
namespace atmega328p
@main {
    ram mut $ok: u8 = 1

    # EEPROM pointer u8 read/write
    eeprom mut $ee8: u8 = 7
    eeprom ptr u8 $pe8 = &$ee8
    ram mut $rv8: u8 = *$pe8
    ? $rv8 != 7 {
        0 -> $ok
    }
    3 -> *$pe8
    *$pe8 -> $rv8
    ? $rv8 != 3 {
        0 -> $ok
    }

    # EEPROM pointer u16 read/write
    eeprom mut $ee16: u16 = 0x55AA
    eeprom ptr u16 $pe16 = &$ee16
    ram mut $rv16: u16 = *$pe16
    ? $rv16 != 0x55AA {
        0 -> $ok
    }
    0xAA55 -> *$pe16
    *$pe16 -> $rv16
    ? $rv16 != 0xAA55 {
        0 -> $ok
    }

    $ok

    loop * {
        # End of test
    }
}
