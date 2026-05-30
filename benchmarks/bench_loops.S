.section .text
.global main
main:
    # Initialize ok = 1 at 0x0101
    ldi r16, 1
    sts 0x0101, r16

    # x = 10
    ldi r16, 10
    sts 0x0102, r16
    
    # 1. Conditionals (If-Then-Else)
    lds r16, 0x0102
    cpi r16, 10
    breq cond1_true
    ldi r16, 2
    rjmp cond1_end
cond1_true:
    ldi r16, 1
cond1_end:
    sts 0x0100, r16
    cpi r16, 1
    breq cond2
    ldi r16, 0
    sts 0x0101, r16

cond2:
    lds r16, 0x0102
    cpi r16, 10
    brne cond2_true
    ldi r16, 4
    rjmp cond2_end
cond2_true:
    ldi r16, 3
cond2_end:
    sts 0x0100, r16
    cpi r16, 4
    breq loop1
    ldi r16, 0
    sts 0x0101, r16

loop1:
    # 2. Simple Range Loop
    # sum = 0
    ldi r16, 0
    ldi r17, 0
    sts 0x0103, r16
    sts 0x0104, r17
    # i = 0
    ldi r16, 0
    ldi r17, 0
    sts 0x0107, r16
    sts 0x0108, r17
loop1_cond:
    lds r16, 0x0107
    lds r17, 0x0108
    cpi r16, 5
    ldi r18, 0
    cpc r17, r18
    brsh loop1_end
    
    # sum = sum + i
    lds r20, 0x0103
    lds r21, 0x0104
    add r20, r16
    adc r21, r17
    sts 0x0103, r20
    sts 0x0104, r21
    
    # i++
    lds r16, 0x0107
    lds r17, 0x0108
    subi r16, 0xFF
    sbci r17, 0xFF
    sts 0x0107, r16
    sts 0x0108, r17
    rjmp loop1_cond
loop1_end:
    lds r16, 0x0103
    lds r17, 0x0104
    cpi r16, 10
    ldi r18, 0
    cpc r17, r18
    breq loop2
    ldi r16, 0
    sts 0x0101, r16

loop2:
    # 3. Dynamic Range Bounds Loop
    # limit = 10
    ldi r16, 10
    ldi r17, 0
    sts 0x0105, r16
    sts 0x0106, r17
    # sum = 0
    ldi r16, 0
    ldi r17, 0
    sts 0x0103, r16
    sts 0x0104, r17
    # j = 5
    ldi r16, 5
    ldi r17, 0
    sts 0x0109, r16
    sts 0x010A, r17
loop2_cond:
    lds r16, 0x0109
    lds r17, 0x010A
    lds r18, 0x0105
    lds r19, 0x0106
    cp r16, r18
    cpc r17, r19
    brsh loop2_end
    
    # sum = sum + j
    lds r20, 0x0103
    lds r21, 0x0104
    add r20, r16
    adc r21, r17
    sts 0x0103, r20
    sts 0x0104, r21
    
    # j++
    lds r16, 0x0109
    lds r17, 0x010A
    subi r16, 0xFF
    sbci r17, 0xFF
    sts 0x0109, r16
    sts 0x010A, r17
    rjmp loop2_cond
loop2_end:
    lds r16, 0x0103
    lds r17, 0x0104
    cpi r16, 35
    ldi r18, 0
    cpc r17, r18
    breq loop3
    ldi r16, 0
    sts 0x0101, r16

loop3:
    # 4. Nested Range Loops
    # sum = 0
    ldi r16, 0
    ldi r17, 0
    sts 0x0103, r16
    sts 0x0104, r17
    # outer = 0
    ldi r16, 0
    ldi r17, 0
    sts 0x010B, r16
    sts 0x010C, r17
outer_cond:
    lds r16, 0x010B
    lds r17, 0x010C
    cpi r16, 3
    ldi r18, 0
    cpc r17, r18
    brsh outer_end
    
    # inner = 0
    ldi r20, 0
    ldi r21, 0
    sts 0x010D, r20
    sts 0x010E, r21
inner_cond:
    lds r20, 0x010D
    lds r21, 0x010E
    cpi r20, 4
    ldi r22, 0
    cpc r21, r22
    brsh inner_end
    
    # sum = sum + 1
    lds r24, 0x0103
    lds r25, 0x0104
    adiw r24, 1
    sts 0x0103, r24
    sts 0x0104, r25
    
    # inner++
    lds r20, 0x010D
    lds r21, 0x010E
    subi r20, 0xFF
    sbci r21, 0xFF
    sts 0x010D, r20
    sts 0x010E, r21
    rjmp inner_cond
inner_end:
    # outer++
    lds r16, 0x010B
    lds r17, 0x010C
    subi r16, 0xFF
    sbci r17, 0xFF
    sts 0x010B, r16
    sts 0x010C, r17
    rjmp outer_cond
outer_end:
    lds r16, 0x0103
    lds r17, 0x0104
    cpi r16, 12
    ldi r18, 0
    cpc r17, r18
    breq check_fn
    ldi r16, 0
    sts 0x0101, r16

check_fn:
    # 5. Return Statement Subroutine Check
    ldi r24, 5
    ldi r25, 0
    rcall test_return
    sts 0x0100, r24
    cpi r24, 25
    ldi r18, 0
    cpc r25, r18
    breq finish
    ldi r16, 0
    sts 0x0101, r16

finish:
    lds r16, 0x0101
    sts 0x0100, r16

halt:
    rjmp halt

test_return:
    mov r18, r24
    or r18, r25
    brne val_nonzero
    ldi r24, 0
    ldi r25, 0
    ret
val_nonzero:
    mov r18, r24
    mov r19, r25
    lsl r24
    rol r25
    lsl r24
    rol r25
    add r24, r18
    adc r25, r19
    ret
