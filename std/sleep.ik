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
# Sleep Modes Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at43usb355 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at76c711 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at86rf401 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90c8534 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90can128 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90can32 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90can64 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm161 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm216 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm2b {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm3 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm316 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm3b {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90pwm81 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s1200 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s2313 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s2323 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s2333 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s2343 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s4414 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s4433 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s4434 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s8515 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90s8535 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90scr100 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90usb1286 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90usb1287 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90usb162 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90usb646 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90usb647 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at90usb82 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == at94k {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5272 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5505 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5702m322 {
    const %SLEEP_CTRL_REG: u16 = 0x0058
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5782 {
    const %SLEEP_CTRL_REG: u16 = 0x0058
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5790 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5790n {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5795 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata5831 {
    const %SLEEP_CTRL_REG: u16 = 0x0058
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6285 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6286 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6289 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6612c {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6613c {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6614q {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6616c {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata6617c {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == ata664251 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega103 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega128 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega1280 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega1281 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega1284 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega1284p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega1284rfr2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega128a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega128rfa1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega128rfr2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega1608 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega1609 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega161 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega162 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega163 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega164a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega164p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega164pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega165 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega165a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega165p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega165pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega168 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega168a {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega168p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega168pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega168pb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega169 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega169a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega169p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega169pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16hva {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16hva2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16hvb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16hvbrevb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16m1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16u2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega16u4 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega2560 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega2561 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega2564rfr2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega256rfr2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3208 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega3209 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega323 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega324a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega324p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega324pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega324pb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega325 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3250 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3250a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3250p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3250pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega325a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega325p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega325pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega328 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega328p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega328pb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega329 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3290 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3290a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3290p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega3290pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega329a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega329p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega329pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32c1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32hvb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32hvbrevb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32m1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32u2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32u4 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega32u6 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega406 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega48 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega4808 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega4809 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega48a {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega48p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega48pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega48pb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega640 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega644 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega644a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega644p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega644pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega644rfr2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega645 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega6450 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega6450a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega6450p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega645a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega645p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega649 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega6490 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega6490a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega6490p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega649a {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega649p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64c1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64hve {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64hve2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64m1 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega64rfr2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega8 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega808 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega809 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == atmega8515 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega8535 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega88 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega88a {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega88p {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega88pa {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega88pb {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega8a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega8hva {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atmega8u2 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny10 {
    const %SLEEP_CTRL_REG: u16 = 0x005A
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny11 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny12 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny13 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny13a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny15 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny1604 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1606 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1607 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1614 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1616 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1617 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1624 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1626 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1627 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny1634 {
    const %SLEEP_CTRL_REG: u16 = 0x0056
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny167 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny20 {
    const %SLEEP_CTRL_REG: u16 = 0x005A
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny202 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny204 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny212 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny214 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny22 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny2313 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny2313a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny24 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny24a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny25 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny26 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny261 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny261a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny28 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny3214 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny3216 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny3217 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny3224 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny3226 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny3227 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny4 {
    const %SLEEP_CTRL_REG: u16 = 0x005A
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny40 {
    const %SLEEP_CTRL_REG: u16 = 0x005A
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny402 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny404 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny406 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny412 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny414 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny416 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny417 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny424 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny426 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny427 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny4313 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny43u {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny44 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny441 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny44a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny45 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny461 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny461a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny48 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny5 {
    const %SLEEP_CTRL_REG: u16 = 0x005A
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny804 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny806 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny807 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny814 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny816 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny817 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny824 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny826 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny827 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == attiny828 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny84 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny841 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny84a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny85 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny861 {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny861a {
    const %SLEEP_CTRL_REG: u16 = 0x0055
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny87 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny88 {
    const %SLEEP_CTRL_REG: u16 = 0x0053
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == attiny9 {
    const %SLEEP_CTRL_REG: u16 = 0x005A
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128a1 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128a1u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128a3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128a3u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128a4u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128b1 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128b3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128c3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128d3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega128d4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega16a4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega16a4u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega16c4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega16d4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega192a3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega192a3u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega192c3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega192d3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega256a3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega256a3b {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega256a3bu {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega256a3u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega256c3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega256d3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32a4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32a4u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32c3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32c4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32d3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32d4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega32e5 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega384c3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega384d3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64a1 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64a1u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64a3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64a3u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64a4u {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64b1 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64b3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64c3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64d3 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega64d4 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == atxmega8e5 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}

? target == avr128da28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128da32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128da48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128da64 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128db28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128db32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128db48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr128db64 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16dd14 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16dd20 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16dd28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16dd32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16ea28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16ea32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16ea48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16eb14 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16eb20 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16eb28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr16eb32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32da28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32da32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32da48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32db28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32db32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32db48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32dd14 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32dd20 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32dd28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32dd32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32ea28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32ea32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr32ea48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64da28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64da32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64da48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64da64 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64db28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64db32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64db48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64db64 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64dd14 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64dd20 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64dd28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64dd32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64du28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64du32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64ea28 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64ea32 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == avr64ea48 {
    const %SLEEP_CTRL_REG: u16 = 0x0050
    const %SLEEP_IS_MODERN: u16 = 0x0001
}

? target == m3000 {
    const %SLEEP_CTRL_REG: u16 = 0x0000
    const %SLEEP_IS_MODERN: u16 = 0x0000
}


@sleep_idle() {
    ? %SLEEP_IS_MODERN == 1 {
        0x01 -> %SLEEP_CTRL_REG
    } : {
        0x01 -> %SLEEP_CTRL_REG
    }
}

@sleep_powerdown() {
    ? %SLEEP_IS_MODERN == 1 {
        0x05 -> %SLEEP_CTRL_REG
    } : {
        0x05 -> %SLEEP_CTRL_REG
    }
}

@sleep_standby() {
    ? %SLEEP_IS_MODERN == 1 {
        0x09 -> %SLEEP_CTRL_REG
    } : {
        0x0D -> %SLEEP_CTRL_REG
    }
}

@sleep_disable() {
    0x00 -> %SLEEP_CTRL_REG
}
