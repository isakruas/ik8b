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

# Technical test for ik8b switch-case statement
# Verifies switch matching on standard values, complex case targets, and wildcard (*) default fallbacks.

@main {
    mut $res: u8 = 0
    mut $ok: u8 = 1

    # 1. Direct case match
    mut $val: u8 = 2
    switch $val {
        1 -> {
            10 -> $res
        }
        2 -> {
            20 -> $res
        }
        3 -> {
            30 -> $res
        }
        * -> {
            99 -> $res
        }
    }
    ? $res != 20 {
        0 -> $ok
    }

    # 2. Match first case
    1 -> $val
    switch $val {
        1 -> {
            10 -> $res
        }
        2 -> {
            20 -> $res
        }
        * -> {
            99 -> $res
        }
    }
    ? $res != 10 {
        0 -> $ok
    }

    # 3. Wildcard (*) default fallback match
    5 -> $val
    switch $val {
        1 -> {
            10 -> $res
        }
        2 -> {
            20 -> $res
        }
        * -> {
            99 -> $res
        }
    }
    ? $res != 99 {
        0 -> $ok
    }

    #  switch statement with dynamic expressions
    mut $x: u8 = 2
    mut $y: u8 = 3
    switch $x + $y {
        4 -> {
            40 -> $res
        }
        5 -> {
            50 -> $res
        }
        * -> {
            99 -> $res
        }
    }
    ? $res != 50 {
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}
