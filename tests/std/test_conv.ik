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
 
import std/conv

@main {
    ram mut $ok: u8 = 1

    # 1. atoi
    ? @atoi("123") != 123 { 0 -> $ok }
    ? @atoi("-45") != -45 { 0 -> $ok }
    ? @atoi("+67") != 67 { 0 -> $ok }

    # 2. atou
    ? @atou("500") != 500 { 0 -> $ok }
    ? @atou("0") != 0 { 0 -> $ok }

    # 3. itoa
    ram mut $cbuf: u8[8] = 0
    @itoa(-789, &$cbuf[0])
    ? $cbuf[0] != 45 { 0 -> $ok } # '-'
    ? $cbuf[1] != 55 { 0 -> $ok } # '7'
    ? $cbuf[2] != 56 { 0 -> $ok } # '8'
    ? $cbuf[3] != 57 { 0 -> $ok } # '9'
    ? $cbuf[4] != 0 { 0 -> $ok }

    @itoa(0, &$cbuf[0])
    ? $cbuf[0] != 48 { 0 -> $ok } # '0'
    ? $cbuf[1] != 0 { 0 -> $ok }

    # 4. utoa
    @utoa(6543, &$cbuf[0])
    ? $cbuf[0] != 54 { 0 -> $ok } # '6'
    ? $cbuf[1] != 53 { 0 -> $ok } # '5'
    ? $cbuf[2] != 52 { 0 -> $ok } # '4'
    ? $cbuf[3] != 51 { 0 -> $ok } # '3'
    ? $cbuf[4] != 0 { 0 -> $ok }

    @utoa(0, &$cbuf[0])
    ? $cbuf[0] != 48 { 0 -> $ok } # '0'
    ? $cbuf[1] != 0 { 0 -> $ok }

    # 5. utoa_hex
    @utoa_hex(255, &$cbuf[0])
    ? $cbuf[0] != 70 { 0 -> $ok } # 'F'
    ? $cbuf[1] != 70 { 0 -> $ok } # 'F'
    ? $cbuf[2] != 0 { 0 -> $ok }

    @utoa_hex(0, &$cbuf[0])
    ? $cbuf[0] != 48 { 0 -> $ok } # '0'
    ? $cbuf[1] != 0 { 0 -> $ok }

    # 6. atou_hex
    ? @atou_hex("0xAB") != 171 { 0 -> $ok }
    ? @atou_hex("FF") != 255 { 0 -> $ok }
    ? @atou_hex("0X10") != 16 { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
