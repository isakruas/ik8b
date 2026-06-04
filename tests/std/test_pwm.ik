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

import std/pwm

@main {
    ram mut $ok: u8 = 1

    ? %PWM0_CTRLA != 0 {
        @pwm0_init_fast(5)
        @pwm0_set_duty_a(128)
        @pwm0_enable_output_a()
    }

    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]
    loop * {}
}
