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

# Exercises register pressure, compound assignments, loops and mixed widths.
# Designed to guard a register-allocation rewrite: many simultaneously-live locals,
# compound updates, nested loops, and loop-carried values.

@main {
    mut $ok: u8 = 1
    mut $res: u16 = 0

    # 8 simultaneously-live u8 locals.
    mut $a: u8 = 1
    mut $b: u8 = 2
    mut $c: u8 = 3
    mut $d: u8 = 4
    mut $e: u8 = 5
    mut $f: u8 = 6
    mut $g: u8 = 7
    mut $h: u8 = 8
    mut $sum: u8 = 0
    $a + $b -> $sum
    $sum + $c -> $sum
    $sum + $d -> $sum
    $sum + $e -> $sum
    $sum + $f -> $sum
    $sum + $g -> $sum
    $sum + $h -> $sum
    ? $sum != 36 { 0 -> $ok }

    # u8 compound assignments.
    mut $cx: u8 = 100
    50 ->+ $cx
    ? $cx != 150 { 0 -> $ok }
    25 ->- $cx
    ? $cx != 125 { 0 -> $ok }
    0x0F ->& $cx
    ? $cx != 13 { 0 -> $ok }
    0xF0 ->| $cx
    ? $cx != 253 { 0 -> $ok }
    0xFF ->^ $cx
    ? $cx != 2 { 0 -> $ok }

    # u16 compound assignments.
    mut $w: u16 = 10000
    5000 ->+ $w
    ? $w != 15000 { 0 -> $ok }
    3000 ->- $w
    ? $w != 12000 { 0 -> $ok }

    # Single loop accumulate.
    mut $acc: u16 = 0
    loop 0..10 -> $i {
        1 ->+ $acc
    }
    ? $acc != 10 { 0 -> $ok }

    # Nested loops.
    mut $cnt: u16 = 0
    loop 0..5 -> $oi {
        loop 0..5 -> $ii {
            1 ->+ $cnt
        }
    }
    ? $cnt != 25 { 0 -> $ok }

    # Loop-carried value using the induction variable.
    mut $s2: u16 = 0
    loop 1..5 -> $k {
        $s2 + $k -> $s2
    }
    ? $s2 != 10 { 0 -> $ok }

    # Many simultaneously-live u16 locals.
    mut $p1: u16 = 100
    mut $p2: u16 = 200
    mut $p3: u16 = 300
    mut $p4: u16 = 400
    mut $p5: u16 = 500
    mut $tot: u16 = 0
    $p1 + $p2 -> $tot
    $tot + $p3 -> $tot
    $tot + $p4 -> $tot
    $tot + $p5 -> $tot
    ? $tot != 1500 { 0 -> $ok }

    $ok -> $res
    loop * { }
}
