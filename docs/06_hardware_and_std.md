# Hardware and the Standard Library

## Targets

`target` selects an entry from `src/devices.rs`:

```ik8b
target atmega328p
```

Each entry records:

- device name;
- AVR core;
- SRAM start and size;
- flash size;
- EEPROM size;
- boot size when known.

List targets with:

```sh
./ik8b list-devices
```

## Cores

Core families:

- `AVRe`
- `AVRePlus`
- `AVRrc`
- `AVRxm`
- `AVRxt`

Not every core supports every instruction. The target model marks `MUL` as
unavailable on `AVRe` and `AVRrc`. The backend also has restrictions for flash
loads and EEPROM access on some cores.

## Hardware Registers

The standard library uses target blocks to define aliases:

```ik8b
? target == atmega328p {
    const %PORTB: u16 = 0x0025
}
```

Programs can read or write `%PORTB` as a hardware memory source/destination:

```ik8b
0x20 -> %PORTB
%PORTB -> $x
```

## Using the Standard Library

Imports use paths from the `std` directory:

```ik8b
import std/gpio
import std/uart
```

Many modules define registers per target. If a peripheral does not exist on the
selected device, calling that module can fail compilation or access a fallback
address chosen by the module. In portable code, isolate calls with
`? target == ...`.

```ik8b
? target == atmega328p {
    @pin_mode_b(5, 1)
}
```

## Modules

The `std/` directory contains:

- `adc`
- `atomic`
- `bits`
- `conv`
- `crc`
- `delay`
- `eeprom`
- `font`
- `gpio`
- `math`
- `mem`
- `pwm`
- `ringbuf`
- `sleep`
- `spi`
- `string`
- `timer`
- `twi`
- `uart`
- `wdt`

See [Standard Library Reference](std_reference.md) and the pages under
`docs/api/`.

## API Pattern

Standard library functions use normal ik8b syntax:

```ik8b
@uart_init(103)
@uart_send(65)
```

Buffers are usually provided by the caller:

```ik8b
import std/conv

@main {
    ram mut $buf: u8[6] = 0
    @utoa(1234, &$buf[0])
    loop * {}
}
```

The standard library does not allocate heap memory.
