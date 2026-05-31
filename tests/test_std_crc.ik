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

 

import std/crc

@main {
    ram mut $ok: u8 = 1

    ram mut $crc_data: u8[4] = 0
    0x01 -> $crc_data[0]
    0x02 -> $crc_data[1]
    0x03 -> $crc_data[2]
    0x04 -> $crc_data[3]

    # 1. crc8
    ram imut $c8: u8 = @crc8(&$crc_data[0], 4)
    ? $c8 == 0 { 0 -> $ok } # Dallas/Maxim CRC-8 of [1, 2, 3, 4] is non-zero, check logic

    # 2. crc16
    ram imut $c16: u16 = @crc16(&$crc_data[0], 4)
    ? $c16 == 0 { 0 -> $ok } # CRC-16 of [1, 2, 3, 4] is non-zero, check logic

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
