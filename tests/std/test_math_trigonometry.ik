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

import std/math

@main {
    ram mut $ok: u8 = 1
    ram mut $r: r16 = 0.0
    ram mut $ri: u16 = 0
    ram imut $one: r16 = 1.0
    ram imut $zero: r16 = 0.0

    # 1. Trigonometric & Angular
    @_sin_180(90) -> $r
    ? $r != $one { 0 -> $ok }

    @sin(0) -> $r
    ? $r != $zero { 0 -> $ok }

    @cos(0) -> $r
    ? $r != $one { 0 -> $ok }

    @tan(0) -> $r
    ? $r != $zero { 0 -> $ok }

    ram imut $pi: r16 = 3.14
    @radians(180) -> $r
    ? $r != $pi { 0 -> $ok }

    @degrees($pi) -> $ri
    ? $ri != 180 { 0 -> $ok }

    ram imut $three: r16 = 3.0
    ram imut $four: r16 = 4.0
    ram imut $five: r16 = 5.0
    @hypot($three, $four) -> $r
    ? $r != $five { 0 -> $ok }

    @dist($zero, $zero, $three, $four) -> $r
    ? $r != $five { 0 -> $ok }

    # Non-trivial high-level trigonometric verifications
    ram imut $half: r16 = 0.5
    @sin(30) -> $r
    ? $r != $half { 0 -> $ok }

    @cos(60) -> $r
    ? $r != $half { 0 -> $ok }

    @tan(45) -> $r
    ? $r != $one { 0 -> $ok }

    # 2. Hyperbolic
    @sinh($zero) -> $r
    ? $r != $zero { 0 -> $ok }

    @cosh($zero) -> $r
    ? $r != $one { 0 -> $ok }

    @tanh($zero) -> $r
    ? $r != $zero { 0 -> $ok }

    @asinh($zero) -> $r
    ? $r != $zero { 0 -> $ok }

    @acosh($one) -> $r
    ? $r != $zero { 0 -> $ok }

    @atanh($zero) -> $r
    ? $r != $zero { 0 -> $ok }

    # Edge cases (Out of bounds)
    ram imut $nan_val: r16 = -128.0
    @acosh($zero) -> $r
    ? $r != $nan_val { 0 -> $ok }

    # atanh domain is (-1, 1). atanh(2.0) should be NaN
    ram imut $two: r16 = 2.0
    @atanh($two) -> $r
    ? $r != $nan_val { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
