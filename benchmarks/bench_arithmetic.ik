# Technical test for ik8b arithmetic operations
# Verifies addition, subtraction, software multiplication, software division, modulo, and negation.

@main {
    mut $res: u8 = 0
    mut $ok: u8 = 1
    mut $res16: u16 = 0

    # 1. 8-bit Addition
    mut $x8: u8 = 100
    mut $y8: u8 = 50
    $x8 + $y8 -> $res
    ? $res != 150 {
        0 -> $ok
    }

    # 2. 8-bit Subtraction
    $x8 - $y8 -> $res
    ? $res != 50 {
        0 -> $ok
    }

    # 3. 8-bit Software Multiplication
    mut $m8_a: u8 = 12
    mut $m8_b: u8 = 8
    $m8_a * $m8_b -> $res
    ? $res != 96 {
        0 -> $ok
    }

    # 4. 8-bit Software Division
    mut $d8_a: u8 = 100
    mut $d8_b: u8 = 8
    $d8_a / $d8_b -> $res
    ? $res != 12 {
        0 -> $ok
    }

    # 5. 8-bit Modulo
    $d8_a % $d8_b -> $res
    ? $res != 4 {
        0 -> $ok
    }

    # 6. 16-bit Addition
    mut $x16: u16 = 30000
    mut $y16: u16 = 5000
    $x16 + $y16 -> $res16
    ? $res16 != 35000 {
        0 -> $ok
    }

    # 7. 16-bit Subtraction
    $x16 - $y16 -> $res16
    ? $res16 != 25000 {
        0 -> $ok
    }

    # 8. Unary Negation (8-bit)
    mut $neg8: u8 = 10
    (-$neg8) -> $res
    ? $res != 246 {  # 256 - 10
        0 -> $ok
    }

    # 9. Unary Negation (16-bit)
    mut $neg16: u16 = 500
    (-$neg16) -> $res16
    ? $res16 != 65036 { # 65536 - 500
        0 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}
