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

# Technical test for ik8b logical operations
# Verifies logical short-circuit AND (&&), logical OR (||), and prefix logical NOT (!).

@main {
    mut $res: u8 = 0
    mut $ok: u8 = 1

    mut $t: u8 = 1
    mut $f: u8 = 0

    # 1. Logical NOT (!) on true
    !$t -> $res
    ? $res != 0 {
        0 -> $ok
    }

    # 2. Logical NOT (!) on false
    !$f -> $res
    ? $res != 1 {
        0 -> $ok
    }

    # 3. Logical NOT (!) on non-zero
    mut $val: u8 = 42
    !$val -> $res
    ? $res != 0 {
        0 -> $ok
    }

    # 4. Short-circuit AND (&&) - True && True
    ? $t && 1 {
        # Correct
    } : {
        0 -> $ok
    }

    # 5. Short-circuit AND (&&) - True && False
    ? $t && $f {
        0 -> $ok
    }

    # 6. Short-circuit AND (&&) - False && True (should short-circuit and not evaluate right side)
    mut $eval_right: u8 = 0
    ? $f && (@trigger_eval_right() == 1) {
        0 -> $ok
    }
    ? $eval_right != 0 {
        0 -> $ok
    }

    # 7. Short-circuit OR (||) - False || False
    ? $f || 0 {
        0 -> $ok
    }

    # 8. Short-circuit OR (||) - True || False (should short-circuit and not evaluate right side)
    0 -> $eval_right # reset to 0
    ? $t || (@trigger_eval_right() == 1) {
        # Correct
    } : {
        0 -> $ok
    }
    ? $eval_right != 0 {
        0 -> $ok
    }

    # 9. Complex logical combining
    ? ($t && 1) || $f {
        # Correct
    } : {
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}

@trigger_eval_right() -> u8 {
    1 -> $eval_right
    return 1
}
