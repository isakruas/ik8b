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

# Regression matrix for pointer dereference/load/store across widths and spaces.
namespace atmega328p

@id_ptr_u16($p: ptr ram u16) -> ptr ram u16 {
    return $p
}

@main {
    ram mut $ok: u8 = 1

    # RAM pointer u8 read/write
    ram mut $x8: u8 = 17
    ram ptr u8 $p8 = &$x8
    ram mut $y8: u8 = 0
    *$p8 -> $y8
    ? $y8 != 17 {
        0 -> $ok
    }
    9 -> *$p8
    ? $x8 != 9 {
        0 -> $ok
    }

    # RAM pointer u16 read/write
    ram mut $x16: u16 = 0x1234
    ram ptr u16 $p16 = &$x16
    ram mut $y16: u16 = *$p16
    ? $y16 != 0x1234 {
        0 -> $ok
    }
    0xBEEF -> *$p16
    ? $x16 != 0xBEEF {
        0 -> $ok
    }

    # Address of u16 array element (scaled index) + pointer-return function signature
    ram mut $arr16: u16[3] = 0
    ram ptr u16 $ae = &$arr16[1]
    ram ptr u16 $ae2 = @id_ptr_u16($ae)
    0xCAFE -> *$ae2
    ? $arr16[1] != 0xCAFE {
        0 -> $ok
    }

    # Pointer arithmetic dereference expression
    ram mut $arr8: u8[2] = 0
    ram ptr u8 $pa = &$arr8[0]
    42 -> *($pa + 1)
    ? $arr8[1] != 42 {
        0 -> $ok
    }

    $ok

    loop * {
        # End of test
    }
}
