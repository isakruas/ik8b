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

# Math, Bitwise, Comparison, Switch, Array, and Logical Test in ik8b
# Fully testing division, modulo, bitwise operators, relational swaps, switch cases, arrays, and logical boolean short-circuits.

target atmega328p

@main {
    ram mut $res: u8 = 0
    ram mut $ok: u8 = 1

    # 1. Arithmetic Test
    ram imut $x: u8 = 10
    ram imut $y: u8 = 3

    # Addition: 10 + 3 = 13
    $x + $y -> $res
    ? $res != 13 {
        0 -> $ok
    }

    # Subtraction: 10 - 3 = 7
    $x - $y -> $res
    ? $res != 7 {
        0 -> $ok
    }

    # Multiplication: 10 * 3 = 30
    $x * $y -> $res
    ? $res != 30 {
        0 -> $ok
    }

    # Division: 10 / 3 = 3
    $x / $y -> $res
    ? $res != 3 {
        0 -> $ok
    }

    # Modulo: 10 % 3 = 1
    $x % $y -> $res
    ? $res != 1 {
        0 -> $ok
    }

    # 2. Bitwise operations
    ram imut $a: u8 = 0xF0
    ram imut $b: u8 = 0x0F

    # Bitwise AND: 0xF0 & 0x0F = 0x00
    $a & $b -> $res
    ? $res != 0 {
        0 -> $ok
    }

    # Bitwise OR: 0xF0 | 0x0F = 0xFF
    $a | $b -> $res
    ? $res != 0xFF {
        0 -> $ok
    }

    # Bitwise XOR: 0xF0 ^ 0x0F = 0xFF
    $a ^ $b -> $res
    ? $res != 0xFF {
        0 -> $ok
    }

    # 3. Relational comparisons (> and <=)
    # Greater Than: 10 > 3 is true
    ? $x > $y {
        # correct, do nothing
    } : {
        0 -> $ok
    }

    # Less Than or Equal: 10 <= 3 is false
    ? $x <= $y {
        0 -> $ok
    }

    # Less Than: 3 < 10 is true
    ? $y < $x {
        # correct, do nothing
    } : {
        0 -> $ok
    }

    # Greater Than or Equal: 3 >= 10 is false
    ? $y >= $x {
        0 -> $ok
    }

    # 4. Switch-Case tests
    ram imut $val: u8 = 2
    ram mut $switch_ok: u8 = 0

    # Test case matching: $val is 2, should match case 2
    switch $val {
        1 -> {
            0 -> $switch_ok
        }
        2 -> {
            1 -> $switch_ok
        }
        * -> {
            0 -> $switch_ok
        }
    }

    ? $switch_ok != 1 {
        0 -> $ok
    }

    # Test default fallback: $val + 5 is 7, should match wildcard *
    0 -> $switch_ok
    switch $val + 5 {
        1 -> {
            0 -> $switch_ok
        }
        2 -> {
            0 -> $switch_ok
        }
        * -> {
            1 -> $switch_ok
        }
    }

    ? $switch_ok != 1 {
        0 -> $ok
    }

    # 5. Array Tests
    # Allocate a buffer of 5 bytes, all initialized to 0
    ram mut $buf: u8[5] = 0
    
    # Write to elements
    10 -> $buf[0]
    20 -> $buf[1]
    30 -> $buf[2]
    
    # Read and assert elements
    ? $buf[0] != 10 {
        0 -> $ok
    }
    ? $buf[1] != 20 {
        0 -> $ok
    }
    ? $buf[2] != 30 {
        0 -> $ok
    }
    
    # Dynamic indexing using a variable
    ram imut $idx: u8 = 1
    ? $buf[$idx] != 20 {
        0 -> $ok
    }

    # 6. Logical operators (&& and ||)
    ram imut $t1: u8 = 1
    ram imut $t2: u8 = 0

    # 1 && 0 should be false (0)
    ? $t1 && $t2 {
        0 -> $ok
    }

    # 1 || 0 should be true (1)
    ? $t1 || $t2 {
        # correct
    } : {
        0 -> $ok
    }

    # 1 && 1 should be true (1)
    ? $t1 && 1 {
        # correct
    } : {
        0 -> $ok
    }

    # Infinite loop to hold state
    loop * {
        # If all checks passed, $ok will be 1 at address 0x0101
    }
}
