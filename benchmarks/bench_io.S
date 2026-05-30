.section .text
.global main
main:
    # 0x24 is DDRB (I/O offset is 0x04)
    # 0x25 is PORTB (I/O offset is 0x05)
    ldi r16, 0xFF
    out 0x04, r16

    ldi r16, 0x55
    out 0x05, r16

    ldi r16, 0xAA
    out 0x05, r16

halt:
    rjmp halt
