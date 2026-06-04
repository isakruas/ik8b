# Benchmark for raw GPIO I/O register writes.
# The active target embeds one available GPIO port and writes DDRx/PORTx directly.

? target == at43usb320 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at43usb355 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at76c711 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s1200 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s2313 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s2323 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s2333 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s2343 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s4414 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s4433 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s4434 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s8515 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90s8535 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90usb162 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90usb82 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5272 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5505 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6616c {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6617c {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata664251 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega103 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16u2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32u2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega8u2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny11 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny12 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny13 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny13a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny15 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1634 {
    const %DDRB: u16 = 0x002C
    const %PORTB: u16 = 0x002D

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny167 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny22 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny2313 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny2313a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny24 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny24a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny25 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny26 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny261 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny261a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny28 {
    const %DDRD: u16 = 0x0031
    const %PORTD: u16 = 0x0032

    @main {
        0xFF -> %DDRD
        0x55 -> %PORTD
        0xAA -> %PORTD
        loop * {}
    }
}

? target == attiny4313 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny43u {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny44 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny441 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny44a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny45 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny461 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny461a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny48 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny828 {
    const %DDRB: u16 = 0x0025
    const %PORTB: u16 = 0x0026

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny84 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny841 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny84a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny85 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny861 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny861a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny87 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny88 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90can128 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90can32 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90can64 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm161 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm216 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm2b {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm3 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm316 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm3b {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90pwm81 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90scr100 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90usb1286 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90usb1287 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90usb646 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at90usb647 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == at94k {
    const %DDRD: u16 = 0x0031
    const %PORTD: u16 = 0x0032

    @main {
        0xFF -> %DDRD
        0x55 -> %PORTD
        0xAA -> %PORTD
        loop * {}
    }
}

? target == ata5702m322 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5782 {
    const %DDRB: u16 = 0x0026
    const %PORTB: u16 = 0x0027

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5790 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5790n {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5795 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata5831 {
    const %DDRB: u16 = 0x0026
    const %PORTB: u16 = 0x0027

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6285 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6286 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6289 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6612c {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6613c {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == ata6614q {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega128 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega1280 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega1281 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega1284 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega1284p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega1284rfr2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega128a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega128rfa1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega128rfr2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega161 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega162 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega163 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega164a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega164p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega164pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega165 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega165a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega165p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega165pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega168p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega168pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega168pb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega169 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega169a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega169p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega169pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16hva {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16hva2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16hvb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16hvbrevb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16m1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega16u4 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega2560 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega2561 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega2564rfr2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega256rfr2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega323 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega324a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega324p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega324pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega324pb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega325 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3250 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3250a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3250p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3250pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega325a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega325p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega325pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega328 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega328p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega328pb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega329 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3290 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3290a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3290p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3290pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega329a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega329p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega329pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32c1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32hvb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32hvbrevb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32m1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32u4 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega32u6 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega406 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega48p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega48pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega48pb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega640 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega644 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega644a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega644p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega644pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega644rfr2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega645 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega6450 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega6450a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega6450p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega645a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega645p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega649 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega6490 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega6490a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega6490p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega649a {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega649p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64c1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64hve {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64hve2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64m1 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega64rfr2 {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega8 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega8515 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega8535 {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega88p {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega88pa {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega88pb {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega8a {
    const %DDRB: u16 = 0x0037
    const %PORTB: u16 = 0x0038

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega8hva {
    const %DDRB: u16 = 0x0024
    const %PORTB: u16 = 0x0025

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny10 {
    const %DDRB: u16 = 0x0021
    const %PORTB: u16 = 0x0022

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny20 {
    const %DDRB: u16 = 0x0025
    const %PORTB: u16 = 0x0026

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny4 {
    const %DDRB: u16 = 0x0021
    const %PORTB: u16 = 0x0022

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny40 {
    const %DDRB: u16 = 0x0025
    const %PORTB: u16 = 0x0026

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny5 {
    const %DDRB: u16 = 0x0021
    const %PORTB: u16 = 0x0022

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny9 {
    const %DDRB: u16 = 0x0021
    const %PORTB: u16 = 0x0022

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128a1 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128a1u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128a3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128a3u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128a4u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128b1 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128b3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128c3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128d3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega128d4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega16a4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega16a4u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega16c4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega16d4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega192a3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega192a3u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega192c3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega192d3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega256a3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega256a3b {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega256a3bu {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega256a3u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega256c3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega256d3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32a4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32a4u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32c3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32c4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32d3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32d4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega32e5 {
    const %DDRA: u16 = 0x0600
    const %PORTA: u16 = 0x0604

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == atxmega384c3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega384d3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64a1 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64a1u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64a3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64a3u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64a4u {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64b1 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64b3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64c3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64d3 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega64d4 {
    const %DDRB: u16 = 0x0620
    const %PORTB: u16 = 0x0624

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atxmega8e5 {
    const %DDRA: u16 = 0x0600
    const %PORTA: u16 = 0x0604

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64du28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64du32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == atmega1608 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega1609 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3208 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega3209 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega4808 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega4809 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega808 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == atmega809 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1604 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1606 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1607 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1614 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1616 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1617 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1624 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1626 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny1627 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny202 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == attiny204 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny212 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == attiny214 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny3214 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny3216 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny3217 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny3224 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny3226 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny3227 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny402 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == attiny404 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny406 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny412 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == attiny414 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny416 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny417 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny424 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny426 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny427 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny804 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny806 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny807 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny814 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny816 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny817 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny824 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny826 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == attiny827 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr128da28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr128da32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr128da48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr128da64 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr128db28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr128db32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr128db48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr128db64 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr16dd14 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16dd20 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16dd28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16dd32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16ea28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16ea32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16ea48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr16eb14 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16eb20 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16eb28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr16eb32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32da28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32da32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32da48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr32db28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32db32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32db48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr32dd14 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32dd20 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32dd28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32dd32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32ea28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32ea32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr32ea48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr64da28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64da32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64da48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr64da64 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr64db28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64db32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64db48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr64db64 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

? target == avr64dd14 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64dd20 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64dd28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64dd32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64ea28 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64ea32 {
    const %DDRA: u16 = 0x0400
    const %PORTA: u16 = 0x0404

    @main {
        0xFF -> %DDRA
        0x55 -> %PORTA
        0xAA -> %PORTA
        loop * {}
    }
}

? target == avr64ea48 {
    const %DDRB: u16 = 0x0420
    const %PORTB: u16 = 0x0424

    @main {
        0xFF -> %DDRB
        0x55 -> %PORTB
        0xAA -> %PORTB
        loop * {}
    }
}

# No raw GPIO port map is currently embedded for these targets:
# at86rf401, at90c8534, atmega168, atmega168a, atmega48, atmega48a
# atmega88, atmega88a, m3000
