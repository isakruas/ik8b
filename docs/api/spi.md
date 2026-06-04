# std/spi

Raw SPI master helpers for SPI0 and SPI1 when the target registers exist.

## API

```ik8b
@spi_transfer($data: u8) -> u8
@spi_init_master_raw()
@spi1_transfer($data: u8) -> u8
@spi1_init_master_raw()
```

## Behavior

- `*_init_master_raw` writes the standard library's basic master
  configuration.
- `*_transfer(data)` writes one byte, waits for transfer completion, and returns
  the received byte.

## Example

```ik8b
target atmega328p
import std/spi

@main {
    @spi_init_master_raw()
    ram mut $rx: u8 = @spi_transfer(0x55)
    loop * {}
}
```

## Notes

Chip-select control is left to the program, usually through `std/gpio`.
