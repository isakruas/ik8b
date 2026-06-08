==========================
Standard Library Reference
==========================

The standard library lives in ``std/`` and is written in ik itself. Pull a
module into your program with ``import``, naming it by path without the ``.ik``
extension::

   import std/gpio
   import std/delay

General rules
=============

A handful of conventions hold across the whole library:

* **No dynamic allocation.** Nothing uses a heap. When a routine needs scratch
  space or an output buffer, *you* declare it and pass a pointer.
* **Strings are caller-owned ``str ram``.** The string and conversion routines
  operate on NUL-terminated SRAM strings and ``ptr ram u8`` buffers; there are
  no ``str flash`` variants in their signatures.
* **Peripheral modules depend on ``target``.** ``std/gpio``, ``std/uart``,
  ``std/spi``, ``std/twi``, ``std/adc``, ``std/pwm``, and ``std/timer`` resolve
  their register addresses for the selected device via compile-time
  ``? target == ...`` blocks. A function only makes sense on a device that
  actually has the corresponding peripheral, port, or instance.
* **The CPU clock is a project constant.** Time-based code (``std/delay``) calls
  a ``@cpu_mhz()`` function that you define once per project.
* **Some routines wrap intrinsics.** Library code freely uses the compiler
  intrinsics :func:`@burn`, :func:`@cli`, :func:`@sei`, and :func:`@nop`
  (see :doc:`/reference/intrinsics`).

A note on naming: functions whose names begin with an underscore (for example
``@_delay_ms`` or ``@_eeprom_wait``) are internal primitives. They are
documented for completeness, but day-to-day code uses the public wrappers.

Hardware and peripherals
========================

.. toctree::
   :maxdepth: 1

   gpio
   uart
   spi
   twi
   adc
   pwm
   timer
   eeprom
   wdt
   sleep
   boot
   bootloader

Concurrency and buffers
=======================

.. toctree::
   :maxdepth: 1

   atomic
   ringbuf

Time
====

.. toctree::
   :maxdepth: 1

   delay

Strings, conversion, and memory
===============================

.. toctree::
   :maxdepth: 1

   string
   conv
   mem

Numeric and bit manipulation
============================

.. toctree::
   :maxdepth: 1

   bits
   crc
   math

Graphics
========

.. toctree::
   :maxdepth: 1

   font

Module summary
==============

================== ===========================================================
Module             Summary
================== ===========================================================
``std/gpio``       Per-port pin mode, read, write, and toggle.
``std/uart``       Blocking USART transmit/receive (USART0–5).
``std/spi``        Blocking master-mode SPI byte transfer.
``std/twi``        I²C / TWI master primitives.
``std/adc``        Analog-to-digital conversion reads.
``std/pwm``        Fast-PWM setup for Timer0 (8-bit) and Timer1 (16-bit).
``std/timer``      Timer0/Timer1 prescaler, compare, count, and CTC mode.
``std/eeprom``     Byte read/write of on-chip EEPROM.
``std/wdt``        Watchdog timer enable/disable/reset.
``std/sleep``      Sleep-mode entry and configuration.
``std/boot``       Flash self-programming (SPM) for bootloaders.
``std/bootloader`` Ready-made serial firmware bootloader over USART0.
``std/atomic``     Save/restore SREG around a critical section.
``std/ringbuf``    Caller-owned byte ring buffer.
``std/delay``      Blocking millisecond/microsecond delays.
``std/string``     String and character-class routines.
``std/conv``       Integer ↔ string (decimal and hexadecimal).
``std/mem``        Memory block routines.
``std/bits``       Rotation, population count, parity, and bit reversal.
``std/crc``        CRC-8 (Dallas/Maxim) and CRC-16 (IBM/ANSI).
``std/math``       Q8.8 fixed-point math: trig, logs, roots, and more.
``std/font``       5×8 font: render to a buffer, stream, or fold.
================== ===========================================================
