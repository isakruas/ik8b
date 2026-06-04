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

import std/gpio

@main {
    ram mut $ok: u8 = 1

    # 1. Test _gpio_mask helper (universal helper)
    ? @_gpio_mask(0) != 1 { 0 -> $ok }
    ? @_gpio_mask(3) != 8 { 0 -> $ok }
    ? @_gpio_mask(7) != 128 { 0 -> $ok }

    # Port tests: verify compilation and basic execution.
    # Result verification is omitted as the VM does not simulate I/O hardware registers (PINx).

    # Port B (Available on many MCUs like attiny85, atmega328p, atmega2560, atmega32u4)
    ? target == attiny85 {
        @pin_mode_b(1, 1)
        @digital_write_b(1, 1)
        @toggle_b(1)
    }
    ? target == atmega328p {
        @pin_mode_b(1, 1)
        @digital_write_b(1, 1)
        @toggle_b(1)
    }
    ? target == atmega2560 {
        @pin_mode_b(1, 1)
        @digital_write_b(1, 1)
        @toggle_b(1)
    }
    ? target == atmega32u4 {
        @pin_mode_b(1, 1)
        @digital_write_b(1, 1)
        @toggle_b(1)
    }

    # Port A (Available on atmega2560)
    ? target == atmega2560 {
        @pin_mode_a(2, 1)
        @digital_write_a(2, 1)
        @toggle_a(2)
    }

    # Port C (Available on atmega328p, atmega2560, and atmega32u4)
    ? target == atmega328p {
        @pin_mode_c(1, 1)
        @digital_write_c(1, 1)
        @toggle_c(1)
    }
    ? target == atmega2560 {
        @pin_mode_c(1, 1)
        @digital_write_c(1, 1)
        @toggle_c(1)
    }
    ? target == atmega32u4 {
        @pin_mode_c(1, 1)
        @digital_write_c(1, 1)
        @toggle_c(1)
    }

    # Port D (Available on atmega328p, atmega2560, and atmega32u4)
    ? target == atmega328p {
        @pin_mode_d(0, 1)
        @digital_write_d(0, 1)
        @toggle_d(0)
    }
    ? target == atmega2560 {
        @pin_mode_d(0, 1)
        @digital_write_d(0, 1)
        @toggle_d(0)
    }
    ? target == atmega32u4 {
        @pin_mode_d(0, 1)
        @digital_write_d(0, 1)
        @toggle_d(0)
    }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}