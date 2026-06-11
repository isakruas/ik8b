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

# Technical test for signed integer types i8 / i16.
# Each case is chosen so that an UNSIGNED interpretation would give a different
# (wrong) answer, proving the signed code paths are actually exercised.
 
@main {
    ram mut $ok: u8 = 1

    # 1. i8 sign + relational: -5 < 3 is true signed, false unsigned (0xFB > 3)
    ram mut $a: i8 = -5
    ram mut $b: i8 = 3
    ? $a >= $b {
        0 -> $ok
    }

    # 2. i8 compare against zero
    ? $a >= 0 {
        0 -> $ok
    }

    # 3. i8 signed division: -6 / 4 = -1 (truncated toward zero)
    ram mut $x: i8 = -6
    ram mut $y: i8 = 4
    ram mut $q: i8 = 0
    $x / $y -> $q
    ? $q != -1 {
        0 -> $ok
    }

    # 4. i8 signed modulo: -7 % 3 = -1 (sign follows dividend)
    ram mut $x2: i8 = -7
    ram mut $y2: i8 = 3
    ram mut $m: i8 = 0
    $x2 % $y2 -> $m
    ? $m != -1 {
        0 -> $ok
    }

    # 5. i8 -> i16 sign extension on widening: -5 becomes 0xFFFB, not 0x00FB
    ram mut $w: i16 = 0
    $a -> $w
    ? $w != -5 {
        0 -> $ok
    }

    # 6. i16 signed relational: -300 < 100 (unsigned -300=0xFED4 > 100)
    ram mut $c: i16 = -300
    ram mut $d: i16 = 100
    ? $c >= $d {
        0 -> $ok
    }

    # 7. i16 signed division: -1000 / 8 = -125
    ram mut $n: i16 = -1000
    ram mut $den: i16 = 8
    ram mut $r: i16 = 0
    $n / $den -> $r
    ? $r != -125 {
        0 -> $ok
    }

    # 8. i16 signed modulo: -1000 % 7 = -6
    ram mut $n2: i16 = -1000
    ram mut $den2: i16 = 7
    ram mut $r2: i16 = 0
    $n2 % $den2 -> $r2
    ? $r2 != -6 {
        0 -> $ok
    }

    # 9. signed constant folding in initializer: -6 / 4 folds to -1 at compile time
    ram mut $f: i8 = -6 / 4
    ? $f != -1 {
        0 -> $ok
    }

    # 10. unsigned still works (regression): 200 < 100 is false for u8
    ram mut $u1: u8 = 200
    ram mut $u2: u8 = 100
    ? $u1 < $u2 {
        0 -> $ok
    }

    # 11. 16-bit unary negation: -x wraps modulo 2^16 for u16, and a low byte
    # of zero must still propagate the +1 into the high byte (-256 case).
    ram mut $v1: u16 = 5
    ram mut $w1: u16 = -$v1
    ? $w1 != 65531 {
        0 -> $ok
    }
    ram mut $v2: u16 = 256
    ram mut $w2: u16 = -$v2
    ? $w2 != 65280 {
        0 -> $ok
    }
    ram mut $v3: i16 = -1000
    ram mut $w3: i16 = -$v3
    ? $w3 != 1000 {
        0 -> $ok
    }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {
        # End of test
    }
}
