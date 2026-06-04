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
Unsigiled identifiers are used for keywords, type names, device targets, and
import paths.

## 2. Lexical Structure

Source text is tokenized as an ASCII-oriented stream.

Whitespace separates tokens and otherwise has no semantic meaning. Newlines are
tracked only for diagnostics.

Line comments start with `#` and continue to the end of the line.

The reserved keywords are:

```ik
const mut imut ram eeprom flash loop return import switch target ptr str fn
```

The primitive type names are:

```ik
u8 u16 i8 i16 bool char r8 r16 void
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

String literals are double quoted. They support the same escapes as character
literals plus `\"` and a two-digit hexadecimal byte escape `\xHH`, which makes
them suitable for arbitrary binary data:

```ik
"hello\n"
"\x00\x3E\x5B\x4F"
```

A string literal is lowered to a byte sequence; no NUL terminator is added
automatically, so include `\x00` (or `\0`) when a terminator is required. String
literals appear as `str ram`/`str flash` initializers and as `str ram`
arguments (see §5.1).

Identifiers used after sigils should be composed of letters, digits, `_`, `.`,
and `/`, with the first unsigiled character being a letter or `_`. `/` and `.`
exist primarily for import paths such as `std/math` and `tests/test_helper`.

## 3. Program Structure

A source file is a sequence of top-level statements:

```ebnf
Program ::= { TopLevelStatement }

TopLevelStatement ::=
      ImportStatement
    | targetStatement
    | CompileTimeCondition
    | ConstDeclaration
    | FunctionDeclaration
```

The compiler driver requires one top-level device target before code
generation:

```ik
target atmega328p
```

The target selects the device entry from the compiler device table. If no
target is present, or if the selected device is unknown, compilation fails.
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

Imported files are parsed using the active target of the importing parser.

Top-level target conditions select declarations at parse time:

```ik
? target == atmega328p {
    const %PORTB: u16 = 0x0025
    @board_init() { }
}
```

Only `import`, `const`, and function declarations are accepted inside a
top-level target condition. Conditions compare the active target against a
single identifier using `==`; arbitrary compile-time expressions are not
supported.

## 5. Declarations and Types

### 5.1 Types

The primitive scalar types are:

| Type | Width | Semantics |
|---|---:|---|
| `u8` | 8 bits | Unsigned byte, wrapping modulo 256. |
| `u16` | 16 bits | Unsigned word, wrapping modulo 65536, little-endian in memory. |
| `i8` | 8 bits | Signed integer, range `[-128, 127]`. |
| `i16` | 16 bits | Signed integer, range `[-32768, 32767]`, little-endian in memory. |
| `bool` | 8 bits | Boolean type representing `true` (1) or `false` (0). |
| `char` | 8 bits | Single character literal or byte representation. |
| `r8` | 8 bits | CPU register reference mapping directly to one of `R0`..`R31`. |
| `r16` | 16 bits | CPU register pair reference mapping directly to a register pair. |
| `void` | no value | Function return type only. |

The context/pointer-aware complex types are:

- **Pointer Types (`ptr <space> <pointee_type>`)**:
  References a memory address in the specified pointer space (`ram`, `eeprom`, or `flash`) pointing to a value of `<pointee_type>`. Examples:
  - `ptr ram u8` (pointer to mutable `u8` in SRAM)
  - `ptr flash u16` (pointer to constant `u16` in Program Flash)
  - `ptr eeprom u8` (pointer to persistent `u8` in EEPROM)

- **String Types (`str ram` / `str flash`)**:
  References a string by base address. `str ram` is a mutable string in SRAM;
  `str flash` stores the bytes in program memory (read via `LPM`) and indexes
  them with `$name[i]`. `str flash` is read-only and is rejected on reduced-core
  (AVRrc) devices, which lack `LPM`.

- **Function-Pointer Types (`fn(<args>)` / `fn(<args>) -> <ret>`)**:
  A 16-bit word address of a function with the given parameter and return types.
  Omitting `-> <ret>` means a `void` return. Examples:
  - `fn(u8)` (pointer to a function taking one `u8`, returning nothing)
  - `fn(u8,u8) -> u8` (two `u8` arguments, `u8` result)

  A function pointer is produced with `&@func` and called indirectly with
  `@$var(args)` (see §5.3).

Array types are written as `Type[N]`, where `Type` is any valid base type and `N` is a numeric literal. Example: `u8[16]`, `i16[4]`.

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

#### Function pointers and indirect calls

The address of a function is taken with `&@func`, producing a value of a
function-pointer type (§5.1). It may be passed as an argument, stored in a
variable, and called indirectly through the variable with `@$var(args)`:

```ik
@apply($f: fn(u8) -> u8, $v: u8) -> u8 {
    return @$f($v)              # indirect call through Z (ICALL)
}

@inc($x: u8) -> u8 { return $x + 1 }

@main {
    ram mut $r: u8 = @apply(&@inc, 41)   # 42
    ram mut $g: fn(u8) -> u8 = &@inc     # function pointer in a local
    @$g(9) -> $r                         # 10
}
```

Indirect calls use the same argument and return-value convention as direct
calls. A function that is only ever address-taken (never called directly by
name) is still retained by reachability analysis. Taking the address of a
function makes it callable from anywhere holding the pointer, so it cannot be
eliminated as dead code.

### 5.4 Variables

Variables are declared inside function blocks and must explicitly specify both their storage location (`ram`, `eeprom`, or `flash`) and their mutability (`mut` or `imut`):

```ik
ram imut $pin: u8 = 5
ram mut $counter: u16 = 0
ram mut $buffer: u8[16] = 0
eeprom mut $saved_count: u8 = 0
flash imut $lookup_table: u8[4] = 12
```

The supported combinations of storage space and mutability are:

| Declaration | Description |
|---|---|
| `ram mut` | A mutable variable allocated in the static SRAM space. |
| `ram imut` | An immutable variable allocated in the static SRAM space. |
| `eeprom mut` | A mutable variable stored in persistent EEPROM. |
| `eeprom imut` | An immutable variable stored in persistent EEPROM. |
| `flash imut` | An immutable constant variable placed in program Flash memory. |

Every variable declaration must have an initializer. If a variable declaration omits the storage location or is declared incorrectly, a compilation syntax error is immediately raised. 

`flash mut` is invalid and illegal. Because Flash memory cannot be modified at runtime by normal write instructions, any declaration of `flash mut` will raise a compilation error.

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

`Target` may be a mutable `$` variable, a `%` hardware register, an array
element (`$arr[i]`), or a pointer dereference (`*($p + i)`, which writes through
a `ptr ram`/`ptr eeprom` pointer; flash is read-only). Compound arrows update
the target using its current value:

| Operator | Meaning |
|---|---|
| `->+` | `target = target + expression` |
| `->-` | `target = target - expression` |
| `->&` | `target = target & expression` |
| `->|` | `target = target | expression` |
| `->^` | `target = target ^ expression` |

Assigning to an `imut` variable or immutable array element is a compilation error.

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
| 1 | literals, string literals, `$x`, `%REG`, `$arr[i]`, `@call(args)`, `@$ptr(args)`, `&@func`, `(expr)` | primary |
| 2 | `!`, `~`, unary `-`, address-of `&`, dereference `*` | right-to-left |
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

In operand position `&` is address-of and `*` is dereference (distinct from the
infix bitwise-AND and multiply). `&$var`, `&$arr[i]`, and `&@func` yield 16-bit
addresses; `*($p + i)` reads through a pointer in its target memory space
(`ram`/`flash`/`eeprom`). `@$var(args)` is an indirect call through a
function-pointer variable.

Arithmetic, bitwise operations, division, and modulo are unsigned operations in
the expression width selected by the surrounding context. Division by zero has
undefined runtime behavior and is not guaranteed to be diagnosed.

Comparisons produce `0` or `1`. Relational comparisons are unsigned.

Logical `&&` and `||` use zero/nonzero truthiness and short-circuit evaluation.

## 8. Compilation Model

### 8.1 Target Device

The active `target` selects a device from `src/devices.rs`. Each device entry
provides:

| Field | Purpose |
|---|---|
| `core` | AVR core family used for instruction selection. |
| `sram_start` | First compiler-managed SRAM address. |
| `sram_size` | Static data budget. |
| `flash_size` | Total on-device Flash capacity. |
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

A parameterless function whose body is a single `return <constant-expression>`
is treated as a named compile-time constant: calls to it fold to an immediate at
every use site, costing no program space or registers. This makes accessor-style
functions (e.g. layout/ABI offset helpers) free to use in place of magic numbers.
Folding applies transitively (such a function may call another).

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
After generation, program size, static SRAM use, and static EEPROM use are
checked against the selected device budget. Program size is checked against
usable Flash (`flash_size - boot_size`).

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
top-level target conditions to expose declarations for supported devices.

| Module | Purpose |
|---|---|
| `std/gpio` | GPIO register constants and per-port helpers. |
| `std/uart` | USART initialization, send, receive, availability, and newline helpers. |
| `std/spi` | SPI master initialization and byte transfer. |
| `std/twi` | TWI/I2C initialization, start, stop, write, and read helpers. |
| `std/eeprom` | EEPROM byte read/write helpers and busy-wait synchronization. |
| `std/atomic` | Interrupt-safe critical-section helpers (`@atomic_start`, `@atomic_end`). |
| `std/delay` | Cycle-based delay helpers in microseconds and milliseconds. |
| `std/math` | Fixed-point and integer math helpers. |
| `std/bits` | Bit rotations, popcount/parity, and bit-reversal helpers. |
| `std/crc` | CRC-8 (Dallas/Maxim) and CRC-16 (IBM/ANSI) checksums. |
| `std/mem` | Memory copy/fill/compare/search utilities for SRAM/flash pointers. |
| `std/string` | NUL-terminated string and character classification utilities. |
| `std/conv` | Numeric/string conversion helpers (decimal and hexadecimal). |
| `std/font` | 5x8 bitmap font lookup, rendering, and streaming helpers. |

`std/gpio` supports conditional register maps for `attiny85`, `atmega328p`,
`atmega2560`, and `atmega32u4`. It exposes helpers of the form
`@pin_mode_<port>`, `@digital_write_<port>`, `@digital_read_<port>`, and
`@toggle_<port>` where the selected device defines that port.

`std/uart`, `std/spi`, and `std/twi` currently define device-specific routines
for `atmega328p`, `atmega2560`, and `atmega32u4`.
`std/uart` also includes USART1 helpers for `atmega2560`
(`@uart1_init`, `@uart1_send`, `@uart1_receive`).

`std/eeprom`, `std/atomic`, and `std/delay` provide generic AVR helpers without
target-conditional variants in the current tree.

`std/math` primarily uses `r16` (Q8.8 signed fixed-point) conventions for many
functions. Public
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
| `--report` | Prints a formatted build summary with Program, SRAM, EEPROM, and register usage; memory over-budget conditions fail compilation. |

Unknown options or unexpected extra arguments are CLI errors.

## 12. Current Language Limits

The current language intentionally omits several constructs common in larger
languages:

- No structs, enums, or dynamic allocation (no heap; all storage is static).
- No user-defined global variables.
- No array bounds checks.
- No `break` or `continue` statements.
- Function pointers are supported (`fn(...)`, `&@func`, `@$var(args)`), but
  there are no closures: a function pointer carries only an address, not any
  captured environment.
- No general preprocessor; only top-level `? target == name { ... }`.
- No interrupt declaration syntax beyond emitting low-level intrinsics such as
  `@reti()`.

These limits describe the current compiler behavior and should be treated as
part of the compatibility surface until explicitly changed.
