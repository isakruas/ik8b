# std/mem

Memory helpers for SRAM buffers and flash-to-SRAM copies.

## API

```ik8b
@memcpy_P($dest: ptr ram u8, $src: ptr flash u8, $len: u16)
@memset($dest: ptr ram u8, $val: u8, $len: u16)
@memcmp($s1: ptr ram u8, $s2: ptr ram u8, $len: u16) -> i16
@memcpy($dest: ptr ram u8, $src: ptr ram u8, $len: u16)
@memmove($dest: ptr ram u8, $src: ptr ram u8, $len: u16)
@memchr($s: ptr ram u8, $c: u8, $n: u16) -> ptr ram u8
@memrchr($s: ptr ram u8, $c: u8, $n: u16) -> ptr ram u8
@memccpy($dest: ptr ram u8, $src: ptr ram u8, $c: u8, $len: u16) -> ptr ram u8
```

## Behavior

- `@memcpy_P` copies from flash to SRAM.
- `@memcpy` copies from SRAM to SRAM without special overlap handling.
- `@memmove` handles overlap.
- `@memcmp` returns `0` or the difference of the first differing byte.
- `@memchr` and `@memrchr` return a pointer or `0`.
- `@memccpy` copies until `c` is found; it returns the pointer after the copied
  byte or `0`.

## Example

```ik8b
target atmega328p
import std/mem

@main {
    ram mut $buf: u8[4] = 0
    @memset(&$buf[0], 7, 4)
    ram ptr u8 $p = @memchr(&$buf[0], 7, 4)
    loop * {}
}
```
