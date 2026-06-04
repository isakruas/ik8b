# std/adc

Basic ADC reads for targets whose ADC registers are defined by this module.

## API

```ik8b
@adc_init()
@adc_read($channel: u8) -> u16
@adc_read_8bit($channel: u8) -> u8
```

## Behavior

- `@adc_init()` configures the ADC control register with the value used by the
  standard library.
- `@adc_read(channel)` selects a channel, starts conversion, waits for
  completion, and returns the 10-bit result in `u16`.
- `@adc_read_8bit(channel)` performs a full read and returns an 8-bit version.

## Example

```ik8b
target atmega328p
import std/adc

@main {
    @adc_init()
    ram mut $sample: u16 = @adc_read(0)
    ram mut $sample8: u8 = @adc_read_8bit(0)
    loop * {}
}
```

## Notes

The module defines `%ADC_*` aliases per target. Use it only on devices with ADC
support in the module.
