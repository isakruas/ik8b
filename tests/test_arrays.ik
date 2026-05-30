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

# Technical test for ik8b array allocation and element manipulation
# Verifies scalar initialization, static indexing, dynamic variable indexing, 16-bit elements, and compound assignments.

@main {
    ram mut $ok: u8 = 1
    ram mut $res: u8 = 0
    ram imut $res16: u16 = 0

    # 1. 8-bit Array Static Read/Write
    ram mut $buf8: u8[5] = 0
    
    10 -> $buf8[0]
    20 -> $buf8[1]
    30 -> $buf8[2]
    
    ? $buf8[0] != 10 {
        0 -> $ok
    }
    ? $buf8[1] != 20 {
        0 -> $ok
    }
    ? $buf8[2] != 30 {
        0 -> $ok
    }

    # 2. 8-bit Array Dynamic Indexing
    ram mut $idx8: u8 = 1
    ? $buf8[$idx8] != 20 {
        0 -> $ok
    }
    
    2 -> $idx8
    ? $buf8[$idx8] != 30 {
        0 -> $ok
    }

    # 3. 8-bit Array Compound Assignment
    0 -> $idx8
    5 ->+ $buf8[$idx8]  # Add 5 to 10 -> 15
    ? $buf8[$idx8] != 15 {
        0 -> $ok
    }

    3 ->- $buf8[$idx8]  # Subtract 3 from 15 -> 12
    ? $buf8[$idx8] != 12 {
        0 -> $ok
    }

    0xF0 ->& $buf8[$idx8]  # AND 0x0C & 0xF0 -> 0
    ? $buf8[$idx8] != 0 {
        0 -> $ok
    }

    # 4. 16-bit Array Static Read/Write
    ram mut $buf16: u16[3] = 0
    
    1000 -> $buf16[0]
    2000 -> $buf16[1]
    
    ? $buf16[0] != 1000 {
        0 -> $ok
    }
    ? $buf16[1] != 2000 {
        0 -> $ok
    }

    # 5. 16-bit Array Dynamic Indexing
    ram imut $idx16: u16 = 1
    ? $buf16[$idx16] != 2000 {
        0 -> $ok
    }

    # 6. 16-bit Array Compound Assignment
    500 ->+ $buf16[$idx16]  # Add 500 to 2000 -> 2500
    ? $buf16[$idx16] != 2500 {
        0 -> $ok
    }

    300 ->- $buf16[$idx16]  # Subtract 300 from 2500 -> 2200
    ? $buf16[$idx16] != 2200 {
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}
