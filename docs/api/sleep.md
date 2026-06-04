# std/sleep

Sleep-mode configuration through control registers.

## API

```ik8b
@sleep_idle()
@sleep_powerdown()
@sleep_standby()
@sleep_disable()
```

## Behavior

- `@sleep_idle()` configures idle mode.
- `@sleep_powerdown()` configures power-down mode.
- `@sleep_standby()` configures standby mode.
- `@sleep_disable()` clears the sleep-enable bit.

## Example

```ik8b
target atmega328p
import std/sleep

@main {
    @sleep_idle()
    @sleep_disable()
    loop * {}
}
```

## Notes

There is no backend intrinsic named `@sleep`. This module only writes the
`%SLEEP_*` registers defined for the target.
