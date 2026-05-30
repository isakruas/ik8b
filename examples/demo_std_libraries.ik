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

# Example demonstrating the use of the unified ik8b Standard Library on ATmega328p

namespace atmega328p

import std/gpio
import std/uart
import std/spi
import std/twi
import std/math

@main {
    # 1. GPIO: Configure PB5 (pin 13 on Arduino Uno / Built-in LED) as output
    @pin_mode_b(5, 1)
    
    # 2. UART: Initialize Serial at 9600 bps divisor (103)
    @uart_init(103)
    
    # 3. SPI: Initialize SPI Master Mode
    @spi_init_master()
    
    # 4. TWI: Initialize I2C Master at 100KHz (72)
    @twi_init(72)
    
    # 5. Math: Clamp a value and map it
    mut $clamped: u16 = 0
    @clamp(150, 10, 100) -> $clamped   # Will clamp to 100
    
    mut $mapped: u16 = 0
    @map($clamped, 0, 100, 0, 255) -> $mapped # Will map 100 to 255
    
    # 6. Serial Transmit to terminal: Send the mapped byte
    mut $mapped8: u8 = 0
    $mapped & 0xFF -> $mapped8
    @uart_send($mapped8)
    
    # 7. GPIO: Turn on LED
    @digital_write_b(5, 1)

    loop * {
        # Keep running
    }
}
