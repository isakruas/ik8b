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
# Two-Wire Interface (TWI/I2C) Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at43usb355 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at76c711 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at86rf401 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90c8534 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90can128 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90can32 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90can64 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90pwm1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm161 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm2 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm216 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm2b {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm316 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm3b {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90pwm81 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s1200 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s2313 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s2323 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s2333 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s2343 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s4414 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s4433 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s4434 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s8515 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90s8535 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90scr100 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90usb1286 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90usb1287 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90usb162 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at90usb646 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90usb647 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == at90usb82 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == at94k {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x003C
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x003F
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x003D
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == ata5272 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5505 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5702m322 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5782 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5790 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5790n {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5795 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata5831 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata6285 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata6286 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata6289 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata6612c {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == ata6613c {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == ata6614q {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == ata6616c {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata6617c {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == ata664251 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega103 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega128 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0070
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0074
    const %TWI0_DATA_REG: u8 = 0x0073
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0071
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega1280 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega1281 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega1284 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega1284p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega1284rfr2 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega128a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0070
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0074
    const %TWI0_DATA_REG: u8 = 0x0073
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0071
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega128rfa1 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega128rfr2 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega16 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega1608 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega1609 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega161 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega162 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega163 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega164a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega164p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega164pa {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega165 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega165a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega165p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega165pa {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega168 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega168a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega168p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega168pa {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega168pb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega169 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega169a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega169p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega169pa {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega16a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega16hva {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega16hva2 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega16hvb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega16hvbrevb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega16m1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega16u2 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega16u4 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega2560 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega2561 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega2564rfr2 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega256rfr2 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega32 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega3208 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega3209 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega323 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega324a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega324p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega324pa {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega324pb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
    const %TWI1_ACK_VAL: u8 = 0x00C4
    const %TWI1_BAUD_REG: u8 = 0x00D8
    const %TWI1_CTRL_REG: u8 = 0x00DC
    const %TWI1_DATA_REG: u8 = 0x00DB
    const %TWI1_EN_VAL: u8 = 0x0084
    const %TWI1_INT_MASK: u8 = 0x0080
    const %TWI1_IS_MODERN: u8 = 0x0000
    const %TWI1_START_VAL: u8 = 0x00A4
    const %TWI1_STATUS_REG: u8 = 0x00D9
    const %TWI1_STOP_VAL: u8 = 0x0094
}

? target == atmega325 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3250 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3250a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3250p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3250pa {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega325a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega325p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega325pa {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega328 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega328p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega328pb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
    const %TWI1_ACK_VAL: u8 = 0x00C4
    const %TWI1_BAUD_REG: u8 = 0x00D8
    const %TWI1_CTRL_REG: u8 = 0x00DC
    const %TWI1_DATA_REG: u8 = 0x00DB
    const %TWI1_EN_VAL: u8 = 0x0084
    const %TWI1_INT_MASK: u8 = 0x0080
    const %TWI1_IS_MODERN: u8 = 0x0000
    const %TWI1_START_VAL: u8 = 0x00A4
    const %TWI1_STATUS_REG: u8 = 0x00D9
    const %TWI1_STOP_VAL: u8 = 0x0094
}

? target == atmega329 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3290 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3290a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3290p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega3290pa {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega329a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega329p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega329pa {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega32a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega32c1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega32hvb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega32hvbrevb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega32m1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega32u2 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega32u4 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega32u6 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega406 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega48 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega4808 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega4809 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega48a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega48p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega48pa {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega48pb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega64 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0070
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0074
    const %TWI0_DATA_REG: u8 = 0x0073
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0071
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega640 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega644 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega644a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega644p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega644pa {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega644rfr2 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega645 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega6450 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega6450a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega6450p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega645a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega645p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega649 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega6490 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega6490a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega6490p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega649a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega649p {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega64a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0070
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0074
    const %TWI0_DATA_REG: u8 = 0x0073
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0071
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega64c1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega64hve {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega64hve2 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega64m1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega64rfr2 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega8 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega808 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega809 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == atmega8515 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega8535 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega88 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega88a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega88p {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega88pa {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega88pb {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega8a {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x0020
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0056
    const %TWI0_DATA_REG: u8 = 0x0023
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x0021
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == atmega8hva {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atmega8u2 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny10 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny11 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny12 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny13 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny13a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny15 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny1604 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1606 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1607 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1614 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1616 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1617 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1624 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1626 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1627 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny1634 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny167 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny20 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny202 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny204 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny212 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny214 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny22 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny2313 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny2313a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny24 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny24a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny25 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny26 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny261 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny261a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny28 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny3214 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny3216 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny3217 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny3224 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny3226 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny3227 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny40 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny402 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny404 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny406 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny412 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny414 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny416 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny417 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny424 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny426 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny427 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny4313 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny43u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny44 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny441 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny44a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny45 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny461 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny461a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny48 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == attiny5 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny804 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny806 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny807 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny814 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny816 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny817 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0816
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0814
    const %TWI0_DATA_REG: u8 = 0x0818
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0815
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny824 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny826 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny827 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x08A6
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x08A4
    const %TWI0_DATA_REG: u8 = 0x08A8
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x08A5
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == attiny828 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny84 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny841 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny84a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny85 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny861 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny861a {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny87 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == attiny88 {
    const %TWI0_ACK_VAL: u8 = 0x00C4
    const %TWI0_BAUD_REG: u8 = 0x00B8
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x00BC
    const %TWI0_DATA_REG: u8 = 0x00BB
    const %TWI0_EN_VAL: u8 = 0x0084
    const %TWI0_INT_MASK: u8 = 0x0080
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x00A4
    const %TWI0_STATUS_REG: u8 = 0x00B9
    const %TWI0_STOP_VAL: u8 = 0x0094
}

? target == attiny9 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128a1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128a1u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128a3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128a3u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128a4u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128b1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128b3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128c3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128d3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega128d4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega16a4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega16a4u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega16c4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega16d4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega192a3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega192a3u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega192c3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega192d3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega256a3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega256a3b {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega256a3bu {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega256a3u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega256c3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega256d3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32a4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32a4u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32c3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32c4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32d3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32d4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega32e5 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega384c3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega384d3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64a1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64a1u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64a3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64a3u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64a4u {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64b1 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64b3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64c3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64d3 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega64d4 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == atxmega8e5 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}

? target == avr128da28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr128da32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr128da48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr128da64 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr128db28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr128db32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr128db48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr128db64 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr16dd14 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16dd20 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16dd28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16dd32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16ea28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16ea32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16ea48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16eb14 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16eb20 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16eb28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr16eb32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32da28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32da32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr32da48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr32db28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32db32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr32db48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr32dd14 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32dd20 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32dd28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32dd32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32ea28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32ea32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr32ea48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64da28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64da32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr64da48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr64da64 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr64db28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64db32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr64db48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr64db64 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
    const %TWI1_ACK_VAL: u8 = 0x0002
    const %TWI1_BAUD_REG: u8 = 0x0926
    const %TWI1_CTRL_REG: u8 = 0x0924
    const %TWI1_DATA_REG: u8 = 0x0928
    const %TWI1_EN_VAL: u8 = 0x0000
    const %TWI1_INT_MASK: u8 = 0x0040
    const %TWI1_IS_MODERN: u8 = 0x0001
    const %TWI1_START_VAL: u8 = 0x0000
    const %TWI1_STATUS_REG: u8 = 0x0925
    const %TWI1_STOP_VAL: u8 = 0x0003
}

? target == avr64dd14 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64dd20 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64dd28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64dd32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64du28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64du32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64ea28 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64ea32 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == avr64ea48 {
    const %TWI0_ACK_VAL: u8 = 0x0002
    const %TWI0_BAUD_REG: u8 = 0x0906
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0904
    const %TWI0_DATA_REG: u8 = 0x0908
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0040
    const %TWI0_IS_MODERN: u8 = 0x0001
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0905
    const %TWI0_STOP_VAL: u8 = 0x0003
}

? target == m3000 {
    const %TWI0_ACK_VAL: u8 = 0x0000
    const %TWI0_BAUD_REG: u8 = 0x0000
    const %TWI0_BITRATE_REG: u8 = 0x0000
    const %TWI0_CTRL_REG: u8 = 0x0000
    const %TWI0_DATA_REG: u8 = 0x0000
    const %TWI0_EN_VAL: u8 = 0x0000
    const %TWI0_INT_MASK: u8 = 0x0000
    const %TWI0_IS_MODERN: u8 = 0x0000
    const %TWI0_START_VAL: u8 = 0x0000
    const %TWI0_STATUS_REG: u8 = 0x0000
    const %TWI0_STOP_VAL: u8 = 0x0000
}


@_twi_wait() {
    loop * {
        ? %TWI0_IS_MODERN == 1 {
            ram imut $st: u8 = %TWI0_STATUS_REG
            ? ($st & %TWI0_INT_MASK) != 0 { return }
        } : {
            ram imut $ctrl: u8 = %TWI0_CTRL_REG
            ? ($ctrl & %TWI0_INT_MASK) != 0 { return }
        }
    }
}
@twi_init($twbr_val: u8) {
    $twbr_val -> %TWI0_BAUD_REG
}
@twi_start() {
    ? %TWI0_IS_MODERN == 1 {
        # Handled in write for modern AVR
    } : {
        %TWI0_START_VAL -> %TWI0_CTRL_REG
        @_twi_wait()
    }
}
@twi_stop() {
    %TWI0_STOP_VAL -> %TWI0_CTRL_REG
}
@twi_write($data: u8) {
    $data -> %TWI0_DATA_REG
    ? %TWI0_IS_MODERN == 1 {
        # Modern
    } : {
        %TWI0_EN_VAL -> %TWI0_CTRL_REG
    }
    @_twi_wait()
}
@twi_read_ack() -> u8 {
    ? %TWI0_IS_MODERN == 1 {
        %TWI0_ACK_VAL -> %TWI0_CTRL_REG
    } : {
        %TWI0_ACK_VAL -> %TWI0_CTRL_REG
    }
    @_twi_wait()
    return %TWI0_DATA_REG
}
@twi_read_nack() -> u8 {
    ? %TWI0_IS_MODERN == 1 {
        %TWI0_ACK_VAL -> %TWI0_CTRL_REG
    } : {
        %TWI0_EN_VAL -> %TWI0_CTRL_REG
    }
    @_twi_wait()
    return %TWI0_DATA_REG
}

@_twi1_wait() {
    loop * {
        ? %TWI1_IS_MODERN == 1 {
            ram imut $st: u8 = %TWI1_STATUS_REG
            ? ($st & %TWI1_INT_MASK) != 0 { return }
        } : {
            ram imut $ctrl: u8 = %TWI1_CTRL_REG
            ? ($ctrl & %TWI1_INT_MASK) != 0 { return }
        }
    }
}
@twi1_init($twbr_val: u8) {
    $twbr_val -> %TWI1_BAUD_REG
}
@twi1_start() {
    ? %TWI1_IS_MODERN == 1 {
        # Handled in write for modern AVR
    } : {
        %TWI1_START_VAL -> %TWI1_CTRL_REG
        @_twi1_wait()
    }
}
@twi1_stop() {
    %TWI1_STOP_VAL -> %TWI1_CTRL_REG
}
@twi1_write($data: u8) {
    $data -> %TWI1_DATA_REG
    ? %TWI1_IS_MODERN == 1 {
        # Modern
    } : {
        %TWI1_EN_VAL -> %TWI1_CTRL_REG
    }
    @_twi1_wait()
}
@twi1_read_ack() -> u8 {
    ? %TWI1_IS_MODERN == 1 {
        %TWI1_ACK_VAL -> %TWI1_CTRL_REG
    } : {
        %TWI1_ACK_VAL -> %TWI1_CTRL_REG
    }
    @_twi1_wait()
    return %TWI1_DATA_REG
}
@twi1_read_nack() -> u8 {
    ? %TWI1_IS_MODERN == 1 {
        %TWI1_ACK_VAL -> %TWI1_CTRL_REG
    } : {
        %TWI1_EN_VAL -> %TWI1_CTRL_REG
    }
    @_twi1_wait()
    return %TWI1_DATA_REG
}
