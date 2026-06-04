# Language Reference

This page summarizes the supported source syntax.

## Lexical Structure

Comments start with `#` and continue to the end of the line.

Plain identifiers use letters, digits, and `_`. Prefixes are meaningful:

- `$name`: local variable or parameter.
- `@name`: direct function, function call, or function name used as a value.
- `%NAME`: hardware address/register alias declared with `const`.

Reserved words:

```text
mut loop return import switch target imut ram eeprom flash const ptr str fn isr
```

Type keywords:

```text
u8 u16 i8 i16 bool char r8 r16 void
```

`true` and `false` are accepted and lowered as `1` and `0`.

## Literals

Numbers:

```ik8b
0
42
-3
0x2A
3.14
-1.5
```

Notes:

- Hexadecimal literals use `0x...`.
- The lexer does not read `-0x10` as one literal.
- Literals with a decimal point are used for fixed-point values, normally
  `r16` or `r8`.

Character literals:

```ik8b
'A'
'\n'
'\0'
'\\'
'\''
```

String literals:

```ik8b
"ok"
"line\n"
"\x48\x69\0"
```

Strings support `\n`, `\r`, `\t`, `\0`, `\\`, `\"`, and `\xHH`.

## File Structure

Top-level forms:

- `target <device>`
- `import <path>`
- `const %NAME: Type = Number`
- `? target == device { ... }`
- `isr VECTOR { ... }`
- function declarations starting with `@`

Example:

```ik8b
target atmega328p
import std/gpio

const %MY_REG: u16 = 0x0025

? target == atmega328p {
    const %LED_PORT: u16 = 0x0025
}

@main {
    loop * {}
}
```

User `ram`, `eeprom`, `flash`, `ptr`, and `str` variable declarations are not
accepted at the top level. They must appear inside blocks.

## Functions

Functions start with `@`. Parentheses are optional when there are no
parameters.

```ik8b
@main {
    loop * {}
}

@add($a: u8, $b: u8) -> u8 {
    return $a + $b
}

@nop_return() -> void {
    return
}
```

Parameters always use `$`. If the return type is omitted, the function returns
`void`.

## Local Declarations

Mutable SRAM variable:

```ik8b
ram mut $x: u8 = 0
```

Immutable variable:

```ik8b
ram imut $limit: u16 = 1000
```

Local array:

```ik8b
ram mut $buf: u8[8] = 0
```

An array initializer fills every element with the same value.

EEPROM:

```ik8b
eeprom mut $saved: u8 = 0
```

Flash:

```ik8b
flash imut $table: u8[4] = 1
```

`flash mut` is rejected by the parser. Flash data is immutable.

Pointer:

```ik8b
ram mut $x: u8 = 1
ram ptr u8 $p = &$x
9 -> *$p
```

Strings:

```ik8b
ram str $name = "ik8b"
flash str $glyph = "\x00\x7e\x42\x42\x7e"
```

`eeprom str` is not accepted.

## Types

Primitive types:

- `u8`, `u16`: unsigned integers.
- `i8`, `i16`: signed integers.
- `bool`: byte boolean, zero is false and nonzero is true.
- `char`: byte.
- `r8`: signed fixed-point Q4.4.
- `r16`: signed fixed-point Q8.8.
- `void`: no return value.

Pointers:

```ik8b
ptr ram u8
ptr flash u8
ptr eeprom u8
```

String parameter/return syntax:

```ik8b
@len($s: str ram) -> u16 {
    return 0
}
```

The parser accepts `str ram` in signatures. Flash strings can be local
variables, but `str flash` is not accepted as a parameter type.

Function pointers:

```ik8b
@inc($x: u8) -> u8 {
    return $x + 1
}

@main {
    ram mut $f: fn(u8)->u8 = &@inc
    ram mut $r: u8 = @$f(10)
    loop * {}
}
```

## Expressions

Accepted binary operators:

```text
|| && | ^ & == != < <= > >= + - * / %
```

Accepted unary operators:

```text
! ~ - & *
```

`&` takes the address of a variable, array element, or function. `*`
dereferences a pointer.

Precedence, from lowest to highest:

1. `||`
2. `&&`
3. `|`
4. `^`
5. `&`
6. `==`, `!=`
7. `<`, `<=`, `>`, `>=`
8. `+`, `-`
9. `*`, `/`, `%`
10. unary `!`, `~`, `-`, `&`, `*`
11. primaries, calls, and indexing

The parser prevents an infix expression from accidentally consuming the next
source line as the same statement. Even so, keep infix expressions on one line
when practical.

## Assignment

Assignment syntax is `value -> destination`:

```ik8b
1 -> $x
$x + 1 -> $x
$buf[0] -> $x
9 -> *$p
```

Compound assignments:

```ik8b
1 ->+ $x
1 ->- $x
1 ->& $x
1 ->| $x
1 ->^ $x
```

They mean `destination = destination op value`.

## Runtime Conditional

```ik8b
? $x == 0 {
    return 1
} : {
    return 2
}
```

The `else` branch is written as `:` followed by a block.

## Target Conditional

At top level or inside blocks:

```ik8b
? target == atmega328p {
    @nop()
}
```

This is decided during parse/compile time. This syntax has no `:` branch.

## Loops

Infinite loop:

```ik8b
loop * {
    @nop()
}
```

Range loop:

```ik8b
ram mut $sum: u16 = 0
loop 0..10 -> $i {
    $i ->+ $sum
}
```

The end bound is exclusive. The induction variable is created as `u16`.

## Switch

```ik8b
switch $v {
    0 -> { return 10 }
    1 -> { return 20 }
    * -> { return 30 }
}
```

The default `*` case is optional. There is no fallthrough.

## Interrupts

```ik8b
isr TIMER0_COMPA {
    @tick()
}
```

The vector name must exist for the current device. The reset vector cannot be
bound with `isr`.

## Intrinsics

The backend recognizes:

- `@nop()`
- `@cli()`
- `@sei()`
- `@swap(reg)`
- `@movw(rd, rr)`
- `@mul(rd, rr)`
- `@burn(cycles)`

`@swap`, `@movw`, and `@mul` take AVR register numbers. `@mul` requires a core
with hardware multiplication.

## Limits

- Calls with more than 5 arguments are not supported by the backend.
- Source-level `<<` and `>>` do not exist in the lexer/parser.
- `while`, `for`, `break`, `continue`, `struct`, `enum`, and `match` do not
  exist.
- Functions must be declared or be recognized intrinsics.
- Assigning to an `imut` variable is rejected. Elements of immutable arrays
  cannot be assigned either.
