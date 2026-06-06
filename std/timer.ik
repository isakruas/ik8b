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
# Timer Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at43usb355 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at76c711 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0056
    const %TMR0_IMASK: u16 = 0x0057
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0056
    const %TMR1_IMASK: u16 = 0x0057
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at86rf401 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90c8534 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90can128 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90can32 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90can64 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm161 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90pwm2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm216 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm2b {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm3 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm316 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm3b {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90pwm81 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s1200 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s2313 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s2323 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s2333 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s2343 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s4414 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at90s4433 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == at90s4434 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at90s8515 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at90s8535 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == at90scr100 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90usb1286 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90usb1287 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90usb162 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90usb646 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90usb647 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at90usb82 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == at94k {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == ata5272 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata5505 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata5702m322 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata5782 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata5790 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata5790n {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata5795 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata5831 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata6285 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata6286 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata6289 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == ata6612c {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata6613c {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata6614q {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata6616c {
    const %TMR0_CNT: u16 = 0x0047
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata6617c {
    const %TMR0_CNT: u16 = 0x0047
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == ata664251 {
    const %TMR0_CNT: u16 = 0x0047
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega103 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0056
    const %TMR0_IMASK: u16 = 0x0057
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0056
    const %TMR1_IMASK: u16 = 0x0057
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega128 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0056
    const %TMR0_IMASK: u16 = 0x0057
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0056
    const %TMR1_IMASK: u16 = 0x0057
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega1280 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega1281 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega1284 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega1284p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega1284rfr2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega128a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0056
    const %TMR0_IMASK: u16 = 0x0057
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0056
    const %TMR1_IMASK: u16 = 0x0057
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega128rfa1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega128rfr2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega16 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x005C
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega1608 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega1609 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega161 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega162 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega163 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega164a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega164p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega164pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega165 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega165a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega165p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega165pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega168 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega168a {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega168p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega168pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega168pb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega169 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega169a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega169p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega169pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega16a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x005C
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega16hva {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega16hva2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega16hvb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega16hvbrevb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega16m1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega16u2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega16u4 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega2560 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega2561 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega2564rfr2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega256rfr2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega32 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x005C
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega3208 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega3209 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega323 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x005C
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega324a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega324p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega324pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega324pb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega325 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3250 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3250a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3250p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3250pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega325a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega325p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega325pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega328 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega328p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega328pb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega329 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3290 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3290a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3290p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega3290pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega329a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega329p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega329pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega32a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x005C
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega32c1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega32hvb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega32hvbrevb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega32m1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega32u2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega32u4 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega32u6 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega406 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega48 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega4808 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega4809 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega48a {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega48p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega48pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega48pb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega64 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0056
    const %TMR0_IMASK: u16 = 0x0057
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0056
    const %TMR1_IMASK: u16 = 0x0057
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega640 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega644 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega644a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega644p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega644pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega644rfr2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega645 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega6450 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega6450a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega6450p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega645a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega645p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega649 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega6490 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega6490a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega6490p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega649a {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega649p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega64a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0056
    const %TMR0_IMASK: u16 = 0x0057
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0056
    const %TMR1_IMASK: u16 = 0x0057
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega64c1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega64hve {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega64hve2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega64m1 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega64rfr2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega8 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega808 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega809 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega8515 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0051
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega8535 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x005C
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega88 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega88a {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atmega88p {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega88pa {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega88pb {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == atmega8a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == atmega8hva {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0089
}

? target == atmega8u2 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == attiny10 {
    const %TMR0_CNT: u16 = 0x0048
    const %TMR0_CTRLA: u16 = 0x004E
    const %TMR0_CTRLB: u16 = 0x004D
    const %TMR0_IFLAG: u16 = 0x004A
    const %TMR0_IMASK: u16 = 0x004B
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0046
    const %TMR0_OCRB: u16 = 0x0044
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny11 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny12 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny13 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x004F
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny13a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x004F
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x0049
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny15 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1604 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1606 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1607 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1614 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1616 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1617 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1624 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1626 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1627 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny1634 {
    const %TMR0_CNT: u16 = 0x0039
    const %TMR0_CTRLA: u16 = 0x003B
    const %TMR0_CTRLB: u16 = 0x003A
    const %TMR0_IFLAG: u16 = 0x0059
    const %TMR0_IMASK: u16 = 0x005A
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0038
    const %TMR0_OCRB: u16 = 0x0037
    const %TMR1_CNTH: u16 = 0x006F
    const %TMR1_CNTL: u16 = 0x006E
    const %TMR1_CTRLA: u16 = 0x0072
    const %TMR1_CTRLB: u16 = 0x0071
    const %TMR1_IFLAG: u16 = 0x0059
    const %TMR1_IMASK: u16 = 0x005A
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x006D
    const %TMR1_OCRAL: u16 = 0x006C
    const %TMR1_OCRBH: u16 = 0x006B
    const %TMR1_OCRBL: u16 = 0x006A
}

? target == attiny167 {
    const %TMR0_CNT: u16 = 0x0047
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == attiny20 {
    const %TMR0_CNT: u16 = 0x0037
    const %TMR0_CTRLA: u16 = 0x0039
    const %TMR0_CTRLB: u16 = 0x0038
    const %TMR0_IFLAG: u16 = 0x0045
    const %TMR0_IMASK: u16 = 0x0046
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0036
    const %TMR0_OCRB: u16 = 0x0035
    const %TMR1_CNTH: u16 = 0x0041
    const %TMR1_CNTL: u16 = 0x0040
    const %TMR1_CTRLA: u16 = 0x0044
    const %TMR1_CTRLB: u16 = 0x0043
    const %TMR1_IFLAG: u16 = 0x0045
    const %TMR1_IMASK: u16 = 0x0046
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x003F
    const %TMR1_OCRAL: u16 = 0x003E
    const %TMR1_OCRBH: u16 = 0x003D
    const %TMR1_OCRBL: u16 = 0x003C
}

? target == attiny202 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny204 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny212 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny214 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny22 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny2313 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny2313a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny24 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny24a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny25 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x004A
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0049
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny26 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0053
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny261 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0035
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0033
    const %TMR0_OCRB: u16 = 0x0032
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny261a {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0035
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0033
    const %TMR0_OCRB: u16 = 0x0032
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny28 {
    const %TMR0_CNT: u16 = 0x0023
    const %TMR0_CTRLA: u16 = 0x0024
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny3214 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny3216 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny3217 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny3224 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny3226 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny3227 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny4 {
    const %TMR0_CNT: u16 = 0x0048
    const %TMR0_CTRLA: u16 = 0x004E
    const %TMR0_CTRLB: u16 = 0x004D
    const %TMR0_IFLAG: u16 = 0x004A
    const %TMR0_IMASK: u16 = 0x004B
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0046
    const %TMR0_OCRB: u16 = 0x0044
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny40 {
    const %TMR0_CNT: u16 = 0x0037
    const %TMR0_CTRLA: u16 = 0x0039
    const %TMR0_CTRLB: u16 = 0x0038
    const %TMR0_IFLAG: u16 = 0x0045
    const %TMR0_IMASK: u16 = 0x0046
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0036
    const %TMR0_OCRB: u16 = 0x0035
    const %TMR1_CNTH: u16 = 0x0047
    const %TMR1_CNTL: u16 = 0x0043
    const %TMR1_CTRLA: u16 = 0x0044
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0045
    const %TMR1_IMASK: u16 = 0x0046
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0042
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0041
}

? target == attiny402 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny404 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny406 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny412 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny414 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny416 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny417 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny424 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny426 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny427 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny4313 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny43u {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004D
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004B
}

? target == attiny44 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny441 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002E
    const %TMR1_IMASK: u16 = 0x002F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny44a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny45 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x004A
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0049
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny461 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0035
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0033
    const %TMR0_OCRB: u16 = 0x0032
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny461a {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0035
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0033
    const %TMR0_OCRB: u16 = 0x0032
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny48 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == attiny5 {
    const %TMR0_CNT: u16 = 0x0048
    const %TMR0_CTRLA: u16 = 0x004E
    const %TMR0_CTRLB: u16 = 0x004D
    const %TMR0_IFLAG: u16 = 0x004A
    const %TMR0_IMASK: u16 = 0x004B
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0046
    const %TMR0_OCRB: u16 = 0x0044
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny804 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny806 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny807 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny814 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny816 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny817 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A4A
    const %TMR1_CTRLA: u16 = 0x0A40
    const %TMR1_CTRLB: u16 = 0x0A41
    const %TMR1_IFLAG: u16 = 0x0A46
    const %TMR1_IMASK: u16 = 0x0A45
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A4C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny824 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny826 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny827 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0A8A
    const %TMR1_CTRLA: u16 = 0x0A80
    const %TMR1_CTRLB: u16 = 0x0A81
    const %TMR1_IFLAG: u16 = 0x0A86
    const %TMR1_IMASK: u16 = 0x0A85
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0A8C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny828 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0044
    const %TMR0_CTRLB: u16 = 0x0045
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == attiny84 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny841 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002E
    const %TMR1_IMASK: u16 = 0x002F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny84a {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x0050
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0056
    const %TMR0_OCRB: u16 = 0x005C
    const %TMR1_CNTH: u16 = 0x004D
    const %TMR1_CNTL: u16 = 0x004C
    const %TMR1_CTRLA: u16 = 0x004F
    const %TMR1_CTRLB: u16 = 0x004E
    const %TMR1_IFLAG: u16 = 0x002B
    const %TMR1_IMASK: u16 = 0x002C
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x004B
    const %TMR1_OCRAL: u16 = 0x004A
    const %TMR1_OCRBH: u16 = 0x0049
    const %TMR1_OCRBL: u16 = 0x0048
}

? target == attiny85 {
    const %TMR0_CNT: u16 = 0x0052
    const %TMR0_CTRLA: u16 = 0x004A
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0049
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == attiny861 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0035
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0033
    const %TMR0_OCRB: u16 = 0x0032
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny861a {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0035
    const %TMR0_CTRLB: u16 = 0x0053
    const %TMR0_IFLAG: u16 = 0x0058
    const %TMR0_IMASK: u16 = 0x0059
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0033
    const %TMR0_OCRB: u16 = 0x0032
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x004E
    const %TMR1_CTRLA: u16 = 0x0050
    const %TMR1_CTRLB: u16 = 0x004F
    const %TMR1_IFLAG: u16 = 0x0058
    const %TMR1_IMASK: u16 = 0x0059
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x004D
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x004C
}

? target == attiny87 {
    const %TMR0_CNT: u16 = 0x0047
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0046
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0048
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == attiny88 {
    const %TMR0_CNT: u16 = 0x0046
    const %TMR0_CTRLA: u16 = 0x0045
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0035
    const %TMR0_IMASK: u16 = 0x006E
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0047
    const %TMR0_OCRB: u16 = 0x0048
    const %TMR1_CNTH: u16 = 0x0085
    const %TMR1_CNTL: u16 = 0x0084
    const %TMR1_CTRLA: u16 = 0x0080
    const %TMR1_CTRLB: u16 = 0x0081
    const %TMR1_IFLAG: u16 = 0x0036
    const %TMR1_IMASK: u16 = 0x006F
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0089
    const %TMR1_OCRAL: u16 = 0x0088
    const %TMR1_OCRBH: u16 = 0x008B
    const %TMR1_OCRBL: u16 = 0x008A
}

? target == attiny9 {
    const %TMR0_CNT: u16 = 0x0048
    const %TMR0_CTRLA: u16 = 0x004E
    const %TMR0_CTRLB: u16 = 0x004D
    const %TMR0_IFLAG: u16 = 0x004A
    const %TMR0_IMASK: u16 = 0x004B
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0046
    const %TMR0_OCRB: u16 = 0x0044
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128a1 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128a1u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128a3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128a3u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128a4u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128b1 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128b3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128c3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128d3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega128d4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega16a4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega16a4u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega16c4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega16d4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega192a3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega192a3u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega192c3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega192d3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3b {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3bu {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega256a3u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega256c3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega256d3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32a4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32a4u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32c3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32c4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32d3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32d4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega32e5 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega384c3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega384d3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64a1 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64a1u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64a3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64a3u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64a4u {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64b1 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64b3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64c3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64d3 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega64d4 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == atxmega8e5 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128da28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128da32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128da48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128da64 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128db28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128db32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128db48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr128db64 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16dd14 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16dd20 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16dd28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16dd32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16ea28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16ea32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16ea48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16eb14 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16eb20 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16eb28 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr16eb32 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32da28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32da32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32da48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32db28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32db32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32db48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32dd14 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32dd20 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32dd28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32dd32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32ea28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32ea32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr32ea48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64da28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64da32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64da48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64da64 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64db28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64db32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64db48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64db64 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64dd14 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64dd20 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64dd28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64dd32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64du28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64du32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64ea28 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64ea32 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == avr64ea48 {
    const %TMR0_CNT: u16 = 0x0A20
    const %TMR0_CTRLA: u16 = 0x0A00
    const %TMR0_CTRLB: u16 = 0x0A01
    const %TMR0_IFLAG: u16 = 0x0A0B
    const %TMR0_IMASK: u16 = 0x0A0A
    const TMR0_IS_MODERN: u16 = 0x0001
    const %TMR0_OCRA: u16 = 0x0A28
    const %TMR0_OCRB: u16 = 0x0A2A
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0B0A
    const %TMR1_CTRLA: u16 = 0x0B00
    const %TMR1_CTRLB: u16 = 0x0B01
    const %TMR1_IFLAG: u16 = 0x0B06
    const %TMR1_IMASK: u16 = 0x0B05
    const TMR1_IS_MODERN: u16 = 0x0001
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0B0C
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}

? target == m3000 {
    const %TMR0_CNT: u16 = 0x0000
    const %TMR0_CTRLA: u16 = 0x0000
    const %TMR0_CTRLB: u16 = 0x0000
    const %TMR0_IFLAG: u16 = 0x0000
    const %TMR0_IMASK: u16 = 0x0000
    const TMR0_IS_MODERN: u16 = 0x0000
    const %TMR0_OCRA: u16 = 0x0000
    const %TMR0_OCRB: u16 = 0x0000
    const %TMR1_CNTH: u16 = 0x0000
    const %TMR1_CNTL: u16 = 0x0000
    const %TMR1_CTRLA: u16 = 0x0000
    const %TMR1_CTRLB: u16 = 0x0000
    const %TMR1_IFLAG: u16 = 0x0000
    const %TMR1_IMASK: u16 = 0x0000
    const TMR1_IS_MODERN: u16 = 0x0000
    const %TMR1_OCRAH: u16 = 0x0000
    const %TMR1_OCRAL: u16 = 0x0000
    const %TMR1_OCRBH: u16 = 0x0000
    const %TMR1_OCRBL: u16 = 0x0000
}


@timer0_set_prescaler($prescaler: u8) {
    ? TMR0_IS_MODERN == 1 {
        $prescaler -> %TMR0_CTRLA
    } : {
        $prescaler -> %TMR0_CTRLB
    }
}

@timer0_set_compare_a($val: u8) {
    $val -> %TMR0_OCRA
}

@timer0_set_compare_b($val: u8) {
    $val -> %TMR0_OCRB
}

@timer0_read() -> u8 {
    return %TMR0_CNT
}

@timer0_write($val: u8) {
    $val -> %TMR0_CNT
}

@timer0_ctc_mode() {
    ? TMR0_IS_MODERN == 1 {
        0x00 -> %TMR0_CTRLA
    } : {
        0x02 -> %TMR0_CTRLA
    }
}

@timer0_enable_compa_int() {
    ? TMR0_IS_MODERN == 1 {
        ram imut $curr: u8 = %TMR0_IMASK
        $curr | 0x10 -> %TMR0_IMASK
    } : {
        ram imut $curr: u8 = %TMR0_IMASK
        $curr | 0x02 -> %TMR0_IMASK
    }
}

@timer1_set_prescaler($prescaler: u8) {
    ? TMR1_IS_MODERN == 1 {
        $prescaler -> %TMR1_CTRLA
    } : {
        $prescaler -> %TMR1_CTRLB
    }
}

@timer1_set_compare_a($val: u16) {
    ram imut $lo: u8 = $val & 0xFF
    ram imut $hi: u8 = ($val / 256) & 0xFF
    $lo -> %TMR1_OCRAL
    $hi -> %TMR1_OCRAH
}

@timer1_set_compare_b($val: u16) {
    ram imut $lo: u8 = $val & 0xFF
    ram imut $hi: u8 = ($val / 256) & 0xFF
    $lo -> %TMR1_OCRBL
    $hi -> %TMR1_OCRBH
}

@timer1_read() -> u16 {
    ram imut $lo: u8 = %TMR1_CNTL
    ram imut $hi: u8 = %TMR1_CNTH
    ram mut $result: u16 = $lo
    ram imut $high_shifted: u16 = $hi * 256
    $result + $high_shifted -> $result
    return $result
}

@timer1_write($val: u16) {
    ram imut $lo: u8 = $val & 0xFF
    ram imut $hi: u8 = ($val / 256) & 0xFF
    $hi -> %TMR1_CNTH
    $lo -> %TMR1_CNTL
}

@timer1_ctc_mode() {
    ? TMR1_IS_MODERN == 1 {
        0x00 -> %TMR1_CTRLA
    } : {
        0x00 -> %TMR1_CTRLA
        0x08 -> %TMR1_CTRLB
    }
}

@timer1_enable_compa_int() {
    ? TMR1_IS_MODERN == 1 {
        ram imut $curr: u8 = %TMR1_IMASK
        $curr | 0x10 -> %TMR1_IMASK
    } : {
        ram imut $curr: u8 = %TMR1_IMASK
        $curr | 0x02 -> %TMR1_IMASK
    }
}
