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
# Watchdog Timer (WDT) Library
# -------------------------------------------------------------

# @wdt_enable/@wdt_disable run the timed WDCE sequence with interrupts disabled,
# which needs @atomic_start/@atomic_end.
import std/atomic

? target == at43usb320 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at43usb355 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at76c711 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at86rf401 {
    const %WDT_CTRL_REG: u16 = 0x0042
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at90c8534 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at90can128 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90can32 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90can64 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm161 {
    const %WDT_CTRL_REG: u16 = 0x0082
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm216 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm2b {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm3 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm316 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm3b {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90pwm81 {
    const %WDT_CTRL_REG: u16 = 0x0082
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90s1200 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at90s2313 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at90s2323 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90s2333 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90s2343 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90s4414 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at90s4433 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90s4434 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90s8515 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == at90s8535 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90scr100 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90usb1286 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90usb1287 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90usb162 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90usb646 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90usb647 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at90usb82 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == at94k {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == ata5272 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata5505 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata5702m322 {
    const %WDT_CTRL_REG: u16 = 0x006E
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x004B
}

? target == ata5782 {
    const %WDT_CTRL_REG: u16 = 0x006E
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x004B
}

? target == ata5790 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata5790n {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata5795 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata5831 {
    const %WDT_CTRL_REG: u16 = 0x006E
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x004B
}

? target == ata6285 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6286 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6289 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6612c {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6613c {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6614q {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6616c {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata6617c {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == ata664251 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega103 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega128 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega1280 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega1281 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega1284 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega1284p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega1284rfr2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega128a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega128rfa1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega128rfr2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega1608 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega1609 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega161 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega162 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega163 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega164a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega164p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega164pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega165 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega165a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega165p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega165pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega168 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atmega168a {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atmega168p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega168pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega168pb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega169 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega169a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega169p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega169pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16hva {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16hva2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16hvb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16hvbrevb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16m1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16u2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega16u4 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega2560 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega2561 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega2564rfr2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega256rfr2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3208 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega3209 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega323 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega324a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega324p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega324pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega324pb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega325 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3250 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3250a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3250p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3250pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega325a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega325p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega325pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega328 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega328p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega328pb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega329 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3290 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3290a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3290p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega3290pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega329a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega329p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega329pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32c1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32hvb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32hvbrevb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32m1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32u2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32u4 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega32u6 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega406 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega48 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atmega4808 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega4809 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega48a {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atmega48p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega48pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega48pb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega640 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega644 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega644a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega644p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega644pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega644rfr2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega645 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega6450 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega6450a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega6450p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega645a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega645p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega649 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega6490 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega6490a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega6490p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega649a {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega649p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64c1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64hve {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64hve2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64m1 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega64rfr2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega8 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega808 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega809 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == atmega8515 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega8535 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega88 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atmega88a {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atmega88p {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega88pa {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega88pb {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega8a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega8hva {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == atmega8u2 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny10 {
    const %WDT_CTRL_REG: u16 = 0x0051
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == attiny11 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny12 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny13 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny13a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny15 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny1604 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1606 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1607 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1614 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1616 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1617 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1624 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1626 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1627 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny1634 {
    const %WDT_CTRL_REG: u16 = 0x0050
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0055
}

? target == attiny167 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny20 {
    const %WDT_CTRL_REG: u16 = 0x0051
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == attiny202 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny204 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny212 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny214 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny22 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny2313 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny2313a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny24 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny24a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny25 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny26 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny261 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny261a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny28 {
    const %WDT_CTRL_REG: u16 = 0x0021
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == attiny3214 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny3216 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny3217 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny3224 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny3226 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny3227 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny4 {
    const %WDT_CTRL_REG: u16 = 0x0051
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == attiny40 {
    const %WDT_CTRL_REG: u16 = 0x0051
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == attiny402 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny404 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny406 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny412 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny414 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny416 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny417 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny424 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny426 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny427 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny4313 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny43u {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny44 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny441 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny44a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny45 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny461 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny461a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny48 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny5 {
    const %WDT_CTRL_REG: u16 = 0x0051
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == attiny804 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny806 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny807 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny814 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny816 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny817 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny824 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny826 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny827 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == attiny828 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny84 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny841 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny84a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny85 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny861 {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny861a {
    const %WDT_CTRL_REG: u16 = 0x0041
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny87 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny88 {
    const %WDT_CTRL_REG: u16 = 0x0060
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0054
}

? target == attiny9 {
    const %WDT_CTRL_REG: u16 = 0x0051
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128a1 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128a1u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128a3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128a3u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128a4u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128b1 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128b3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128c3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128d3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega128d4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega16a4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega16a4u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega16c4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega16d4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega192a3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega192a3u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega192c3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega192d3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega256a3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega256a3b {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega256a3bu {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega256a3u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega256c3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega256d3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32a4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32a4u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32c3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32c4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32d3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32d4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega32e5 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega384c3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega384d3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64a1 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64a1u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64a3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64a3u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64a4u {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64b1 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64b3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64c3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64d3 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega64d4 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == atxmega8e5 {
    const %WDT_CTRL_REG: u16 = 0x0000
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}

? target == avr128da28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128da32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128da48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128da64 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128db28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128db32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128db48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr128db64 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16dd14 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16dd20 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16dd28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16dd32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16ea28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16ea32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16ea48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16eb14 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16eb20 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16eb28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr16eb32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32da28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32da32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32da48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32db28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32db32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32db48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32dd14 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32dd20 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32dd28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32dd32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32ea28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32ea32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr32ea48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64da28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64da32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64da48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64da64 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64db28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64db32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64db48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64db64 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64dd14 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64dd20 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64dd28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64dd32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64du28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64du32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64ea28 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64ea32 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == avr64ea48 {
    const %WDT_CTRL_REG: u16 = 0x0100
    const WDT_IS_MODERN: u16 = 0x0001
    const %WDT_STATUS_REG: u16 = 0x0101
}

? target == m3000 {
    const %WDT_CTRL_REG: u16 = 0x002F
    const WDT_IS_MODERN: u16 = 0x0000
    const %WDT_STATUS_REG: u16 = 0x0000
}


@wdt_enable($prescaler: u8) {
    ? WDT_IS_MODERN == 1 {
        ram imut $s: u8 = @atomic_start()
        $prescaler -> %WDT_CTRL_REG
        @atomic_end($s)
    } : {
        ram imut $s: u8 = @atomic_start()
        0x18 -> %WDT_CTRL_REG
        $prescaler | 0x08 -> %WDT_CTRL_REG
        @atomic_end($s)
    }
}

@wdt_disable() {
    ? WDT_IS_MODERN == 1 {
        ram imut $s: u8 = @atomic_start()
        0x00 -> %WDT_CTRL_REG
        @atomic_end($s)
    } : {
        ram imut $s: u8 = @atomic_start()
        0x18 -> %WDT_CTRL_REG
        0x00 -> %WDT_CTRL_REG
        @atomic_end($s)
    }
}

@wdt_reset() {
    @wdr()
}
