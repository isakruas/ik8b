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
# Two-Wire Interface (TWI/I2C) Driver for AVR Microcontrollers
# -------------------------------------------------------------

? namespace == atmega328p {
    # TWI Bit Rate Register
    const %TWBR: u16 = 0x00B8
    # TWI Status Register (TWS7:3, TWPS1:0)
    const %TWSR: u16 = 0x00B9
    # TWI Data Register
    const %TWDR: u16 = 0x00BB
    # TWI Control Register (TWINT, TWEA, TWSTA, TWSTO, TWWC, TWEN, TWIE)
    const %TWCR: u16 = 0x00BC

    # Blocks execution until the TWI Interrupt Flag (TWINT) is set, signaling hardware operation complete
    @_twi_wait() {
        loop * {
            mut $ctrl: u8 = %TWCR
            mut $twint: u8 = $ctrl & 0x80
            ? $twint != 0 { loop_break }
        }
    }

    # Initializes TWI bit rate prescaler and enables the TWI peripheral interface
    @twi_init($twbr_val: u8) {
        $twbr_val -> %TWBR
        # Set prescaler bits TWPS1:0 to 0 (Prescaler = 1)
        0x00 -> %TWSR
        # Enable TWI interface (TWEN=1)
        0x04 -> %TWCR
    }

    # Generates a TWI START condition by driving TWSTA and TWINT high in the control register
    @twi_start() {
        # TWINT=1, TWSTA=1, TWEN=1
        0xA4 -> %TWCR
        @_twi_wait()
    }

    # Generates a TWI STOP condition by driving TWSTO and TWINT high in the control register
    @twi_stop() {
        # TWINT=1, TWSTO=1, TWEN=1
        0x94 -> %TWCR
    }

    # Writes a single byte payload to the TWI bus and initiates transmission
    @twi_write($data: u8) {
        $data -> %TWDR
        # TWINT=1, TWEN=1 to transmit
        0x84 -> %TWCR
        @_twi_wait()
    }

    # Reads a byte from TWI bus and returns ACK to the sender, indicating further data expected
    @twi_read_ack() -> u8 {
        # TWINT=1, TWEA=1, TWEN=1 to read with ACK enabled
        0xC4 -> %TWCR
        @_twi_wait()
        return %TWDR
    }

    # Reads a byte from TWI bus and returns NACK to the sender, indicating end of transmission
    @twi_read_nack() -> u8 {
        # TWINT=1, TWEN=1 to read with ACK disabled (NACK)
        0x84 -> %TWCR
        @_twi_wait()
        return %TWDR
    }
}

? namespace == atmega2560 {
    # TWI Bit Rate Register
    const %TWBR: u16 = 0x00B8
    # TWI Status Register
    const %TWSR: u16 = 0x00B9
    # TWI Data Register
    const %TWDR: u16 = 0x00BB
    # TWI Control Register
    const %TWCR: u16 = 0x00BC

    # Blocks execution until the TWI Interrupt Flag (TWINT) is set, signaling hardware operation complete
    @_twi_wait() {
        loop * {
            mut $ctrl: u8 = %TWCR
            mut $twint: u8 = $ctrl & 0x80
            ? $twint != 0 { loop_break }
        }
    }

    # Initializes TWI bit rate prescaler and enables TWI peripheral interface
    @twi_init($twbr_val: u8) {
        $twbr_val -> %TWBR
        # Set prescaler to 1
        0x00 -> %TWSR
        # Enable TWI
        0x04 -> %TWCR
    }

    # Generates TWI START condition
    @twi_start() {
        # TWINT=1, TWSTA=1, TWEN=1
        0xA4 -> %TWCR
        @_twi_wait()
    }

    # Generates TWI STOP condition
    @twi_stop() {
        # TWINT=1, TWSTO=1, TWEN=1
        0x94 -> %TWCR
    }

    # Writes a single byte payload to the TWI bus
    @twi_write($data: u8) {
        $data -> %TWDR
        # TWINT=1, TWEN=1
        0x84 -> %TWCR
        @_twi_wait()
    }

    # Reads a byte from TWI bus and returns ACK
    @twi_read_ack() -> u8 {
        # TWINT=1, TWEA=1, TWEN=1
        0xC4 -> %TWCR
        @_twi_wait()
        return %TWDR
    }

    # Reads a byte from TWI bus and returns NACK
    @twi_read_nack() -> u8 {
        # TWINT=1, TWEN=1
        0x84 -> %TWCR
        @_twi_wait()
        return %TWDR
    }
}

? namespace == atmega32u4 {
    # TWI Bit Rate Register
    const %TWBR: u16 = 0x00D8
    # TWI Status Register
    const %TWSR: u16 = 0x00D9
    # TWI Data Register
    const %TWDR: u16 = 0x00DB
    # TWI Control Register
    const %TWCR: u16 = 0x00DC

    # Blocks execution until the TWI Interrupt Flag (TWINT) is set, signaling hardware operation complete
    @_twi_wait() {
        loop * {
            mut $ctrl: u8 = %TWCR
            mut $twint: u8 = $ctrl & 0x80
            ? $twint != 0 { loop_break }
        }
    }

    # Initializes TWI bit rate prescaler and enables TWI peripheral interface
    @twi_init($twbr_val: u8) {
        $twbr_val -> %TWBR
        # Set prescaler to 1
        0x00 -> %TWSR
        # Enable TWI
        0x04 -> %TWCR
    }

    # Generates TWI START condition
    @twi_start() {
        # TWINT=1, TWSTA=1, TWEN=1
        0xA4 -> %TWCR
        @_twi_wait()
    }

    # Generates TWI STOP condition
    @twi_stop() {
        # TWINT=1, TWSTO=1, TWEN=1
        0x94 -> %TWCR
    }

    # Writes a single byte payload to the TWI bus
    @twi_write($data: u8) {
        $data -> %TWDR
        # TWINT=1, TWEN=1
        0x84 -> %TWCR
        @_twi_wait()
    }

    # Reads a byte from TWI bus and returns ACK
    @twi_read_ack() -> u8 {
        # TWINT=1, TWEA=1, TWEN=1
        0xC4 -> %TWCR
        @_twi_wait()
        return %TWDR
    }

    # Reads a byte from TWI bus and returns NACK
    @twi_read_nack() -> u8 {
        # TWINT=1, TWEN=1
        0x84 -> %TWCR
        @_twi_wait()
        return %TWDR
    }
}
