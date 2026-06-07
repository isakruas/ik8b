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
# Universal Asynchronous Receiver-Transmitter (UART) Library
# -------------------------------------------------------------

? target == at43usb320 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at43usb355 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at76c711 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at86rf401 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90c8534 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90can128 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90can32 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90can64 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90pwm1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90pwm161 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90pwm2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90pwm216 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90pwm2b {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90pwm3 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90pwm316 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90pwm3b {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90pwm81 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90s1200 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90s2313 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90s2323 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90s2333 {
    const %UART0_BAUDH_REG: u8 = 0x0023
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90s2343 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == at90s4414 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90s4433 {
    const %UART0_BAUDH_REG: u8 = 0x0023
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90s4434 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90s8515 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90s8535 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == at90scr100 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == at90usb1286 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90usb1287 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90usb162 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90usb646 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90usb647 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at90usb82 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == at94k {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x0000
    const %UART1_BAUDL_REG: u8 = 0x0020
    const %UART1_CTRLB_REG: u8 = 0x0021
    const %UART1_CTRLC_REG: u8 = 0x0000
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0023
    const %UART1_STATUS_REG: u8 = 0x0022
    const %UART1_TX_REG: u8 = 0x0023
}

? target == ata5272 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5505 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5702m322 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5782 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5790 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5790n {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5795 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata5831 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata6285 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata6286 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata6289 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata6612c {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == ata6613c {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == ata6614q {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == ata6616c {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata6617c {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == ata664251 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega103 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega128 {
    const %UART0_BAUDH_REG: u8 = 0x0090
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0095
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x0098
    const %UART1_BAUDL_REG: u8 = 0x0099
    const %UART1_CTRLB_REG: u8 = 0x009A
    const %UART1_CTRLC_REG: u8 = 0x009D
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x009C
    const %UART1_STATUS_REG: u8 = 0x009B
    const %UART1_TX_REG: u8 = 0x009C
}

? target == atmega1280 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
    const %UART2_BAUDH_REG: u8 = 0x00D5
    const %UART2_BAUDL_REG: u8 = 0x00D4
    const %UART2_CTRLB_REG: u8 = 0x00D1
    const %UART2_CTRLC_REG: u8 = 0x00D2
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x0018
    const UART2_INIT_CTRLC: u8 = 0x0006
    const UART2_IS_MODERN: u8 = 0x0000
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x00D6
    const %UART2_STATUS_REG: u8 = 0x00D0
    const %UART2_TX_REG: u8 = 0x00D6
    const %UART3_BAUDH_REG: u8 = 0x0135
    const %UART3_BAUDL_REG: u8 = 0x0134
    const %UART3_CTRLB_REG: u8 = 0x0131
    const %UART3_CTRLC_REG: u8 = 0x0132
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x0018
    const UART3_INIT_CTRLC: u8 = 0x0006
    const UART3_IS_MODERN: u8 = 0x0000
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0136
    const %UART3_STATUS_REG: u8 = 0x0130
    const %UART3_TX_REG: u8 = 0x0136
}

? target == atmega1281 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega1284 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega1284p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega1284rfr2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega128a {
    const %UART0_BAUDH_REG: u8 = 0x0090
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0095
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x0098
    const %UART1_BAUDL_REG: u8 = 0x0099
    const %UART1_CTRLB_REG: u8 = 0x009A
    const %UART1_CTRLC_REG: u8 = 0x009D
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x009C
    const %UART1_STATUS_REG: u8 = 0x009B
    const %UART1_TX_REG: u8 = 0x009C
}

? target == atmega128rfa1 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega128rfr2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega16 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega1608 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == atmega1609 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
}

? target == atmega161 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x0000
    const %UART1_BAUDL_REG: u8 = 0x0020
    const %UART1_CTRLB_REG: u8 = 0x0021
    const %UART1_CTRLC_REG: u8 = 0x0000
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0023
    const %UART1_STATUS_REG: u8 = 0x0022
    const %UART1_TX_REG: u8 = 0x0023
}

? target == atmega162 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x005C
    const %UART1_BAUDL_REG: u8 = 0x0020
    const %UART1_CTRLB_REG: u8 = 0x0021
    const %UART1_CTRLC_REG: u8 = 0x005C
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0023
    const %UART1_STATUS_REG: u8 = 0x0022
    const %UART1_TX_REG: u8 = 0x0023
}

? target == atmega163 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega164a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega164p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega164pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega165 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega165a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega165p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega165pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega168 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega168a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega168p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega168pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega168pb {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega169 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega169a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega169p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega169pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega16a {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega16hva {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega16hva2 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega16hvb {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega16hvbrevb {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega16m1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega16u2 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega16u4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega2560 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
    const %UART2_BAUDH_REG: u8 = 0x00D5
    const %UART2_BAUDL_REG: u8 = 0x00D4
    const %UART2_CTRLB_REG: u8 = 0x00D1
    const %UART2_CTRLC_REG: u8 = 0x00D2
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x0018
    const UART2_INIT_CTRLC: u8 = 0x0006
    const UART2_IS_MODERN: u8 = 0x0000
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x00D6
    const %UART2_STATUS_REG: u8 = 0x00D0
    const %UART2_TX_REG: u8 = 0x00D6
    const %UART3_BAUDH_REG: u8 = 0x0135
    const %UART3_BAUDL_REG: u8 = 0x0134
    const %UART3_CTRLB_REG: u8 = 0x0131
    const %UART3_CTRLC_REG: u8 = 0x0132
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x0018
    const UART3_INIT_CTRLC: u8 = 0x0006
    const UART3_IS_MODERN: u8 = 0x0000
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0136
    const %UART3_STATUS_REG: u8 = 0x0130
    const %UART3_TX_REG: u8 = 0x0136
}

? target == atmega2561 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega2564rfr2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega256rfr2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega32 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0086
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega3208 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == atmega3209 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
}

? target == atmega323 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega324a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega324p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega324pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega324pb {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
    const %UART2_BAUDH_REG: u8 = 0x00D5
    const %UART2_BAUDL_REG: u8 = 0x00D4
    const %UART2_CTRLB_REG: u8 = 0x00D1
    const %UART2_CTRLC_REG: u8 = 0x00D2
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x0018
    const UART2_INIT_CTRLC: u8 = 0x0006
    const UART2_IS_MODERN: u8 = 0x0000
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x00D6
    const %UART2_STATUS_REG: u8 = 0x00D0
    const %UART2_TX_REG: u8 = 0x00D6
}

? target == atmega325 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3250 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3250a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3250p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3250pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega325a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega325p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega325pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega328 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega328p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega328pb {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega329 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3290 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3290a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3290p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega3290pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega329a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega329p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega329pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega32a {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega32c1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega32hvb {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega32hvbrevb {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega32m1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega32u2 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega32u4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega32u6 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega406 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega48 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega4808 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == atmega4809 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
}

? target == atmega48a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega48p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega48pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega48pb {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega64 {
    const %UART0_BAUDH_REG: u8 = 0x0090
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0095
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x0098
    const %UART1_BAUDL_REG: u8 = 0x0099
    const %UART1_CTRLB_REG: u8 = 0x009A
    const %UART1_CTRLC_REG: u8 = 0x009D
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x009C
    const %UART1_STATUS_REG: u8 = 0x009B
    const %UART1_TX_REG: u8 = 0x009C
}

? target == atmega640 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
    const %UART2_BAUDH_REG: u8 = 0x00D5
    const %UART2_BAUDL_REG: u8 = 0x00D4
    const %UART2_CTRLB_REG: u8 = 0x00D1
    const %UART2_CTRLC_REG: u8 = 0x00D2
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x0018
    const UART2_INIT_CTRLC: u8 = 0x0006
    const UART2_IS_MODERN: u8 = 0x0000
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x00D6
    const %UART2_STATUS_REG: u8 = 0x00D0
    const %UART2_TX_REG: u8 = 0x00D6
    const %UART3_BAUDH_REG: u8 = 0x0135
    const %UART3_BAUDL_REG: u8 = 0x0134
    const %UART3_CTRLB_REG: u8 = 0x0131
    const %UART3_CTRLC_REG: u8 = 0x0132
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x0018
    const UART3_INIT_CTRLC: u8 = 0x0006
    const UART3_IS_MODERN: u8 = 0x0000
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0136
    const %UART3_STATUS_REG: u8 = 0x0130
    const %UART3_TX_REG: u8 = 0x0136
}

? target == atmega644 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega644a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega644p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega644pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega644rfr2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega645 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega6450 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega6450a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega6450p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega645a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega645p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega649 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega6490 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega6490a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega6490p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega649a {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega649p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega64a {
    const %UART0_BAUDH_REG: u8 = 0x0090
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0095
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
    const %UART1_BAUDH_REG: u8 = 0x0098
    const %UART1_BAUDL_REG: u8 = 0x0099
    const %UART1_CTRLB_REG: u8 = 0x009A
    const %UART1_CTRLC_REG: u8 = 0x009D
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x009C
    const %UART1_STATUS_REG: u8 = 0x009B
    const %UART1_TX_REG: u8 = 0x009C
}

? target == atmega64c1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega64hve {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega64hve2 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega64m1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega64rfr2 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == atmega8 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega808 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == atmega809 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
}

? target == atmega8515 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega8535 {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega88 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega88a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega88p {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega88pa {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega88pb {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == atmega8a {
    const %UART0_BAUDH_REG: u8 = 0x0040
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0040
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == atmega8hva {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atmega8u2 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
    const %UART1_BAUDH_REG: u8 = 0x00CD
    const %UART1_BAUDL_REG: u8 = 0x00CC
    const %UART1_CTRLB_REG: u8 = 0x00C9
    const %UART1_CTRLC_REG: u8 = 0x00CA
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x00CE
    const %UART1_STATUS_REG: u8 = 0x00C8
    const %UART1_TX_REG: u8 = 0x00CE
}

? target == attiny10 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny11 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny12 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny13 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny13a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny15 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny1604 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny1606 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny1607 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny1614 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny1616 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny1617 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny1624 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny1626 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny1627 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny1634 {
    const %UART0_BAUDH_REG: u8 = 0x0042
    const %UART0_BAUDL_REG: u8 = 0x0041
    const %UART0_CTRLB_REG: u8 = 0x0045
    const %UART0_CTRLC_REG: u8 = 0x0044
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0040
    const %UART0_STATUS_REG: u8 = 0x0046
    const %UART0_TX_REG: u8 = 0x0040
    const %UART1_BAUDH_REG: u8 = 0x0075
    const %UART1_BAUDL_REG: u8 = 0x0074
    const %UART1_CTRLB_REG: u8 = 0x0078
    const %UART1_CTRLC_REG: u8 = 0x0077
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0073
    const %UART1_STATUS_REG: u8 = 0x0079
    const %UART1_TX_REG: u8 = 0x0073
}

? target == attiny167 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny20 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny202 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny204 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny212 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny214 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny22 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny2313 {
    const %UART0_BAUDH_REG: u8 = 0x0022
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0023
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == attiny2313a {
    const %UART0_BAUDH_REG: u8 = 0x0022
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0023
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == attiny24 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny24a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny25 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny26 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny261 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny261a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny28 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny3214 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny3216 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny3217 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny3224 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny3226 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny3227 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny40 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny402 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny404 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny406 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny412 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny414 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny416 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny417 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny424 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny426 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny427 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny4313 {
    const %UART0_BAUDH_REG: u8 = 0x0022
    const %UART0_BAUDL_REG: u8 = 0x0029
    const %UART0_CTRLB_REG: u8 = 0x002A
    const %UART0_CTRLC_REG: u8 = 0x0023
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x002C
    const %UART0_STATUS_REG: u8 = 0x002B
    const %UART0_TX_REG: u8 = 0x002C
}

? target == attiny43u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny44 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny441 {
    const %UART0_BAUDH_REG: u8 = 0x0082
    const %UART0_BAUDL_REG: u8 = 0x0081
    const %UART0_CTRLB_REG: u8 = 0x0085
    const %UART0_CTRLC_REG: u8 = 0x0084
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0080
    const %UART0_STATUS_REG: u8 = 0x0086
    const %UART0_TX_REG: u8 = 0x0080
    const %UART1_BAUDH_REG: u8 = 0x0092
    const %UART1_BAUDL_REG: u8 = 0x0091
    const %UART1_CTRLB_REG: u8 = 0x0095
    const %UART1_CTRLC_REG: u8 = 0x0094
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0090
    const %UART1_STATUS_REG: u8 = 0x0096
    const %UART1_TX_REG: u8 = 0x0090
}

? target == attiny44a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny45 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny461 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny461a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny48 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny5 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny804 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny806 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny807 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny814 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny816 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny817 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == attiny824 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny826 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny827 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == attiny828 {
    const %UART0_BAUDH_REG: u8 = 0x00C5
    const %UART0_BAUDL_REG: u8 = 0x00C4
    const %UART0_CTRLB_REG: u8 = 0x00C1
    const %UART0_CTRLC_REG: u8 = 0x00C2
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x00C6
    const %UART0_STATUS_REG: u8 = 0x00C0
    const %UART0_TX_REG: u8 = 0x00C6
}

? target == attiny84 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny841 {
    const %UART0_BAUDH_REG: u8 = 0x0082
    const %UART0_BAUDL_REG: u8 = 0x0081
    const %UART0_CTRLB_REG: u8 = 0x0085
    const %UART0_CTRLC_REG: u8 = 0x0084
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x0018
    const UART0_INIT_CTRLC: u8 = 0x0006
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0080
    const %UART0_STATUS_REG: u8 = 0x0086
    const %UART0_TX_REG: u8 = 0x0080
    const %UART1_BAUDH_REG: u8 = 0x0092
    const %UART1_BAUDL_REG: u8 = 0x0091
    const %UART1_CTRLB_REG: u8 = 0x0095
    const %UART1_CTRLC_REG: u8 = 0x0094
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x0018
    const UART1_INIT_CTRLC: u8 = 0x0006
    const UART1_IS_MODERN: u8 = 0x0000
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0090
    const %UART1_STATUS_REG: u8 = 0x0096
    const %UART1_TX_REG: u8 = 0x0090
}

? target == attiny84a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny85 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny861 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny861a {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny87 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny88 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == attiny9 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128a1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128a1u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128a3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128a3u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128a4u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128b1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128b3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128c3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128d3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega128d4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega16a4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega16a4u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega16c4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega16d4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega192a3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega192a3u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega192c3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega192d3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega256a3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega256a3b {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega256a3bu {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega256a3u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega256c3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega256d3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32a4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32a4u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32c3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32c4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32d3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32d4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega32e5 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega384c3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega384d3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64a1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64a1u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64a3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64a3u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64a4u {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64b1 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64b3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64c3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64d3 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega64d4 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == atxmega8e5 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}

? target == avr128da28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr128da32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr128da48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
}

? target == avr128da64 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
    const %UART5_BAUDH_REG: u8 = 0x08A9
    const %UART5_BAUDL_REG: u8 = 0x08A8
    const %UART5_CTRLB_REG: u8 = 0x08A6
    const %UART5_CTRLC_REG: u8 = 0x08A7
    const UART5_DRE_MASK: u8 = 0x0020
    const UART5_INIT_CTRLB: u8 = 0x00C0
    const UART5_INIT_CTRLC: u8 = 0x0003
    const UART5_IS_MODERN: u8 = 0x0001
    const UART5_RXC_MASK: u8 = 0x0080
    const %UART5_RX_REG: u8 = 0x08A0
    const %UART5_STATUS_REG: u8 = 0x08A4
    const %UART5_TX_REG: u8 = 0x08A2
}

? target == avr128db28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr128db32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr128db48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
}

? target == avr128db64 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
    const %UART5_BAUDH_REG: u8 = 0x08A9
    const %UART5_BAUDL_REG: u8 = 0x08A8
    const %UART5_CTRLB_REG: u8 = 0x08A6
    const %UART5_CTRLC_REG: u8 = 0x08A7
    const UART5_DRE_MASK: u8 = 0x0020
    const UART5_INIT_CTRLB: u8 = 0x00C0
    const UART5_INIT_CTRLC: u8 = 0x0003
    const UART5_IS_MODERN: u8 = 0x0001
    const UART5_RXC_MASK: u8 = 0x0080
    const %UART5_RX_REG: u8 = 0x08A0
    const %UART5_STATUS_REG: u8 = 0x08A4
    const %UART5_TX_REG: u8 = 0x08A2
}

? target == avr16dd14 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr16dd20 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr16dd28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr16dd32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr16ea28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr16ea32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr16ea48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr16eb14 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == avr16eb20 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == avr16eb28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == avr16eb32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
}

? target == avr32da28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr32da32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr32da48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
}

? target == avr32db28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr32db32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr32db48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
}

? target == avr32dd14 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr32dd20 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr32dd28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr32dd32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr32ea28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr32ea32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr32ea48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64da28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64da32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64da48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
}

? target == avr64da64 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
    const %UART5_BAUDH_REG: u8 = 0x08A9
    const %UART5_BAUDL_REG: u8 = 0x08A8
    const %UART5_CTRLB_REG: u8 = 0x08A6
    const %UART5_CTRLC_REG: u8 = 0x08A7
    const UART5_DRE_MASK: u8 = 0x0020
    const UART5_INIT_CTRLB: u8 = 0x00C0
    const UART5_INIT_CTRLC: u8 = 0x0003
    const UART5_IS_MODERN: u8 = 0x0001
    const UART5_RXC_MASK: u8 = 0x0080
    const %UART5_RX_REG: u8 = 0x08A0
    const %UART5_STATUS_REG: u8 = 0x08A4
    const %UART5_TX_REG: u8 = 0x08A2
}

? target == avr64db28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64db32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64db48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
}

? target == avr64db64 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
    const %UART3_BAUDH_REG: u8 = 0x0869
    const %UART3_BAUDL_REG: u8 = 0x0868
    const %UART3_CTRLB_REG: u8 = 0x0866
    const %UART3_CTRLC_REG: u8 = 0x0867
    const UART3_DRE_MASK: u8 = 0x0020
    const UART3_INIT_CTRLB: u8 = 0x00C0
    const UART3_INIT_CTRLC: u8 = 0x0003
    const UART3_IS_MODERN: u8 = 0x0001
    const UART3_RXC_MASK: u8 = 0x0080
    const %UART3_RX_REG: u8 = 0x0860
    const %UART3_STATUS_REG: u8 = 0x0864
    const %UART3_TX_REG: u8 = 0x0862
    const %UART4_BAUDH_REG: u8 = 0x0889
    const %UART4_BAUDL_REG: u8 = 0x0888
    const %UART4_CTRLB_REG: u8 = 0x0886
    const %UART4_CTRLC_REG: u8 = 0x0887
    const UART4_DRE_MASK: u8 = 0x0020
    const UART4_INIT_CTRLB: u8 = 0x00C0
    const UART4_INIT_CTRLC: u8 = 0x0003
    const UART4_IS_MODERN: u8 = 0x0001
    const UART4_RXC_MASK: u8 = 0x0080
    const %UART4_RX_REG: u8 = 0x0880
    const %UART4_STATUS_REG: u8 = 0x0884
    const %UART4_TX_REG: u8 = 0x0882
    const %UART5_BAUDH_REG: u8 = 0x08A9
    const %UART5_BAUDL_REG: u8 = 0x08A8
    const %UART5_CTRLB_REG: u8 = 0x08A6
    const %UART5_CTRLC_REG: u8 = 0x08A7
    const UART5_DRE_MASK: u8 = 0x0020
    const UART5_INIT_CTRLB: u8 = 0x00C0
    const UART5_INIT_CTRLC: u8 = 0x0003
    const UART5_IS_MODERN: u8 = 0x0001
    const UART5_RXC_MASK: u8 = 0x0080
    const %UART5_RX_REG: u8 = 0x08A0
    const %UART5_STATUS_REG: u8 = 0x08A4
    const %UART5_TX_REG: u8 = 0x08A2
}

? target == avr64dd14 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr64dd20 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr64dd28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr64dd32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr64du28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr64du32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
}

? target == avr64ea28 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64ea32 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == avr64ea48 {
    const %UART0_BAUDH_REG: u8 = 0x0809
    const %UART0_BAUDL_REG: u8 = 0x0808
    const %UART0_CTRLB_REG: u8 = 0x0806
    const %UART0_CTRLC_REG: u8 = 0x0807
    const UART0_DRE_MASK: u8 = 0x0020
    const UART0_INIT_CTRLB: u8 = 0x00C0
    const UART0_INIT_CTRLC: u8 = 0x0003
    const UART0_IS_MODERN: u8 = 0x0001
    const UART0_RXC_MASK: u8 = 0x0080
    const %UART0_RX_REG: u8 = 0x0800
    const %UART0_STATUS_REG: u8 = 0x0804
    const %UART0_TX_REG: u8 = 0x0802
    const %UART1_BAUDH_REG: u8 = 0x0829
    const %UART1_BAUDL_REG: u8 = 0x0828
    const %UART1_CTRLB_REG: u8 = 0x0826
    const %UART1_CTRLC_REG: u8 = 0x0827
    const UART1_DRE_MASK: u8 = 0x0020
    const UART1_INIT_CTRLB: u8 = 0x00C0
    const UART1_INIT_CTRLC: u8 = 0x0003
    const UART1_IS_MODERN: u8 = 0x0001
    const UART1_RXC_MASK: u8 = 0x0080
    const %UART1_RX_REG: u8 = 0x0820
    const %UART1_STATUS_REG: u8 = 0x0824
    const %UART1_TX_REG: u8 = 0x0822
    const %UART2_BAUDH_REG: u8 = 0x0849
    const %UART2_BAUDL_REG: u8 = 0x0848
    const %UART2_CTRLB_REG: u8 = 0x0846
    const %UART2_CTRLC_REG: u8 = 0x0847
    const UART2_DRE_MASK: u8 = 0x0020
    const UART2_INIT_CTRLB: u8 = 0x00C0
    const UART2_INIT_CTRLC: u8 = 0x0003
    const UART2_IS_MODERN: u8 = 0x0001
    const UART2_RXC_MASK: u8 = 0x0080
    const %UART2_RX_REG: u8 = 0x0840
    const %UART2_STATUS_REG: u8 = 0x0844
    const %UART2_TX_REG: u8 = 0x0842
}

? target == m3000 {
    const %UART0_BAUDH_REG: u8 = 0x0000
    const %UART0_BAUDL_REG: u8 = 0x0000
    const %UART0_CTRLB_REG: u8 = 0x0000
    const %UART0_CTRLC_REG: u8 = 0x0000
    const UART0_DRE_MASK: u8 = 0x0000
    const UART0_INIT_CTRLB: u8 = 0x0000
    const UART0_INIT_CTRLC: u8 = 0x0000
    const UART0_IS_MODERN: u8 = 0x0000
    const UART0_RXC_MASK: u8 = 0x0000
    const %UART0_RX_REG: u8 = 0x0000
    const %UART0_STATUS_REG: u8 = 0x0000
    const %UART0_TX_REG: u8 = 0x0000
}


@uart_init($ubrr: u16) {
    ram imut $ubrr_lo: u8 = $ubrr & 0xFF
    ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
    $ubrr_lo -> %UART0_BAUDL_REG
    $ubrr_hi -> %UART0_BAUDH_REG
    UART0_INIT_CTRLB -> %UART0_CTRLB_REG
    UART0_INIT_CTRLC -> %UART0_CTRLC_REG
}
@_uart_wait_tx() {
    loop * {
        ram imut $status: u8 = %UART0_STATUS_REG
        ? ($status & UART0_DRE_MASK) != 0 { return }
    }
}
@uart_send($data: u8) {
    @_uart_wait_tx()
    $data -> %UART0_TX_REG
}
@uart_receive() -> u8 {
    loop * {
        ram imut $status: u8 = %UART0_STATUS_REG
        ? ($status & UART0_RXC_MASK) != 0 { return %UART0_RX_REG }
    }
    return %UART0_RX_REG
}
@uart_available() -> u8 {
    ram imut $status: u8 = %UART0_STATUS_REG
    ? ($status & UART0_RXC_MASK) != 0 { return 1 }
    return 0
}
@uart_print_char($char: u8) { @uart_send($char) }
@uart_println() {
    @uart_send(13)
    @uart_send(10)
}

@uart1_init($ubrr: u16) {
    ram imut $ubrr_lo: u8 = $ubrr & 0xFF
    ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
    $ubrr_lo -> %UART1_BAUDL_REG
    $ubrr_hi -> %UART1_BAUDH_REG
    UART1_INIT_CTRLB -> %UART1_CTRLB_REG
    UART1_INIT_CTRLC -> %UART1_CTRLC_REG
}
@_uart1_wait_tx() {
    loop * {
        ram imut $status: u8 = %UART1_STATUS_REG
        ? ($status & UART1_DRE_MASK) != 0 { return }
    }
}
@uart1_send($data: u8) {
    @_uart1_wait_tx()
    $data -> %UART1_TX_REG
}
@uart1_receive() -> u8 {
    loop * {
        ram imut $status: u8 = %UART1_STATUS_REG
        ? ($status & UART1_RXC_MASK) != 0 { return %UART1_RX_REG }
    }
    return %UART1_RX_REG
}
@uart1_available() -> u8 {
    ram imut $status: u8 = %UART1_STATUS_REG
    ? ($status & UART1_RXC_MASK) != 0 { return 1 }
    return 0
}
@uart1_print_char($char: u8) { @uart1_send($char) }
@uart1_println() {
    @uart1_send(13)
    @uart1_send(10)
}

@uart2_init($ubrr: u16) {
    ram imut $ubrr_lo: u8 = $ubrr & 0xFF
    ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
    $ubrr_lo -> %UART2_BAUDL_REG
    $ubrr_hi -> %UART2_BAUDH_REG
    UART2_INIT_CTRLB -> %UART2_CTRLB_REG
    UART2_INIT_CTRLC -> %UART2_CTRLC_REG
}
@_uart2_wait_tx() {
    loop * {
        ram imut $status: u8 = %UART2_STATUS_REG
        ? ($status & UART2_DRE_MASK) != 0 { return }
    }
}
@uart2_send($data: u8) {
    @_uart2_wait_tx()
    $data -> %UART2_TX_REG
}
@uart2_receive() -> u8 {
    loop * {
        ram imut $status: u8 = %UART2_STATUS_REG
        ? ($status & UART2_RXC_MASK) != 0 { return %UART2_RX_REG }
    }
    return %UART2_RX_REG
}
@uart2_available() -> u8 {
    ram imut $status: u8 = %UART2_STATUS_REG
    ? ($status & UART2_RXC_MASK) != 0 { return 1 }
    return 0
}
@uart2_print_char($char: u8) { @uart2_send($char) }
@uart2_println() {
    @uart2_send(13)
    @uart2_send(10)
}

@uart3_init($ubrr: u16) {
    ram imut $ubrr_lo: u8 = $ubrr & 0xFF
    ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
    $ubrr_lo -> %UART3_BAUDL_REG
    $ubrr_hi -> %UART3_BAUDH_REG
    UART3_INIT_CTRLB -> %UART3_CTRLB_REG
    UART3_INIT_CTRLC -> %UART3_CTRLC_REG
}
@_uart3_wait_tx() {
    loop * {
        ram imut $status: u8 = %UART3_STATUS_REG
        ? ($status & UART3_DRE_MASK) != 0 { return }
    }
}
@uart3_send($data: u8) {
    @_uart3_wait_tx()
    $data -> %UART3_TX_REG
}
@uart3_receive() -> u8 {
    loop * {
        ram imut $status: u8 = %UART3_STATUS_REG
        ? ($status & UART3_RXC_MASK) != 0 { return %UART3_RX_REG }
    }
    return %UART3_RX_REG
}
@uart3_available() -> u8 {
    ram imut $status: u8 = %UART3_STATUS_REG
    ? ($status & UART3_RXC_MASK) != 0 { return 1 }
    return 0
}
@uart3_print_char($char: u8) { @uart3_send($char) }
@uart3_println() {
    @uart3_send(13)
    @uart3_send(10)
}

@uart4_init($ubrr: u16) {
    ram imut $ubrr_lo: u8 = $ubrr & 0xFF
    ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
    $ubrr_lo -> %UART4_BAUDL_REG
    $ubrr_hi -> %UART4_BAUDH_REG
    UART4_INIT_CTRLB -> %UART4_CTRLB_REG
    UART4_INIT_CTRLC -> %UART4_CTRLC_REG
}
@_uart4_wait_tx() {
    loop * {
        ram imut $status: u8 = %UART4_STATUS_REG
        ? ($status & UART4_DRE_MASK) != 0 { return }
    }
}
@uart4_send($data: u8) {
    @_uart4_wait_tx()
    $data -> %UART4_TX_REG
}
@uart4_receive() -> u8 {
    loop * {
        ram imut $status: u8 = %UART4_STATUS_REG
        ? ($status & UART4_RXC_MASK) != 0 { return %UART4_RX_REG }
    }
    return %UART4_RX_REG
}
@uart4_available() -> u8 {
    ram imut $status: u8 = %UART4_STATUS_REG
    ? ($status & UART4_RXC_MASK) != 0 { return 1 }
    return 0
}
@uart4_print_char($char: u8) { @uart4_send($char) }
@uart4_println() {
    @uart4_send(13)
    @uart4_send(10)
}

@uart5_init($ubrr: u16) {
    ram imut $ubrr_lo: u8 = $ubrr & 0xFF
    ram imut $ubrr_hi: u8 = ($ubrr / 256) & 0xFF
    $ubrr_lo -> %UART5_BAUDL_REG
    $ubrr_hi -> %UART5_BAUDH_REG
    UART5_INIT_CTRLB -> %UART5_CTRLB_REG
    UART5_INIT_CTRLC -> %UART5_CTRLC_REG
}
@_uart5_wait_tx() {
    loop * {
        ram imut $status: u8 = %UART5_STATUS_REG
        ? ($status & UART5_DRE_MASK) != 0 { return }
    }
}
@uart5_send($data: u8) {
    @_uart5_wait_tx()
    $data -> %UART5_TX_REG
}
@uart5_receive() -> u8 {
    loop * {
        ram imut $status: u8 = %UART5_STATUS_REG
        ? ($status & UART5_RXC_MASK) != 0 { return %UART5_RX_REG }
    }
    return %UART5_RX_REG
}
@uart5_available() -> u8 {
    ram imut $status: u8 = %UART5_STATUS_REG
    ? ($status & UART5_RXC_MASK) != 0 { return 1 }
    return 0
}
@uart5_print_char($char: u8) { @uart5_send($char) }
@uart5_println() {
    @uart5_send(13)
    @uart5_send(10)
}
