==================
Your first program
==================

The embedded "hello world" is a blinking LED. We will build it twice: once by
writing to hardware registers directly, and once using the standard library, so
you can see both levels the language operates at.

Blink, the raw way
==================

.. code-block:: text

   target atmega328p

   const %DDRB:  u16 = 0x0024
   const %PORTB: u16 = 0x0025

   @main {
       0x20 -> %DDRB          # PB5 as output (a common on-board LED pin)

       loop * {
           0x20 -> %PORTB     # drive PB5 high  -> LED on
           @burn(800000)      # waste ~800k CPU cycles
           0x00 -> %PORTB     # drive PB5 low   -> LED off
           @burn(800000)
       }
   }

Line by line:

``target atmega328p``
   Selects the device. This single line fixes the register layout, the SRAM and
   Flash sizes, and the interrupt vector table for the whole compilation.

``const %DDRB: u16 = 0x0024``
   Declares a **register alias**. ``%DDRB`` now names the I/O address ``0x0024``,
   the Data Direction Register for port B. ``%PORTB`` at ``0x0025`` is the
   output latch. The names with a ``%`` sigil are how ik talks to memory-mapped
   peripherals.

``@main { ... }``
   ``@main`` is the program entry point. The compiler emits the reset vector,
   stack setup, and the jump into ``@main`` for you.

``0x20 -> %DDRB``
   Assignment reads **left to right**: the value ``0x20`` flows into ``%DDRB``.
   Bit 5 set means "PB5 is an output". This is the single most important piece
   of ik syntax — the arrow ``->`` always points at the destination.

``loop * { ... }``
   ``loop *`` is the infinite loop. Embedded programs never return from
   ``@main``; they spin forever.

``@burn(800000)``
   A compiler **intrinsic** that emits a precise busy-wait of the given number
   of CPU cycles. It is the primitive the delay library is built on.

Compile and flash::

   ./ik8b blink.ik -o blink.hex
   avrdude -p m328p -c arduino -P /dev/ttyACM0 -U flash:w:blink.hex:i

Blink, with the standard library
================================

Hard-coding register addresses and cycle counts is fine for one pin, but the
standard library gives you portable, readable helpers. The delay library needs
to know your clock speed, which you supply by defining a ``@cpu_mhz`` function —
this is a project-wide convention, not a built-in:

.. code-block:: text

   target atmega328p

   import std/gpio
   import std/delay

   # The delay library calls @cpu_mhz() to scale its busy-waits. Define it once
   # per project to match your actual clock (e.g. 16 MHz from an external
   # crystal, or 1/8 MHz on the internal RC oscillator).
   @cpu_mhz() -> u16 { return 16 }

   @main {
       @pin_mode_b(5, 1)          # PB5 as output (mode 1 = output)

       loop * {
           @digital_write_b(5, 1) # LED on
           @delay_ms(500)
           @digital_write_b(5, 0) # LED off
           @delay_ms(500)
       }
   }

This version is shorter and more readable, yet compiles to the same kind of
tight AVR code as the raw version. The :doc:`stdlib` page covers ``import`` and
the library in more depth.

What just happened
==================

* The ``target`` line told the compiler everything device-specific.
* ``@main`` was the entry point; the compiler generated the vector table and
  startup code around it.
* You reached hardware either directly through ``%`` register aliases or
  through library functions that wrap those same registers.
* There was no heap, no ``malloc``, and no runtime — every line maps to a fixed,
  predictable instruction sequence.

The next page tours the language features you will use to write something more
interesting than a blink.
