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
# Microcontroller-Specific Memory-Mapped Register Configurations
# -------------------------------------------------------------

? namespace == attiny85 {
    const %PINB: u16  = 0x0036
    const %DDRB: u16  = 0x0037
    const %PORTB: u16 = 0x0038
}

? namespace == atmega328p {
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

? namespace == atmega2560 {
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

? namespace == atmega32u4 {
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

# Computes a bitmask representing (1 << pin) dynamically
@_gpio_mask($pin: u8) -> u8 {
    mut $mask: u8 = 1
    loop 0..$pin -> $i {
        $mask * 2 -> $mask
    }
    return $mask
}

# -------------------------------------------------------------
# Port B I/O Interface
# -------------------------------------------------------------

# Configures direction of Port B pin (0 = Input, 1 = Output)
@pin_mode_b($pin: u8, $mode: u8) {
    mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $mode == 1 {
        mut $ddr: u8 = %DDRB
        $ddr | $mask -> $ddr
        $ddr -> %DDRB
    } : {
        mut $ddr: u8 = %DDRB
        mut $inv_mask: u8 = ~$mask
        $ddr & $inv_mask -> $ddr
        $ddr -> %DDRB
    }
}

# Writes logical state to Port B pin (0 = Low, 1 = High)
@digital_write_b($pin: u8, $val: u8) {
    mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    ? $val == 1 {
        mut $port: u8 = %PORTB
        $port | $mask -> $port
        $port -> %PORTB
    } : {
        mut $port: u8 = %PORTB
        mut $inv_mask: u8 = ~$mask
        $port & $inv_mask -> $port
        $port -> %PORTB
    }
}

# Reads and returns the logical state of Port B pin (0 or 1)
@digital_read_b($pin: u8) -> u8 {
    mut $pin_val: u8 = %PINB
    mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    $pin_val & $mask -> $pin_val
    ? $pin_val != 0 {
        return 1
    }
    return 0
}

# Toggles the logical output state of Port B pin
@toggle_b($pin: u8) {
    mut $mask: u8 = 0
    @_gpio_mask($pin) -> $mask
    mut $port: u8 = %PORTB
    $port ^ $mask -> $port
    $port -> %PORTB
}

# -------------------------------------------------------------
# Port A I/O Interface (ATmega328p and ATmega2560 only)
# -------------------------------------------------------------
? namespace == atmega328p {
    @pin_mode_a($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRA
            $ddr | $mask -> $ddr
            $ddr -> %DDRA
        } : {
            mut $ddr: u8 = %DDRA
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRA
        }
    }
    @digital_write_a($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTA
            $port | $mask -> $port
            $port -> %PORTA
        } : {
            mut $port: u8 = %PORTA
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTA
        }
    }
    @digital_read_a($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINA
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_a($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTA
        $port ^ $mask -> $port
        $port -> %PORTA
    }
}

? namespace == atmega2560 {
    @pin_mode_a($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRA
            $ddr | $mask -> $ddr
            $ddr -> %DDRA
        } : {
            mut $ddr: u8 = %DDRA
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRA
        }
    }
    @digital_write_a($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTA
            $port | $mask -> $port
            $port -> %PORTA
        } : {
            mut $port: u8 = %PORTA
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTA
        }
    }
    @digital_read_a($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINA
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_a($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTA
        $port ^ $mask -> $port
        $port -> %PORTA
    }
}

# -------------------------------------------------------------
# Port C I/O Interface (ATmega328p, ATmega2560, and ATmega32u4)
# -------------------------------------------------------------
? namespace == atmega328p {
    @pin_mode_c($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRC
            $ddr | $mask -> $ddr
            $ddr -> %DDRC
        } : {
            mut $ddr: u8 = %DDRC
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRC
        }
    }
    @digital_write_c($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTC
            $port | $mask -> $port
            $port -> %PORTC
        } : {
            mut $port: u8 = %PORTC
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTC
        }
    }
    @digital_read_c($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINC
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_c($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTC
        $port ^ $mask -> $port
        $port -> %PORTC
    }
}

? namespace == atmega2560 {
    @pin_mode_c($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRC
            $ddr | $mask -> $ddr
            $ddr -> %DDRC
        } : {
            mut $ddr: u8 = %DDRC
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRC
        }
    }
    @digital_write_c($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTC
            $port | $mask -> $port
            $port -> %PORTC
        } : {
            mut $port: u8 = %PORTC
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTC
        }
    }
    @digital_read_c($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINC
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_c($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTC
        $port ^ $mask -> $port
        $port -> %PORTC
    }
}

? namespace == atmega32u4 {
    @pin_mode_c($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRC
            $ddr | $mask -> $ddr
            $ddr -> %DDRC
        } : {
            mut $ddr: u8 = %DDRC
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRC
        }
    }
    @digital_write_c($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTC
            $port | $mask -> $port
            $port -> %PORTC
        } : {
            mut $port: u8 = %PORTC
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTC
        }
    }
    @digital_read_c($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINC
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_c($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTC
        $port ^ $mask -> $port
        $port -> %PORTC
    }
}

# -------------------------------------------------------------
# Port D I/O Interface (ATmega328p, ATmega2560, and ATmega32u4)
# -------------------------------------------------------------
? namespace == atmega328p {
    @pin_mode_d($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRD
            $ddr | $mask -> $ddr
            $ddr -> %DDRD
        } : {
            mut $ddr: u8 = %DDRD
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRD
        }
    }
    @digital_write_d($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTD
            $port | $mask -> $port
            $port -> %PORTD
        } : {
            mut $port: u8 = %PORTD
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTD
        }
    }
    @digital_read_d($pin: u8) -> u8 {
        mut $pin_val: u8 = %PIND
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_d($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTD
        $port ^ $mask -> $port
        $port -> %PORTD
    }
}

? namespace == atmega2560 {
    @pin_mode_d($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRD
            $ddr | $mask -> $ddr
            $ddr -> %DDRD
        } : {
            mut $ddr: u8 = %DDRD
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRD
        }
    }
    @digital_write_d($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTD
            $port | $mask -> $port
            $port -> %PORTD
        } : {
            mut $port: u8 = %PORTD
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTD
        }
    }
    @digital_read_d($pin: u8) -> u8 {
        mut $pin_val: u8 = %PIND
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_d($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTD
        $port ^ $mask -> $port
        $port -> %PORTD
    }
}

? namespace == atmega32u4 {
    @pin_mode_d($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRD
            $ddr | $mask -> $ddr
            $ddr -> %DDRD
        } : {
            mut $ddr: u8 = %DDRD
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRD
        }
    }
    @digital_write_d($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTD
            $port | $mask -> $port
            $port -> %PORTD
        } : {
            mut $port: u8 = %PORTD
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTD
        }
    }
    @digital_read_d($pin: u8) -> u8 {
        mut $pin_val: u8 = %PIND
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_d($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTD
        $port ^ $mask -> $port
        $port -> %PORTD
    }
}

# -------------------------------------------------------------
# Port E & F I/O Interface (ATmega2560 and ATmega32u4)
# -------------------------------------------------------------
? namespace == atmega2560 {
    @pin_mode_e($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRE
            $ddr | $mask -> $ddr
            $ddr -> %DDRE
        } : {
            mut $ddr: u8 = %DDRE
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRE
        }
    }
    @digital_write_e($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTE
            $port | $mask -> $port
            $port -> %PORTE
        } : {
            mut $port: u8 = %PORTE
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTE
        }
    }
    @digital_read_e($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINE
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_e($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTE
        $port ^ $mask -> $port
        $port -> %PORTE
    }

    @pin_mode_f($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRF
            $ddr | $mask -> $ddr
            $ddr -> %DDRF
        } : {
            mut $ddr: u8 = %DDRF
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRF
        }
    }
    @digital_write_f($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTF
            $port | $mask -> $port
            $port -> %PORTF
        } : {
            mut $port: u8 = %PORTF
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTF
        }
    }
    @digital_read_f($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINF
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_f($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTF
        $port ^ $mask -> $port
        $port -> %PORTF
    }
}

? namespace == atmega32u4 {
    @pin_mode_e($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRE
            $ddr | $mask -> $ddr
            $ddr -> %DDRE
        } : {
            mut $ddr: u8 = %DDRE
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRE
        }
    }
    @digital_write_e($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTE
            $port | $mask -> $port
            $port -> %PORTE
        } : {
            mut $port: u8 = %PORTE
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTE
        }
    }
    @digital_read_e($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINE
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_e($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTE
        $port ^ $mask -> $port
        $port -> %PORTE
    }

    @pin_mode_f($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRF
            $ddr | $mask -> $ddr
            $ddr -> %DDRF
        } : {
            mut $ddr: u8 = %DDRF
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRF
        }
    }
    @digital_write_f($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTF
            $port | $mask -> $port
            $port -> %PORTF
        } : {
            mut $port: u8 = %PORTF
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTF
        }
    }
    @digital_read_f($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINF
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_f($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTF
        $port ^ $mask -> $port
        $port -> %PORTF
    }
}

# -------------------------------------------------------------
# Port G, H, J, K, L I/O Interface (ATmega2560 only)
# -------------------------------------------------------------
? namespace == atmega2560 {
    @pin_mode_g($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRG
            $ddr | $mask -> $ddr
            $ddr -> %DDRG
        } : {
            mut $ddr: u8 = %DDRG
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRG
        }
    }
    @digital_write_g($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTG
            $port | $mask -> $port
            $port -> %PORTG
        } : {
            mut $port: u8 = %PORTG
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTG
        }
    }
    @digital_read_g($pin: u8) -> u8 {
        mut $pin_val: u8 = %PING
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_g($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTG
        $port ^ $mask -> $port
        $port -> %PORTG
    }

    @pin_mode_h($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRH
            $ddr | $mask -> $ddr
            $ddr -> %DDRH
        } : {
            mut $ddr: u8 = %DDRH
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRH
        }
    }
    @digital_write_h($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTH
            $port | $mask -> $port
            $port -> %PORTH
        } : {
            mut $port: u8 = %PORTH
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTH
        }
    }
    @digital_read_h($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINH
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_h($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTH
        $port ^ $mask -> $port
        $port -> %PORTH
    }

    @pin_mode_j($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRJ
            $ddr | $mask -> $ddr
            $ddr -> %DDRJ
        } : {
            mut $ddr: u8 = %DDRJ
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRJ
        }
    }
    @digital_write_j($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTJ
            $port | $mask -> $port
            $port -> %PORTJ
        } : {
            mut $port: u8 = %PORTJ
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTJ
        }
    }
    @digital_read_j($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINJ
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_j($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTJ
        $port ^ $mask -> $port
        $port -> %PORTJ
    }

    @pin_mode_k($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRK
            $ddr | $mask -> $ddr
            $ddr -> %DDRK
        } : {
            mut $ddr: u8 = %DDRK
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRK
        }
    }
    @digital_write_k($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTK
            $port | $mask -> $port
            $port -> %PORTK
        } : {
            mut $port: u8 = %PORTK
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTK
        }
    }
    @digital_read_k($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINK
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_k($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTK
        $port ^ $mask -> $port
        $port -> %PORTK
    }

    @pin_mode_l($pin: u8, $mode: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $mode == 1 {
            mut $ddr: u8 = %DDRL
            $ddr | $mask -> $ddr
            $ddr -> %DDRL
        } : {
            mut $ddr: u8 = %DDRL
            mut $inv_mask: u8 = ~$mask
            $ddr & $inv_mask -> $ddr
            $ddr -> %DDRL
        }
    }
    @digital_write_l($pin: u8, $val: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        ? $val == 1 {
            mut $port: u8 = %PORTL
            $port | $mask -> $port
            $port -> %PORTL
        } : {
            mut $port: u8 = %PORTL
            mut $inv_mask: u8 = ~$mask
            $port & $inv_mask -> $port
            $port -> %PORTL
        }
    }
    @digital_read_l($pin: u8) -> u8 {
        mut $pin_val: u8 = %PINL
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        $pin_val & $mask -> $pin_val
        ? $pin_val != 0 { return 1 }
        return 0
    }
    @toggle_l($pin: u8) {
        mut $mask: u8 = 0
        @_gpio_mask($pin) -> $mask
        mut $port: u8 = %PORTL
        $port ^ $mask -> $port
        $port -> %PORTL
    }
}
