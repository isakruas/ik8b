# Memory Model

ik8b exposes three AVR storage spaces:

- `ram`: SRAM, used for mutable data, stack, buffers, and runtime strings.
- `eeprom`: device EEPROM, when supported by the target and backend.
- `flash`: program memory, used for code and immutable data.

Hardware addresses are represented with `%` aliases.

## SRAM

`ram` declarations live in SRAM when they need a physical address. The compiler
keeps scalars in SSA/registers where possible; arrays, address-taken values,
and some temporaries become memory slots.

```ik8b
@main {
    ram mut $x: u8 = 1
    ram mut $buf: u8[4] = 0
    ram ptr u8 $p = &$x
    9 -> *$p
    loop * {}
}
```

The `--report` output shows static SRAM use. The pipeline also reserves a
minimum call-stack headroom and fails when static SRAM leaves less than 32 bytes
free.

## EEPROM

`eeprom` variables use the EEPROM budget of the selected target:

```ik8b
@main {
    eeprom mut $saved: u8 = 0
    42 -> $saved
    loop * {}
}
```

The backend rejects EEPROM access on some modern/reduced cores
(`AVRxt`, `AVRxm`, `AVRrc`). Use `std/eeprom` only on targets whose register
layout and backend support EEPROM access.

## Flash

`flash` data is immutable:

```ik8b
@main {
    flash imut $table: u8[4] = 7
    ram mut $x: u8 = $table[0]
    loop * {}
}
```

`flash str` stores string bytes in program memory:

```ik8b
@main {
    flash str $glyph = "\x00\x7e\x42\x42\x7e"
    ram mut $col: u8 = $glyph[1]
    loop * {}
}
```

Flash loads use program-memory read instructions in the backend and are not
available on every core. The backend rejects flash loads on `AVRrc`.

## Hardware Aliases with `%`

`const %NAME: type = number` declares a hardware address/register alias. The
standard library uses this pattern to map registers per target.

```ik8b
target atmega328p

const %PORTB_ADDR: u16 = 0x0025

@main {
    0x20 -> %PORTB_ADDR
    loop * {}
}
```

The pipeline validates that hardware aliases do not overlap compiler-allocated
SRAM.

## Pointers

Pointers are 16-bit values with an associated address space:

```ik8b
ptr ram u8
ptr flash u8
ptr eeprom u8
```

Example:

```ik8b
@main {
    ram mut $x: u8 = 1
    ram ptr u8 $p = &$x
    5 -> *$p
    loop * {}
}
```

Pointer arithmetic uses `+` and `-` on addresses. There is no runtime bounds
checking.

## Strings

`ram str` creates a NUL-terminated string in SRAM:

```ik8b
@main {
    ram str $s = "ok"
    ram mut $first: u8 = $s[0]
    loop * {}
}
```

`flash str` creates a string in flash. `std/string` accepts `str ram`; it does
not provide `str flash` variants.

## No Heap

There is no heap, dynamic allocation, `malloc`, or `free`. Buffers must be
declared explicitly by the program or provided by the caller.
