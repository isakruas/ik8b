# Technical test for ik8b subroutines and imports
# Verifies parameter passing, return values, nested subroutines, and import resolution.

import tests/test_helper

@main {
    mut $ok: u8 = 1
    mut $res: u16 = 0

    # 1. Direct function call with parameters
    @add_u8(10, 20) -> $res
    ? $res != 30 {
        10 -> $ok
    }

    # 2. 16-bit subroutine call
    @multiply_u16(500, 4) -> $res
    ? $res != 2000 {
        20 -> $ok
    }

    # 3. Nested function call
    @nested_ops(3, 4) -> $res
    ? $res != 49 {  # (3 + 4) ^ 2 = 7 ^ 2 = 49
        30 -> $ok
    }

    # 4. Imported function call
    @square(12) -> $res
    ? $res != 144 {
        40 -> $ok
    }

    $ok -> $res
    loop * {
        # End of test
    }
}

@add_u8($a: u8, $b: u8) -> u16 {
    return $a + $b
}

@multiply_u16($a: u16, $b: u16) -> u16 {
    return $a * $b
}

@nested_ops($x: u16, $y: u16) -> u16 {
    mut $sum: u16 = $x + $y
    return @square($sum)
}
