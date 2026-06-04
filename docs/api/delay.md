# std/delay

Blocking delays based on the `@burn` intrinsic.

## API

```ik8b
@_delay_ms($ms: u16, $clock_mhz: u16)
@delay_ms($ms: u16)
@_delay_us($us: u16, $clock_mhz: u16)
@delay_us($us: u16)
```

## Behavior

- `@_delay_ms` and `@_delay_us` receive the clock explicitly in MHz.
- `@delay_ms` and `@delay_us` call a project function named
  `@cpu_mhz() -> u16`.
- All delays are blocking.

## Example

```ik8b
target atmega328p
import std/delay

@cpu_mhz() -> u16 {
    return 16
}

@main {
    @delay_ms(10)
    @_delay_us(50, 16)
    loop * {}
}
```

## Notes

The calculation uses `u16` arithmetic. Large microsecond values multiplied by
the clock can overflow `u16`.
