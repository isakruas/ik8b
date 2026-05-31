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

# Technical test for the byte-wide primitive types bool and char.
# Both lower identically to u8 (1 byte, unsigned).
 
@main {
    ram mut $ok: u8 = 1

    # 1. bool: true => 1, false => 0
    ram mut $b_true: bool = true
    ? $b_true != 1 {
        0 -> $ok
    }
    ram mut $b_false: bool = false
    ? $b_false != 0 {
        0 -> $ok
    }

    # 2. char: stores the ASCII code
    ram mut $c: char = 'A'
    ? $c != 65 {
        0 -> $ok
    }

    # 3. bool/char participate in u8 arithmetic
    ram mut $sum: u8 = 0
    $b_true + $c -> $sum
    ? $sum != 66 {
        0 -> $ok
    }

    # 4. char escape sequence
    ram mut $nl: char = '\n'
    ? $nl != 10 {
        0 -> $ok
    }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {
        # End of test
    }
}
