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

# Test suite for new features of ik8b:
# Unary operators (!, ~, -), boolean literals (true, false),
# character literals ('c'), and compound array assignments (->+).

namespace atmega328p

@main {
    ram mut $res: u8 = 0
    ram mut $ok: u8 = 1

    # 1. Boolean literals test
    ram imut $t_bool: u8 = true
    ram imut $f_bool: u8 = false
    
    ? $t_bool != 1 {
        0 -> $ok
    }
    ? $f_bool != 0 {
        0 -> $ok
    }

    # 2. Character literals test
    ram imut $char_a: u8 = 'A'
    ram imut $char_nl: u8 = '\n'
    
    ? $char_a != 65 {
        0 -> $ok
    }
    ? $char_nl != 10 {
        0 -> $ok
    }

    # 3. Unary prefix operators test (8-bit)
    ram imut $val: u8 = 5
    
    # Unary negation: -$val -> -5 (0xFB)
    (-$val) -> $res
    ? $res != 0xFB {
        0 -> $ok
    }
    
    # Logical NOT: !$val -> 0
    !$val -> $res
    ? $res != 0 {
        0 -> $ok
    }
    
    # Logical NOT on zero: !0 -> 1
    !0 -> $res
    ? $res != 1 {
        0 -> $ok
    }
    
    # Bitwise NOT: ~$val -> ~5 = 250 (0xFA)
    ~$val -> $res
    ? $res != 0xFA {
        0 -> $ok
    }

    # 4. Unary prefix operators test (16-bit)
    ram imut $val16: u16 = 5
    ram mut $res16: u16 = 0

    # Unary negation (16-bit): -$val16 -> -5 = 65531 (0xFFFB)
    (-$val16) -> $res16
    ? $res16 != 65531 {
        0 -> $ok
    }

    # Logical NOT (16-bit): !$val16 -> 0
    !$val16 -> $res16
    ? $res16 != 0 {
        0 -> $ok
    }

    # Bitwise NOT (16-bit): ~$val16 -> ~5 = 65530 (0xFFFA)
    ~$val16 -> $res16
    ? $res16 != 65530 {
        0 -> $ok
    }

    # 5. Compound assignment on array elements (8-bit)
    ram mut $buf8: u8[5] = 0
    10 -> $buf8[0]
    
    # Addition assignment: 5 ->+ $buf8[0] (should be 15)
    5 ->+ $buf8[0]
    ? $buf8[0] != 15 {
        0 -> $ok
    }
    
    # Subtraction assignment: 3 ->- $buf8[0] (should be 12)
    3 ->- $buf8[0]
    ? $buf8[0] != 12 {
        0 -> $ok
    }
    
    # Bitwise AND assignment: 0xF0 ->& $buf8[0] (12 = 0x0C & 0xF0 = 0)
    0xF0 ->& $buf8[0]
    ? $buf8[0] != 0 {
        0 -> $ok
    }

    # 6. Compound assignment on array elements (16-bit)
    ram mut $buf16: u16[3] = 0
    1000 -> $buf16[1]
    
    # Addition assignment (16-bit): 500 ->+ $buf16[1] (should be 1500)
    500 ->+ $buf16[1]
    ? $buf16[1] != 1500 {
        0 -> $ok
    }
    
    # Subtraction assignment (16-bit): 200 ->- $buf16[1] (should be 1300)
    200 ->- $buf16[1]
    ? $buf16[1] != 1300 {
        0 -> $ok
    }

    # Infinite loop to hold state
    loop * {
        # If all checks passed, $ok will be 1 at address 0x0101
    }
}
