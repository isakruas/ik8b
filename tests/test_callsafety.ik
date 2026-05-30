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

# Verifies that local variables retain their values across function calls.
# This is the critical correctness property for register allocation: a callee must
# preserve any registers its caller is using to hold variables.

@main {
    mut $ok: u8 = 1
    mut $res: u16 = 0

    mut $v1: u8 = 11
    mut $v2: u8 = 22
    mut $v3: u8 = 33
    mut $v4: u8 = 44
    mut $v5: u16 = 1000
    mut $v6: u16 = 2000
    mut $v7: u16 = 3000
    mut $v8: u16 = 60000

    @clobber(99, 88) -> $res
    ? $res != 187 { 0 -> $ok }

    @clobber2(7, 5000) -> $res
    ? $res != 5007 { 0 -> $ok }

    # All caller locals must survive both calls.
    ? $v1 != 11 { 0 -> $ok }
    ? $v2 != 22 { 0 -> $ok }
    ? $v3 != 33 { 0 -> $ok }
    ? $v4 != 44 { 0 -> $ok }
    ? $v5 != 1000 { 0 -> $ok }
    ? $v6 != 2000 { 0 -> $ok }
    ? $v7 != 3000 { 0 -> $ok }
    ? $v8 != 60000 { 0 -> $ok }

    # Use locals in arithmetic after the calls to ensure they are truly live.
    mut $acc: u16 = 0
    $v5 + $v6 -> $acc
    $acc + $v7 -> $acc
    ? $acc != 6000 { 0 -> $ok }

    mut $before: u8 = 123
    @clobber(1, 2) -> $res
    ? $before != 123 { 0 -> $ok }
    ? $res != 3 { 0 -> $ok }

    # A call nested inside a loop: the loop counter must survive each call.
    mut $loopacc: u16 = 0
    loop 0..6 -> $i {
        @clobber(1, 1) -> $res
        $loopacc + $res -> $loopacc
    }
    ? $loopacc != 12 { 0 -> $ok }

    $ok -> $res
    loop * { }
}

@clobber($a: u8, $b: u8) -> u16 {
    mut $x1: u8 = 1
    mut $x2: u8 = 2
    mut $x3: u8 = 3
    mut $x4: u8 = 4
    mut $sum: u16 = 0
    $a + $b -> $sum
    return $sum
}

@clobber2($a: u16, $b: u16) -> u16 {
    mut $y1: u16 = 9
    mut $y2: u16 = 8
    mut $y3: u16 = 7
    mut $r: u16 = 0
    $a + $b -> $r
    return $r
}
