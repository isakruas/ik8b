# std/conv

Conversion between NUL-terminated SRAM strings and integers.

## API

```ik8b
@atoi($s: str ram) -> i16
@atou($s: str ram) -> u16
@itoa($val: i16, $buf: ptr ram u8)
@utoa($val: u16, $buf: ptr ram u8)
@utoa_hex($val: u16, $buf: ptr ram u8)
@atou_hex($s: str ram) -> u16
```

## Behavior

- `@atoi` accepts optional `+` or `-` and stops at the first non-digit byte.
- `@atou` parses unsigned decimal and stops at the first non-digit byte.
- `@itoa` and `@utoa` write NUL-terminated decimal.
- `@utoa_hex` writes uppercase hexadecimal without a prefix.
- `@atou_hex` accepts optional `0x` or `0X` and letters `A-F`/`a-f`.

## Buffer Size

- `@itoa`: reserve up to 7 bytes for `-32768\0`.
- `@utoa`: reserve up to 6 bytes for `65535\0`.
- `@utoa_hex`: reserve up to 5 bytes for `FFFF\0`.

## Example

```ik8b
target atmega328p
import std/conv

@main {
    ram str $s = "1234"
    ram mut $v: u16 = @atou($s)
    ram mut $buf: u8[6] = 0
    @utoa($v, &$buf[0])
    loop * {}
}
```
