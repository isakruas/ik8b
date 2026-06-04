# ik8b Documentation

ik8b is a compiler and language for AVR-8 microcontrollers. It compiles `.ik`
source files to Intel HEX and uses explicit storage spaces for SRAM, EEPROM,
and flash.

Examples use the supported syntax: `target` in source code, functions prefixed
with `@`, local variables prefixed with `$`, hardware aliases prefixed with
`%`, and assignments written as `value -> dest`.

## Table of Contents

1. [Introduction](01_introduction.md)
2. [CLI, Build, and Targets](cli.md)
3. [Language Reference](language_reference.md)
4. [Memory Model](02_memory_model.md)
5. [Types and Pointers](03_types_and_pointers.md)
6. [Control Flow](04_control_flow.md)
7. [Functions and Interrupts](05_functions_and_interrupts.md)
8. [Hardware and the Standard Library](06_hardware_and_std.md)
9. [Standard Library Reference](std_reference.md)
10. [Compiler Architecture](compiler_architecture.md)
11. [Testing and Validation](testing.md)

## Unsupported Constructs

These constructs are not supported:

- There is no `while`. Use `loop * { ... }` or
  `loop start..end -> $i { ... }`.
- There is no `switch` syntax with `=>` or `_`. The real syntax is
  `case -> { ... }` and `* -> { ... }` for the default case.
- There is no `@isr(...)`. The real syntax is `isr VECTOR_NAME { ... }`.
- There are no source-level `<<` or `>>` operators.
- User variables cannot be declared at the top level. `ram`, `eeprom`, `flash`,
  `ptr`, and `str` declarations belong inside blocks.
- There is no heap, `malloc`, classes, namespaces, user macros, or textual
  include system.
- There is no builtin `@sleep`. `std/sleep` provides functions that configure
  sleep control registers.

## Conventions

Examples assume a local `ik8b` binary:

```sh
./ik8b program.ik -o program.hex --report
```

Language examples use `ik8b` fenced blocks:

```ik8b
target atmega328p

@main {
    ram mut $x: u8 = 1
    $x + 1 -> $x
    loop * {}
}
```

The compiler emits Intel HEX for AVR-8. The device is selected inside the
source file with `target`, not with a command-line flag.
