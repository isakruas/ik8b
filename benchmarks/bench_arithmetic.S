.section .text
.global main
main:
    # SRAM Layout:
    # 0x0100: res (1 byte)
    # 0x0101: ok (1 byte)
    # 0x0102: res16 (2 bytes)
    # 0x0104: x8 (1 byte)
    # 0x0105: y8 (1 byte)
    # 0x0106: m8_a (1 byte)
    # 0x0107: m8_b (1 byte)
    # 0x0108: d8_a (1 byte)
    # 0x0109: d8_b (1 byte)
    # 0x010A: x16 (2 bytes)
    # 0x010C: y16 (2 bytes)
    # 0x010E: neg8 (1 byte)
    # 0x010F: neg16 (2 bytes)

    # Initialize ok = 1
    ldi r16, 1
    sts 0x0101, r16

    # 1. 8-bit Addition
    ldi r16, 100
    sts 0x0104, r16
    ldi r16, 50
    sts 0x0105, r16
    lds r16, 0x0104
    lds r17, 0x0105
    add r16, r17
    sts 0x0100, r16
    cpi r16, 150
    breq check_sub
    ldi r16, 0
    sts 0x0101, r16

check_sub:
    # 2. 8-bit Subtraction
    lds r16, 0x0104
    lds r17, 0x0105
    sub r16, r17
    sts 0x0100, r16
    cpi r16, 50
    breq check_mul
    ldi r16, 0
    sts 0x0101, r16

check_mul:
    # 3. 8-bit Software Multiplication
    ldi r16, 12
    sts 0x0106, r16
    ldi r16, 8
    sts 0x0107, r16
    lds r16, 0x0106
    lds r17, 0x0107
    ldi r18, 0
mul_loop:
    tst r17
    breq mul_end
    sbrc r17, 0
    add r18, r16
    lsl r16
    lsr r17
    rjmp mul_loop
mul_end:
    sts 0x0100, r18
    cpi r18, 96
    breq check_div
    ldi r16, 0
    sts 0x0101, r16

check_div:
    # 4. 8-bit Software Division
    ldi r16, 100
    sts 0x0108, r16
    ldi r16, 8
    sts 0x0109, r16
    lds r16, 0x0108
    lds r17, 0x0109
    ldi r18, 0
    mov r19, r16
div_loop:
    cp r19, r17
    brlo div_end
    sub r19, r17
    inc r18
    rjmp div_loop
div_end:
    sts 0x0100, r18
    cpi r18, 12
    breq check_mod
    ldi r16, 0
    sts 0x0101, r16

check_mod:
    # 5. 8-bit Modulo
    sts 0x0100, r19
    cpi r19, 4
    breq check_add16
    ldi r16, 0
    sts 0x0101, r16

check_add16:
    # 6. 16-bit Addition
    ldi r16, lo8(30000)
    ldi r17, hi8(30000)
    sts 0x010A, r16
    sts 0x010B, r17
    ldi r16, lo8(5000)
    ldi r17, hi8(5000)
    sts 0x010C, r16
    sts 0x010D, r17
    lds r16, 0x010A
    lds r17, 0x010B
    lds r18, 0x010C
    lds r19, 0x010D
    add r16, r18
    adc r17, r19
    sts 0x0102, r16
    sts 0x0103, r17
    cpi r16, lo8(35000)
    ldi r20, hi8(35000)
    cpc r17, r20
    breq check_sub16
    ldi r16, 0
    sts 0x0101, r16

check_sub16:
    # 7. 16-bit Subtraction
    lds r16, 0x010A
    lds r17, 0x010B
    lds r18, 0x010C
    lds r19, 0x010D
    sub r16, r18
    sbc r17, r19
    sts 0x0102, r16
    sts 0x0103, r17
    cpi r16, lo8(25000)
    ldi r20, hi8(25000)
    cpc r17, r20
    breq check_neg8
    ldi r16, 0
    sts 0x0101, r16

check_neg8:
    # 8. Unary Negation (8-bit)
    ldi r16, 10
    sts 0x010E, r16
    lds r16, 0x010E
    neg r16
    sts 0x0100, r16
    cpi r16, 246
    breq check_neg16
    ldi r16, 0
    sts 0x0101, r16

check_neg16:
    # 9. Unary Negation (16-bit)
    ldi r16, lo8(500)
    ldi r17, hi8(500)
    sts 0x010F, r16
    sts 0x0110, r17
    lds r16, 0x010F
    lds r17, 0x0110
    ldi r18, 0
    ldi r19, 0
    sub r18, r16
    sbc r19, r17
    sts 0x0102, r18
    sts 0x0103, r19
    cpi r18, lo8(65036)
    ldi r20, hi8(65036)
    cpc r19, r20
    breq finish
    ldi r16, 0
    sts 0x0101, r16

finish:
    lds r16, 0x0101
    sts 0x0100, r16

halt:
    rjmp halt
