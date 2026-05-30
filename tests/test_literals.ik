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

# Technical test for ik8b literals support
# Verifies hexadecimals, negatives, boolean literals (true, false), and single-quoted character literals.

@main {
    mut $ok: u8 = 1
    mut $res: u8 = 0
    mut $res16: u16 = 0

    # 1. Hexadecimal Literals
    mut $hex: u8 = 0x5A
    ? $hex != 90 {
        0 -> $ok
    }

    # 2. Negative Number Literals
    mut $neg: u8 = -15
    ? $neg != -15 {
        0 -> $ok
    }

    # 3. Boolean Literals (true, false)
    mut $b_true: u8 = true
    mut $b_false: u8 = false
    
    ? $b_true != 1 {
        0 -> $ok
    }
    ? $b_false != 0 {
        0 -> $ok
    }

    # 4. Standard Character Literals
    mut $char_a: u8 = 'A'
    mut $char_z: u8 = 'z'
    
    ? $char_a != 65 {
        0 -> $ok
    }
    ? $char_z != 122 {
        0 -> $ok
    }

    # 5. Escaped Character Literals
    mut $char_nl: u8 = '\n'
    mut $char_tab: u8 = '\t'
    mut $char_null: u8 = '\0'
    mut $char_slash: u8 = '\\'
    mut $char_quote: u8 = '\''

    ? $char_nl != 10 {
        0 -> $ok
    }
    ? $char_tab != 9 {
        0 -> $ok
    }
    ? $char_null != 0 {
        0 -> $ok
    }
    ? $char_slash != 92 {
        0 -> $ok
    }
    ? $char_quote != 39 {
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}
