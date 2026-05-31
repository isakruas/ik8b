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

 

import std/bits

@main {
    ram mut $ok: u8 = 1

    # 1. rotl8
    ? @rotl8(0x80, 1) != 0x01 { 0 -> $ok }
    ? @rotl8(0x0F, 4) != 0xF0 { 0 -> $ok }

    # 2. rotr8
    ? @rotr8(0x01, 1) != 0x80 { 0 -> $ok }
    ? @rotr8(0xF0, 4) != 0x0F { 0 -> $ok }

    # 3. rotl16
    ? @rotl16(0x8000, 1) != 0x0001 { 0 -> $ok }
    ? @rotl16(0x00FF, 8) != 0xFF00 { 0 -> $ok }

    # 4. rotr16
    ? @rotr16(0x0001, 1) != 0x8000 { 0 -> $ok }
    ? @rotr16(0xFF00, 8) != 0x00FF { 0 -> $ok }

    # 5. popcount8
    ? @popcount8(0x00) != 0 { 0 -> $ok }
    ? @popcount8(0x0F) != 4 { 0 -> $ok }
    ? @popcount8(0xFF) != 8 { 0 -> $ok }

    # 6. popcount16
    ? @popcount16(0x0000) != 0 { 0 -> $ok }
    ? @popcount16(0x0FFF) != 12 { 0 -> $ok }
    ? @popcount16(0xFFFF) != 16 { 0 -> $ok }

    # 7. parity8
    ? @parity8(0x00) != 0 { 0 -> $ok }
    ? @parity8(0x01) != 1 { 0 -> $ok }
    ? @parity8(0x03) != 0 { 0 -> $ok }
    ? @parity8(0x07) != 1 { 0 -> $ok }

    # 8. reverse8
    ? @reverse8(0x80) != 0x01 { 0 -> $ok }
    ? @reverse8(0xAA) != 0x55 { 0 -> $ok }

    # 9. reverse16
    ? @reverse16(0x8000) != 0x0001 { 0 -> $ok }
    ? @reverse16(0xAAAA) != 0x5555 { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
