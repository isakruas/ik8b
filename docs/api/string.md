# std/string

NUL-terminated SRAM string routines and character classification helpers.

## String API

```ik8b
@strlen($s: str ram) -> u16
@strcpy($dest: ptr ram u8, $src: str ram)
@strncpy($dest: ptr ram u8, $src: str ram, $n: u16)
@strcat($dest: ptr ram u8, $src: str ram)
@strncat($dest: ptr ram u8, $src: str ram, $n: u16)
@strcmp($s1: str ram, $s2: str ram) -> i16
@strncmp($s1: str ram, $s2: str ram, $n: u16) -> i16
@strchr($s: str ram, $c: u8) -> ptr ram u8
@strrchr($s: str ram, $c: u8) -> ptr ram u8
@strstr($haystack: str ram, $needle: str ram) -> ptr ram u8
@strspn($s: str ram, $accept: str ram) -> u16
@strcspn($s: str ram, $reject: str ram) -> u16
@strpbrk($s: str ram, $accept: str ram) -> ptr ram u8
```

## Character API

```ik8b
@tolower($c: u8) -> u8
@toupper($c: u8) -> u8
@isspace($c: u8) -> bool
@isdigit($c: u8) -> bool
@isalpha($c: u8) -> bool
@isalnum($c: u8) -> bool
@isxdigit($c: u8) -> bool
@islower($c: u8) -> bool
@isupper($c: u8) -> bool
```

## Behavior

The functions follow C-like behavior for NUL-terminated strings. The caller is
responsible for ensuring destination buffers are large enough.

## Example

```ik8b
target atmega328p
import std/string

@main {
    ram str $src = "abc"
    ram mut $buf: u8[8] = 0
    @strcpy(&$buf[0], $src)
    ram mut $len: u16 = @strlen($src)
    ram mut $is_digit: bool = @isdigit('7')
    loop * {}
}
```

## Notes

Signatures accept `str ram`. There are no `str flash` variants.
