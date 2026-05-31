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

    # 1. Power & Log
    ram imut $base_2: r16 = 2.0
    ram imut $pow_val: r16 = @pow($base_2, 4)
    ram imut $pow_expected: r16 = 16.0
    ? $pow_val != $pow_expected { 0 -> $ok }

    ram imut $sqrt_in: r16 = 25.0
    ram imut $sqrt_val: r16 = @sqrt($sqrt_in)
    ram imut $sqrt_expected: r16 = 5.0
    ? $sqrt_val != $sqrt_expected { 0 -> $ok }

    ram imut $zero: r16 = 0.0
    ram imut $exp_val: r16 = @exp($zero)
    ram imut $exp_expected: r16 = 1.0
    ? $exp_val != $exp_expected { 0 -> $ok }

    ram imut $one: r16 = 1.0
    ram imut $log_val: r16 = @log($one)
    ? $log_val != $zero { 0 -> $ok }

    ram imut $log2_val: r16 = @log2($one)
    ? $log2_val != $zero { 0 -> $ok }

    ram imut $log10_val: r16 = @log10($one)
    ? $log10_val != $zero { 0 -> $ok }

    ram imut $two: r16 = 2.0
    ram imut $log2_two: r16 = @log2($two)
    ram imut $log2_two_close: r16 = @isclose($log2_two, 1.0, 0.01)
    ? $log2_two_close != 1.0 { 0 -> $ok }

    ram imut $e_const: r16 = 2.718
    ram imut $log_e: r16 = @log($e_const)
    ram imut $log_e_close: r16 = @isclose($log_e, 1.0, 0.01)
    ? $log_e_close != 1.0 { 0 -> $ok }

    ram imut $ten_const: r16 = 10.0
    ram imut $log10_ten: r16 = @log10($ten_const)
    ram imut $log10_close: r16 = @isclose($log10_ten, 1.0, 0.01)
    ? $log10_close != 1.0 { 0 -> $ok }

    # Edge cases (NaN represented as -128.0)
    ram imut $neg_one: r16 = -1.0
    ram imut $log_neg: r16 = @log($neg_one)
    ram imut $nan_val: r16 = -128.0
    ? $log_neg != $nan_val { 0 -> $ok }

    ram imut $sqrt_neg: r16 = @sqrt($neg_one)
    ? $sqrt_neg != $nan_val { 0 -> $ok }

    ram imut $zero_div: r16 = @_q88_div($one, $zero)
    ram imut $inf_val: r16 = 127.99
    ? $zero_div != $inf_val { 0 -> $ok }

    # 2. Combinatorics & Number Theory
    ram imut $gcd_val: u16 = @gcd(12, 18)
    ? $gcd_val != 6 { 0 -> $ok }

    ram imut $lcm_val: u16 = @lcm(12, 18)
    ? $lcm_val != 36 { 0 -> $ok }

    ram imut $fact_val: u16 = @factorial(5)
    ? $fact_val != 120 { 0 -> $ok }

    ram imut $fib_val: u16 = @fibonacci(6)
    ? $fib_val != 8 { 0 -> $ok }

    ram imut $perm_val: u16 = @perm(5, 2)
    ? $perm_val != 20 { 0 -> $ok }

    ram imut $gamma_val: u16 = @gamma(5)
    ? $gamma_val != 24 { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
