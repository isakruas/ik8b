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

# Technical test for fixed-point types r8 (Q4.4) and r16 (Q8.8).
# Fixed-point multiply uses the hardware multiplier; cores without one are
# skipped by the harness (the compiler emits a Memory Error for them).
namespace atmega328p
@main {
    ram mut $ok: u8 = 1

    # 1. r16 literal: 3.0 == 768 in Q8.8
    ram mut $a: r16 = 3.0
    ? $a != 768 {
        0 -> $ok
    }

    # 2. r16 multiply: 3.0 * 2.0 == 6.0 (1536)
    ram mut $b: r16 = 2.0
    ram mut $c: r16 = 0.0
    $a * $b -> $c
    ? $c != 1536 {
        0 -> $ok
    }

    # 3. r16 fractional multiply: 1.5 * 3.0 == 4.5 (1152)
    ram mut $h: r16 = 1.5
    ram mut $t: r16 = 3.0
    ram mut $p: r16 = 0.0
    $h * $t -> $p
    ? $p != 1152 {
        0 -> $ok
    }

    # 4. r16 signed multiply: -2.0 * 3.0 == -6.0 (-1536)
    ram mut $neg: r16 = -2.0
    ram mut $pn: r16 = 0.0
    $neg * $t -> $pn
    ? $pn != -1536 {
        0 -> $ok
    }

    # 5. r16 add preserves scale: 1.5 + 2.0 == 3.5 (896)
    ram mut $s: r16 = 0.0
    $h + $b -> $s
    ? $s != 896 {
        0 -> $ok
    }

    # 6. r16 signed comparison: 1.5 < 2.0
    ? $h >= $b {
        0 -> $ok
    }

    # 7. r8 literal: 3.0 == 48 in Q4.4
    ram mut $r8a: r8 = 3.0
    ? $r8a != 48 {
        0 -> $ok
    }

    # 8. r8 multiply: 2.0 * 3.0 == 6.0 (96)
    ram mut $r8b: r8 = 2.0
    ram mut $r8c: r8 = 0.0
    $r8b * $r8a -> $r8c
    ? $r8c != 96 {
        0 -> $ok
    }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {
        # End of test
    }
}
