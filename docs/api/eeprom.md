# std/eeprom

Basic EEPROM access by address.

## API

```ik8b
@_eeprom_wait()
@eeprom_read($addr: u16) -> u8
@eeprom_write($addr: u16, $val: u8)
```

## Behavior

- `@_eeprom_wait()` waits for the active EEPROM operation to finish.
- `@eeprom_read(addr)` configures the address and returns one byte.
- `@eeprom_write(addr, val)` waits, configures address/data, and starts a write.

## Example

```ik8b
target atmega328p
import std/eeprom

@main {
    @eeprom_write(0, 42)
    ram mut $x: u8 = @eeprom_read(0)
    loop * {}
}
```

## Notes

The backend rejects EEPROM on some cores (`AVRxt`, `AVRxm`, `AVRrc`).
Compile for the real target to confirm support.
