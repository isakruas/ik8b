# ik8b Language and Compiler Specification

This document specifies the source language accepted by the current ik8b
compiler and the observable compiler behavior required for AVR-8 targets. The
formal grammar is maintained in `EBNF`; this document adds lexical rules,
semantic rules, target selection, memory layout, intrinsics, and standard
library conventions.

The keywords "must", "must not", "should", and "may" are normative when they
describe source program behavior or compiler diagnostics.

## 1. Scope

ik8b is a small, statically typed embedded language that compiles directly to
AVR instruction words emitted as Intel HEX. Source programs are organized around
explicit context sigils:

| Sigil | Kind | Meaning |
|---|---|---|
| `$` | Variable | Compiler-managed scalar or array storage. |
| `%` | Hardware register | Memory-mapped byte register address declared with `const`. |
| `@` | Function | User-defined subroutine or compiler intrinsic. |

Every variable, hardware register, and function reference must use its sigil.
Unsigiled identifiers are used for keywords, type names, device namespaces, and
import paths.

## 2. Lexical Structure

Source text is tokenized as an ASCII-oriented stream.

Whitespace separates tokens and otherwise has no semantic meaning. Newlines are
tracked only for diagnostics.

Line comments start with `#` and continue to the end of the line.

The reserved keywords are:

```ik
const mut val loop return import switch namespace
```

The primitive type names are:

```ik
u8 u16 void
```

Boolean literals are lexical aliases:

| Literal | Value |
|---|---:|
| `true` | `1` |
| `false` | `0` |

Numeric literals are integers:

| Form | Example | Notes |
|---|---|---|
| Decimal | `123`, `-15` | A leading `-` is tokenized as part of the literal only when followed by a digit. |
| Hexadecimal | `0x25`, `0x00C6` | Hexadecimal literals are unsigned in lexical form. Use `0 - 0xNN` for a negative hex expression. |

Character literals are single quoted and evaluate to their byte value:

```ik
'A' '\n' '\r' '\t' '\0' '\\' '\''
```

Identifiers used after sigils should be composed of letters, digits, `_`, `.`,
and `/`, with the first unsigiled character being a letter or `_`. `/` and `.`
exist primarily for import paths such as `std/math` and `tests/test_helper`.

## 3. Program Structure

A source file is a sequence of top-level statements:

```ebnf
Program ::= { TopLevelStatement }

TopLevelStatement ::=
      ImportStatement
    | NamespaceStatement
    | CompileTimeCondition
    | ConstDeclaration
    | FunctionDeclaration
```

The compiler driver requires one top-level device namespace before code
generation:

```ik
namespace atmega328p
```

The namespace selects the device entry from the compiler device table. If no
namespace is present, or if the selected device is unknown, compilation fails.
Use `ik8b --list-devices` to list supported names.

The program entry point is `@main`. Code generation emits a call to `@main` at
program address zero, followed by a halt word (`0xFFFF`). A program without
`@main` is not a valid complete program.

## 4. Imports and Conditional Compilation

Imports merge another `.ik` file into the current compilation unit:

```ik
import std/math
import examples/demo_delay
```

The import operand is an identifier-like path without quotes. The compiler
appends `.ik` during lookup. Resolution is attempted in this order:

1. The current working directory.
2. `IK8B_STD_PATH`, when the environment variable is set.
3. Directories relative to the compiler executable, including `std` fallbacks
   for paths starting with `std/`.

Imported files are parsed using the active namespace of the importing parser.

Top-level namespace conditions select declarations at parse time:

```ik
? namespace == atmega328p {
    const %PORTB: u16 = 0x0025
    @board_init() { }
}
```

Only `import`, `const`, and function declarations are accepted inside a
top-level namespace condition. Conditions compare the active namespace against a
single identifier using `==`; arbitrary compile-time expressions are not
supported.

## 5. Declarations and Types

### 5.1 Types

The scalar integer types are:

| Type | Width | Semantics |
|---|---:|---|
| `u8` | 8 bits | Unsigned byte, wrapping modulo 256. |
| `u16` | 16 bits | Unsigned word, wrapping modulo 65536, little-endian in memory. |
| `void` | no value | Function return type only. |

Array types are written on variable declarations as `u8[N]` or `u16[N]`, where
`N` is a numeric literal.

### 5.2 Constants

Constants are top-level declarations for hardware register addresses:

```ik
const %PORTB: u16 = 0x0025
```

The name must start with `%`. The initializer must be a numeric literal. The
declared type is used to validate the numeric range (`u8` or `u16`), but `%`
accesses are byte-wide hardware register reads or writes at the declared
address.

### 5.3 Functions

Function declarations use an `@` name, optional parameters, an optional return
type, and a block:

```ik
@add($a: u16, $b: u16) -> u16 {
    return $a + $b
}

@init {
    @nop()
}
```

If the return type is omitted, it is `void`. Parameters must be `$` variables
with explicit scalar types.

Function calls use parentheses:

```ik
@add(10, 20) -> $result
@init()
```

Return values are passed in AVR registers `R24:R25`; a `u8` result uses `R24`.
Arguments are evaluated into register pairs starting at `R24:R25`, then
`R22:R23`, `R20:R21`, and `R18:R19`.

### 5.4 Variables

Variables are declared inside function blocks:

```ik
val $pin: u8 = 5
mut $counter: u16 = 0
mut $buffer: u8[16] = 0
```

`val` declares an immutable variable after initialization. `mut` declares a
mutable variable. Every declaration must have an initializer.

Array initializers are scalar expressions. The compiler evaluates the
initializer once and writes that value to every element. Array elements may be
read and assigned through indexing:

```ik
10 -> $buffer[0]
$buffer[$index] -> $value
```

Array bounds are not checked at runtime.

## 6. Statements

Blocks are delimited by braces and contain zero or more statements:

```ik
{
    mut $x: u8 = 1
    $x + 1 -> $x
}
```

There are no semicolons. Statements are separated by their grammar.

### 6.1 Assignment

Assignments are directional:

```ik
Expression -> Target
Expression ->+ Target
Expression ->- Target
Expression ->& Target
Expression ->| Target
Expression ->^ Target
```

`Target` may be a mutable `$` variable, a `%` hardware register, or an array
element. Compound arrows update the target using its current value:

| Operator | Meaning |
|---|---|
| `->+` | `target = target + expression` |
| `->-` | `target = target - expression` |
| `->&` | `target = target & expression` |
| `->|` | `target = target | expression` |
| `->^` | `target = target ^ expression` |

Assigning to a `val` variable or immutable array element is a compilation error.

### 6.2 Conditionals

Runtime conditionals use `?`:

```ik
? $x == 10 {
    1 -> $ok
} : {
    0 -> $ok
}
```

The `:` else block is optional. Conditions use zero as false and nonzero as
true.

### 6.3 Loops

Infinite loops use:

```ik
loop * {
    @nop()
}
```

Range loops use an exclusive upper bound:

```ik
loop 0..10 -> $i {
    $sum + $i -> $sum
}
```

The loop variable is a mutable `u16` induction variable created by the loop. The
body executes while `start <= $i < end`, using unsigned comparison, and `$i` is
incremented by one after each iteration.

`break` and `continue` are not language statements.

### 6.4 Switch

Switch statements compare an expression against case expressions in order:

```ik
switch $mode {
    0 -> { 10 -> $result }
    1 -> { 20 -> $result }
    * -> { 99 -> $result }
}
```

The `*` default branch is optional. Branch bodies do not fall through.

### 6.5 Return

Return exits the current function:

```ik
return
return $value
```

A value should be present only for non-`void` functions.

### 6.6 Expression Statements

An expression may be used as a statement for side effects, most commonly an
intrinsic or function call:

```ik
@nop()
@uart_send(65)
```

## 7. Expressions

Expressions are parsed by precedence from highest to lowest:

| Precedence | Operators and forms | Associativity |
|---:|---|---|
| 1 | literals, `$x`, `%REG`, `$arr[i]`, `@call(args)`, `(expr)` | primary |
| 2 | `!`, `~`, unary `-` | right-to-left |
| 3 | `*`, `/`, `%` | left-to-right |
| 4 | `+`, `-` | left-to-right |
| 5 | `<`, `>`, `<=`, `>=` | left-to-right |
| 6 | `==`, `!=` | left-to-right |
| 7 | `&` | left-to-right |
| 8 | `^` | left-to-right |
| 9 | `|` | left-to-right |
| 10 | `&&` | left-to-right, short-circuit |
| 11 | `||` | left-to-right, short-circuit |

Unary minus at the start of a statement should be parenthesized when it is the
left-hand expression of an assignment:

```ik
(-$x) -> $y
```

Arithmetic, bitwise operations, division, and modulo are unsigned operations in
the expression width selected by the surrounding context. Division by zero has
undefined runtime behavior and is not guaranteed to be diagnosed.

Comparisons produce `0` or `1`. Relational comparisons are unsigned.

Logical `&&` and `||` use zero/nonzero truthiness and short-circuit evaluation.

## 8. Compilation Model

### 8.1 Target Device

The active `namespace` selects a device from `src/devices.rs`. Each device entry
provides:

| Field | Purpose |
|---|---|
| `core` | AVR core family used for instruction selection. |
| `sram_start` | First compiler-managed SRAM address. |
| `sram_size` | Static data budget. |
| `flash_size` | Program budget. |
| `eeprom_size` | Reported EEPROM capacity. |
| `boot_size` | Reserved boot section size. |

Supported core families are `AVRe`, `AVRePlus`, `AVRrc`, `AVRxm`, and `AVRxt`.
The core affects instruction availability, including hardware multiplication
and `ADIW`/`SBIW` use.

### 8.2 Entry, Reachability, and Output

The compiler emits an initial call to `@main`, emits only functions reachable
from `@main`, resolves labels, performs peephole optimization, relaxes long
relative jumps/calls to absolute forms when required, and writes Intel HEX with
little-endian AVR instruction words.

Leaf user functions may be inlined as an optimization. This must not change the
observable result of a valid program.

### 8.3 Storage

Compiler-managed SRAM allocation starts at the selected device's `sram_start`.
Scalars may be kept in callee-saved registers `R2..R15` when the register
allocator can prove it is safe. Arrays and spilled scalars occupy SRAM.

Storage sizes are:

| Type | Bytes |
|---|---:|
| `u8` | 1 |
| `u16` | 2 |
| `u8[N]` | `N` |
| `u16[N]` | `2 * N` |

Hardware constants whose addresses overlap compiler-allocated SRAM are rejected.
After generation, program size and static SRAM use are checked against the
selected device budget.

### 8.4 Hardware Register Access

`%` references access memory-mapped byte registers at their declared address.
The backend may use:

| Address range | Access form |
|---|---|
| `0x20..0x5F` | AVR I/O `IN`/`OUT` when possible. |
| First 64 bytes from `sram_start` | `LDD`/`STD` through `Y+q` on cores that support it. |
| Other addresses | `LDS`/`STS`. |

Reading a `%` reference in a `u16` expression zero-extends the byte value.

## 9. Compiler Intrinsics

Intrinsics are functions with names reserved by the compiler. They are emitted
directly and do not require user declarations.

| Intrinsic | Arguments | Result |
|---|---|---|
| `@nop()` | none | Emits `NOP` (`0x0000`). |
| `@sleep()` | none | Emits `SLEEP` (`0x9588`). |
| `@wdr()` | none | Emits `WDR` (`0x95A8`). |
| `@break()` | none | Emits `BREAK` (`0x9598`). |
| `@reti()` | none | Emits `RETI` (`0x9518`). |
| `@lpm()` | none | Emits `LPM` using `Z`. |
| `@elpm()` | none | Emits `ELPM` using `Z`. |
| `@spm()` | none | Emits `SPM`. |
| `@ijmp()` | none | Emits indirect jump through `Z`. |
| `@icall()` | none | Emits indirect call through `Z`. |
| `@eijmp()` | none | Emits extended indirect jump through `Z`. |
| `@eicall()` | none | Emits extended indirect call through `Z`. |
| `@des(k)` | literal `k`, `0..15` | Emits XMEGA DES round instruction. |
| `@swap(reg)` | literal register, `0..31` | Emits `SWAP reg`. |
| `@movw(rd, rr)` | literal even registers, `0..30` | Emits `MOVW`; on `AVRrc`, expands to two `MOV` instructions. |
| `@mul(rd, rr)` | literal registers, `0..31` | Emits unsigned multiply into `R1:R0`; on cores without hardware `MUL`, expands to software multiply. |
| `@muls(rd, rr)` | literal registers, `16..31` | Emits signed multiply. |
| `@mulsu(rd, rr)` | literal registers, `16..23` | Emits signed by unsigned multiply. |
| `@fmul(rd, rr)` | literal registers, `16..23` | Emits fractional unsigned multiply. |
| `@fmuls(rd, rr)` | literal registers, `16..23` | Emits fractional signed multiply. |
| `@fmulsu(rd, rr)` | literal registers, `16..23` | Emits fractional signed by unsigned multiply. |

The register-numbered intrinsics operate on raw AVR registers. Valid programs
must pass literal register numbers in the ranges above.

## 10. Standard Library

The standard library is ordinary ik8b source under `std/`. Modules use
top-level namespace conditions to expose declarations for supported devices.

| Module | Purpose |
|---|---|
| `std/gpio` | GPIO register constants and per-port helpers. |
| `std/uart` | USART initialization, send, receive, availability, and newline helpers. |
| `std/spi` | SPI master initialization and byte transfer. |
| `std/twi` | TWI/I2C initialization, start, stop, write, and read helpers. |
| `std/math` | Fixed-point and integer math helpers. |

`std/gpio` supports conditional register maps for `attiny85`, `atmega328p`,
`atmega2560`, and `atmega32u4`. It exposes helpers of the form
`@pin_mode_<port>`, `@digital_write_<port>`, `@digital_read_<port>`, and
`@toggle_<port>` where the selected device defines that port.

`std/uart`, `std/spi`, and `std/twi` currently define device-specific routines
for `atmega328p`, `atmega2560`, and `atmega32u4`.

`std/math` uses `u16` fixed-point conventions for many functions. Public
functions include:

```ik
@pi @e @tau
@min @max @clamp @map @abs @fabs
@ceil @floor @trunc @copysign @fmod @isclose @isnan @isinf @isfinite
@pow @sqrt @exp @log @log2 @log10
@sin @cos @tan @radians @degrees @hypot @dist
@sinh @cosh @tanh @asinh @acosh @atanh
@gcd @lcm @factorial @fibonacci @perm @gamma
```

Names starting with `_` in the standard library are internal helpers by
convention.

## 11. Command Line Interface

The compiler command line supports a direct compile form and informational
commands:

```text
ik8b <file.ik> [-o <out.hex>] [--report]
ik8b help
ik8b version
ik8b info
ik8b license
ik8b list-devices
```

The following flag aliases must be accepted:

| Flag | Equivalent command |
|---|---|
| `-h`, `--help` | `help` |
| `-V`, `--version` | `version` |
| `--info` | `info` |
| `--license` | `license` |
| `--list-devices` | `list-devices` |

Compile options are:

| Option | Meaning |
|---|---|
| `-o <out.hex>` | Selects the output Intel HEX path. The default is `out.hex`. |
| `--report` | Prints `SRAM_BYTES=<n>` before the normal device memory report. |

Unknown options or unexpected extra arguments are CLI errors.

## 12. Current Language Limits

The current language intentionally omits several constructs common in larger
languages:

- No strings or string literals.
- No structs, enums, pointers, references, or dynamic allocation.
- No user-defined global variables.
- No array bounds checks.
- No `break` or `continue` statements.
- No general preprocessor; only top-level `? namespace == name { ... }`.
- No interrupt declaration syntax beyond emitting low-level intrinsics such as
  `@reti()`.

These limits describe the current compiler behavior and should be treated as
part of the compatibility surface until explicitly changed.
