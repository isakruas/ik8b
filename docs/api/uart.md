# std/uart

UART0..UART5 with a simple blocking API.

## API

UART0 uses names without a numeric suffix:

```ik8b
@uart_init($ubrr: u16)
@_uart_wait_tx()
@uart_send($data: u8)
@uart_receive() -> u8
@uart_available() -> u8
@uart_print_char($char: u8)
@uart_println()
```

UART1..UART5 repeat the same pattern with a number:

```ik8b
@uart1_init($ubrr: u16)
@uart1_send($data: u8)
@uart1_receive() -> u8
@uart1_available() -> u8
@uart1_print_char($char: u8)
@uart1_println()
```

`_uart1_wait_tx` through `_uart5_wait_tx` also exist.

## Behavior

- `init(ubrr)` configures baud and control registers used by the standard
  library.
- `send` waits until TX is ready and writes one byte.
- `receive` waits for a received byte and returns it.
- `available` returns the RX flag state.
- `println` sends CR and LF.

## Example

```ik8b
target atmega328p
import std/uart

@main {
    @uart_init(103)
    @uart_send(65)
    @uart_println()
    loop * {}
}
```

## Notes

Use only UARTs that exist on the device. The program must calculate `ubrr` for
the desired clock and baud.
