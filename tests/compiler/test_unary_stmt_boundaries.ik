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

# Regression for statement boundary handling when next line starts with unary operators.

@main {
    ram mut $ok: u8 = 1

    ram mut $x: u8 = 5
    ram mut $y: i8 = 0
    ram mut $flag: u8 = 1
    ram ptr u8 $p = &$x

    # These unary-start lines must parse as independent statements.
    *$p -> $y
    ? $y != 5 {
        0 -> $ok
    }

    -$y -> $y
    ? $y != -5 {
        0 -> $ok
    }

    ~$x -> $x
    ? $x != 250 {
        0 -> $ok
    }

    !$flag -> $flag
    ? $flag != 0 {
        0 -> $ok
    }

    $ok

    loop * {
        # End of test
    }
}
