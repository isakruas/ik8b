# std/crc

CRC calculation over SRAM buffers.

## API

```ik8b
@crc8($data: ptr ram u8, $len: u16) -> u8
@crc16($data: ptr ram u8, $len: u16) -> u16
```

## Behavior

- `@crc8` uses the Dallas/Maxim variant with reversed polynomial `0x8C`.
- `@crc16` uses the IBM/ANSI variant with reversed polynomial `0xA001`.
- The caller provides an SRAM byte pointer and length.

## Example

```ik8b
target atmega328p
import std/crc

@main {
    ram mut $data: u8[3] = 0
    1 -> $data[0]
    2 -> $data[1]
    3 -> $data[2]
    ram mut $c: u8 = @crc8(&$data[0], 3)
    loop * {}
}
```
