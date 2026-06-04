# std/gpio

Digital GPIO by port.

## API

Helper:

```ik8b
@_gpio_mask($pin: u8) -> u8
```

For each port `a`, `b`, `c`, `d`, `e`, `f`, `g`, `h`, `j`, `k`, `l`, `m`, `q`,
and `r`, functions follow this pattern:

```ik8b
@pin_mode_b($pin: u8, $mode: u8)
@digital_write_b($pin: u8, $val: u8)
@digital_read_b($pin: u8) -> u8
@toggle_b($pin: u8)
```

Replace suffix `b` with the desired port.

## Behavior

- `mode == 1`: configure as output.
- Any other `mode`: configure as input.
- `val == 1`: write high.
- Any other `val`: write low.
- `toggle_*` toggles the output bit.

## Example

```ik8b
target atmega328p
import std/gpio

@main {
    @pin_mode_b(5, 1)
    @digital_write_b(5, 1)
    loop * {}
}
```

## Notes

Functions exist for many ports, but real peripherals depend on the selected
target. Use only ports present on the device, or guard portable code with
`? target == ...`.
