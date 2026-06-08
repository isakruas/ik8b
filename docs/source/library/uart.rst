=============================
``std/uart`` --- Serial USART
=============================

.. code-block:: text

   import std/uart

Blocking, polled access to the USART for asynchronous serial I/O. Each operation
busy-waits on the relevant status flag, so there is no buffering and no
interrupt handling in this module.

Configuring the baud rate
=========================

:func:`@uart_init` takes the **UBRR** divisor value, not a baud rate. That is
why the examples pass a number like ``103`` rather than ``9600``: ``103`` is the
divisor that *produces* 9600 baud on a 16 MHz clock. Compute it from your clock
and desired baud with:

.. math::

   \text{UBRR} = \frac{F_{CPU}}{16 \times \text{baud}} - 1

For 16 MHz at 9600 baud: ``16000000 / (16 * 9600) - 1 = 103``.

Common values (rounded to the nearest integer) for the two most common clocks:

=========== ===================== =====================
Baud rate   UBRR at 8 MHz         UBRR at 16 MHz
=========== ===================== =====================
2400        207                   416
4800        103                   207
9600        51                    103
19200       25                    51
38400       12                    25
57600       8                     16
115200      3                     8
=========== ===================== =====================

The further the real divisor is from a whole number, the larger the baud-rate
error; the slower rates above are exact, while 57600/115200 carry a few percent
error that most receivers still tolerate.

USART0
======

.. function:: @uart_init($ubrr: u16)

   Initialise USART0: set the baud divisor ``$ubrr`` and enable the transmitter
   and receiver in 8-N-1 frame format.

.. function:: @uart_send($data: u8)

   Transmit one byte, blocking until the transmit data register is empty first.

.. function:: @uart_receive() -> u8

   Block until a byte has been received, then return it.

.. function:: @uart_available() -> u8

   Return non-zero if a received byte is waiting to be read, ``0`` otherwise.
   Use this to poll without blocking in :func:`@uart_receive`.

.. function:: @uart_print_str($s: str ram)

   Transmit a NUL-terminated string from RAM, one byte at a time, stopping at
   the terminating ``0``. Each byte is sent through :func:`@uart_send`, so the
   call blocks until the whole string has been pushed out.

.. function:: @uart_print_char($char: u8)

   Convenience wrapper that transmits a single character ``$char``.

.. function:: @uart_println()

   Send a carriage return (13) followed by a line feed (10) — a CRLF line
   terminator.

.. function:: @_uart_wait_tx()

   Internal: block until the transmit register is ready. Used by the public send
   routines.

Additional USART instances
==========================

Devices with more than one USART expose the same API on numbered modules. The
``uart1`` … ``uart5`` families mirror USART0 exactly, for use on parts that have
those peripherals:

* ``@uart1_init`` / ``@uart1_send`` / ``@uart1_receive`` / ``@uart1_available``
  / ``@uart1_print_str`` / ``@uart1_print_char`` / ``@uart1_println``
* ``@uart2_*``, ``@uart3_*``, ``@uart4_*``, ``@uart5_*`` — identical shape.

Only call into an instance that exists on your ``target``.

Example
=======

.. code-block:: text

   target atmega328p
   import std/uart

   @main {
       @uart_init(103)                # 9600 baud @ 16 MHz (UBRR = 103)
       @uart_print_str("ready\r\n")   # greet over the serial line
       loop * {
           ? @uart_available() != 0 {            # is a received byte waiting?
               ram imut $c: u8 = @uart_receive() # read it (blocks until one arrives)
               @uart_send($c)                    # echo the same byte back out
           }
       }
   }