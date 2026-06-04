# Introduction

ik8b is a language and compiler for AVR-8 microcontrollers. The compiler reads
`.ik` files, resolves imports, validates the `target`, lowers the AST to SSA
IR, allocates registers and memory, emits AVR instructions, and writes Intel
HEX output.

Repository layout:

- `src/`: compiler, lexer, parser, device table, interrupt vectors, and AVR
  backend.
- `std/`: standard library written in ik8b.
- `tests/`: language, standard library, and VM execution tests.

## Smallest Program

Every program needs a `target` and an `@main` function.

```ik8b
target atmega328p

@main {
    loop * {}
}
```

Compile it with:

```sh
./ik8b main.ik -o main.hex --report
```

## Blink with the Standard Library

This example uses GPIO and delay on `atmega328p`. `std/delay` calls a project
function named `@cpu_mhz()`, so the program must provide it.

```ik8b
target atmega328p
import std/gpio
import std/delay

@cpu_mhz() -> u16 {
    return 16
}

@main {
    @pin_mode_b(5, 1)

    loop * {
        @digital_write_b(5, 1)
        @delay_ms(250)
        @digital_write_b(5, 0)
        @delay_ms(250)
    }
}
```

## Language Model

ik8b exposes important AVR details instead of hiding their memory cost:

- `ram`, `eeprom`, and `flash` explicitly select a storage space.
- Local variables use the `$` prefix.
- Hardware registers or hardware addresses use the `%` prefix.
- Functions use the `@` prefix.
- Assignment is written as `value -> destination`.
- Types are small and AVR-oriented: `u8`, `u16`, `i8`, `i16`, `bool`, `char`,
  `r8`, `r16`, pointers, strings, and function pointers.

## Compilation Flow

1. The lexer turns source text into tokens.
2. The parser resolves imports, target-conditionals, and the AST.
3. The compiler requires a `target` and `@main`.
4. SSA lowering checks types, lowers expressions, and decides which values need
   memory homes.
5. The backend allocates registers, emits AVR, resolves labels, relaxes
   branches, and writes Intel HEX.
6. The optional report validates `flash`, `sram`, and `eeprom` use against the
   selected device.

## Target Support

The compiler supports many AVR devices through the table in `src/devices.rs`.
Not every feature is available on every core: EEPROM access, flash loads,
multiplication, and fixed-point runtime helpers have target-specific
restrictions. See [Hardware and the Standard Library](06_hardware_and_std.md).
