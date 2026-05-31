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
# SPI Peripheral Driver for AVR Microcontrollers
# -------------------------------------------------------------

? namespace == atmega328p {
    # Port B Data Direction Register
    const %DDRB: u16 = 0x0024
    # SPI Control Register (SPIE, SPE, DORD, MSTR, CPOL, CPHA, SPR1, SPR0)
    const %SPCR: u16 = 0x004C
    # SPI Status Register (SPIF, WCOL, SPI2X)
    const %SPSR: u16 = 0x004D
    # SPI Data Register
    const %SPDR: u16 = 0x004E

    # Configures SPI Master Mode (ATmega328p: PB3=MOSI, PB5=SCK, PB2=SS outputs)
    @spi_init_master() {
        ram mut $ddr: u8 = %DDRB
        # Set MOSI (Bit 3), SCK (Bit 5), and SS (Bit 2) as outputs
        $ddr | 0x2C -> $ddr
        $ddr -> %DDRB
        # Enable SPI (SPE=1), Master Mode (MSTR=1), Clock Rate Fosc/16 (SPR0=1)
        0x51 -> %SPCR
    }

    # Transmits and receives a byte via SPI, polling the Serial Transfer Complete (SPIF) flag
    @spi_transfer($data: u8) -> u8 {
        $data -> %SPDR
        loop * {
            ram imut $status: u8 = %SPSR
            ram imut $spif: u8 = $status & 0x80
            ? $spif != 0 { return %SPDR }
        }
        return %SPDR
    }
}

? namespace == atmega2560 {
    # Port B Data Direction Register
    const %DDRB: u16 = 0x0024
    # SPI Control Register
    const %SPCR: u16 = 0x004C
    # SPI Status Register
    const %SPSR: u16 = 0x004D
    # SPI Data Register
    const %SPDR: u16 = 0x004E

    # Configures SPI Master Mode (ATmega2560: PB2=MOSI, PB1=SCK, PB0=SS outputs)
    @spi_init_master() {
        ram mut $ddr: u8 = %DDRB
        # Set MOSI (Bit 2), SCK (Bit 1), and SS (Bit 0) as outputs
        $ddr | 0x07 -> $ddr
        $ddr -> %DDRB
        # Enable SPI (SPE=1), Master Mode (MSTR=1), Clock Rate Fosc/16 (SPR0=1)
        0x51 -> %SPCR
    }

    # Transmits and receives a byte via SPI, polling the SPIF flag
    @spi_transfer($data: u8) -> u8 {
        $data -> %SPDR
        loop * {
            ram imut $status: u8 = %SPSR
            ram imut $spif: u8 = $status & 0x80
            ? $spif != 0 { return %SPDR }
        }
        return %SPDR
    }
}

? namespace == atmega32u4 {
    # Port B Data Direction Register
    const %DDRB: u16 = 0x0024
    # SPI Control Register
    const %SPCR: u16 = 0x004C
    # SPI Status Register
    const %SPSR: u16 = 0x004D
    # SPI Data Register
    const %SPDR: u16 = 0x004E

    # Configures SPI Master Mode (ATmega32u4: PB2=MOSI, PB1=SCK, PB0=SS outputs)
    @spi_init_master() {
        ram mut $ddr: u8 = %DDRB
        # Set MOSI (Bit 2), SCK (Bit 1), and SS (Bit 0) as outputs
        $ddr | 0x07 -> $ddr
        $ddr -> %DDRB
        # Enable SPI (SPE=1), Master Mode (MSTR=1), Clock Rate Fosc/16 (SPR0=1)
        0x51 -> %SPCR
    }

    # Transmits and receives a byte via SPI, polling the SPIF flag
    @spi_transfer($data: u8) -> u8 {
        $data -> %SPDR
        loop * {
            ram imut $status: u8 = %SPSR
            ram imut $spif: u8 = $status & 0x80
            ? $spif != 0 { return %SPDR }
        }
        return %SPDR
    }
}
