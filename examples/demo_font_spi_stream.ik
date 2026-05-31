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

# =========================================================================
# Demo: stream text to a (simulated) SPI display using std/font callbacks
# =========================================================================
#
# The flow:
#
#   "Hi!"  --->  @font_stream  --->  @spi_send(byte)  --->  display
#   (text)       (std/font)         (YOUR callback)        (hardware)
#
# @font_stream walks the text one character at a time, turns each character
# into 6 column bytes (5 glyph columns + 1 blank spacer), and hands each byte
# to the function pointer you give it. Nothing is buffered, so the text can be
# arbitrarily long (even living in flash) while SRAM use stays constant.
#
# Here @spi_send plays the role of the display driver. On real hardware it
# would push the byte out over SPI (`@spi_transfer($b)`); to keep this demo
# self-checking on the VM, it instead tallies what it "sent" into EEPROM so
# @main can confirm the whole stream flowed through correctly.

namespace atmega328p
import std/font
import std/eeprom

# EEPROM addresses we use as a tiny "transmit log" for verification.
# (Address 0 = how many bytes were sent; address 1 = XOR of every byte sent.)

# ---- The callback: simulates sending one byte to the display over SPI ----
#
# Signature MUST be `fn(u8)` to match what @font_stream expects.
@spi_send($b: u8) {
    # On real hardware this single line would do the work:
    #     @spi_transfer($b)
    # For the demo we record the byte instead so we can verify the flow:
    ram imut $n: u8 = @eeprom_read(0)
    @eeprom_write(0, $n + 1)

    ram imut $x: u8 = @eeprom_read(1)
    @eeprom_write(1, $x ^ $b)
}

# A second callback, to show callbacks are interchangeable: fold the stream
# into an XOR checksum without any side effects (pure reduction).
@xor_acc($acc: u8, $b: u8) -> u8 { return $acc ^ $b }

@main {
    ram mut $ok: u8 = 1

    # 1) The text we want to draw. (A short string keeps the demo fast; the
    #    same call works for long text — font_stream never buffers it.)
    #    "Hi!" is 3 characters -> 3 * 6 = 18 column bytes.

    # 2) Reset the transmit log, then stream the text through @spi_send.
    @eeprom_write(0, 0)
    @eeprom_write(1, 0)
    @font_stream("Hi!", &@spi_send)

    # 3) Check that exactly 18 bytes were "sent" to the display.
    ram imut $sent: u8 = @eeprom_read(0)
    ? $sent != 18 { 0 -> $ok }

    # 4) Check the bytes themselves: the checksum the callback accumulated must
    #    match the same text folded independently with a different callback.
    ram imut $sent_xor: u8 = @eeprom_read(1)
    ram imut $expected:  u8 = @font_fold("Hi!", 0, &@xor_acc)
    ? $sent_xor != $expected { 0 -> $ok }

    # $ok stays 1 only if the whole stream flowed through correctly.
    # (R16 == 0x01 means the demo passed.)
    $ok -> $ok
    loop * {}
}
