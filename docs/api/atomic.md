# std/atomic

Critical-section helpers based on the AVR status register.

## API

```ik8b
@atomic_start() -> u8
@atomic_end($sreg_val: u8)
```

## Behavior

- `@atomic_start()` reads `%CPU_SREG`, clears the global interrupt bit, and
  returns the original SREG value.
- `@atomic_end(sreg)` restores `%CPU_SREG` with the saved value.

## Example

```ik8b
target atmega328p
import std/atomic

@main {
    ram mut $sreg: u8 = @atomic_start()
    @nop()
    @atomic_end($sreg)
    loop * {}
}
```

## Notes

Restore the value returned by `@atomic_start()` instead of unconditionally
calling `@sei()`.
