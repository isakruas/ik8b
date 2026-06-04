# Standard Library Reference

The standard library lives in `std/` and is written in ik8b. Import modules by
path without the `.ik` extension:

```ik8b
import std/gpio
import std/delay
```

## General Rules

- The standard library does not allocate heap memory.
- Large buffers are usually provided by the caller.
- Peripheral modules depend on `target` and `%REG` aliases defined by the
  module.
- Some APIs only make sense on devices that have the matching peripheral.
- `std/string` works with `str ram`; there are no `str flash` variants
  in its signatures.
- Library functions can call intrinsics such as `@burn`, `@cli`, `@sei`, and
  `@nop`.

## Modules

| Module | Page | Summary |
| --- | --- | --- |
| `std/adc` | [api/adc.md](api/adc.md) | basic ADC reads |
| `std/atomic` | [api/atomic.md](api/atomic.md) | save/restore SREG around critical sections |
| `std/bits` | [api/bits.md](api/bits.md) | rotation, popcount, parity, and bit reverse |
| `std/conv` | [api/conv.md](api/conv.md) | decimal/hex conversion between strings and integers |
| `std/crc` | [api/crc.md](api/crc.md) | CRC8 Dallas/Maxim and CRC16 IBM/ANSI |
| `std/delay` | [api/delay.md](api/delay.md) | blocking delays with `@burn` |
| `std/eeprom` | [api/eeprom.md](api/eeprom.md) | EEPROM read/write helpers |
| `std/font` | [api/font.md](api/font.md) | 5x8 font rendering to buffer/stream |
| `std/gpio` | [api/gpio.md](api/gpio.md) | GPIO by port |
| `std/math` | [api/math.md](api/math.md) | Q8.8 fixed-point math |
| `std/mem` | [api/mem.md](api/mem.md) | libc-style memory helpers |
| `std/pwm` | [api/pwm.md](api/pwm.md) | timer0/timer1 PWM helpers |
| `std/ringbuf` | [api/ringbuf.md](api/ringbuf.md) | caller-owned byte ring buffer |
| `std/sleep` | [api/sleep.md](api/sleep.md) | sleep-mode register configuration |
| `std/spi` | [api/spi.md](api/spi.md) | raw SPI0/SPI1 master helpers |
| `std/string` | [api/string.md](api/string.md) | NUL-terminated SRAM strings |
| `std/timer` | [api/timer.md](api/timer.md) | timer0/timer1 helpers |
| `std/twi` | [api/twi.md](api/twi.md) | TWI/I2C 0 and 1 helpers |
| `std/uart` | [api/uart.md](api/uart.md) | UART0..UART5 helpers |
| `std/wdt` | [api/wdt.md](api/wdt.md) | watchdog helpers |

## Integrated Example

```ik8b
target atmega328p
import std/gpio
import std/delay

@cpu_mhz() -> u16 {
    return 16
}

@main {
    @pin_mode_b(5, 1)
    loop * {
        @toggle_b(5)
        @delay_ms(500)
    }
}
```

## Target Compatibility

Each module page documents signatures and general behavior. To know whether a
specific register exists on a target, inspect the module in `std/` and compile
with that `target`. The compiler and device table define the supported surface.
