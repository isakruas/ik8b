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

# Technical test for ik8b control flow structures
# Verifies conditional branching, range-based loops (including nested), and subroutine returns.

@main {
    mut $res: u8 = 0
    mut $ok: u8 = 1

    # 1. Conditionals (If-Then-Else)
    mut $x: u8 = 10
    ? $x == 10 {
        1 -> $res
    } : {
        2 -> $res
    }
    ? $res != 1 {
        0 -> $ok
    }

    ? $x != 10 {
        3 -> $res
    } : {
        4 -> $res
    }
    ? $res != 4 {
        0 -> $ok
    }

    # 2. Simple Range Loop
    mut $sum: u16 = 0
    loop 0..5 -> $i {
        $sum + $i -> $sum
    }
    ? $sum != 10 {  # 0 + 1 + 2 + 3 + 4 = 10
        0 -> $ok
    }

    # 3. Dynamic Range Bounds Loop
    mut $limit: u16 = 10
    0 -> $sum
    loop 5..$limit -> $j {
        $sum + $j -> $sum
    }
    ? $sum != 35 {  # 5 + 6 + 7 + 8 + 9 = 35
        0 -> $ok
    }

    # 4. Nested Range Loops
    0 -> $sum
    loop 0..3 -> $outer {
        loop 0..4 -> $inner {
            $sum + 1 -> $sum
        }
    }
    ? $sum != 12 {  # 3 * 4 = 12
        0 -> $ok
    }

    # 5. Return Statement Subroutine Check
    @test_return(5) -> $res
    ? $res != 25 {
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}

@test_return($val: u16) -> u16 {
    ? $val == 0 {
        return 0
    }
    return $val * 5
}
