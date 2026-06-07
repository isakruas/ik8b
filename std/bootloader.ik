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
# Serial Bootloader Library
# -------------------------------------------------------------
# A ready-made serial bootloader that lives in the Boot Loader Section and
# rewrites the *application* section of flash with an image streamed over UART0
# by the IDE. Everything that depends ONLY on the chip (flash page size and the
# start of the boot section) is selected automatically from the target, the same
# way std/uart and std/gpio pick the right registers. Each target block below
# even carries its own `boot` directive, so the program is automatically located
# in the Boot Loader Section — the user just declares the target and provides the
# UART divisor for their crystal + baud:
#
#   target atmega32
#   import std/bootloader
#   @main { @bootloader_run(51) }   # 51 = 8 MHz / (16*9600) - 1
#
# Only chips that have a hardware UART, self-programming (SPM) and a real boot
# section whose application area fits below 64 KB are listed.
#
# Wire protocol (host = IDE, target = this bootloader); integers big-endian:
#
#   Frame  host -> target:  0x1B 'i' 'k'  CMD  LEN_HI LEN_LO  payload[LEN]  CRC_HI CRC_LO
#                           CRC-16/ARC (poly 0xA001, init 0) over CMD,LEN_HI,LEN_LO,payload.
#   Reply  target -> host:  0x06 (ACK) or 0x15 (NAK), then command-specific bytes.
#
#   CMD 0x01 HELLO  payload: (none)  -> ACK, VER, PAGE_HI, PAGE_LO, APPEND_HI, APPEND_LO
#   CMD 0x02 WRITE  payload: ADDR_HI ADDR_LO  <PAGE_SIZE data bytes>  -> ACK | NAK
#   CMD 0x04 RUN    payload: (none)  -> ACK, then jump to the application at 0x0000
#
# Security / validation rules (enforced below):
#   - every frame is CRC-16 checked; a bad CRC is NAKed and ignored.
#   - WRITE is rejected (NAK) unless the page address is page-aligned and the
#     whole page lies strictly below the boot section -> the bootloader can
#     never erase/overwrite itself nor write past the application section.
#   - interrupts are disabled around every SPM sequence.
#   - with no valid sync inside the startup window, the existing application is
#     started, so a normally-flashed board boots without the IDE.

import std/uart
import std/boot
import std/crc

# ============================================================================
# Per-target data: flash page size and boot section start. Auto-selected from
# the declared target, exactly like the other std libraries.
# ============================================================================

? target == at90can32 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0x6000
    boot 0x6000
}

? target == at90can64 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == at90pwm216 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3000
    boot 0x3000
}

? target == at90pwm2b {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == at90pwm316 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3000
    boot 0x3000
}

? target == at90pwm3b {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == ata6612c {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == ata6613c {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == ata6614q {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega16 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega162 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega163 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega164a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega164p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega164pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega165 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega165a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega165p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega165pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega168 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega168a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega168p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega168pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega169 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega169a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega169p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega169pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega16a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x3800
    boot 0x3800
}

? target == atmega32 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega324a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega324p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega324pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega325 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3250 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3250a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3250p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3250pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega325a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega325p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega325pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega328 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega328p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega329 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3290 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3290a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3290p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega3290pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega329a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega329p {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega329pa {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega32a {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    const BOOT_ORIGIN: u16 = 0x7000
    boot 0x7000
}

? target == atmega64 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega640 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega644 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega644a {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega644p {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega644pa {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega645 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega6450 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega6450a {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega6450p {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega645a {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega645p {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega649 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega6490 {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega6490a {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega6490p {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega649a {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega649p {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega64a {
    const PAGE_SIZE:   u16 = 256
    const PAGE_MASK:   u16 = 255
    const BOOT_ORIGIN: u16 = 0xE000
    boot 0xE000
}

? target == atmega8 {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega8515 {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega8535 {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega88 {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega88a {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega88p {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega88pa {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega88pb {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == atmega8a {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}

? target == attiny828 {
    const PAGE_SIZE:   u16 = 64
    const PAGE_MASK:   u16 = 63
    const BOOT_ORIGIN: u16 = 0x1800
    boot 0x1800
}


# ============================================================================
# Protocol constants (chip-independent).
# ============================================================================
const SOF0: u8 = 0x1B
const SOF1: u8 = 0x69          # 'i'
const SOF2: u8 = 0x6B          # 'k'
const ACK:  u8 = 0x06
const NAK:  u8 = 0x15
const CMD_HELLO: u8 = 0x01
const CMD_WRITE: u8 = 0x02
const CMD_RUN:   u8 = 0x04
const PROTO_VER: u8 = 1

# Coarse startup window (outer x inner UART polls) before running the app.
const BL_WAIT_OUTER: u16 = 250
const BL_WAIT_INNER: u16 = 2000

# Read `$n` bytes from the UART into the buffer at offset `$off`.
@bl_read_into($buf: ptr ram u8, $off: u16, $n: u16) {
    loop 0..$n -> $i {
        ram imut $b: u8 = @uart_receive()
        $b -> *($buf + $off + $i)
    }
}

# Block until the 3-byte sync magic (0x1B 'i' 'k') arrives. Every frame is
# prefixed with it, so this also resynchronises after any garbled frame.
@bl_resync() {
    ram mut $state: u8 = 0
    loop * {
        ram imut $b: u8 = @uart_receive()
        ? $state == 0 {
            ? $b == SOF0 { 1 -> $state }
        } : {
            ? $state == 1 {
                ? $b == SOF1 { 2 -> $state } : { 0 -> $state }
            } : {
                ? $b == SOF2 { return } : { 0 -> $state }
            }
        }
    }
}

# Wait for the 3-byte sync magic, polling without blocking so we can time out.
# Returns 1 when sync is seen, 0 on timeout.
@bl_wait_sync() -> u8 {
    ram mut $state: u8 = 0
    loop 0..BL_WAIT_OUTER -> $o {
        loop 0..BL_WAIT_INNER -> $j {
            ? @uart_available() != 0 {
                ram imut $b: u8 = @uart_receive()
                ? $state == 0 {
                    ? $b == SOF0 { 1 -> $state }
                } : {
                    ? $state == 1 {
                        ? $b == SOF1 { 2 -> $state } : { 0 -> $state }
                    } : {
                        ? $b == SOF2 { return 1 } : { 0 -> $state }
                    }
                }
            }
        }
    }
    return 0
}

# Program one flash page from buffer[$data_off .. +PAGE_SIZE] at page byte
# address $addr. The caller has already validated $addr.
@bl_write_page($buf: ptr ram u8, $addr: u16, $data_off: u16) {
    @cli()
    @boot_page_erase($addr)
    ram imut $words: u16 = PAGE_SIZE / 2
    loop 0..$words -> $k {
        ram imut $lo: u16 = *($buf + $data_off + ($k * 2))
        ram imut $hi: u16 = *($buf + $data_off + ($k * 2) + 1)
        @boot_page_fill($addr + ($k * 2), $lo + ($hi * 256))
    }
    @boot_page_write($addr)
    @boot_rww_enable()
}

# Handle one validated (CRC-checked) frame.
@bl_dispatch($buf: ptr ram u8, $cmd: u8, $len: u16) {
    ? $cmd == CMD_HELLO {
        @uart_send(ACK)
        @uart_send(PROTO_VER)
        @uart_send(PAGE_SIZE / 256)
        @uart_send(PAGE_SIZE & 0xFF)
        @uart_send(BOOT_ORIGIN / 256)
        @uart_send(BOOT_ORIGIN & 0xFF)
        return
    }
    ? $cmd == CMD_RUN {
        @uart_send(ACK)
        @boot_rww_enable()
        @goto(0)
    }
    ? $cmd == CMD_WRITE {
        ram imut $addr: u16 = (*($buf + 3) * 256) + *($buf + 4)
        # Security: page-aligned, inside the application section, whole page
        # below the boot section, and exactly one page of data.
        ram mut $ok: u8 = 1
        ? ($addr & PAGE_MASK) != 0 { 0 -> $ok }
        ? $addr >= BOOT_ORIGIN { 0 -> $ok }
        ? ($addr + PAGE_SIZE) > BOOT_ORIGIN { 0 -> $ok }
        ? $len != (PAGE_SIZE + 2) { 0 -> $ok }
        ? $ok == 1 {
            @bl_write_page($buf, $addr, 5)
            @uart_send(ACK)
        } : {
            @uart_send(NAK)
        }
        return
    }
    @uart_send(NAK)
}

# Bootloader entry point. Initialises UART0 at the given divisor, waits briefly
# for the IDE, then either services the upload protocol or starts the existing
# application. `$ubrr` = F_CPU / (16 * baud) - 1 for the board's crystal + baud.
@bootloader_run($ubrr: u16) {
    # Frame scratch: CMD + LEN(2) + payload(<=PAGE_SIZE+2) + CRC(2).
    ram mut $frame: u8[263] = 0

    @uart_init($ubrr)

    # Startup window: if nobody syncs, run whatever is already in flash.
    ? @bl_wait_sync() == 0 {
        @goto(0)
    }

    loop * {
        # CMD (1) + LEN (2).
        @bl_read_into(&$frame[0], 0, 3)
        ram imut $cmd: u8 = $frame[0]
        ram imut $len: u16 = ($frame[1] * 256) + $frame[2]

        ? $len > (PAGE_SIZE + 2) {
            # Reject oversized frames (still drain the trailing CRC bytes).
            @bl_read_into(&$frame[0], 3, 2)
            @uart_send(NAK)
        } : {
            # Payload then the 2 CRC bytes, contiguous after CMD/LEN.
            @bl_read_into(&$frame[0], 3, $len + 2)
            ram imut $rx_crc: u16 = ($frame[3 + $len] * 256) + $frame[4 + $len]
            ram imut $calc: u16 = @crc16(&$frame[0], 3 + $len)
            ? $calc != $rx_crc {
                @uart_send(NAK)
            } : {
                @bl_dispatch(&$frame[0], $cmd, $len)
            }
        }
        # Every frame is self-framed: wait for the next one's sync magic.
        @bl_resync()
    }
}
