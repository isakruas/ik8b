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
# Atomic Operations and Critical Sections Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at43usb355 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at76c711 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at86rf401 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90c8534 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90can128 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90can32 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90can64 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm161 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm216 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm2b {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm3 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm316 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm3b {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90pwm81 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s1200 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s2313 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s2323 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s2333 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s2343 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s4414 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s4433 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s4434 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s8515 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90s8535 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90scr100 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90usb1286 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90usb1287 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90usb162 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90usb646 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90usb647 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at90usb82 {
    const %CPU_SREG: u8 = 0x005F
}

? target == at94k {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5272 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5505 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5702m322 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5782 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5790 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5790n {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5795 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata5831 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6285 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6286 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6289 {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6612c {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6613c {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6614q {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6616c {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata6617c {
    const %CPU_SREG: u8 = 0x005F
}

? target == ata664251 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega103 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega128 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega1280 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega1281 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega1284 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega1284p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega1284rfr2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega128a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega128rfa1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega128rfr2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega1608 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega1609 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega161 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega162 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega163 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega164a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega164p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega164pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega165 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega165a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega165p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega165pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega168 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega168a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega168p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega168pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega168pb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega169 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega169a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega169p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega169pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16hva {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16hva2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16hvb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16hvbrevb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16m1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16u2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega16u4 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega2560 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega2561 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega2564rfr2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega256rfr2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3208 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega3209 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega323 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega324a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega324p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega324pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega324pb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega325 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3250 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3250a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3250p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3250pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega325a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega325p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega325pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega328 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega328p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega328pb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega329 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3290 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3290a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3290p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega3290pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega329a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega329p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega329pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32c1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32hvb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32hvbrevb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32m1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32u2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32u4 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega32u6 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega406 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega48 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega4808 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega4809 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega48a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega48p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega48pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega48pb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega640 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega644 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega644a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega644p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega644pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega644rfr2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega645 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega6450 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega6450a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega6450p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega645a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega645p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega649 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega6490 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega6490a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega6490p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega649a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega649p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64c1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64hve {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64hve2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64m1 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega64rfr2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega8 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega808 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega809 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atmega8515 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega8535 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega88 {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega88a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega88p {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega88pa {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega88pb {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega8a {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega8hva {
    const %CPU_SREG: u8 = 0x005F
}

? target == atmega8u2 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny10 {
    const %CPU_SREG: u8 = 0x001F
}

? target == attiny11 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny12 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny13 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny13a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny15 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny1604 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1606 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1607 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1614 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1616 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1617 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1624 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1626 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1627 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny1634 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny167 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny20 {
    const %CPU_SREG: u8 = 0x001F
}

? target == attiny202 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny204 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny212 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny214 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny22 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny2313 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny2313a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny24 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny24a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny25 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny26 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny261 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny261a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny28 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny3214 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny3216 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny3217 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny3224 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny3226 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny3227 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny4 {
    const %CPU_SREG: u8 = 0x001F
}

? target == attiny40 {
    const %CPU_SREG: u8 = 0x001F
}

? target == attiny402 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny404 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny406 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny412 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny414 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny416 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny417 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny424 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny426 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny427 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny4313 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny43u {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny44 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny441 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny44a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny45 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny461 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny461a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny48 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny5 {
    const %CPU_SREG: u8 = 0x001F
}

? target == attiny804 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny806 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny807 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny814 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny816 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny817 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny824 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny826 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny827 {
    const %CPU_SREG: u8 = 0x003F
}

? target == attiny828 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny84 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny841 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny84a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny85 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny861 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny861a {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny87 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny88 {
    const %CPU_SREG: u8 = 0x005F
}

? target == attiny9 {
    const %CPU_SREG: u8 = 0x001F
}

? target == atxmega128a1 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128a1u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128a3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128a3u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128a4u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128b1 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128b3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128c3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128d3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega128d4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega16a4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega16a4u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega16c4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega16d4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega192a3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega192a3u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega192c3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega192d3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega256a3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega256a3b {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega256a3bu {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega256a3u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega256c3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega256d3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32a4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32a4u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32c3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32c4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32d3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32d4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega32e5 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega384c3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega384d3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64a1 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64a1u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64a3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64a3u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64a4u {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64b1 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64b3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64c3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64d3 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega64d4 {
    const %CPU_SREG: u8 = 0x003F
}

? target == atxmega8e5 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128da28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128da32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128da48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128da64 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128db28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128db32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128db48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr128db64 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16dd14 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16dd20 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16dd28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16dd32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16ea28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16ea32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16ea48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16eb14 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16eb20 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16eb28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr16eb32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32da28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32da32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32da48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32db28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32db32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32db48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32dd14 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32dd20 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32dd28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32dd32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32ea28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32ea32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr32ea48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64da28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64da32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64da48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64da64 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64db28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64db32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64db48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64db64 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64dd14 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64dd20 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64dd28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64dd32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64du28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64du32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64ea28 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64ea32 {
    const %CPU_SREG: u8 = 0x003F
}

? target == avr64ea48 {
    const %CPU_SREG: u8 = 0x003F
}

? target == m3000 {
    const %CPU_SREG: u8 = 0x005F
}


@atomic_start() -> u8 {
    ram imut $sreg_val: u8 = %CPU_SREG
    ram imut $disabled: u8 = $sreg_val & 0x7F
    $disabled -> %CPU_SREG
    return $sreg_val
}

@atomic_end($sreg_val: u8) {
    $sreg_val -> %CPU_SREG
}
