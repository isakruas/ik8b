# std/timer

Basic Timer0 and Timer1 control.

## API

Timer0:

```ik8b
@timer0_set_prescaler($prescaler: u8)
@timer0_set_compare_a($val: u8)
@timer0_set_compare_b($val: u8)
@timer0_read() -> u8
@timer0_write($val: u8)
@timer0_ctc_mode()
@timer0_enable_compa_int()
```

Timer1:

```ik8b
@timer1_set_prescaler($prescaler: u8)
@timer1_set_compare_a($val: u16)
@timer1_set_compare_b($val: u16)
@timer1_read() -> u16
@timer1_write($val: u16)
@timer1_ctc_mode()
@timer1_enable_compa_int()
```

## Example

```ik8b
target atmega328p
import std/timer

@main {
    @timer0_ctc_mode()
    @timer0_set_compare_a(249)
    @timer0_enable_compa_int()
    @timer0_set_prescaler(3)
    loop * {}
}
```

## Notes

Enabling compare interrupts does not define the ISR. Declare the correct vector
with `isr VECTOR_NAME { ... }` for the selected target.
