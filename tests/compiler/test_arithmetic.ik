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

# Technical test for ik8b arithmetic operations
# Verifies addition, subtraction, software multiplication, software division, modulo, and negation.

@main {
    ram mut $res: u8 = 0
    ram mut $ok: u8 = 1
    ram mut $res16: u16 = 0

    # 1. 8-bit Addition
    ram imut $x8: u8 = 100
    ram imut $y8: u8 = 50
    $x8 + $y8 -> $res
    ? $res != 150 {
        0 -> $ok
    }

    # 2. 8-bit Subtraction
    $x8 - $y8 -> $res
    ? $res != 50 {
        0 -> $ok
    }

    # 3. 8-bit Software Multiplication
    ram imut $m8_a: u8 = 12
    ram imut $m8_b: u8 = 8
    $m8_a * $m8_b -> $res
    ? $res != 96 {
        0 -> $ok
    }

    # 4. 8-bit Software Division
    ram imut $d8_a: u8 = 100
    ram imut $d8_b: u8 = 8
    $d8_a / $d8_b -> $res
    ? $res != 12 {
        0 -> $ok
    }

    # 5. 8-bit Modulo
    $d8_a % $d8_b -> $res
    ? $res != 4 {
        0 -> $ok
    }

    # 6. 16-bit Addition
    ram imut $x16: u16 = 30000
    ram imut $y16: u16 = 5000
    $x16 + $y16 -> $res16
    ? $res16 != 35000 {
        0 -> $ok
    }

    # 7. 16-bit Subtraction
    $x16 - $y16 -> $res16
    ? $res16 != 25000 {
        0 -> $ok
    }

    # 8. Unary Negation (8-bit)
    ram imut $neg8: u8 = 10
    (-$neg8) -> $res
    ? $res != 246 {  # 256 - 10
        0 -> $ok
    }

    # 9. Unary Negation (16-bit)
    ram imut $neg16: u16 = 500
    (-$neg16) -> $res16
    ? $res16 != 65036 { # 65536 - 500
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
    
}
