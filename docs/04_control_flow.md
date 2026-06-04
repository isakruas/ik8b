# Control Flow

## Runtime Conditional

Conditionals use `?`:

```ik8b
@classify($x: u8) -> u8 {
    ? $x == 0 {
        return 0
    } : {
        return 1
    }
}
```

The `:` branch is optional.

Boolean truth follows the usual AVR convention: zero is false and nonzero is
true. `&&` and `||` short-circuit.

## Target Conditional

`? target == name { ... }` is resolved at compile time:

```ik8b
? target == atmega328p {
    @nop()
}
```

This form has no `:` branch.

## Infinite Loop

```ik8b
@main {
    loop * {
        @nop()
    }
}
```

Use `return` to exit a function. The language has no `break` or
`continue`.

## Range Loop

```ik8b
@sum10() -> u16 {
    ram mut $sum: u16 = 0
    loop 0..10 -> $i {
        $i ->+ $sum
    }
    return $sum
}
```

The end bound is exclusive. The `$i` induction variable is created as `u16`
inside the loop.

## Switch

```ik8b
@code($x: u8) -> u8 {
    switch $x {
        0 -> { return 10 }
        1 -> { return 20 }
        * -> { return 99 }
    }
}
```

Each case is an expression followed by `->` and a block. The default case uses
`*`. There is no fallthrough.

## Return

```ik8b
@f($x: u8) -> u8 {
    ? $x == 0 { return 1 }
    return $x
}
```

`return` without an expression is valid in `void` functions.

## Important Absences

Unsupported constructs:

- `while`
- `for`
- `break`
- `continue`
- ternary expressions
- `switch` with `=>`
- `_` as default case
