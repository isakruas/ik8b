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
# Analog-to-Digital Converter (ADC) Library
# -------------------------------------------------------------

? target == at43usb320 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at43usb355 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0027
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0028
    const %ADC_RESH: u16 = 0x0023
    const %ADC_RESL: u16 = 0x0022
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at76c711 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at86rf401 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90c8534 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90can128 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90can32 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90can64 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm161 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0027
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0028
    const %ADC_RESH: u16 = 0x004D
    const %ADC_RESL: u16 = 0x004C
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm216 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm2b {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm3 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm316 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm3b {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90pwm81 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0027
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0028
    const %ADC_RESH: u16 = 0x004D
    const %ADC_RESL: u16 = 0x004C
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90s1200 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90s2313 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90s2323 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90s2333 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90s2343 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90s4414 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90s4433 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90s4434 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90s8515 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90s8535 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90scr100 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90usb1286 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90usb1287 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90usb162 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at90usb646 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90usb647 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == at90usb82 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == at94k {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata5272 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata5505 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata5702m322 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata5782 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata5790 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata5790n {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata5795 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata5831 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata6285 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata6286 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata6289 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == ata6612c {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata6613c {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata6614q {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata6616c {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata6617c {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == ata664251 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega103 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega128 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega1280 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega1281 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega1284 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega1284p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega1284rfr2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega128a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega128rfa1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega128rfr2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega16 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega1608 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega1609 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega161 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega162 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega163 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega164a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega164p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega164pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega165 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega165a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega165p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega165pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega168 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega168a {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega168p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega168pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega168pb {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega169 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega169a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega169p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega169pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega16a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega16hva {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega16hva2 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega16hvb {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega16hvbrevb {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega16m1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega16u2 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega16u4 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega2560 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega2561 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega2564rfr2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega256rfr2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega32 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3208 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega3209 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega323 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega324a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega324p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega324pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega324pb {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega325 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3250 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3250a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3250p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3250pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega325a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega325p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega325pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega328 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega328p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega328pb {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega329 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3290 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3290a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3290p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega3290pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega329a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega329p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega329pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega32a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega32c1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega32hvb {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega32hvbrevb {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega32m1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega32u2 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega32u4 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega32u6 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega406 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega48 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega4808 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega4809 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega48a {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega48p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega48pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega48pb {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega64 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x008E
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega640 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega644 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega644a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega644p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega644pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega644rfr2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega645 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega6450 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega6450a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega6450p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega645a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega645p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega649 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega6490 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega6490a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega6490p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega649a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega649p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega64a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x008E
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega64c1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega64hve {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega64hve2 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega64m1 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega64rfr2 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega8 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega808 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega809 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega8515 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega8535 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega88 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega88a {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega88p {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega88pa {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega88pb {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega8a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == atmega8hva {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atmega8u2 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny10 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x003C
    const %ADC_CTRLREG: u16 = 0x003D
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x003B
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0039
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny11 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny12 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny13 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny13a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny15 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny1604 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1606 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1607 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1614 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1616 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1617 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1624 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1626 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1627 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny1634 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0022
    const %ADC_CTRLREG: u16 = 0x0023
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0024
    const %ADC_RESH: u16 = 0x0021
    const %ADC_RESL: u16 = 0x0020
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny167 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny20 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0031
    const %ADC_CTRLREG: u16 = 0x0032
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0030
    const %ADC_RESH: u16 = 0x002F
    const %ADC_RESL: u16 = 0x002E
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny202 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny204 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny212 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny214 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny22 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny2313 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny2313a {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny24 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny24a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny25 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny26 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny261 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny261a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny28 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny3214 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny3216 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny3217 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny3224 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny3226 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny3227 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny40 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0031
    const %ADC_CTRLREG: u16 = 0x0032
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0030
    const %ADC_RESH: u16 = 0x002F
    const %ADC_RESL: u16 = 0x002E
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny402 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny404 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny406 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny412 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny414 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny416 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny417 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny424 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny426 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny427 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny4313 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny43u {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny44 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny441 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny44a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny45 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny461 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny461a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny48 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny5 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x003C
    const %ADC_CTRLREG: u16 = 0x003D
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x003B
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0039
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny804 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny806 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny807 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny814 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny816 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny817 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0606
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny824 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny826 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny827 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny828 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny84 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny841 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == attiny84a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny85 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny861 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny861a {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x0023
    const %ADC_CTRLREG: u16 = 0x0026
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0027
    const %ADC_RESH: u16 = 0x0025
    const %ADC_RESL: u16 = 0x0024
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny87 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny88 {
    const ADC_BUSY_MASK: u16 = 0x0040
    const %ADC_CTRLBREG: u16 = 0x007B
    const %ADC_CTRLREG: u16 = 0x007A
    const ADC_INIT_CLASSIC: u16 = 0x0087
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x007C
    const %ADC_RESH: u16 = 0x0079
    const %ADC_RESL: u16 = 0x0078
    const ADC_START_CLASSIC: u16 = 0x00C7
}

? target == attiny9 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128a1 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128a1u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128a3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128a3u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128a4u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128b1 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128b3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128c3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128d3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega128d4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega16a4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega16a4u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega16c4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega16d4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega192a3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega192a3u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega192c3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega192d3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega256a3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega256a3b {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega256a3bu {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega256a3u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega256c3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega256d3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32a4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32a4u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32c3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32c4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32d3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32d4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega32e5 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega384c3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega384d3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64a1 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64a1u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64a3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64a3u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64a4u {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64b1 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64b3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64c3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64d3 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega64d4 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == atxmega8e5 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128da28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128da32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128da48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128da64 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128db28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128db32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128db48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr128db64 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16dd14 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16dd20 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16dd28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16dd32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16ea28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16ea32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16ea48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16eb14 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16eb20 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16eb28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr16eb32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32da28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32da32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32da48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32db28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32db32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32db48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32dd14 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32dd20 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32dd28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32dd32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32ea28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32ea32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr32ea48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64da28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64da32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64da48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64da64 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64db28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64db32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64db48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64db64 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64dd14 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64dd20 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64dd28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64dd32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x0608
    const %ADC_RESH: u16 = 0x0611
    const %ADC_RESL: u16 = 0x0610
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64du28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060B
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64du32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060B
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64ea28 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64ea32 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == avr64ea48 {
    const ADC_BUSY_MASK: u16 = 0x0001
    const %ADC_CTRLBREG: u16 = 0x0601
    const %ADC_CTRLREG: u16 = 0x0600
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0001
    const %ADC_MUXREG: u16 = 0x060C
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}

? target == m3000 {
    const ADC_BUSY_MASK: u16 = 0x0000
    const %ADC_CTRLBREG: u16 = 0x0000
    const %ADC_CTRLREG: u16 = 0x0000
    const ADC_INIT_CLASSIC: u16 = 0x0000
    const ADC_IS_MODERN: u16 = 0x0000
    const %ADC_MUXREG: u16 = 0x0000
    const %ADC_RESH: u16 = 0x0000
    const %ADC_RESL: u16 = 0x0000
    const ADC_START_CLASSIC: u16 = 0x0000
}


@adc_init() {
    ? ADC_IS_MODERN == 1 {
        0x01 -> %ADC_CTRLREG
    } : {
        ADC_INIT_CLASSIC -> %ADC_CTRLREG
    }
}

@adc_read($channel: u8) -> u16 {
    ? ADC_IS_MODERN == 1 {
        $channel -> %ADC_MUXREG
        0x01 -> %ADC_CTRLREG
        loop * {
            ram imut $flags: u8 = %ADC_CTRLREG
            ? ($flags & ADC_BUSY_MASK) != 0 {
                ram imut $lo: u8 = %ADC_RESL
                ram imut $hi: u8 = %ADC_RESH
                ram mut $result: u16 = $lo
                ram imut $high_shifted: u16 = $hi * 256
                $result + $high_shifted -> $result
                return $result
            }
        }
    } : {
        ram mut $mux: u8 = %ADC_MUXREG
        $mux & 0xF0 -> $mux
        $mux | $channel -> $mux
        $mux -> %ADC_MUXREG
        ADC_START_CLASSIC -> %ADC_CTRLREG
        loop * {
            ram imut $ctrl: u8 = %ADC_CTRLREG
            ? ($ctrl & ADC_BUSY_MASK) == 0 {
                ram imut $lo: u8 = %ADC_RESL
                ram imut $hi: u8 = %ADC_RESH
                ram mut $result: u16 = $lo
                ram imut $high_shifted: u16 = $hi * 256
                $result + $high_shifted -> $result
                return $result
            }
        }
    }
    return 0
}

@adc_read_8bit($channel: u8) -> u8 {
    ram imut $val: u16 = @adc_read($channel)
    ram imut $result: u8 = $val / 4
    return $result
}
