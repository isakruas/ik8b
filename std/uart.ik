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

# -------------------------------------------------------------
# USART Register Offsets and Configurations for AVR Devices
# -------------------------------------------------------------

? namespace == atmega328p {
    # USART0 Control and Status Register A (RXC0, TXC0, UDRE0, FE0, DOR0, UPE0, U2X0, MPCM0)
    const %UCSR0A: u16 = 0x00C0
    # USART0 Control and Status Register B (RXCIE0, TXCIE0, UDRIE0, RXEN0, TXEN0, UCSZ02, RXB80, TXB80)
    const %UCSR0B: u16 = 0x00C1
    # USART0 Control and Status Register C (UMSEL01, UMSEL00, UPM01, UPM00, USBS0, UCSZ01, UCSZ00, UCPOL0)
    const %UCSR0C: u16 = 0x00C2
    # USART0 Baud Rate Register Low Byte
    const %UBRR0L: u16 = 0x00C4
    # USART0 Baud Rate Register High Byte
    const %UBRR0H: u16 = 0x00C5
    # USART0 I/O Data Register
    const %UDR0: u16   = 0x00C6

    # Initializes USART0 with calculated baud rate prescaler, enabling TX and RX, 8-bit data, 1-bit stop
    @uart_init($ubrr: u16) {
        ram imut $ubrr_lo: u8 = $ubrr & 0xFF
        ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
        $ubrr_lo -> %UBRR0L
        $ubrr_hi -> %UBRR0H
        # Enable Receiver (RXEN0=1) and Transmitter (TXEN0=1)
        0x18 -> %UCSR0B
        # Set frame format: 8 data bits (UCSZ01:0=3), 1 stop bit (USBS0=0), Asynchronous mode
        0x06 -> %UCSR0C
    }

    @_uart_wait_tx() {
        loop * {
            ram imut $status: u8 = %UCSR0A
            ram imut $udre: u8 = $status & 0x20
            ? $udre != 0 { return }
        }
    }

    # Transmits a single byte over USART0, polling the Data Register Empty (UDRE0) flag
    @uart_send($data: u8) {
        @_uart_wait_tx()
        $data -> %UDR0
    }

    # Receives a single byte over USART0, polling the Receive Complete (RXC0) flag
    @uart_receive() -> u8 {
        loop * {
            ram imut $status: u8 = %UCSR0A
            ram imut $rxc: u8 = $status & 0x80
            ? $rxc != 0 { return %UDR0 }
        }
        return %UDR0
    }

    # Checks if data has been received and is available to read in USART0 (RXC0 flag)
    @uart_available() -> u8 {
        ram imut $status: u8 = %UCSR0A
        ram imut $rxc: u8 = $status & 0x80
        ? $rxc != 0 { return 1 }
        return 0
    }

    # Transmits a single character byte over USART0
    @uart_print_char($char: u8) { @uart_send($char) }

    # Transmits a Carriage Return (CR, ASCII 13) followed by Line Feed (LF, ASCII 10)
    @uart_println() {
        @uart_send(13)
        @uart_send(10)
    }
}

? namespace == atmega2560 {
    # USART0 Control and Status Register A
    const %UCSR0A: u16 = 0x00C0
    # USART0 Control and Status Register B
    const %UCSR0B: u16 = 0x00C1
    # USART0 Control and Status Register C
    const %UCSR0C: u16 = 0x00C2
    # USART0 Baud Rate Register Low Byte
    const %UBRR0L: u16 = 0x00C4
    # USART0 Baud Rate Register High Byte
    const %UBRR0H: u16 = 0x00C5
    # USART0 I/O Data Register
    const %UDR0: u16   = 0x00C6

    # USART1 Control and Status Register A
    const %UCSR1A: u16 = 0x00C8
    # USART1 Control and Status Register B
    const %UCSR1B: u16 = 0x00C9
    # USART1 Control and Status Register C
    const %UCSR1C: u16 = 0x00CA
    # USART1 Baud Rate Register Low Byte
    const %UBRR1L: u16 = 0x00CC
    # USART1 Baud Rate Register High Byte
    const %UBRR1H: u16 = 0x00CD
    # USART1 I/O Data Register
    const %UDR1: u16   = 0x00CE

    # Initializes USART0 with calculated baud rate prescaler, enabling TX and RX
    @uart_init($ubrr: u16) {
        ram imut $ubrr_lo: u8 = $ubrr & 0xFF
        ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
        $ubrr_lo -> %UBRR0L
        $ubrr_hi -> %UBRR0H
        # Enable RXEN0=1, TXEN0=1
        0x18 -> %UCSR0B
        # 8-bit character size, 1 stop bit
        0x06 -> %UCSR0C
    }

    @_uart_wait_tx() {
        loop * {
            ram imut $status: u8 = %UCSR0A
            ram imut $udre: u8 = $status & 0x20
            ? $udre != 0 { return }
        }
    }

    # Transmits a single byte over USART0, polling the UDRE0 flag
    @uart_send($data: u8) {
        @_uart_wait_tx()
        $data -> %UDR0
    }

    # Receives a single byte over USART0, polling the RXC0 flag
    @uart_receive() -> u8 {
        loop * {
            ram imut $status: u8 = %UCSR0A
            ram imut $rxc: u8 = $status & 0x80
            ? $rxc != 0 { return %UDR0 }
        }
        return %UDR0
    }

    # Checks if data is available to read in USART0 (RXC0 flag)
    @uart_available() -> u8 {
        ram imut $status: u8 = %UCSR0A
        ram imut $rxc: u8 = $status & 0x80
        ? $rxc != 0 { return 1 }
        return 0
    }

    # Transmits a single character byte over USART0
    @uart_print_char($char: u8) { @uart_send($char) }

    # Transmits a CR followed by LF over USART0
    @uart_println() {
        @uart_send(13)
        @uart_send(10)
    }

    # Initializes USART1 with calculated baud rate prescaler, enabling TX and RX
    @uart1_init($ubrr: u16) {
        ram imut $ubrr_lo: u8 = $ubrr & 0xFF
        ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
        $ubrr_lo -> %UBRR1L
        $ubrr_hi -> %UBRR1H
        # Enable RXEN1=1, TXEN1=1
        0x18 -> %UCSR1B
        # 8-bit character size, 1 stop bit
        0x06 -> %UCSR1C
    }

    @_uart1_wait_tx() {
        loop * {
            ram imut $status: u8 = %UCSR1A
            ram imut $udre: u8 = $status & 0x20
            ? $udre != 0 { return }
        }
    }

    # Transmits a single byte over USART1, polling the UDRE1 flag
    @uart1_send($data: u8) {
        @_uart1_wait_tx()
        $data -> %UDR1
    }

    # Receives a single byte over USART1, polling the RXC1 flag
    @uart1_receive() -> u8 {
        loop * {
            ram imut $status: u8 = %UCSR1A
            ram imut $rxc: u8 = $status & 0x80
            ? $rxc != 0 { return %UDR1 }
        }
        return %UDR1
    }
}

? namespace == atmega32u4 {
    # USART1 Control and Status Register A
    const %UCSR1A: u16 = 0x00C8
    # USART1 Control and Status Register B
    const %UCSR1B: u16 = 0x00C9
    # USART1 Control and Status Register C
    const %UCSR1C: u16 = 0x00CA
    # USART1 Baud Rate Register Low Byte
    const %UBRR1L: u16 = 0x00CC
    # USART1 Baud Rate Register High Byte
    const %UBRR1H: u16 = 0x00CD
    # USART1 I/O Data Register
    const %UDR1: u16   = 0x00CE

    # Initializes USART1 as the primary UART interface (ATmega32u4 lacks USART0)
    @uart_init($ubrr: u16) {
        ram imut $ubrr_lo: u8 = $ubrr & 0xFF
        ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
        $ubrr_lo -> %UBRR1L
        $ubrr_hi -> %UBRR1H
        # Enable RXEN1=1, TXEN1=1
        0x18 -> %UCSR1B
        # 8-bit character size, 1 stop bit
        0x06 -> %UCSR1C
    }

    @_uart_wait_tx() {
        loop * {
            ram imut $status: u8 = %UCSR1A
            ram imut $udre: u8 = $status & 0x20
            ? $udre != 0 { return }
        }
    }

    # Transmits a single byte over USART1, polling the UDRE1 flag
    @uart_send($data: u8) {
        @_uart_wait_tx()
        $data -> %UDR1
    }

    # Receives a single byte over USART1, polling the RXC1 flag
    @uart_receive() -> u8 {
        loop * {
            ram imut $status: u8 = %UCSR1A
            ram imut $rxc: u8 = $status & 0x80
            ? $rxc != 0 { return %UDR1 }
        }
        return %UDR1
    }

    # Checks if data is available to read in USART1 (RXC1 flag)
    @uart_available() -> u8 {
        ram imut $status: u8 = %UCSR1A
        ram imut $rxc: u8 = $status & 0x80
        ? $rxc != 0 { return 1 }
        return 0
    }

    # Transmits a single character byte over USART1
    @uart_print_char($char: u8) { @uart_send($char) }

    # Transmits a CR followed by LF over USART1
    @uart_println() {
        @uart_send(13)
        @uart_send(10)
    }
}
