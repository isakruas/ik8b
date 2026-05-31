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

 

import std/mem

@main {
    ram mut $ok: u8 = 1

    # 1. memset & memcpy
    ram mut $buf1: u8[4] = 0
    ram mut $buf2: u8[4] = 0
    @memset(&$buf1[0], 0x55, 4)
    ? $buf1[0] != 0x55 { 0 -> $ok }
    ? $buf1[3] != 0x55 { 0 -> $ok }

    @memcpy(&$buf2[0], &$buf1[0], 4)
    ? $buf2[0] != 0x55 { 0 -> $ok }
    ? $buf2[3] != 0x55 { 0 -> $ok }

    # 2. memcpy_P (flash to ram)
    ram mut $flash_dest: u8[2] = 0
    @memcpy_P(&$flash_dest[0], 0, 2)
    ? $flash_dest[0] != 0x01 { 0 -> $ok }
    ? $flash_dest[1] != 0xD0 { 0 -> $ok }

    # 3. memcmp
    ram imut $cmp: i16 = @memcmp(&$buf1[0], &$buf2[0], 4)
    ? $cmp != 0 { 0 -> $ok }

    # 4. memmove (overlapping copy)
    ram mut $move_buf: u8[5] = 0
    1 -> $move_buf[0]
    2 -> $move_buf[1]
    3 -> $move_buf[2]
    @memmove(&$move_buf[1], &$move_buf[0], 3)
    ? $move_buf[1] != 1 { 0 -> $ok }
    ? $move_buf[2] != 2 { 0 -> $ok }
    ? $move_buf[3] != 3 { 0 -> $ok }

    # 5. memchr & memrchr
    ram ptr u8 $mchr = @memchr(&$move_buf[0], 2, 5)
    ? $mchr != (&$move_buf[2]) { 0 -> $ok }

    ram ptr u8 $mrchr = @memrchr(&$move_buf[0], 2, 5)
    ? $mrchr != (&$move_buf[2]) { 0 -> $ok }

    # 6. memccpy
    ram mut $cc_buf: u8[5] = 0
    ram ptr u8 $mcc = @memccpy(&$cc_buf[0], &$move_buf[0], 2, 5)
    ? $cc_buf[1] != 1 { 0 -> $ok }
    ? $cc_buf[2] != 2 { 0 -> $ok }
    ? $mcc != (&$cc_buf[3]) { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
