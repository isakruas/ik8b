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

# Blink LED on pin PB0 (Arduino Uno) in ik8b
# Based on the hardware register mapping described in SPECIFICATION.md

namespace atmega328p

const %PORTB: u16 = 0x0025
const %DDRB: u16 = 0x0024

@main {
    0x01 -> %DDRB      # PB0 as output

    loop * {
        0x01 -> %PORTB     # LED on
        @delay_ms(10)      # Using 10 instead of 500 for fast simulation
        0x00 -> %PORTB     # LED off
        @delay_ms(10)
    }
}

@delay_ms($ms: u16) {
    loop 0..$ms -> $i {
        loop 0..10 -> $j {
            # busy wait
        }
    }
}
