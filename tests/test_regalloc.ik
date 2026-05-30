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
    ram mut $ok: u8 = 1
    ram mut $res: u16 = 0

    # 8 simultaneously-live u8 locals.
    ram imut $a: u8 = 1
    ram imut $b: u8 = 2
    ram imut $c: u8 = 3
    ram imut $d: u8 = 4
    ram imut $e: u8 = 5
    ram imut $f: u8 = 6
    ram imut $g: u8 = 7
    ram imut $h: u8 = 8
    ram mut $sum: u8 = 0
    $a + $b -> $sum
    $sum + $c -> $sum
    $sum + $d -> $sum
    $sum + $e -> $sum
    $sum + $f -> $sum
    $sum + $g -> $sum
    $sum + $h -> $sum
    ? $sum != 36 { 0 -> $ok }

    # u8 compound assignments.
    ram mut $cx: u8 = 100
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
    ram mut $w: u16 = 10000
    5000 ->+ $w
    ? $w != 15000 { 0 -> $ok }
    3000 ->- $w
    ? $w != 12000 { 0 -> $ok }

    # Single loop accumulate.
    ram mut $acc: u16 = 0
    loop 0..10 -> $i {
        1 ->+ $acc
    }
    ? $acc != 10 { 0 -> $ok }

    # Nested loops.
    ram mut $cnt: u16 = 0
    loop 0..5 -> $oi {
        loop 0..5 -> $ii {
            1 ->+ $cnt
        }
    }
    ? $cnt != 25 { 0 -> $ok }

    # Loop-carried value using the induction variable.
    ram mut $s2: u16 = 0
    loop 1..5 -> $k {
        $s2 + $k -> $s2
    }
    ? $s2 != 10 { 0 -> $ok }

    # Many simultaneously-live u16 locals.
    ram imut $p1: u16 = 100
    ram imut $p2: u16 = 200
    ram imut $p3: u16 = 300
    ram imut $p4: u16 = 400
    ram imut $p5: u16 = 500
    ram mut $tot: u16 = 0
    $p1 + $p2 -> $tot
    $tot + $p3 -> $tot
    $tot + $p4 -> $tot
    $tot + $p5 -> $tot
    ? $tot != 1500 { 0 -> $ok }

    $ok -> $res
    loop * { }
}
