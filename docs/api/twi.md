# std/twi

Basic TWI/I2C helpers for controller 0 and 1.

## API

TWI0:

```ik8b
@_twi_wait()
@twi_init($twbr_val: u8)
@twi_start()
@twi_stop()
@twi_write($data: u8)
@twi_read_ack() -> u8
@twi_read_nack() -> u8
```

TWI1:

```ik8b
@_twi1_wait()
@twi1_init($twbr_val: u8)
@twi1_start()
@twi1_stop()
@twi1_write($data: u8)
@twi1_read_ack() -> u8
@twi1_read_nack() -> u8
```

## Behavior

- `init` writes the basic divisor/configuration.
- `start` triggers start on classic controllers; comments in the source note
  that start is handled by write on some modern variants.
- `write` sends one byte.
- `read_ack` reads one byte and sends ACK.
- `read_nack` reads one byte and sends NACK.

## Example

```ik8b
target atmega328p
import std/twi

@main {
    @twi_init(72)
    @twi_start()
    @twi_write(0xA0)
    @twi_stop()
    loop * {}
}
```
