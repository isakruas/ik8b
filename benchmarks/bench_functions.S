.section .text
.global main
main:
    # Initialize ok = 1 at 0x0100
    ldi r16, 1
    sts 0x0100, r16

    # 1. Direct function call with parameters
    ldi r24, 10
    ldi r22, 20
    rcall add_u8
    sts 0x0101, r24
    sts 0x0102, r25
    cpi r24, 30
    ldi r18, 0
    cpc r25, r18
    breq fn2
    ldi r16, 10
    sts 0x0100, r16

fn2:
    # 2. 16-bit subroutine call
    ldi r24, lo8(500)
    ldi r25, hi8(500)
    ldi r22, 4
    ldi r23, 0
    rcall multiply_u16
    sts 0x0101, r24
    sts 0x0102, r25
    cpi r24, lo8(2000)
    ldi r18, hi8(2000)
    cpc r25, r18
    breq fn3
    ldi r16, 20
    sts 0x0100, r16

fn3:
    # 3. Nested function call
    ldi r24, 3
    ldi r25, 0
    ldi r22, 4
    ldi r23, 0
    rcall nested_ops
    sts 0x0101, r24
    sts 0x0102, r25
    cpi r24, 49
    ldi r18, 0
    cpc r25, r18
    breq fn4
    ldi r16, 30
    sts 0x0100, r16

fn4:
    # 4. Imported function call
    ldi r24, 12
    ldi r25, 0
    rcall square
    sts 0x0101, r24
    sts 0x0102, r25
    cpi r24, lo8(144)
    ldi r18, hi8(144)
    cpc r25, r18
    breq finish
    ldi r16, 40
    sts 0x0100, r16

finish:
    lds r16, 0x0100
    sts 0x0101, r16

halt:
    rjmp halt

add_u8:
    add r24, r22
    ldi r25, 0
    ret

multiply_u16:
    ldi r20, 0
    ldi r21, 0
mul16_loop:
    mov r18, r22
    or r18, r23
    breq mul16_end
    sbrc r22, 0
    add r20, r24
    sbrc r22, 0
    adc r21, r25
    lsl r24
    rol r25
    lsr r23
    ror r22
    rjmp mul16_loop
mul16_end:
    mov r24, r20
    mov r25, r21
    ret

square:
    mov r22, r24
    mov r23, r25
    rcall multiply_u16
    ret

nested_ops:
    add r24, r22
    adc r25, r23
    sts 0x0103, r24
    sts 0x0104, r25
    rcall square
    ret
