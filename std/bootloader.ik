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
# section are listed, and then only when the bootloader (~3.3 KB) stays at or
# below ~11% of flash -- i.e. 32 KB and 64 KB parts -- and avrdude recognises
# the part name (the IDE flashes the image with avrdude). This list must stay in
# sync with has_bootloader_support() in the IDE (src/core/bootloader.rs).
#
# Wire protocol (host = IDE, target = this bootloader); ADDR is big-endian:
#
#   Frame  host -> target:  0x1B 'i' 'k'  CMD  payload  CRC8
#                           CRC-8/MAXIM (poly 0x8C reflected, init 0) over CMD and payload.
#   Reply  target -> host:  0x06 (ACK) or 0x15 (NAK), then command-specific bytes.
#
#   CMD 0x02 WRITE  payload: ADDR_HI ADDR_LO  <PAGE_SIZE data bytes>  -> ACK | NAK
#   CMD 0x04 RUN    payload: (none)                                   -> ACK, then jump to 0x0000
#
# The protocol has no HELLO handshake and no length field. Each command's
# payload length is fixed (RUN: none; WRITE: 2 address bytes + one flash page),
# so the receiver knows exactly how many bytes to read from the command alone.
# The host derives PAGE_SIZE and BOOT_ORIGIN from the selected MCU instead of
# querying the device (see bootloader_params() in src/core/bootloader.rs), and
# detects a live loader by retrying the first WRITE across the board-reset
# window -- any ACK proves the loader is up. Dropping HELLO and the 2-byte
# length, and replacing CRC-16 with CRC-8, keeps the image under 2 KB.
#
# Security / validation rules (enforced below):
#   - every frame is CRC-8 checked; a bad CRC is NAKed and ignored.
#   - WRITE is rejected (NAK) unless the page address is page-aligned and lies
#     strictly below the boot section -> the loader can never erase/overwrite
#     itself nor write past the application section.
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

? target == atmega32 {
    const PAGE_SIZE:   u16 = 128
    const PAGE_MASK:   u16 = 127
    # 1024-word (2 KB) max boot section -> starts at byte 0x7800. The loader must
    # live entirely here so SPM (boot-section only) actually programs flash.
    const BOOT_ORIGIN: u16 = 0x7800
    boot 0x7800
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
    # 1024-word (2 KB) max boot section -> starts at byte 0x7800 (see atmega32).
    const BOOT_ORIGIN: u16 = 0x7800
    boot 0x7800
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


# ============================================================================
# Protocol constants (chip-independent).
# ============================================================================
const SOF0: u8 = 0x1B
const SOF1: u8 = 0x69          # 'i'
const SOF2: u8 = 0x6B          # 'k'
const ACK:  u8 = 0x06
const NAK:  u8 = 0x15
const CMD_WRITE: u8 = 0x02
const CMD_RUN:   u8 = 0x04

# SPM (Store-Program-Memory) sub-commands routed through the single @bl_spm
# wrapper. These are the same action codes the std @boot_* wrappers would use.
const SPM_FILL:  u8 = 0x01     # load one word into the page temporary buffer
const SPM_ERASE: u8 = 0x03     # erase the addressed flash page
const SPM_WRITE: u8 = 0x05     # write the page buffer to flash
const SPM_RWW:   u8 = 0x11     # re-enable the Read-While-Write section

# Coarse startup window (outer x inner UART polls) before running the app.
const BL_WAIT_OUTER: u16 = 250
const BL_WAIT_INNER: u16 = 2000

# Wait for the 3-byte sync magic (0x1B 'i' 'k'), polling the UART without
# blocking so it can time out. Returns 1 when the magic is seen, 0 on timeout.
#
# This is the loader's only sync routine. Every frame opens with the magic, so
# the same state machine serves both the initial startup window and inter-frame
# resynchronisation (recovery after a corrupt or unknown frame). It also bounds
# the startup window: with no magic inside it, the caller boots the application.
@bl_sync() -> u8 {
    ram mut $state: u8 = 0
    # Startup window: outer x inner polling loops before giving up.
    loop 0..BL_WAIT_OUTER -> $o {
        loop 0..BL_WAIT_INNER -> $j {
            ? @uart_available() != 0 {
                ram imut $b: u8 = @uart_receive()
                # Magic state machine: advance 0->1->2 and finish on 'k'.
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

# Single SPM-sequence wrapper. The @spm intrinsic expands inline (~120 bytes) at
# every call site; routing erase/fill/write/rww through one function emits the
# sequence once -- the loader's largest flash saving. (%SPM_CTRL_REG comes from
# std/boot, selected per target, which is why the import remains.)
@bl_spm($cmd: u8, $addr: u16, $word: u16) {
    @spm(%SPM_CTRL_REG, $cmd, $addr, $word)
}

# Program one flash page from $data (a page of words already in RAM) to byte
# address $addr. The caller has already validated $addr.
#
# $data is a u16 pointer: the page image arrives over the UART in flash byte
# order (little-endian, low byte of each word first), so each word is loaded
# directly with a single 16-bit read -- no lo/hi assembly and no multiply by
# 256, which was the hottest part of the loop.
#
# Pointer arithmetic is byte-scaled (ptr + n advances n bytes, not n elements),
# so the word at index $k lives at byte offset $k * 2 from $data -- the same
# stride used for the flash address.
@bl_write_page($data: ptr ram u16, $addr: u16) {
    @cli()
    @bl_spm(SPM_ERASE, $addr, 0)
    ram imut $words: u16 = PAGE_SIZE / 2
    loop 0..$words -> $k {
        @bl_spm(SPM_FILL, $addr + ($k * 2), *($data + ($k * 2)))
    }
    @bl_spm(SPM_WRITE, $addr, 0)
    @bl_spm(SPM_RWW, 0, 0)
}

# Bootloader entry point. Initialises UART0 at the given divisor, then loops
# receiving frames; if the sync window expires with no frame, it boots the
# existing application. `$ubrr` = F_CPU / (16 * baud) - 1 for the board's
# crystal + baud.
@bootloader_run($ubrr: u16) {
    # Frame scratch holds the CRC input contiguously for the largest command:
    # ADDR(2) + one flash page (<= PAGE_SIZE). The CRC covers the payload only,
    # not CMD (CMD is validated by the command branch below), so CMD is never
    # stored here; the trailing CRC byte is read into a local.
    ram mut $frame: u8[258] = 0

    @uart_init($ubrr)

    # Main loop. Each frame is self-delimited by the sync magic, so every
    # iteration starts by waiting for it with bl_sync(). If the window expires
    # without sync -- host absent at startup, or idle/disconnected mid-session
    # -- the already-flashed application is started (@goto(0)). Thus the startup
    # window is just the first iteration (no separate routine), a normal board
    # boots without the IDE, and the session never hangs if the host vanishes.
    loop * {
        ? @bl_sync() == 0 {
            @goto(0)
        }

        # The command byte follows the magic. Its payload length is fixed per
        # command, so there is no length field to read.
        ram imut $cmd: u8 = @uart_receive()

        # Reply defaults to NAK and is sent once at the end of the iteration, so
        # every rejection path simply falls through to a single @uart_send call
        # site (cheaper than a send per branch, especially on 3-byte-PC parts).
        # Only a fully validated WRITE upgrades it to ACK; RUN replies inline
        # because it must ACK and then jump before this loop body ends.
        ram mut $reply: u8 = NAK

        ? $cmd == CMD_WRITE {
            # Payload is ADDR(2) + one page at frame[0..], read byte by byte,
            # then the trailing CRC byte.
            loop 0..(PAGE_SIZE + 2) -> $i {
                @uart_receive() -> $frame[$i]
            }
            ram imut $rx_crc: u8 = @uart_receive()
            ? @crc8(&$frame[0], PAGE_SIZE + 2) == $rx_crc {
                ram imut $addr: u16 = ($frame[0] * 256) + $frame[1]
                # Security: accept only a page-aligned address below the boot
                # section. The "whole page below boot" test
                # ($addr + PAGE_SIZE <= BOOT_ORIGIN) is implied -- BOOT_ORIGIN is
                # a PAGE_SIZE multiple on every target, so alignment plus
                # $addr < BOOT_ORIGIN already guarantee it. Nested checks let the
                # default NAK stand on any failure.
                ? ($addr & PAGE_MASK) == 0 {
                    ? $addr < BOOT_ORIGIN {
                        # Page data starts at frame[2]; passed as a u16 pointer.
                        @bl_write_page(&$frame[2], $addr)
                        ACK -> $reply
                    }
                }
            }
        }

        ? $cmd == CMD_RUN {
            # RUN has an empty payload, so its CRC over nothing is the init value
            # 0; a single 0x00 byte must follow. This guards against a stray sync
            # sequence triggering a spurious jump.
            ram imut $rx_crc: u8 = @uart_receive()
            ? $rx_crc == 0 {
                @uart_send(ACK)
                @bl_spm(SPM_RWW, 0, 0)    # re-enable RWW before jumping to the app
                @goto(0)
            }
        }

        @uart_send($reply)
    }
}
