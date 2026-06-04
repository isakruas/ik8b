# Copyright 2026 The ik8b Authors.
#
# Function-pointer / callback tests: &@fn, fn(...) parameter and local types,
# and indirect calls `@$var(...)`. RAM-only so it runs across all cores.

@inc($x: u8) -> u8 { return $x + 1 }
@dbl($x: u8) -> u8 { return $x + $x }

# Higher-order: receives a function pointer and applies it.
@apply($f: fn(u8)->u8, $v: u8) -> u8 {
    return @$f($v)
}

# Multi-argument accumulator callback exercised by a reducer.
@xor2($a: u8, $b: u8) -> u8 { return $a ^ $b }
@reduce($init: u8, $s: fn(u8,u8)->u8) -> u8 {
    ram mut $a: u8 = $init
    @$s($a, 1) -> $a
    @$s($a, 2) -> $a
    @$s($a, 4) -> $a
    return $a
}

@main {
    ram mut $ok: u8 = 1

    # &@fn passed as an argument, called indirectly inside @apply.
    # @inc/@dbl are NEVER called directly, only address-taken: this also
    # proves dead-code elimination keeps address-taken functions.
    ram mut $r: u8 = @apply(&@inc, 9)
    ? $r != 10 { 10 -> $ok }

    @apply(&@dbl, 21) -> $r
    ? $r != 42 { 11 -> $ok }

    # Function pointer held in a local variable, then called.
    ram mut $f: fn(u8)->u8 = &@inc
    @$f(100) -> $r
    ? $r != 101 { 12 -> $ok }

    # Reassign the local to a different function.
    &@dbl -> $f
    @$f(50) -> $r
    ? $r != 100 { 13 -> $ok }

    # Multi-arg accumulator callback: 0^1^2^4 = 7.
    ram mut $x: u8 = @reduce(0, &@xor2)
    ? $x != 7 { 14 -> $ok }

    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]
    loop * {}
}
