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
# Self-programming (bootloader) helpers — built on the @spm intrinsic.
# -------------------------------------------------------------
# These wrap the classic AVR Store-Program-Memory protocol. The SPMCSR (a.k.a.
# SPMCR) register address is selected per-device below from the avr-gcc/avr-libc
# device definitions (e.g. 0x57 on ATmega48/88/168/328 and ATtiny25/45/85, but
# 0x68 on ATmega64/128 and 0x5C on the ATA5782/5831). Parts without flash self-
# programming map %SPM_CTRL_REG to 0x0000; @spm must not be used on those.
#
# Requirements:
#   - The program must be a bootloader: declare `boot <addr>` at the top so it
#     is located in the Boot Loader Section, and set the BOOTRST/BOOTSZ fuses to
#     match. SPM is only allowed from the boot section on most ATmega parts.
#   - Disable interrupts around programming: call @cli() first.
#
# Writing one page (PAGESIZE words) from a RAM/UART buffer:
#   @boot_page_erase($page_addr)
#   ram mut $off: u16 = 0
#   loop ... { @boot_page_fill($page_addr + $off, $word); $off + 2 -> $off }
#   @boot_page_write($page_addr)
#   @boot_rww_enable()
# where $page_addr is the page's byte address in flash.

# -------------------------------------------------------------
# Per-device SPMCSR (SPM Control/Status Register) data-space address.
# Generated from avr-gcc (`_SFR_ADDR(SPMCSR/SPMCR)` per -mmcu).
# -------------------------------------------------------------

? target == at43usb320 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at43usb355 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at76c711 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at86rf401 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90c8534 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90can128 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90can32 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90can64 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm161 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm216 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm2b {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm3 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm316 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm3b {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90pwm81 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90s1200 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s2313 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s2323 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s2333 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s2343 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s4414 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s4433 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s4434 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s8515 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90s8535 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == at90scr100 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90usb1286 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90usb1287 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90usb162 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90usb646 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90usb647 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at90usb82 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == at94k {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == ata5272 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata5505 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata5702m322 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata5782 {
    const %SPM_CTRL_REG: u16 = 0x005C
}

? target == ata5790 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata5790n {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata5795 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata5831 {
    const %SPM_CTRL_REG: u16 = 0x005C
}

? target == ata6285 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6286 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6289 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6612c {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6613c {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6614q {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6616c {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata6617c {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == ata664251 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega103 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega1280 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega128 {
    const %SPM_CTRL_REG: u16 = 0x0068
}

? target == atmega1281 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega1284 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega1284p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega1284rfr2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega128a {
    const %SPM_CTRL_REG: u16 = 0x0068
}

? target == atmega128rfa1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega128rfr2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega1608 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega1609 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega16 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega161 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega162 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega163 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega164a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega164p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega164pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega165 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega165a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega165p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega165pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega168 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega168a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega168p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega168pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega168pb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega169 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega169a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega169p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega169pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16hva {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16hva2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16hvb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16hvbrevb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16m1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16u2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega16u4 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega2560 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega2561 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega2564rfr2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega256rfr2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3208 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega3209 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega32 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega323 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega324a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega324p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega324pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega324pb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3250 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3250a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3250p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3250pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega325 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega325a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega325p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega325pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega328 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega328p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega328pb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3290 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3290a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3290p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega3290pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega329 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega329a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega329p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega329pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32c1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32hvb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32hvbrevb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32m1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32u2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32u4 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega32u6 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega406 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega4808 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega4809 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega48 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega48a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega48p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega48pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega48pb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega640 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega64 {
    const %SPM_CTRL_REG: u16 = 0x0068
}

? target == atmega644 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega644a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega644p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega644pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega644rfr2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega6450 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega6450a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega6450p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega645 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega645a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega645p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega6490 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega6490a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega6490p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega649 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega649a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega649p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega64a {
    const %SPM_CTRL_REG: u16 = 0x0068
}

? target == atmega64c1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega64hve {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega64hve2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega64m1 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega64rfr2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega808 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega809 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atmega8 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega8515 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega8535 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega88 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega88a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega88p {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega88pa {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega88pb {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega8a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega8hva {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == atmega8u2 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny10 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny11 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny12 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny13 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny13a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny15 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1604 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1606 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1607 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1614 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1616 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1617 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1624 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1626 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1627 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny1634 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny167 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny202 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny204 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny20 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny212 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny214 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny22 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny2313 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny2313a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny24 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny24a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny25 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny261 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny261a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny26 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny3214 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny3216 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny3217 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny3224 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny3226 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny3227 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny402 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny404 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny406 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny40 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny412 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny414 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny416 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny417 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny424 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny426 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny427 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny4313 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny43u {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny44 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny441 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny44a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny45 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny461 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny461a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny48 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny5 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny804 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny806 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny807 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny814 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny816 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny817 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny824 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny826 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny827 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == attiny828 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny84 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny841 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny84a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny85 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny861 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny861a {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny87 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny88 {
    const %SPM_CTRL_REG: u16 = 0x0057
}

? target == attiny9 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128a1 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128a1u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128a3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128a3u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128a4u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128b1 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128b3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128c3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128d3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega128d4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega16a4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega16a4u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega16c4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega16d4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega192a3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega192a3u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega192c3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega192d3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega256a3b {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega256a3bu {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega256a3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega256a3u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega256c3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega256d3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32a4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32a4u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32c3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32c4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32d3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32d4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega32e5 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega384c3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega384d3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64a1 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64a1u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64a3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64a3u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64a4u {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64b1 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64b3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64c3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64d3 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega64d4 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == atxmega8e5 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128da28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128da32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128da48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128da64 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128db28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128db32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128db48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr128db64 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16dd14 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16dd20 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16dd28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16dd32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16ea28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16ea32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16ea48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16eb14 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16eb20 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16eb28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr16eb32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32da28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32da32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32da48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32db28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32db32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32db48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32dd14 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32dd20 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32dd28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32dd32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32ea28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32ea32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr32ea48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64da28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64da32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64da48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64da64 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64db28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64db32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64db48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64db64 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64dd14 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64dd20 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64dd28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64dd32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64du28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64du32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64ea28 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64ea32 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == avr64ea48 {
    const %SPM_CTRL_REG: u16 = 0x0000
}

? target == m3000 {
    const %SPM_CTRL_REG: u16 = 0x0000
}


# Erase the flash page that contains byte address $addr.
@boot_page_erase($addr: u16) {
    ram imut $unused: u16 = 0
    @spm(%SPM_CTRL_REG, 0x03, $addr, $unused)
}

# Load one 16-bit word into the temporary page buffer at byte address $addr.
# (Only the in-page word offset bits of $addr matter for buffer fills.)
@boot_page_fill($addr: u16, $word: u16) {
    @spm(%SPM_CTRL_REG, 0x01, $addr, $word)
}

# Write the filled page buffer to flash at page byte address $addr.
@boot_page_write($addr: u16) {
    ram imut $unused: u16 = 0
    @spm(%SPM_CTRL_REG, 0x05, $addr, $unused)
}

# Re-enable the Read-While-Write section so the application can run again.
@boot_rww_enable() {
    ram imut $zero: u16 = 0
    @spm(%SPM_CTRL_REG, 0x11, $zero, $zero)
}
