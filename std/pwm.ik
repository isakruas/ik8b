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
# PWM Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at43usb355 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at76c711 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at86rf401 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90c8534 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90can128 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90can32 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90can64 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm161 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90pwm2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm216 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm2b {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm3 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm316 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm3b {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90pwm81 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s1200 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s2313 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s2323 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s2333 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s2343 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s4414 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at90s4433 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == at90s4434 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at90s8515 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at90s8535 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == at90scr100 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90usb1286 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90usb1287 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90usb162 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90usb646 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90usb647 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at90usb82 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == at94k {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == ata5272 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata5505 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata5702m322 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata5782 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata5790 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata5790n {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata5795 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata5831 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata6285 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata6286 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata6289 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == ata6612c {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata6613c {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata6614q {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata6616c {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata6617c {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == ata664251 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega103 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega128 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega1280 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega1281 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega1284 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega1284p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega1284rfr2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega128a {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega128rfa1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega128rfr2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega16 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x005C
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega1608 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega1609 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega161 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega162 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega163 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega164a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega164p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega164pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega165 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega165a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega165p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega165pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega168 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega168a {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega168p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega168pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega168pb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega169 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega169a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega169p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega169pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega16a {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x005C
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega16hva {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega16hva2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega16hvb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega16hvbrevb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega16m1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega16u2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega16u4 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega2560 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega2561 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega2564rfr2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega256rfr2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega32 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x005C
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega3208 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega3209 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega323 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x005C
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega324a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega324p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega324pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega324pb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega325 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3250 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3250a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3250p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3250pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega325a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega325p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega325pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega328 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega328p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega328pb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega329 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3290 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3290a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3290p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega3290pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega329a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega329p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega329pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega32a {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x005C
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega32c1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega32hvb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega32hvbrevb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega32m1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega32u2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega32u4 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega32u6 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega406 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega48 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega4808 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega4809 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega48a {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega48p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega48pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega48pb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega64 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega640 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega644 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega644a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega644p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega644pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega644rfr2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega645 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega6450 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega6450a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega6450p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega645a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega645p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega649 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega6490 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega6490a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega6490p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega649a {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega649p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega64a {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega64c1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega64hve {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega64hve2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega64m1 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega64rfr2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega8 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega808 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega809 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega8515 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0051
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega8535 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x005C
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega88 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega88a {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atmega88p {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega88pa {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega88pb {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == atmega8a {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == atmega8hva {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0089
}

? target == atmega8u2 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == attiny10 {
    const %PWM0_CTRLA: u16 = 0x004E
    const %PWM0_CTRLB: u16 = 0x004D
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0046
    const %PWM0_OCRB: u16 = 0x0044
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny11 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny12 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny13 {
    const %PWM0_CTRLA: u16 = 0x004F
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny13a {
    const %PWM0_CTRLA: u16 = 0x004F
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x0049
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny15 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1604 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1606 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1607 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1614 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1616 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1617 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1624 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1626 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1627 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny1634 {
    const %PWM0_CTRLA: u16 = 0x003B
    const %PWM0_CTRLB: u16 = 0x003A
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0038
    const %PWM0_OCRB: u16 = 0x0037
    const %PWM1_CTRLA: u16 = 0x0072
    const %PWM1_CTRLB: u16 = 0x0071
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x006D
    const %PWM1_OCRAL: u16 = 0x006C
    const %PWM1_OCRBH: u16 = 0x006B
    const %PWM1_OCRBL: u16 = 0x006A
}

? target == attiny167 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == attiny20 {
    const %PWM0_CTRLA: u16 = 0x0039
    const %PWM0_CTRLB: u16 = 0x0038
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0036
    const %PWM0_OCRB: u16 = 0x0035
    const %PWM1_CTRLA: u16 = 0x0044
    const %PWM1_CTRLB: u16 = 0x0043
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x003F
    const %PWM1_OCRAL: u16 = 0x003E
    const %PWM1_OCRBH: u16 = 0x003D
    const %PWM1_OCRBL: u16 = 0x003C
}

? target == attiny202 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny204 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny212 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny214 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny22 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny2313 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny2313a {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny24 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny24a {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny25 {
    const %PWM0_CTRLA: u16 = 0x004A
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0049
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny26 {
    const %PWM0_CTRLA: u16 = 0x0053
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny261 {
    const %PWM0_CTRLA: u16 = 0x0035
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0033
    const %PWM0_OCRB: u16 = 0x0032
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny261a {
    const %PWM0_CTRLA: u16 = 0x0035
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0033
    const %PWM0_OCRB: u16 = 0x0032
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny28 {
    const %PWM0_CTRLA: u16 = 0x0024
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny3214 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny3216 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny3217 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny3224 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny3226 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny3227 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny4 {
    const %PWM0_CTRLA: u16 = 0x004E
    const %PWM0_CTRLB: u16 = 0x004D
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0046
    const %PWM0_OCRB: u16 = 0x0044
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny40 {
    const %PWM0_CTRLA: u16 = 0x0039
    const %PWM0_CTRLB: u16 = 0x0038
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0036
    const %PWM0_OCRB: u16 = 0x0035
    const %PWM1_CTRLA: u16 = 0x0044
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0042
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0041
}

? target == attiny402 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny404 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny406 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny412 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny414 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny416 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny417 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny424 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny426 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny427 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny4313 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny43u {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004B
}

? target == attiny44 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny441 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny44a {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny45 {
    const %PWM0_CTRLA: u16 = 0x004A
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0049
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny461 {
    const %PWM0_CTRLA: u16 = 0x0035
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0033
    const %PWM0_OCRB: u16 = 0x0032
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny461a {
    const %PWM0_CTRLA: u16 = 0x0035
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0033
    const %PWM0_OCRB: u16 = 0x0032
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny48 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == attiny5 {
    const %PWM0_CTRLA: u16 = 0x004E
    const %PWM0_CTRLB: u16 = 0x004D
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0046
    const %PWM0_OCRB: u16 = 0x0044
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny804 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny806 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny807 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny814 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny816 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny817 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A40
    const %PWM1_CTRLB: u16 = 0x0A41
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A4C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny824 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny826 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny827 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0A80
    const %PWM1_CTRLB: u16 = 0x0A81
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0A8C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny828 {
    const %PWM0_CTRLA: u16 = 0x0044
    const %PWM0_CTRLB: u16 = 0x0045
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == attiny84 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny841 {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny84a {
    const %PWM0_CTRLA: u16 = 0x0050
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0056
    const %PWM0_OCRB: u16 = 0x005C
    const %PWM1_CTRLA: u16 = 0x004F
    const %PWM1_CTRLB: u16 = 0x004E
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x004B
    const %PWM1_OCRAL: u16 = 0x004A
    const %PWM1_OCRBH: u16 = 0x0049
    const %PWM1_OCRBL: u16 = 0x0048
}

? target == attiny85 {
    const %PWM0_CTRLA: u16 = 0x004A
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0049
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == attiny861 {
    const %PWM0_CTRLA: u16 = 0x0035
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0033
    const %PWM0_OCRB: u16 = 0x0032
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny861a {
    const %PWM0_CTRLA: u16 = 0x0035
    const %PWM0_CTRLB: u16 = 0x0053
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0033
    const %PWM0_OCRB: u16 = 0x0032
    const %PWM1_CTRLA: u16 = 0x0050
    const %PWM1_CTRLB: u16 = 0x004F
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x004D
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x004C
}

? target == attiny87 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0046
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0048
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == attiny88 {
    const %PWM0_CTRLA: u16 = 0x0045
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0047
    const %PWM0_OCRB: u16 = 0x0048
    const %PWM1_CTRLA: u16 = 0x0080
    const %PWM1_CTRLB: u16 = 0x0081
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0089
    const %PWM1_OCRAL: u16 = 0x0088
    const %PWM1_OCRBH: u16 = 0x008B
    const %PWM1_OCRBL: u16 = 0x008A
}

? target == attiny9 {
    const %PWM0_CTRLA: u16 = 0x004E
    const %PWM0_CTRLB: u16 = 0x004D
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0046
    const %PWM0_OCRB: u16 = 0x0044
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128a1 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128a1u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128a3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128a3u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128a4u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128b1 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128b3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128c3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128d3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega128d4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega16a4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega16a4u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega16c4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega16d4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega192a3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega192a3u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega192c3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega192d3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3b {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3bu {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega256c3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega256d3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32a4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32a4u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32c3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32c4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32d3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32d4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega32e5 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega384c3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega384d3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64a1 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64a1u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64a3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64a3u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64a4u {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64b1 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64b3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64c3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64d3 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega64d4 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == atxmega8e5 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128da28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128da32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128da48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128da64 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128db28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128db32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128db48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr128db64 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16dd14 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16dd20 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16dd28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16dd32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16ea28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16ea32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16ea48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16eb14 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16eb20 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16eb28 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr16eb32 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32da28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32da32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32da48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32db28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32db32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32db48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32dd14 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32dd20 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32dd28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32dd32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32ea28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32ea32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr32ea48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64da28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64da32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64da48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64da64 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64db28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64db32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64db48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64db64 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64dd14 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64dd20 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64dd28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64dd32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64du28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64du32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64ea28 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64ea32 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == avr64ea48 {
    const %PWM0_CTRLA: u16 = 0x0A00
    const %PWM0_CTRLB: u16 = 0x0A01
    const %PWM0_IS_MODERN: u16 = 0x0001
    const %PWM0_OCRA: u16 = 0x0A28
    const %PWM0_OCRB: u16 = 0x0A2A
    const %PWM1_CTRLA: u16 = 0x0B00
    const %PWM1_CTRLB: u16 = 0x0B01
    const %PWM1_IS_MODERN: u16 = 0x0001
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0B0C
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}

? target == m3000 {
    const %PWM0_CTRLA: u16 = 0x0000
    const %PWM0_CTRLB: u16 = 0x0000
    const %PWM0_IS_MODERN: u16 = 0x0000
    const %PWM0_OCRA: u16 = 0x0000
    const %PWM0_OCRB: u16 = 0x0000
    const %PWM1_CTRLA: u16 = 0x0000
    const %PWM1_CTRLB: u16 = 0x0000
    const %PWM1_IS_MODERN: u16 = 0x0000
    const %PWM1_OCRAH: u16 = 0x0000
    const %PWM1_OCRAL: u16 = 0x0000
    const %PWM1_OCRBH: u16 = 0x0000
    const %PWM1_OCRBL: u16 = 0x0000
}


@pwm0_init_fast($prescaler: u8) {
    ? %PWM0_IS_MODERN == 1 {
        0x03 -> %PWM0_CTRLB
        $prescaler | 0x01 -> %PWM0_CTRLA
    } : {
        0x03 -> %PWM0_CTRLA
        $prescaler -> %PWM0_CTRLB
    }
}

@pwm0_set_duty_a($duty: u8) {
    $duty -> %PWM0_OCRA
}

@pwm0_set_duty_b($duty: u8) {
    $duty -> %PWM0_OCRB
}

@pwm0_enable_output_a() {
    ? %PWM0_IS_MODERN == 1 {
        ram imut $ctrl: u8 = %PWM0_CTRLB
        $ctrl | 0x10 -> %PWM0_CTRLB
    } : {
        ram imut $ctrl: u8 = %PWM0_CTRLA
        $ctrl | 0x80 -> %PWM0_CTRLA
    }
}

@pwm0_enable_output_b() {
    ? %PWM0_IS_MODERN == 1 {
        ram imut $ctrl: u8 = %PWM0_CTRLB
        $ctrl | 0x20 -> %PWM0_CTRLB
    } : {
        ram imut $ctrl: u8 = %PWM0_CTRLA
        $ctrl | 0x20 -> %PWM0_CTRLA
    }
}

@pwm0_stop() {
    0x00 -> %PWM0_CTRLB
    ? %PWM0_IS_MODERN == 1 {
        0x00 -> %PWM0_CTRLA
    }
}

@pwm1_init_fast($prescaler: u8) {
    ? %PWM1_IS_MODERN == 1 {
        0x03 -> %PWM1_CTRLB
        $prescaler | 0x01 -> %PWM1_CTRLA
    } : {
        0x02 -> %PWM1_CTRLA
        $prescaler | 0x18 -> %PWM1_CTRLB
    }
}

@pwm1_set_duty_a($duty: u16) {
    ram imut $lo: u8 = $duty & 0xFF
    ram imut $hi: u8 = ($duty / 256) & 0xFF
    $lo -> %PWM1_OCRAL
    $hi -> %PWM1_OCRAH
}

@pwm1_set_duty_b($duty: u16) {
    ram imut $lo: u8 = $duty & 0xFF
    ram imut $hi: u8 = ($duty / 256) & 0xFF
    $lo -> %PWM1_OCRBL
    $hi -> %PWM1_OCRBH
}

@pwm1_enable_output_a() {
    ? %PWM1_IS_MODERN == 1 {
        ram imut $ctrl: u8 = %PWM1_CTRLB
        $ctrl | 0x10 -> %PWM1_CTRLB
    } : {
        ram imut $ctrl: u8 = %PWM1_CTRLA
        $ctrl | 0x80 -> %PWM1_CTRLA
    }
}

@pwm1_enable_output_b() {
    ? %PWM1_IS_MODERN == 1 {
        ram imut $ctrl: u8 = %PWM1_CTRLB
        $ctrl | 0x20 -> %PWM1_CTRLB
    } : {
        ram imut $ctrl: u8 = %PWM1_CTRLA
        $ctrl | 0x20 -> %PWM1_CTRLA
    }
}

@pwm1_stop() {
    0x00 -> %PWM1_CTRLB
    ? %PWM1_IS_MODERN == 1 {
        0x00 -> %PWM1_CTRLA
    }
}
