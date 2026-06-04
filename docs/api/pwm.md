# std/pwm

Basic PWM configuration using Timer0 and Timer1.

## API

Timer0:

```ik8b
@pwm0_init_fast($prescaler: u8)
@pwm0_set_duty_a($duty: u8)
@pwm0_set_duty_b($duty: u8)
@pwm0_enable_output_a()
@pwm0_enable_output_b()
@pwm0_stop()
```

Timer1:

```ik8b
@pwm1_init_fast($prescaler: u8)
@pwm1_set_duty_a($duty: u16)
@pwm1_set_duty_b($duty: u16)
@pwm1_enable_output_a()
@pwm1_enable_output_b()
@pwm1_stop()
```

## Behavior

- `*_init_fast` configures fast PWM mode and prescaler.
- `*_set_duty_a/b` writes compare A/B.
- `*_enable_output_a/b` configures compare output according to the std mode.
- `*_stop` clears prescaler/control state according to the module registers.

## Example

```ik8b
target atmega328p
import std/pwm

@main {
    @pwm0_init_fast(3)
    @pwm0_set_duty_a(128)
    @pwm0_enable_output_a()
    loop * {}
}
```

## Notes

The module depends on `%PWM*` aliases defined per target. Configure the
corresponding physical pin as output when required by the hardware.
