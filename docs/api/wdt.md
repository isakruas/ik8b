# std/wdt

Watchdog timer helpers.

## API

```ik8b
@wdt_enable($prescaler: u8)
@wdt_disable()
@wdt_reset()
```

## Behavior

- `@wdt_enable(prescaler)` enables the watchdog using registers defined for the
  target.
- `@wdt_disable()` clears watchdog configuration according to the module.
- `@wdt_reset()` calls only `@nop()`. The name suggests watchdog reset, but the
  implementation does not emit a `WDR` instruction.

## Example

```ik8b
target atmega328p
import std/wdt

@main {
    @wdt_enable(4)
    @wdt_reset()
    @wdt_disable()
    loop * {}
}
```
