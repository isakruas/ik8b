================================
``std/twi`` --- I²C / TWI master
================================

.. code-block:: text

   import std/twi

Two-Wire Interface (TWI, Atmel's I²C) master primitives. The module exposes the
low-level building blocks of an I²C transaction — start, address/data write,
acknowledged and unacknowledged reads, and stop — so you can drive any I²C
device. Each call busy-waits on the TWI hardware until the operation completes.

Choosing the bit-rate value
===========================

:func:`@twi_init` takes the **TWBR** register value, not a clock frequency. That
is why the examples pass a number like ``72`` rather than ``100000``. With the
TWI prescaler left at 1, the SCL clock is:

.. math::

   f_{SCL} = \frac{F_{CPU}}{16 + 2 \times \text{TWBR}}

Solving for TWBR: ``TWBR = (F_CPU / f_SCL - 16) / 2``. For 100 kHz on a 16 MHz
clock that is ``(16000000 / 100000 - 16) / 2 = 72``.

=================== =================== ===================
SCL frequency       TWBR at 8 MHz       TWBR at 16 MHz
=================== =================== ===================
100 kHz (standard)  32                  72
400 kHz (fast)      2                   12
=================== =================== ===================

Standard-mode (100 kHz) is the safe default; many devices also accept fast-mode
(400 kHz). TWBR must stay ≥ 10 for reliable master operation, so very high SCL
rates need the larger clock.

TWI0
====

.. function:: @twi_init($twbr_val: u8)

   Initialise the TWI peripheral as a master. ``$twbr_val`` is the bit-rate
   register value that, together with the prescaler, sets the SCL clock
   frequency.

.. function:: @twi_start()

   Transmit a START condition and wait for it to complete. Begins a transaction.

.. function:: @twi_stop()

   Transmit a STOP condition, releasing the bus and ending the transaction.

.. function:: @twi_write($data: u8)

   Write one byte ``$data`` onto the bus and wait for the transfer to finish.
   Used both for the slave address+R/W byte after a START and for data bytes.

.. function:: @twi_read_ack() -> u8

   Read one byte from the slave and return an ACK to it (signalling "send more").
   Returns the received byte.

.. function:: @twi_read_nack() -> u8

   Read one byte from the slave and return a NACK (signalling "this is the last
   byte"). Returns the received byte; follow with :func:`@twi_stop`.

.. function:: @_twi_wait()

   Internal: block until the TWI hardware sets its interrupt flag, marking the
   current operation complete.

Additional TWI instance
=======================

Devices with a second TWI peripheral provide the same API on the ``twi1``
module: :samp:`@twi1_init`, :samp:`@twi1_start`, :samp:`@twi1_stop`,
:samp:`@twi1_write`, :samp:`@twi1_read_ack`, and :samp:`@twi1_read_nack`.

Example
=======

Read one byte from register ``0x00`` of an I²C device at 7-bit address ``0x68``:

.. code-block:: text

   target atmega328p
   import std/twi

   @main {
       @twi_init(72)                  # ~100 kHz SCL at 16 MHz (bit-rate register value)

       @twi_start()                   # START: take the bus
       @twi_write(0x68 * 2)           # slave address 0x68 + write bit (R/W = 0)
       @twi_write(0x00)               # point the slave at register 0x00
       @twi_start()                   # repeated START to switch direction
       @twi_write(0x68 * 2 + 1)       # same address + read bit (R/W = 1)
       ram imut $value: u8 = @twi_read_nack()  # read one byte, NACK = "last one"
       @twi_stop()                    # STOP: release the bus
   }