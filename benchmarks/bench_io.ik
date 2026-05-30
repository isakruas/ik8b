const %PORTB: u16 = 0x25
const %DDRB: u16 = 0x24

@main {
    0xFF -> %DDRB
    0x55 -> %PORTB
    0xAA -> %PORTB
    loop * {}
}
