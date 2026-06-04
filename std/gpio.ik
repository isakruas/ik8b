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
# General Purpose Input/Output (GPIO) Library
# -------------------------------------------------------------

# Computes a bitmask representing (1 << pin) dynamically
@_gpio_mask($pin: u8) -> u8 {
    ram mut $mask: u8 = 1
    loop 0..$pin -> $i {
        $mask * 2 -> $mask
    }
    return $mask
}

? target == at43usb320 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

}

? target == at43usb355 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

    const %PINF: u16  = 0x0024
    const %DDRF: u16  = 0x0025
    const %PORTF: u16 = 0x0026

}

? target == at76c711 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s1200 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s2313 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s2323 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == at90s2333 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s2343 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == at90s4414 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s4433 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s4434 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s8515 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90s8535 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == at90usb162 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == at90usb82 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata5272 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == ata5505 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == ata6616c {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == ata6617c {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == ata664251 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega103 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

}

? target == atmega16u2 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega32u2 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega8u2 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == attiny11 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny12 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny13 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny13a {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny15 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny1634 {
    const %PINA: u16  = 0x002F
    const %DDRA: u16  = 0x0030
    const %PORTA: u16 = 0x0031

    const %PINB: u16  = 0x002B
    const %DDRB: u16  = 0x002C
    const %PORTB: u16 = 0x002D

    const %PINC: u16  = 0x0027
    const %DDRC: u16  = 0x0028
    const %PORTC: u16 = 0x0029

}

? target == attiny167 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == attiny22 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny2313 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == attiny2313a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == attiny24 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny24a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny25 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny26 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny261 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny261a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny28 {
    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == attiny4313 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == attiny43u {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny44 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny441 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny44a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny45 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny461 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny461a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny48 {
    const %PINA: u16  = 0x002C
    const %DDRA: u16  = 0x002D
    const %PORTA: u16 = 0x002E

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == attiny828 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0024
    const %DDRB: u16  = 0x0025
    const %PORTB: u16 = 0x0026

    const %PINC: u16  = 0x0028
    const %DDRC: u16  = 0x0029
    const %PORTC: u16 = 0x002A

    const %PIND: u16  = 0x002C
    const %DDRD: u16  = 0x002D
    const %PORTD: u16 = 0x002E

}

? target == attiny84 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny841 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny84a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny85 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny861 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny861a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

}

? target == attiny87 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == attiny88 {
    const %PINA: u16  = 0x002C
    const %DDRA: u16  = 0x002D
    const %PORTA: u16 = 0x002E

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == at90can128 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == at90can32 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == at90can64 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == at90pwm1 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm161 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm2 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm216 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm2b {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm3 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm316 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm3b {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90pwm81 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90scr100 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == at90usb1286 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == at90usb1287 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == at90usb646 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == at90usb647 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == at94k {
    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0025
    const %DDRE: u16  = 0x0026
    const %PORTE: u16 = 0x0027

}

? target == ata5702m322 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata5782 {
    const %PINB: u16  = 0x0025
    const %DDRB: u16  = 0x0026
    const %PORTB: u16 = 0x0027

    const %PINC: u16  = 0x0028
    const %DDRC: u16  = 0x0029
    const %PORTC: u16 = 0x002A

}

? target == ata5790 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata5790n {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata5795 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata5831 {
    const %PINB: u16  = 0x0025
    const %DDRB: u16  = 0x0026
    const %PORTB: u16 = 0x0027

    const %PINC: u16  = 0x0028
    const %DDRC: u16  = 0x0029
    const %PORTC: u16 = 0x002A

}

? target == ata6285 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata6286 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata6289 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata6612c {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata6613c {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == ata6614q {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega128 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

    const %PINF: u16  = 0x0020
    const %DDRF: u16  = 0x0061
    const %PORTF: u16 = 0x0062

    const %PING: u16  = 0x0063
    const %DDRG: u16  = 0x0064
    const %PORTG: u16 = 0x0065

}

? target == atmega1280 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x0100
    const %DDRH: u16  = 0x0101
    const %PORTH: u16 = 0x0102

    const %PINJ: u16  = 0x0103
    const %DDRJ: u16  = 0x0104
    const %PORTJ: u16 = 0x0105

    const %PINK: u16  = 0x0106
    const %DDRK: u16  = 0x0107
    const %PORTK: u16 = 0x0108

    const %PINL: u16  = 0x0109
    const %DDRL: u16  = 0x010A
    const %PORTL: u16 = 0x010B

}

? target == atmega1281 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega1284 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega1284p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega1284rfr2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega128a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

    const %PINF: u16  = 0x0020
    const %DDRF: u16  = 0x0061
    const %PORTF: u16 = 0x0062

    const %PING: u16  = 0x0063
    const %DDRG: u16  = 0x0064
    const %PORTG: u16 = 0x0065

}

? target == atmega128rfa1 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega128rfr2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega16 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega161 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0025
    const %DDRE: u16  = 0x0026
    const %PORTE: u16 = 0x0027

}

? target == atmega162 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0025
    const %DDRE: u16  = 0x0026
    const %PORTE: u16 = 0x0027

}

? target == atmega163 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega164a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega164p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega164pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega165 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega165a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega165p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega165pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega168p {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega168pa {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega168pb {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega169 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega169a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega169p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega169pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega16a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega16hva {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega16hva2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega16hvb {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega16hvbrevb {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega16m1 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega16u4 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == atmega2560 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x0100
    const %DDRH: u16  = 0x0101
    const %PORTH: u16 = 0x0102

    const %PINJ: u16  = 0x0103
    const %DDRJ: u16  = 0x0104
    const %PORTJ: u16 = 0x0105

    const %PINK: u16  = 0x0106
    const %DDRK: u16  = 0x0107
    const %PORTK: u16 = 0x0108

    const %PINL: u16  = 0x0109
    const %DDRL: u16  = 0x010A
    const %PORTL: u16 = 0x010B

}

? target == atmega2561 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega2564rfr2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega256rfr2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega32 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega323 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega324a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega324p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega324pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega324pb {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega325 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega3250 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega3250a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega3250p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega3250pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega325a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega325p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega325pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega328 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega328p {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega328pb {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega329 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega3290 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega3290a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega3290p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega3290pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega329a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega329p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega329pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega32a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega32c1 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega32hvb {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega32hvbrevb {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega32m1 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega32u4 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == atmega32u6 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

}

? target == atmega406 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega48p {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega48pa {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega48pb {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega64 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

    const %PINF: u16  = 0x0020
    const %DDRF: u16  = 0x0061
    const %PORTF: u16 = 0x0062

    const %PING: u16  = 0x0063
    const %DDRG: u16  = 0x0064
    const %PORTG: u16 = 0x0065

}

? target == atmega640 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x0100
    const %DDRH: u16  = 0x0101
    const %PORTH: u16 = 0x0102

    const %PINJ: u16  = 0x0103
    const %DDRJ: u16  = 0x0104
    const %PORTJ: u16 = 0x0105

    const %PINK: u16  = 0x0106
    const %DDRK: u16  = 0x0107
    const %PORTK: u16 = 0x0108

    const %PINL: u16  = 0x0109
    const %DDRL: u16  = 0x010A
    const %PORTL: u16 = 0x010B

}

? target == atmega644 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega644a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega644p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega644pa {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega644rfr2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega645 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega6450 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega6450a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega6450p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega645a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega645p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega649 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega6490 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega6490a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega6490p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

    const %PINH: u16  = 0x00D8
    const %DDRH: u16  = 0x00D9
    const %PORTH: u16 = 0x00DA

    const %PINJ: u16  = 0x00DB
    const %DDRJ: u16  = 0x00DC
    const %PORTJ: u16 = 0x00DD

}

? target == atmega649a {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega649p {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega64a {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0021
    const %DDRE: u16  = 0x0022
    const %PORTE: u16 = 0x0023

    const %PINF: u16  = 0x0020
    const %DDRF: u16  = 0x0061
    const %PORTF: u16 = 0x0062

    const %PING: u16  = 0x0063
    const %DDRG: u16  = 0x0064
    const %PORTG: u16 = 0x0065

}

? target == atmega64c1 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega64hve {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega64hve2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == atmega64m1 {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega64rfr2 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

    const %PINF: u16  = 0x002F
    const %DDRF: u16  = 0x0030
    const %PORTF: u16 = 0x0031

    const %PING: u16  = 0x0032
    const %DDRG: u16  = 0x0033
    const %PORTG: u16 = 0x0034

}

? target == atmega8 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega8515 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

    const %PINE: u16  = 0x0025
    const %DDRE: u16  = 0x0026
    const %PORTE: u16 = 0x0027

}

? target == atmega8535 {
    const %PINA: u16  = 0x0039
    const %DDRA: u16  = 0x003A
    const %PORTA: u16 = 0x003B

    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega88p {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega88pa {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

}

? target == atmega88pb {
    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

    const %PINC: u16  = 0x0026
    const %DDRC: u16  = 0x0027
    const %PORTC: u16 = 0x0028

    const %PIND: u16  = 0x0029
    const %DDRD: u16  = 0x002A
    const %PORTD: u16 = 0x002B

    const %PINE: u16  = 0x002C
    const %DDRE: u16  = 0x002D
    const %PORTE: u16 = 0x002E

}

? target == atmega8a {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038

    const %PINC: u16  = 0x0033
    const %DDRC: u16  = 0x0034
    const %PORTC: u16 = 0x0035

    const %PIND: u16  = 0x0030
    const %DDRD: u16  = 0x0031
    const %PORTD: u16 = 0x0032

}

? target == atmega8hva {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0023
    const %DDRB: u16  = 0x0024
    const %PORTB: u16 = 0x0025

}

? target == attiny10 {
    const %PINB: u16  = 0x0020
    const %DDRB: u16  = 0x0021
    const %PORTB: u16 = 0x0022

}

? target == attiny20 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0024
    const %DDRB: u16  = 0x0025
    const %PORTB: u16 = 0x0026

}

? target == attiny4 {
    const %PINB: u16  = 0x0020
    const %DDRB: u16  = 0x0021
    const %PORTB: u16 = 0x0022

}

? target == attiny40 {
    const %PINA: u16  = 0x0020
    const %DDRA: u16  = 0x0021
    const %PORTA: u16 = 0x0022

    const %PINB: u16  = 0x0024
    const %DDRB: u16  = 0x0025
    const %PORTB: u16 = 0x0026

    const %PINC: u16  = 0x003B
    const %DDRC: u16  = 0x003C
    const %PORTC: u16 = 0x003D

}

? target == attiny5 {
    const %PINB: u16  = 0x0020
    const %DDRB: u16  = 0x0021
    const %PORTB: u16 = 0x0022

}

? target == attiny9 {
    const %PINB: u16  = 0x0020
    const %DDRB: u16  = 0x0021
    const %PORTB: u16 = 0x0022

}

? target == atxmega128a1 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINH: u16  = 0x06E8
    const %DDRH: u16  = 0x06E0
    const %PORTH: u16 = 0x06E4

    const %PINJ: u16  = 0x0708
    const %DDRJ: u16  = 0x0700
    const %PORTJ: u16 = 0x0704

    const %PINK: u16  = 0x0728
    const %DDRK: u16  = 0x0720
    const %PORTK: u16 = 0x0724

    const %PINQ: u16  = 0x07C8
    const %DDRQ: u16  = 0x07C0
    const %PORTQ: u16 = 0x07C4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128a1u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINH: u16  = 0x06E8
    const %DDRH: u16  = 0x06E0
    const %PORTH: u16 = 0x06E4

    const %PINJ: u16  = 0x0708
    const %DDRJ: u16  = 0x0700
    const %PORTJ: u16 = 0x0704

    const %PINK: u16  = 0x0728
    const %DDRK: u16  = 0x0720
    const %PORTK: u16 = 0x0724

    const %PINQ: u16  = 0x07C8
    const %DDRQ: u16  = 0x07C0
    const %PORTQ: u16 = 0x07C4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128a3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128a3u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128a4u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128b1 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PING: u16  = 0x06C8
    const %DDRG: u16  = 0x06C0
    const %PORTG: u16 = 0x06C4

    const %PINM: u16  = 0x0768
    const %DDRM: u16  = 0x0760
    const %PORTM: u16 = 0x0764

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128b3 {
    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PING: u16  = 0x06C8
    const %DDRG: u16  = 0x06C0
    const %PORTG: u16 = 0x06C4

    const %PINM: u16  = 0x0768
    const %DDRM: u16  = 0x0760
    const %PORTM: u16 = 0x0764

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128c3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128d3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega128d4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega16a4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega16a4u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega16c4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega16d4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega192a3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega192a3u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega192c3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega192d3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega256a3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega256a3b {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega256a3bu {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega256a3u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega256c3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega256d3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32a4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32a4u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32c3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32c4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32d3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32d4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega32e5 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega384c3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega384d3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64a1 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINH: u16  = 0x06E8
    const %DDRH: u16  = 0x06E0
    const %PORTH: u16 = 0x06E4

    const %PINJ: u16  = 0x0708
    const %DDRJ: u16  = 0x0700
    const %PORTJ: u16 = 0x0704

    const %PINK: u16  = 0x0728
    const %DDRK: u16  = 0x0720
    const %PORTK: u16 = 0x0724

    const %PINQ: u16  = 0x07C8
    const %DDRQ: u16  = 0x07C0
    const %PORTQ: u16 = 0x07C4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64a1u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINH: u16  = 0x06E8
    const %DDRH: u16  = 0x06E0
    const %PORTH: u16 = 0x06E4

    const %PINJ: u16  = 0x0708
    const %DDRJ: u16  = 0x0700
    const %PORTJ: u16 = 0x0704

    const %PINK: u16  = 0x0728
    const %DDRK: u16  = 0x0720
    const %PORTK: u16 = 0x0724

    const %PINQ: u16  = 0x07C8
    const %DDRQ: u16  = 0x07C0
    const %PORTQ: u16 = 0x07C4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64a3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64a3u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64a4u {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64b1 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PING: u16  = 0x06C8
    const %DDRG: u16  = 0x06C0
    const %PORTG: u16 = 0x06C4

    const %PINM: u16  = 0x0768
    const %DDRM: u16  = 0x0760
    const %PORTM: u16 = 0x0764

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64b3 {
    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PING: u16  = 0x06C8
    const %DDRG: u16  = 0x06C0
    const %PORTG: u16 = 0x06C4

    const %PINM: u16  = 0x0768
    const %DDRM: u16  = 0x0760
    const %PORTM: u16 = 0x0764

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64c3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64d3 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINF: u16  = 0x06A8
    const %DDRF: u16  = 0x06A0
    const %PORTF: u16 = 0x06A4

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega64d4 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINB: u16  = 0x0628
    const %DDRB: u16  = 0x0620
    const %PORTB: u16 = 0x0624

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINE: u16  = 0x0688
    const %DDRE: u16  = 0x0680
    const %PORTE: u16 = 0x0684

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == atxmega8e5 {
    const %PINA: u16  = 0x0608
    const %DDRA: u16  = 0x0600
    const %PORTA: u16 = 0x0604

    const %PINC: u16  = 0x0648
    const %DDRC: u16  = 0x0640
    const %PORTC: u16 = 0x0644

    const %PIND: u16  = 0x0668
    const %DDRD: u16  = 0x0660
    const %PORTD: u16 = 0x0664

    const %PINR: u16  = 0x07E8
    const %DDRR: u16  = 0x07E0
    const %PORTR: u16 = 0x07E4

}

? target == avr64du28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64du32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega1608 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega1609 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega3208 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega3209 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega4808 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega4809 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega808 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == atmega809 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == attiny1604 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1606 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1607 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1614 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

}

? target == attiny1616 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1617 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1624 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1626 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny1627 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny202 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

}

? target == attiny204 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

}

? target == attiny212 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

}

? target == attiny214 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

}

? target == attiny3214 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny3216 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny3217 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny3224 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny3226 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny3227 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny402 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

}

? target == attiny404 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

}

? target == attiny406 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny412 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

}

? target == attiny414 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

}

? target == attiny416 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny417 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny424 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny426 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny427 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny804 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny806 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny807 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny814 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

}

? target == attiny816 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny817 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny824 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny826 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == attiny827 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

}

? target == avr128da28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr128da32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr128da48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr128da64 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

    const %PING: u16  = 0x04C8
    const %DDRG: u16  = 0x04C0
    const %PORTG: u16 = 0x04C4

}

? target == avr128db28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr128db32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr128db48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr128db64 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

    const %PING: u16  = 0x04C8
    const %DDRG: u16  = 0x04C0
    const %PORTG: u16 = 0x04C4

}

? target == avr16dd14 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16dd20 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16dd28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16dd32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16ea28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16ea32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16ea48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16eb14 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16eb20 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16eb28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr16eb32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32da28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32da32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32da48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32db28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32db32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32db48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32dd14 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32dd20 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32dd28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32dd32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32ea28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32ea32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr32ea48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64da28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64da32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64da48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64da64 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

    const %PING: u16  = 0x04C8
    const %DDRG: u16  = 0x04C0
    const %PORTG: u16 = 0x04C4

}

? target == avr64db28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64db32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64db48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64db64 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

    const %PING: u16  = 0x04C8
    const %DDRG: u16  = 0x04C0
    const %PORTG: u16 = 0x04C4

}

? target == avr64dd14 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64dd20 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64dd28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64dd32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64ea28 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64ea32 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

? target == avr64ea48 {
    const %PINA: u16  = 0x0408
    const %DDRA: u16  = 0x0400
    const %PORTA: u16 = 0x0404

    const %PINB: u16  = 0x0428
    const %DDRB: u16  = 0x0420
    const %PORTB: u16 = 0x0424

    const %PINC: u16  = 0x0448
    const %DDRC: u16  = 0x0440
    const %PORTC: u16 = 0x0444

    const %PIND: u16  = 0x0468
    const %DDRD: u16  = 0x0460
    const %PORTD: u16 = 0x0464

    const %PINE: u16  = 0x0488
    const %DDRE: u16  = 0x0480
    const %PORTE: u16 = 0x0484

    const %PINF: u16  = 0x04A8
    const %DDRF: u16  = 0x04A0
    const %PORTF: u16 = 0x04A4

}

# -------------------------------------------------------------
# Generic GPIO Functions (Evaluated lazily by the compiler)
# -------------------------------------------------------------

@pin_mode_a($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRA
        $ddr | $mask -> $ddr
        $ddr -> %DDRA
    } : {
        ram mut $ddr: u8 = %DDRA
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRA
    }
}
@digital_write_a($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTA
        $port | $mask -> $port
        $port -> %PORTA
    } : {
        ram mut $port: u8 = %PORTA
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTA
    }
}
@digital_read_a($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINA
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_a($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTA
    $port ^ $mask -> $port
    $port -> %PORTA
}

@pin_mode_b($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRB
        $ddr | $mask -> $ddr
        $ddr -> %DDRB
    } : {
        ram mut $ddr: u8 = %DDRB
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRB
    }
}
@digital_write_b($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTB
        $port | $mask -> $port
        $port -> %PORTB
    } : {
        ram mut $port: u8 = %PORTB
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTB
    }
}
@digital_read_b($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINB
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_b($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTB
    $port ^ $mask -> $port
    $port -> %PORTB
}

@pin_mode_c($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRC
        $ddr | $mask -> $ddr
        $ddr -> %DDRC
    } : {
        ram mut $ddr: u8 = %DDRC
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRC
    }
}
@digital_write_c($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTC
        $port | $mask -> $port
        $port -> %PORTC
    } : {
        ram mut $port: u8 = %PORTC
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTC
    }
}
@digital_read_c($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINC
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_c($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTC
    $port ^ $mask -> $port
    $port -> %PORTC
}

@pin_mode_d($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRD
        $ddr | $mask -> $ddr
        $ddr -> %DDRD
    } : {
        ram mut $ddr: u8 = %DDRD
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRD
    }
}
@digital_write_d($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTD
        $port | $mask -> $port
        $port -> %PORTD
    } : {
        ram mut $port: u8 = %PORTD
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTD
    }
}
@digital_read_d($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PIND
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_d($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTD
    $port ^ $mask -> $port
    $port -> %PORTD
}

@pin_mode_e($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRE
        $ddr | $mask -> $ddr
        $ddr -> %DDRE
    } : {
        ram mut $ddr: u8 = %DDRE
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRE
    }
}
@digital_write_e($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTE
        $port | $mask -> $port
        $port -> %PORTE
    } : {
        ram mut $port: u8 = %PORTE
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTE
    }
}
@digital_read_e($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINE
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_e($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTE
    $port ^ $mask -> $port
    $port -> %PORTE
}

@pin_mode_f($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRF
        $ddr | $mask -> $ddr
        $ddr -> %DDRF
    } : {
        ram mut $ddr: u8 = %DDRF
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRF
    }
}
@digital_write_f($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTF
        $port | $mask -> $port
        $port -> %PORTF
    } : {
        ram mut $port: u8 = %PORTF
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTF
    }
}
@digital_read_f($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINF
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_f($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTF
    $port ^ $mask -> $port
    $port -> %PORTF
}

@pin_mode_g($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRG
        $ddr | $mask -> $ddr
        $ddr -> %DDRG
    } : {
        ram mut $ddr: u8 = %DDRG
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRG
    }
}
@digital_write_g($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTG
        $port | $mask -> $port
        $port -> %PORTG
    } : {
        ram mut $port: u8 = %PORTG
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTG
    }
}
@digital_read_g($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PING
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_g($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTG
    $port ^ $mask -> $port
    $port -> %PORTG
}

@pin_mode_h($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRH
        $ddr | $mask -> $ddr
        $ddr -> %DDRH
    } : {
        ram mut $ddr: u8 = %DDRH
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRH
    }
}
@digital_write_h($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTH
        $port | $mask -> $port
        $port -> %PORTH
    } : {
        ram mut $port: u8 = %PORTH
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTH
    }
}
@digital_read_h($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINH
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_h($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTH
    $port ^ $mask -> $port
    $port -> %PORTH
}

@pin_mode_j($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRJ
        $ddr | $mask -> $ddr
        $ddr -> %DDRJ
    } : {
        ram mut $ddr: u8 = %DDRJ
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRJ
    }
}
@digital_write_j($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTJ
        $port | $mask -> $port
        $port -> %PORTJ
    } : {
        ram mut $port: u8 = %PORTJ
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTJ
    }
}
@digital_read_j($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINJ
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_j($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTJ
    $port ^ $mask -> $port
    $port -> %PORTJ
}

@pin_mode_k($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRK
        $ddr | $mask -> $ddr
        $ddr -> %DDRK
    } : {
        ram mut $ddr: u8 = %DDRK
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRK
    }
}
@digital_write_k($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTK
        $port | $mask -> $port
        $port -> %PORTK
    } : {
        ram mut $port: u8 = %PORTK
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTK
    }
}
@digital_read_k($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINK
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_k($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTK
    $port ^ $mask -> $port
    $port -> %PORTK
}

@pin_mode_l($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRL
        $ddr | $mask -> $ddr
        $ddr -> %DDRL
    } : {
        ram mut $ddr: u8 = %DDRL
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRL
    }
}
@digital_write_l($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTL
        $port | $mask -> $port
        $port -> %PORTL
    } : {
        ram mut $port: u8 = %PORTL
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTL
    }
}
@digital_read_l($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINL
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_l($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTL
    $port ^ $mask -> $port
    $port -> %PORTL
}

@pin_mode_m($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRM
        $ddr | $mask -> $ddr
        $ddr -> %DDRM
    } : {
        ram mut $ddr: u8 = %DDRM
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRM
    }
}
@digital_write_m($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTM
        $port | $mask -> $port
        $port -> %PORTM
    } : {
        ram mut $port: u8 = %PORTM
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTM
    }
}
@digital_read_m($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINM
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_m($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTM
    $port ^ $mask -> $port
    $port -> %PORTM
}

@pin_mode_q($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRQ
        $ddr | $mask -> $ddr
        $ddr -> %DDRQ
    } : {
        ram mut $ddr: u8 = %DDRQ
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRQ
    }
}
@digital_write_q($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTQ
        $port | $mask -> $port
        $port -> %PORTQ
    } : {
        ram mut $port: u8 = %PORTQ
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTQ
    }
}
@digital_read_q($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINQ
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_q($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTQ
    $port ^ $mask -> $port
    $port -> %PORTQ
}

@pin_mode_r($pin: u8, $mode: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        ram mut $ddr: u8 = %DDRR
        $ddr | $mask -> $ddr
        $ddr -> %DDRR
    } : {
        ram mut $ddr: u8 = %DDRR
        ram imut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRR
    }
}
@digital_write_r($pin: u8, $val: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        ram mut $port: u8 = %PORTR
        $port | $mask -> $port
        $port -> %PORTR
    } : {
        ram mut $port: u8 = %PORTR
        ram imut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTR
    }
}
@digital_read_r($pin: u8) -> u8 {
    ram mut $pin_val: u8 = %PINR
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 { return 1 }
    return 0
}
@toggle_r($pin: u8) {
    ram mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ram mut $port: u8 = %PORTR
    $port ^ $mask -> $port
    $port -> %PORTR
}

