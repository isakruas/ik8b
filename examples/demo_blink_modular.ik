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

# Modular blink: toggles PB5 (the Arduino Uno LED) forever, with the delay
# factored into a local module to demonstrate user-file imports.
# Build from the repository root:  ./ik8b build examples/demo_blink_modular.ik

target atmega328p

import examples/demo_delay

const %DDRB:  u8 = 0x24
const %PORTB: u8 = 0x25

@main {
    0x20 -> %DDRB              # PB5 as output
    loop * {
        0x20 -> %PORTB         # LED on
        @blink_pause()
        0x00 -> %PORTB         # LED off
        @blink_pause()
    }
}
