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
# EEPROM Hardware Interface Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at43usb355 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at76c711 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at86rf401 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90c8534 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90can128 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90can32 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90can64 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm161 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm216 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm2b {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm3 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm316 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm3b {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90pwm81 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s1200 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s2313 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s2323 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s2333 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s2343 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s4414 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s4433 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s4434 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s8515 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90s8535 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90scr100 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90usb1286 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90usb1287 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90usb162 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90usb646 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90usb647 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at90usb82 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == at94k {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5272 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5505 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5702m322 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5782 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5790 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5790n {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5795 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata5831 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6285 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6286 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6289 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6612c {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6613c {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6614q {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6616c {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata6617c {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == ata664251 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega103 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega128 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega1280 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega1281 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega1284 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega1284p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega1284rfr2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega128a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega128rfa1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega128rfr2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega1608 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega1609 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega161 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega162 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega163 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega164a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega164p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega164pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega165 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega165a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega165p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega165pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega168 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega168a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega168p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega168pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega168pb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega169 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega169a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega169p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega169pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16hva {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16hva2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16hvb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16hvbrevb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16m1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16u2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega16u4 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega2560 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega2561 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega2564rfr2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega256rfr2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3208 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega3209 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega323 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega324a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega324p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega324pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega324pb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega325 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3250 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3250a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3250p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3250pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega325a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega325p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega325pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega328 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega328p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega328pb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega329 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3290 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3290a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3290p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega3290pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega329a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega329p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega329pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32c1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32hvb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32hvbrevb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32m1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32u2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32u4 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega32u6 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega406 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega48 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega4808 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega4809 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega48a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega48p {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega48pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega48pb {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega640 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega644 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega644a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega644p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega644pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega644rfr2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega645 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega6450 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega6450a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega6450p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega645a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega645p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega649 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega6490 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega6490a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega6490p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega649a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega649p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64c1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64hve {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64hve2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64m1 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega64rfr2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega8 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega808 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega809 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == atmega8515 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega8535 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega88 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega88a {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega88p {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega88pa {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega88pb {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega8a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega8hva {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atmega8u2 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny10 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny11 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny12 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny13 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny13a {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny15 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny1604 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1606 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1607 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1614 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1616 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1617 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1624 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1626 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1627 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny1634 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny167 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny20 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny202 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny204 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny212 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny214 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny22 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny2313 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny2313a {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny24 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny24a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny25 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny26 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny261 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny261a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny28 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny3214 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny3216 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny3217 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny3224 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny3226 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny3227 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny4 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny40 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny402 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny404 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny406 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny412 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny414 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny416 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny417 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny424 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny426 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny427 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny4313 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny43u {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny44 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny441 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny44a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny45 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny461 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny461a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny48 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny5 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny804 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny806 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny807 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny814 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny816 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny817 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny824 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny826 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny827 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == attiny828 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny84 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny841 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny84a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny85 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny861 {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny861a {
    const %EEPROM_ADDRH_REG: u8 = 0x003F
    const %EEPROM_ADDRL_REG: u8 = 0x003E
    const %EEPROM_CTRL_REG: u8 = 0x003C
    const %EEPROM_DATA_REG: u8 = 0x003D
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny87 {
    const %EEPROM_ADDRH_REG: u8 = 0x0042
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny88 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0041
    const %EEPROM_CTRL_REG: u8 = 0x003F
    const %EEPROM_DATA_REG: u8 = 0x0040
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == attiny9 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}

? target == atxmega128a1 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128a1u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128a3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128a3u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128a4u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128b1 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128b3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128c3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128d3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega128d4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega16a4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega16a4u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega16c4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega16d4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega192a3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega192a3u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega192c3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega192d3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega256a3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega256a3b {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega256a3bu {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega256a3u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega256c3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega256d3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32a4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32a4u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32c3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32c4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32d3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32d4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega32e5 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega384c3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega384d3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64a1 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64a1u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64a3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64a3u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64a4u {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64b1 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64b3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64c3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64d3 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega64d4 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == atxmega8e5 {
    const %EEPROM_ADDRH_REG: u8 = 0x01C1
    const %EEPROM_ADDRL_REG: u8 = 0x01C0
    const %EEPROM_CTRL_REG: u8 = 0x01CB
    const %EEPROM_DATA_REG: u8 = 0x01C4
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x01CF
}

? target == avr128da28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128da32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128da48 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128da64 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128db28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128db32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128db48 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr128db64 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr16dd14 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr16dd20 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr16dd28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr16dd32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr16ea28 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr16ea32 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr16ea48 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr16eb14 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr16eb20 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr16eb28 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr16eb32 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr32da28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32da32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32da48 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32db28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32db32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32db48 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32dd14 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32dd20 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32dd28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32dd32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr32ea28 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr32ea32 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr32ea48 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr64da28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64da32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64da48 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64da64 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64db28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64db32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64db48 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64db64 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64dd14 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64dd20 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64dd28 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64dd32 {
    const %EEPROM_ADDRH_REG: u8 = 0x1009
    const %EEPROM_ADDRL_REG: u8 = 0x1008
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1006
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1002
}

? target == avr64du28 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr64du32 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr64ea28 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr64ea32 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == avr64ea48 {
    const %EEPROM_ADDRH_REG: u8 = 0x100D
    const %EEPROM_ADDRL_REG: u8 = 0x100C
    const %EEPROM_CTRL_REG: u8 = 0x1000
    const %EEPROM_DATA_REG: u8 = 0x1008
    const %EEPROM_IS_MODERN: u8 = 0x0001
    const %EEPROM_STATUS_REG: u8 = 0x1006
}

? target == m3000 {
    const %EEPROM_ADDRH_REG: u8 = 0x0000
    const %EEPROM_ADDRL_REG: u8 = 0x0000
    const %EEPROM_CTRL_REG: u8 = 0x0000
    const %EEPROM_DATA_REG: u8 = 0x0000
    const %EEPROM_IS_MODERN: u8 = 0x0000
    const %EEPROM_STATUS_REG: u8 = 0x0000
}


@_eeprom_wait() {
    ? %EEPROM_IS_MODERN == 1 {
        loop * {
            ram imut $status: u8 = %EEPROM_STATUS_REG
            ? ($status & 1) == 0 { return }
        }
    } : {
        loop * {
            ram imut $ctrl: u8 = %EEPROM_CTRL_REG
            ? ($ctrl & 2) == 0 { return }
        }
    }
}

@eeprom_read($addr: u16) -> u8 {
    @_eeprom_wait()
    $addr & 255 -> %EEPROM_ADDRL_REG
    ($addr / 256) & 3 -> %EEPROM_ADDRH_REG
    ? %EEPROM_IS_MODERN == 1 {
        0x00 -> %EEPROM_CTRL_REG
    } : {
        ram imut $curr: u8 = %EEPROM_CTRL_REG
        $curr | 1 -> %EEPROM_CTRL_REG
    }
    return %EEPROM_DATA_REG
}

@eeprom_write($addr: u16, $val: u8) {
    @_eeprom_wait()
    $addr & 255 -> %EEPROM_ADDRL_REG
    ($addr / 256) & 3 -> %EEPROM_ADDRH_REG
    $val -> %EEPROM_DATA_REG
    ? %EEPROM_IS_MODERN == 1 {
        0x04 -> %EEPROM_CTRL_REG # CMD = EEPROM Erase & Write
    } : {
        ram imut $curr: u8 = %EEPROM_CTRL_REG
        $curr | 4 -> %EEPROM_CTRL_REG
        $curr | 6 -> %EEPROM_CTRL_REG
    }
}
