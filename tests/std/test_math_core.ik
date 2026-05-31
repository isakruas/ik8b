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

    # 1. Fixed point helpers
    ram imut $one: r16 = 1.0
    ram imut $mul_val: r16 = @_q88_mul($one, $one)
    ? $mul_val != $one { 0 -> $ok }

    ram imut $div_val: r16 = @_q88_div($one, $one)
    ? $div_val != $one { 0 -> $ok }

    # 2. Constants
    ram imut $pi_expected: r16 = 3.14
    ? @pi() != $pi_expected { 0 -> $ok }

    ram imut $e_expected: r16 = 2.718
    ? @e() != $e_expected { 0 -> $ok }

    ram imut $tau_expected: r16 = 6.283
    ? @tau() != $tau_expected { 0 -> $ok }

    # 3. Rounding & Bounds
    ram imut $ten: r16 = 10.0
    ram imut $twenty: r16 = 20.0
    ram imut $min_val: r16 = @min($ten, $twenty)
    ? $min_val != $ten { 0 -> $ok }

    ram imut $max_val: r16 = @max($ten, $twenty)
    ? $max_val != $twenty { 0 -> $ok }

    ram imut $five: r16 = 5.0
    ram imut $clamp_val: r16 = @clamp($five, $ten, $twenty)
    ? $clamp_val != $ten { 0 -> $ok }

    ram imut $zero: r16 = 0.0
    ram imut $one_hundred: r16 = 100.0
    ram imut $map_val: r16 = @map($five, $zero, $ten, $zero, $one_hundred)
    ram imut $fifty: r16 = 50.0
    ? $map_val != $fifty { 0 -> $ok }

    ram imut $neg_one: r16 = -1.0
    ram imut $abs_val: r16 = @abs($neg_one)
    ? $abs_val != $one { 0 -> $ok }

    ram imut $fabs_val: r16 = @fabs($neg_one)
    ? $fabs_val != $one { 0 -> $ok }

    ram imut $ceil_in: r16 = 1.0039
    ram imut $ceil_val: r16 = @ceil($ceil_in)
    ram imut $two: r16 = 2.0
    ? $ceil_val != $two { 0 -> $ok }

    ram imut $floor_val: r16 = @floor($ceil_in)
    ? $floor_val != $one { 0 -> $ok }

    ram imut $trunc_val: r16 = @trunc($ceil_in)
    ? $trunc_val != $one { 0 -> $ok }

    ram imut $copysign_val: r16 = @copysign($one, $neg_one)
    ? $copysign_val != $neg_one { 0 -> $ok }

    ram imut $fmod_in: r16 = 2.343
    ram imut $fmod_val: r16 = @fmod($fmod_in, $one)
    ram imut $fmod_expected: r16 = 0.343
    ? $fmod_val != $fmod_expected { 0 -> $ok }

    ram imut $tol: r16 = 0.019
    ram imut $isclose_val: r16 = @isclose($one, $ceil_in, $tol)
    ? $isclose_val != $one { 0 -> $ok }

    ? @isnan($zero) != $zero { 0 -> $ok }
    ? @isinf($zero) != $zero { 0 -> $ok }
    ? @isfinite($zero) != $one { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
