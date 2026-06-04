.section .text
.global main
main:
    # 0x24 is DDRB (I/O offset is 0x04).
    # 0x25 is PORTB (I/O offset is 0x05).
    in r16, 0x04
    ori r16, 0x01
    out 0x04, r16

    in r16, 0x05
    ori r16, 0x01
    out 0x05, r16

    in r16, 0x05
    andi r16, 0xFE
    out 0x05, r16

halt:
    rjmp halt
