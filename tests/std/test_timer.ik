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

import std/timer

@main {
    ram mut $ok: u8 = 1

    ? %TMR0_CTRLA != 0 {
        @timer0_ctc_mode()
        @timer0_set_prescaler(5)
    }

    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]
    loop * {}
}
