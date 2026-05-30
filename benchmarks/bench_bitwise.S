.section .text
.global main
main:
    # Initialize ok = 1 at 0x0101
    ldi r16, 1
    sts 0x0101, r16

    # 1. 8-bit Bitwise AND
    ldi r16, 0xAA
    sts 0x0104, r16
    ldi r16, 0xF0
    sts 0x0105, r16
    
    lds r16, 0x0104
    lds r17, 0x0105
    and r16, r17
    sts 0x0100, r16
    cpi r16, 0xA0
    breq check_or
    ldi r16, 0
    sts 0x0101, r16

check_or:
    # 2. 8-bit Bitwise OR
    lds r16, 0x0104
    lds r17, 0x0105
    or r16, r17
    sts 0x0100, r16
    cpi r16, 0xFA
    breq check_xor
    ldi r16, 0
    sts 0x0101, r16

check_xor:
    # 3. 8-bit Bitwise XOR
    lds r16, 0x0104
    lds r17, 0x0105
    eor r16, r17
    sts 0x0100, r16
    cpi r16, 0x5A
    breq check_not
    ldi r16, 0
    sts 0x0101, r16

check_not:
    # 4. 8-bit Bitwise NOT
    lds r16, 0x0104
    com r16
    sts 0x0100, r16
    cpi r16, 0x55
    breq check_and16
    ldi r16, 0
    sts 0x0101, r16

check_and16:
    # 5. 16-bit Bitwise AND
    ldi r16, lo8(0xAAAA)
    ldi r17, hi8(0xAAAA)
    sts 0x0106, r16
    sts 0x0107, r17
    ldi r16, lo8(0xFF00)
    ldi r17, hi8(0xFF00)
    sts 0x0108, r16
    sts 0x0109, r17
    
    lds r16, 0x0106
    lds r17, 0x0107
    lds r18, 0x0108
    lds r19, 0x0109
    and r16, r18
    and r17, r19
    sts 0x0102, r16
    sts 0x0103, r17
    cpi r16, lo8(0xAA00)
    ldi r20, hi8(0xAA00)
    cpc r17, r20
    breq check_or16
    ldi r16, 0
    sts 0x0101, r16

check_or16:
    # 6. 16-bit Bitwise OR
    lds r16, 0x0106
    lds r17, 0x0107
    lds r18, 0x0108
    lds r19, 0x0109
    or r16, r18
    or r17, r19
    sts 0x0102, r16
    sts 0x0103, r17
    cpi r16, lo8(0xFFAA)
    ldi r20, hi8(0xFFAA)
    cpc r17, r20
    breq check_xor16
    ldi r16, 0
    sts 0x0101, r16

check_xor16:
    # 7. 16-bit Bitwise XOR
    lds r16, 0x0106
    lds r17, 0x0107
    lds r18, 0x0108
    lds r19, 0x0109
    eor r16, r18
    eor r17, r19
    sts 0x0102, r16
    sts 0x0103, r17
    cpi r16, lo8(0x55AA)
    ldi r20, hi8(0x55AA)
    cpc r17, r20
    breq check_not16
    ldi r16, 0
    sts 0x0101, r16

check_not16:
    # 8. 16-bit Bitwise NOT
    lds r16, 0x0106
    lds r17, 0x0107
    com r16
    com r17
    sts 0x0102, r16
    sts 0x0103, r17
    cpi r16, lo8(0x5555)
    ldi r20, hi8(0x5555)
    cpc r17, r20
    breq check_comp_and
    ldi r16, 0
    sts 0x0101, r16

check_comp_and:
    # 9. Compound Bitwise AND (8-bit)
    ldi r16, 0xFF
    sts 0x010A, r16
    
    lds r16, 0x010A
    andi r16, 0x0F
    sts 0x010A, r16
    cpi r16, 0x0F
    breq check_comp_or
    ldi r16, 0
    sts 0x0101, r16

check_comp_or:
    # 10. Compound Bitwise OR (8-bit)
    lds r16, 0x010A
    ori r16, 0xF0
    sts 0x010A, r16
    cpi r16, 0xFF
    breq check_comp_xor
    ldi r16, 0
    sts 0x0101, r16

check_comp_xor:
    # 11. Compound Bitwise XOR (8-bit)
    lds r16, 0x010A
    ldi r17, 0x0F
    eor r16, r17
    sts 0x010A, r16
    cpi r16, 0xF0
    breq finish
    ldi r16, 0
    sts 0x0101, r16

finish:
    lds r16, 0x0101
    sts 0x0100, r16

halt:
    rjmp halt
