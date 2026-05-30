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

# Comprehensive demonstration of the unified ik8b Standard Mathematics Library

namespace atmega328p

import std/math

@main {
    # 1. Test basic algebra helpers
    ram mut $min_val: u16 = 0
    @min(45, 12) -> $min_val             # 12
    ? $min_val != 12 { @break() }

    ram mut $max_val: u16 = 0
    @max(45, 12) -> $max_val             # 45
    ? $max_val != 45 { @break() }

    ram mut $clamped: u16 = 0
    @clamp(150, 10, 100) -> $clamped     # 100
    ? $clamped != 100 { @break() }

    ram mut $abs_val2: u16 = 0
    @abs(0 - 25) -> $abs_val2            # 25
    ? $abs_val2 != 25 { @break() }

    # 2. Representation checks (ceil, floor, trunc, copysign, fmod)
    ram mut $ceil_val: u16 = 0
    @ceil(384) -> $ceil_val              # ceil(1.5) = 2.0 -> 512
    ? $ceil_val != 512 { @break() }

    ram mut $floor_val: u16 = 0
    @floor(384) -> $floor_val            # floor(1.5) = 1.0 -> 256
    ? $floor_val != 256 { @break() }

    ram mut $trunc_val: u16 = 0
    @trunc(0 - 384) -> $trunc_val        # trunc(-1.5) = -1.0 -> 0 - 256
    ? $trunc_val != (0 - 256) { @break() }

    ram mut $copysign_val: u16 = 0
    @copysign(256, 0 - 256) -> $copysign_val # copysign(1.0, -1.0) = -1.0
    ? $copysign_val != (0 - 256) { @break() }

    ram mut $fmod_val: u16 = 0
    @fmod(1350, 400) -> $fmod_val        # 1350 % 400 = 150
    ? $fmod_val < 145 || $fmod_val > 155 { @break() }

    # 3. Exponentials and Logarithms (exp, log, log2, log10)
    ram mut $exp_val: u16 = 0
    @exp(256) -> $exp_val                # e^1 = 2.718 -> 696
    ? $exp_val < 690 || $exp_val > 702 { @break() }

    ram mut $log_val: u16 = 0
    @log(696) -> $log_val                # ln(e) = 1.0 -> 256
    ? $log_val < 250 || $log_val > 262 { @break() }

    ram mut $log2_val: u16 = 0
    @log2(1024) -> $log2_val             # log2(4.0) = 2.0 -> 512
    ? $log2_val < 500 || $log2_val > 524 { @break() }

    # 4. Geometry and Distance (radians, degrees, hypot, dist)
    ram mut $rad_val: u16 = 0
    @radians(180) -> $rad_val            # rad(180) = pi -> 804
    ? $rad_val < 800 || $rad_val > 808 { @break() }

    ram mut $deg_val: u16 = 0
    @degrees(804) -> $deg_val            # deg(pi) -> 180
    ? $deg_val < 178 || $deg_val > 182 { @break() }

    ram mut $hypot_val: u16 = 0
    @hypot(768, 1024) -> $hypot_val      # hypot(3, 4) = 5 -> 1280
    ? $hypot_val < 1270 || $hypot_val > 1290 { @break() }

    # 5. Trigonometry (sin, cos, tan)
    ram mut $sin_val: u16 = 0
    @sin(90) -> $sin_val                 # sin(90) = 100
    ? $sin_val != 100 { @break() }

    ram mut $cos_val: u16 = 0
    @cos(60) -> $cos_val                 # cos(60) = 50
    ? $cos_val < 48 || $cos_val > 52 { @break() }

    # 6. Hyperbolic Functions (sinh, cosh, tanh, asinh)
    ram mut $sinh_val: u16 = 0
    @sinh(256) -> $sinh_val              # sinh(1.0) = 1.175 -> 301
    ? $sinh_val < 295 || $sinh_val > 307 { @break() }

    ram mut $cosh_val: u16 = 0
    @cosh(256) -> $cosh_val              # cosh(1.0) = 1.543 -> 395
    ? $cosh_val < 390 || $cosh_val > 400 { @break() }

    ram mut $tanh_val: u16 = 0
    @tanh(256) -> $tanh_val              # tanh(1.0) = 0.761 -> 195
    ? $tanh_val < 190 || $tanh_val > 200 { @break() }

    # 7. Combinatorics & Theory (gcd, lcm, factorial, fibonacci, perm, gamma)
    ram mut $gcd_val: u16 = 0
    @gcd(48, 18) -> $gcd_val             # 6
    ? $gcd_val != 6 { @break() }

    ram mut $lcm_val: u16 = 0
    @lcm(48, 18) -> $lcm_val             # 144
    ? $lcm_val != 144 { @break() }

    ram mut $fact_val: u16 = 0
    @factorial(6) -> $fact_val           # 720
    ? $fact_val != 720 { @break() }

    ram mut $perm_val: u16 = 0
    @perm(5, 3) -> $perm_val             # P(5,3) = 60
    ? $perm_val != 60 { @break() }

    ram mut $gamma_val: u16 = 0
    @gamma(5) -> $gamma_val              # Gamma(5) = 4! = 24
    ? $gamma_val != 24 { @break() }

    # All checks passed successfully!
    ram imut $success: u8 = 1

    loop * {
        # Loop forever
    }
}
