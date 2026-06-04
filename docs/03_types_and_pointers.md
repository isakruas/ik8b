# Types and Pointers

## Scalar Types

| Type | Representation | Common use |
| --- | --- | --- |
| `u8` | 8-bit unsigned | bytes, registers, small indexes |
| `u16` | 16-bit unsigned | addresses, counters, sizes |
| `i8` | 8-bit signed | small signed integers |
| `i16` | 16-bit signed | signed integers |
| `bool` | byte | `0` false, nonzero true |
| `char` | byte | ASCII/byte character |
| `r8` | signed Q4.4 | 8-bit fixed-point |
| `r16` | signed Q8.8 | 16-bit fixed-point |
| `void` | no value | function return |

`char` is treated as a byte. `bool` also occupies one byte.

## Fixed-Point

`r8` has 4 fractional bits. `r16` has 8 fractional bits.

```ik8b
@main {
    ram mut $a: r16 = 1.5
    ram mut $b: r16 = 2.0
    ram mut $c: r16 = $a * $b
    loop * {}
}
```

Fixed-point multiplication and division are lowered with scale adjustment.
Some `r16` operations use internal runtime helpers. On `AVRrc`, fixed-point
runtime helpers are not supported by the backend. Multiplication also
depends on target support for `MUL`.

## Conversions

The compiler coerces values when the expected type is known, such as variable
initialization or function return.

```ik8b
@as_word($x: u8) -> u16 {
    return $x
}
```

Negative integer literals and literals larger than 255 are usually treated as
16-bit values when no expected type is present. Float literals without an
expected type use fixed-point, normally `r16`.

## Address-Space Pointers

The pointer type carries the pointed-to storage space:

```ik8b
@main {
    ram mut $x: u8 = 3
    ram ptr u8 $p = &$x
    *$p + 1 -> $x
    loop * {}
}
```

Flash and EEPROM pointers also exist:

```ik8b
ptr flash u8
ptr eeprom u8
```

Use a pointer in the correct address space. The backend selects different
instructions for SRAM, flash, and EEPROM.

## Arrays

Arrays are declared with a constant size:

```ik8b
@main {
    ram mut $buf: u8[4] = 0
    10 -> $buf[0]
    $buf[0] -> $buf[1]
    loop * {}
}
```

The initializer fills every element. There is no array literal syntax for
different per-element values.

## Function Pointers

Use `fn(...)` to store function addresses:

```ik8b
@inc($x: u8) -> u8 {
    return $x + 1
}

@apply($f: fn(u8)->u8, $v: u8) -> u8 {
    return @$f($v)
}

@main {
    ram mut $f: fn(u8)->u8 = &@inc
    ram mut $r: u8 = @apply($f, 41)
    loop * {}
}
```

Indirect calls use `@$f(...)`.

## Address-Of and Dereference

`&` can take the address of a variable, array element, or function:

```ik8b
ram ptr u8 $p = &$x
ram ptr u8 $q = &$buf[2]
ram mut $f: fn(u8)->u8 = &@inc
```

`*` dereferences pointers:

```ik8b
7 -> *$p
*$p -> $x
```

There is no runtime null-pointer or bounds check.
