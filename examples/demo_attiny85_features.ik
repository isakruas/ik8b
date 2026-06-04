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

# Example demonstrating the use of the unified ik8b Standard Library on ATtiny85

target attiny85

import std/gpio
import std/math

@main {
    # 1. GPIO: Configure PB0 (pin 5 on ATtiny85) as output
    @pin_mode_b(0, 1)
    
    # 2. Math: Clamp a value
    ram mut $clamped: u16 = 0
    @clamp(150, 10, 100) -> $clamped   # Will clamp to 100
    
    # 3. GPIO: Turn on PB0 if clamp is 100
    ? $clamped == 100 {
        @digital_write_b(0, 1)
    }

    loop * {
        # Keep running
    }
}
