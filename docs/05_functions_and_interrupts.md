# Functions and Interrupts

## Functions

User functions use the `@` prefix.

```ik8b
@add($a: u8, $b: u8) -> u8 {
    return $a + $b
}
```

`@main` is the program root. The generated startup calls `@main` and then emits
one `0xFFFF` word.

```ik8b
@main {
    ram mut $x: u8 = @add(1, 2)
    loop * {}
}
```

The backend supports up to 5 call arguments.

## No-Parameter Declarations

Both forms are accepted:

```ik8b
@main {
    loop * {}
}

@tick() {
    return
}
```

## Function Pointers

```ik8b
@inc($x: u8) -> u8 {
    return $x + 1
}

@main {
    ram mut $f: fn(u8)->u8 = &@inc
    ram mut $r: u8 = @$f(100)
    loop * {}
}
```

The compiler keeps address-taken functions reachable so indirect calls can work.

## Backend Intrinsics

| Intrinsic | Effect |
| --- | --- |
| `@nop()` | emits NOP |
| `@cli()` | disables global interrupts |
| `@sei()` | enables global interrupts |
| `@swap(reg)` | emits SWAP for literal register `0..31` |
| `@movw(rd, rr)` | emits MOVW/pair copy |
| `@mul(rd, rr)` | emits MUL if the core supports multiplication |
| `@burn(cycles)` | burns cycles with padding or a blocking loop |

`@burn` with a literal emits a sequence adjusted for that cycle count. With a
dynamic value, it emits a runtime loop.

## Interrupts

Syntax:

```ik8b
isr TIMER0_COMPA {
    @tick()
}
```

The vector name is validated against `src/vectors.rs` for the selected target.
Rules:

- The reset vector, index 0, cannot be defined with `isr`.
- Two ISRs cannot bind the same vector index.
- Names are case-sensitive.
- Undefined vectors point to a default handler that executes `RETI`.

The backend emits the vector table. On `AVRrc`, vector entries use `RJMP`; on
other supported cores, they use `JMP` when applicable.

## ISR Shape Example

```ik8b
target atmega328p

@on_tick() {
    @nop()
}

isr TIMER0_COMPA {
    @on_tick()
}

@main {
    loop * {}
}
```

The compiler has no user global variables. An ISR can call functions and
operate on hardware, but mutable state shared between `@main` and an ISR needs a
project design that respects that language limitation.
