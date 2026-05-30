# Technical test for ik8b bitwise operations
# Verifies bitwise AND, OR, XOR, one's complement NOT, and bitwise compound assignments.

@main {
    mut $res: u8 = 0
    mut $ok: u8 = 1
    mut $res16: u16 = 0

    # 1. 8-bit Bitwise AND
    mut $x8: u8 = 0xAA  # 10101010
    mut $y8: u8 = 0xF0  # 11110000
    $x8 & $y8 -> $res
    ? $res != 0xA0 {    # 10100000
        0 -> $ok
    }

    # 2. 8-bit Bitwise OR
    $x8 | $y8 -> $res
    ? $res != 0xFA {    # 11111010
        0 -> $ok
    }

    # 3. 8-bit Bitwise XOR
    $x8 ^ $y8 -> $res
    ? $res != 0x5A {    # 01011010
        0 -> $ok
    }

    # 4. 8-bit Bitwise NOT
    ~$x8 -> $res
    ? $res != 0x55 {    # 01010101
        0 -> $ok
    }

    # 5. 16-bit Bitwise AND
    mut $x16: u16 = 0xAAAA
    mut $y16: u16 = 0xFF00
    $x16 & $y16 -> $res16
    ? $res16 != 0xAA00 {
        0 -> $ok
    }

    # 6. 16-bit Bitwise OR
    $x16 | $y16 -> $res16
    ? $res16 != 0xFFAA {
        0 -> $ok
    }

    # 7. 16-bit Bitwise XOR
    $x16 ^ $y16 -> $res16
    ? $res16 != 0x55AA {
        0 -> $ok
    }

    # 8. 16-bit Bitwise NOT
    ~$x16 -> $res16
    ? $res16 != 0x5555 {
        0 -> $ok
    }

    # 9. Compound Bitwise AND (8-bit)
    mut $c8: u8 = 0xFF
    0x0F ->& $c8
    ? $c8 != 0x0F {
        0 -> $ok
    }

    # 10. Compound Bitwise OR (8-bit)
    0xF0 ->| $c8
    ? $c8 != 0xFF {
        0 -> $ok
    }

    # 11. Compound Bitwise XOR (8-bit)
    0x0F ->^ $c8
    ? $c8 != 0xF0 {
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}
