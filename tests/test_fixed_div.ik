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

# Regression test for fixed-point division semantics.
namespace atmega328p
@main {
    ram mut $ok: u8 = 1

    # r16 / Q8.8
    ram mut $a16: r16 = 6.0
    ram mut $b16: r16 = 2.0
    ram mut $r16: r16 = 0.0
    $a16 / $b16 -> $r16
    ? $r16 != 768 {
        0 -> $ok
    }

    ram mut $x16: r16 = 4.5
    ram mut $y16: r16 = 1.5
    $x16 / $y16 -> $r16
    ? $r16 != 768 {
        0 -> $ok
    }

    ram mut $n16: r16 = -7.0
    ram mut $d16: r16 = 2.0
    $n16 / $d16 -> $r16
    ? $r16 != -896 {
        0 -> $ok
    }

    ram mut $p16: r16 = 1.0
    ram mut $q16: r16 = 3.0
    $p16 / $q16 -> $r16
    ? $r16 != 85 {
        0 -> $ok
    }

    ram mut $hn16: r16 = -1.0
    $hn16 / $q16 -> $r16
    ? $r16 != -85 {
        0 -> $ok
    }

    # r8 / Q4.4
    ram mut $a8: r8 = 6.0
    ram mut $b8: r8 = 2.0
    ram mut $r8: r8 = 0.0
    $a8 / $b8 -> $r8
    ? $r8 != 48 {
        0 -> $ok
    }

    ram mut $p8: r8 = 1.0
    ram mut $q8: r8 = 3.0
    $p8 / $q8 -> $r8
    ? $r8 != 5 {
        0 -> $ok
    }

    ram mut $n8: r8 = -3.0
    $n8 / $b8 -> $r8
    ? $r8 != -24 {
        0 -> $ok
    }

    ram mut $h8: r8 = 1.5
    ram mut $k8: r8 = 0.5
    $h8 / $k8 -> $r8
    ? $r8 != 48 {
        0 -> $ok
    }

    $ok

    loop * {
        # End of test
    }
}
