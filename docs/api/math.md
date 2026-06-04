# std/math

Q8.8 fixed-point math library based on `r16`.

## API

Helpers and constants:

```ik8b
@_q88_mul($a: r16, $b: r16) -> r16
@_q88_div($a: r16, $b: r16) -> r16
@pi() -> r16
@e() -> r16
@tau() -> r16
```

Representation helpers:

```ik8b
@min($a: r16, $b: r16) -> r16
@max($a: r16, $b: r16) -> r16
@clamp($val: r16, $min_val: r16, $max_val: r16) -> r16
@map($val: r16, $in_min: r16, $in_max: r16, $out_min: r16, $out_max: r16) -> r16
@abs($x: r16) -> r16
@fabs($x: r16) -> r16
@ceil($x: r16) -> r16
@floor($x: r16) -> r16
@trunc($x: r16) -> r16
@copysign($x: r16, $y: r16) -> r16
@fmod($x: r16, $y: r16) -> r16
@isclose($a: r16, $b: r16, $rel_tol: r16) -> r16
@isnan($x: r16) -> r16
@isinf($x: r16) -> r16
@isfinite($x: r16) -> r16
```

Power, logarithm, and trigonometry:

```ik8b
@pow($base: r16, $exp: u16) -> r16
@sqrt($x: r16) -> r16
@exp($x: r16) -> r16
@log($x: r16) -> r16
@log2($x: r16) -> r16
@log10($x: r16) -> r16
@_sin_180($x: u16) -> r16
@sin($deg: u16) -> r16
@cos($deg: u16) -> r16
@tan($deg: u16) -> r16
@radians($deg: u16) -> r16
@degrees($rad: r16) -> u16
@hypot($x: r16, $y: r16) -> r16
@dist($x1: r16, $y1: r16, $x2: r16, $y2: r16) -> r16
```

Hyperbolic and integer helpers:

```ik8b
@sinh($x: r16) -> r16
@cosh($x: r16) -> r16
@tanh($x: r16) -> r16
@asinh($x: r16) -> r16
@acosh($x: r16) -> r16
@atanh($x: r16) -> r16
@gcd($a: u16, $b: u16) -> u16
@lcm($a: u16, $b: u16) -> u16
@factorial($n: u8) -> u16
@fibonacci($n: u8) -> u16
@perm($n: u8, $k: u8) -> u16
@gamma($x: u8) -> u16
```

## Numeric Notes

- The library uses Q8.8 approximations.
- Some domain errors return `-128.0`.
- `_q88_div` returns `127.99` on division by zero.
- `@isnan` always returns `0.0` in the fixed-point model.
- `@isclose`, `@isinf`, and `@isfinite` return `r16` values `1.0` or `0.0`.

## Example

```ik8b
target atmega328p
import std/math

@main {
    ram mut $h: r16 = @hypot(3.0, 4.0)
    ram mut $p: r16 = @pi()
    loop * {}
}
```
