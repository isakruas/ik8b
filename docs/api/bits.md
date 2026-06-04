# std/bits

Bit utility functions implemented in ik8b.

## API

```ik8b
@rotl8($val: u8, $n: u8) -> u8
@rotr8($val: u8, $n: u8) -> u8
@rotl16($val: u16, $n: u8) -> u16
@rotr16($val: u16, $n: u8) -> u16
@popcount8($val: u8) -> u8
@popcount16($val: u16) -> u8
@parity8($val: u8) -> u8
@reverse8($val: u8) -> u8
@reverse16($val: u16) -> u16
```

## Behavior

- Rotations mask `n` with `7` for 8-bit values and `15` for 16-bit values.
- `popcount*` returns the number of set bits.
- `parity8` returns the parity of `popcount8`.
- `reverse*` reverses bit order.

## Example

```ik8b
target atmega328p
import std/bits

@main {
    ram mut $x: u8 = @rotl8(0x81, 1)
    ram mut $n: u8 = @popcount8($x)
    loop * {}
}
```

## Notes

These functions do not depend on source-level `<<` or `>>`, which are not
implemented by the parser. The implementation uses multiplication,
division by 2, and masks.
