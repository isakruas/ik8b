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

 

import std/uart

@main {
    ram mut $ok: u8 = 1

    # 1. UART0 (Available on atmega328p, atmega2560, and atmega32u4 namespaces)
    ? namespace == atmega328p {
        ? 0 == 1 {
            @uart_init(12)
            @uart_send(65) # Send 'A'
            ram imut $avail: u8 = @uart_available()
            ram imut $rx: u8 = @uart_receive()
            @uart_print_char(67) # 'C'
            @uart_println()
        }
    }
    ? namespace == atmega2560 {
        ? 0 == 1 {
            @uart_init(12)
            @uart_send(65)
            ram imut $avail: u8 = @uart_available()
            ram imut $rx: u8 = @uart_receive()
            @uart_print_char(67)
            @uart_println()
        }
    }
    ? namespace == atmega32u4 {
        ? 0 == 1 {
            @uart_init(12)
            @uart_send(65)
            ram imut $avail: u8 = @uart_available()
            ram imut $rx: u8 = @uart_receive()
            @uart_print_char(67)
            @uart_println()
        }
    }

    # 2. UART1 (Available on atmega2560 namespace only)
    ? namespace == atmega2560 {
        ? 0 == 1 {
            @uart1_init(12)
            @uart1_send(66) # Send 'B'
            ram imut $rx1: u8 = @uart1_receive()
        }
    }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
