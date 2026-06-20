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
# Serial Peripheral Interface (SPI) Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at43usb355 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at76c711 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at86rf401 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == at90c8534 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == at90can128 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90can32 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90can64 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm161 {
    const %SPI0_CTRL_REG: u8 = 0x0037
    const %SPI0_DATA_REG: u8 = 0x0056
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0038
}

? target == at90pwm2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm216 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm2b {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm3 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm316 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm3b {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90pwm81 {
    const %SPI0_CTRL_REG: u8 = 0x0037
    const %SPI0_DATA_REG: u8 = 0x0056
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0038
}

? target == at90s1200 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == at90s2313 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == at90s2323 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == at90s2333 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at90s2343 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == at90s4414 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at90s4433 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at90s4434 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at90s8515 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at90s8535 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == at90scr100 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90usb1286 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90usb1287 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90usb162 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90usb646 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90usb647 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at90usb82 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == at94k {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == ata5272 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5505 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5702m322 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5782 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5790 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5790n {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5795 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata5831 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6285 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6286 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6289 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6612c {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6613c {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6614q {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6616c {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata6617c {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == ata664251 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega103 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega128 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega1280 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega1281 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega1284 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega1284p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega1284rfr2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega128a {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega128rfa1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega128rfr2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega1608 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega1609 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega161 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega162 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega163 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega164a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega164p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega164pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega165 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega165a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega165p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega165pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega168 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega168a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega168p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega168pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega168pb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega169 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega169a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega169p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega169pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16a {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega16hva {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16hva2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16hvb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16hvbrevb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16m1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16u2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega16u4 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega2560 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega2561 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega2564rfr2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega256rfr2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega3208 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega3209 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega323 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega324a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega324p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega324pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega324pb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
    const %SPI1_CTRL_REG: u8 = 0x00AC
    const %SPI1_DATA_REG: u8 = 0x00AE
    const SPI1_INIT_MASTER: u8 = 0x0051
    const SPI1_IS_MODERN: u8 = 0x0000
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x00AD
}

? target == atmega325 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3250 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3250a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3250p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3250pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega325a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega325p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega325pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega328 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega328p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega328pb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
    const %SPI1_CTRL_REG: u8 = 0x00AC
    const %SPI1_DATA_REG: u8 = 0x00AE
    const SPI1_INIT_MASTER: u8 = 0x0051
    const SPI1_IS_MODERN: u8 = 0x0000
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x00AD
}

? target == atmega329 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3290 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3290a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3290p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega3290pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega329a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega329p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega329pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32a {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega32c1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32hvb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32hvbrevb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32m1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32u2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32u4 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega32u6 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega406 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega48 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega4808 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega4809 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega48a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega48p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega48pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega48pb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega64 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega640 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega644 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega644a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega644p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega644pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega644rfr2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega645 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega6450 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega6450a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega6450p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega645a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega645p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega649 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega6490 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega6490a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega6490p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega649a {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega649p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega64a {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega64c1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega64hve {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega64hve2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega64m1 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega64rfr2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega8 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega808 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega809 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == atmega8515 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega8535 {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega88 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega88a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atmega88p {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega88pa {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega88pb {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega8a {
    const %SPI0_CTRL_REG: u8 = 0x002D
    const %SPI0_DATA_REG: u8 = 0x002F
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002E
}

? target == atmega8hva {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == atmega8u2 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == attiny10 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny11 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny12 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny13 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny13a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny15 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny1604 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny1606 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny1607 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny1614 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny1616 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny1617 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny1624 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny1626 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny1627 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny1634 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny167 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == attiny20 {
    const %SPI0_CTRL_REG: u8 = 0x0030
    const %SPI0_DATA_REG: u8 = 0x002E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002F
}

? target == attiny202 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny204 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny212 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny214 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny22 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny2313 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny2313a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny24 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny24a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny25 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny26 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny261 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny261a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny28 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny3214 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny3216 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny3217 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny3224 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny3226 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny3227 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny40 {
    const %SPI0_CTRL_REG: u8 = 0x0030
    const %SPI0_DATA_REG: u8 = 0x002E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x002F
}

? target == attiny402 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny404 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny406 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny412 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny414 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny416 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny417 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny424 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny426 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny427 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny4313 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny43u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny44 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny441 {
    const %SPI0_CTRL_REG: u8 = 0x00B2
    const %SPI0_DATA_REG: u8 = 0x00B0
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x00B1
}

? target == attiny44a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny45 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny461 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny461a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny48 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == attiny5 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny804 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny806 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny807 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny814 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny816 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny817 {
    const %SPI0_CTRL_REG: u8 = 0x0820
    const %SPI0_DATA_REG: u8 = 0x0824
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0823
}

? target == attiny824 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny826 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny827 {
    const %SPI0_CTRL_REG: u8 = 0x08C0
    const %SPI0_DATA_REG: u8 = 0x08C4
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x08C3
}

? target == attiny828 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == attiny84 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny841 {
    const %SPI0_CTRL_REG: u8 = 0x00B2
    const %SPI0_DATA_REG: u8 = 0x00B0
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x00B1
}

? target == attiny84a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny85 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny861 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny861a {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == attiny87 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == attiny88 {
    const %SPI0_CTRL_REG: u8 = 0x004C
    const %SPI0_DATA_REG: u8 = 0x004E
    const SPI0_INIT_MASTER: u8 = 0x0051
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x004D
}

? target == attiny9 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128a1 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128a1u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128a3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128a3u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128a4u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128b1 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128b3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128c3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128d3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega128d4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega16a4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega16a4u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega16c4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega16d4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega192a3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega192a3u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega192c3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega192d3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega256a3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega256a3b {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega256a3bu {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega256a3u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega256c3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega256d3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32a4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32a4u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32c3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32c4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32d3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32d4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega32e5 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega384c3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega384d3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64a1 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64a1u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64a3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64a3u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64a4u {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64b1 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64b3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64c3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64d3 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega64d4 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == atxmega8e5 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}

? target == avr128da28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128da32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128da48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128da64 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128db28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128db32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128db48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr128db64 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr16dd14 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16dd20 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16dd28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16dd32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16ea28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16ea32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16ea48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16eb14 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16eb20 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16eb28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr16eb32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32da28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr32da32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr32da48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr32db28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr32db32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr32db48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr32dd14 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32dd20 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32dd28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32dd32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32ea28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32ea32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr32ea48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64da28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64da32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64da48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64da64 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64db28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64db32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64db48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64db64 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
    const %SPI1_CTRL_REG: u8 = 0x0960
    const %SPI1_DATA_REG: u8 = 0x0964
    const SPI1_INIT_MASTER: u8 = 0x0021
    const SPI1_IS_MODERN: u8 = 0x0001
    const SPI1_SPIF_MASK: u8 = 0x0080
    const %SPI1_STATUS_REG: u8 = 0x0963
}

? target == avr64dd14 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64dd20 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64dd28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64dd32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64du28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64du32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64ea28 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64ea32 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == avr64ea48 {
    const %SPI0_CTRL_REG: u8 = 0x0940
    const %SPI0_DATA_REG: u8 = 0x0944
    const SPI0_INIT_MASTER: u8 = 0x0021
    const SPI0_IS_MODERN: u8 = 0x0001
    const SPI0_SPIF_MASK: u8 = 0x0080
    const %SPI0_STATUS_REG: u8 = 0x0943
}

? target == m3000 {
    const %SPI0_CTRL_REG: u8 = 0x0000
    const %SPI0_DATA_REG: u8 = 0x0000
    const SPI0_INIT_MASTER: u8 = 0x0000
    const SPI0_IS_MODERN: u8 = 0x0000
    const SPI0_SPIF_MASK: u8 = 0x0000
    const %SPI0_STATUS_REG: u8 = 0x0000
}


@spi_transfer($data: u8) -> u8 {
    $data -> %SPI0_DATA_REG
    loop * {
        ram imut $status: u8 = %SPI0_STATUS_REG
        ? ($status & SPI0_SPIF_MASK) != 0 { return %SPI0_DATA_REG }
    }
    return %SPI0_DATA_REG
}
@spi_init_master_raw() {
    SPI0_INIT_MASTER -> %SPI0_CTRL_REG
}

@spi1_transfer($data: u8) -> u8 {
    $data -> %SPI1_DATA_REG
    loop * {
        ram imut $status: u8 = %SPI1_STATUS_REG
        ? ($status & SPI1_SPIF_MASK) != 0 { return %SPI1_DATA_REG }
    }
    return %SPI1_DATA_REG
}
@spi1_init_master_raw() {
    SPI1_INIT_MASTER -> %SPI1_CTRL_REG
}
