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

# Regression test for functions with more arguments than the register ABI
# slots: the surplus travels on the hardware stack (pushed by the caller in
# ascending byte order above the return address, read back with LD Z+).

# Eight 8-bit parameters: the last ones always arrive on the stack.
@sum8($a: u8, $b: u8, $c: u8, $d: u8, $e: u8, $f: u8, $g: u8, $h: u8) -> u8 {
    ram mut $s: u8 = $a + $b
    $s + $c -> $s
    $s + $d -> $s
    $s + $e -> $s
    $s + $f -> $s
    $s + $g -> $s
    $s + $h -> $s
    return $s
}

# Mixed widths: 16-bit stack parameters cross the byte-order convention.
@mix($a: u8, $b: u16, $c: u8, $d: u16, $e: u8, $f: u16, $g: u8) -> u16 {
    ram mut $s: u16 = $b
    $s + $d -> $s
    $s + $f -> $s
    ram mut $t: u8 = $a + $c
    $t + $e -> $t
    $t + $g -> $t
    ram imut $tw: u16 = $t
    return $s + $tw
}

# A function with stack parameters that itself passes stack arguments on:
# its own incoming frame must not be disturbed by the nested call's pushes.
@chain($a: u8, $b: u8, $c: u8, $d: u8, $e: u8, $f: u8) -> u8 {
    return @sum8($a, $b, $c, $d, $e, $f, 9, 10)
}

@main {
    ram mut $ok: u8 = 1

    ram imut $s: u8 = @sum8(1, 2, 3, 4, 5, 6, 7, 8)
    ? $s != 36 {
        0 -> $ok
    }

    ram imut $m: u16 = @mix(1, 1000, 2, 2000, 3, 3000, 4)
    ? $m != 6010 {
        0 -> $ok
    }

    ram imut $n: u8 = @chain(1, 2, 3, 4, 5, 6)
    ? $n != 40 {
        0 -> $ok
    }

    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {
        # End of test
    }
}
