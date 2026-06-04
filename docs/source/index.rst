==========================================
ik Language and Standard Library Reference
==========================================

**ik** is a small, strongly typed systems language for 8-bit Atmel/Microchip
**AVR** microcontrollers. Its compiler is **ik8b**, a self-contained toolchain
written in Rust that translates an ``.ik`` source file directly into an **Intel
HEX** image of AVR instruction words, ready to flash; it depends on no external
assembler, linker, or C runtime.

Throughout this manual, *ik* refers to the language and *ik8b* refers to the
compiler that builds it.

The language is designed for bare-metal embedded work. It has no heap, no
hidden allocations, and no runtime: every construct maps to a predictable
sequence of AVR instructions. Memory spaces (SRAM, EEPROM, Flash) are part of
the type system, peripherals are reached through register aliases, and
interrupt service routines are first-class top-level declarations.

This manual is organised into four parts: a hands-on **tutorial**, a precise
**language reference**, a per-module **standard library reference**, and a
**toolchain** section covering the compiler CLI and the supported device table.

.. rubric:: A first taste

.. code-block:: text

   target atmega328p              # pick the device: sets registers, memory, vectors

   const %DDRB:  u16 = 0x0024     # name the Data Direction Register for port B
   const %PORTB: u16 = 0x0025     # name the output latch for port B

   @main {                        # program entry point
       0x20 -> %DDRB              # bit 5 = 1 -> PB5 is an output (value flows into DDRB)
       loop * {                   # spin forever
           0x20 -> %PORTB         # drive PB5 high -> LED on
           @burn(800000)          # busy-wait ~800k CPU cycles (the delay)
           0x00 -> %PORTB         # drive PB5 low  -> LED off
           @burn(800000)          # busy-wait again
       }
   }

Compile and flash it::

   ./ik8b blink.ik -o blink.hex
   avrdude -p m328p -c arduino -P /dev/ttyACM0 -U flash:w:blink.hex:i

.. rubric:: How to read the sigils

ik uses a leading **sigil** on every name so the lexer always knows what a
token refers to. You will see these everywhere:

.. rst-class:: sigil-legend

* ``$name`` — a variable (``$counter``, ``$buf``)
* ``@name`` — a function (``@main``, ``@delay_ms``)
* ``%name`` — a hardware register alias (``%PORTB``, ``%DDRB``)

Assignment flows **left to right** with the arrow operator: ``value -> target``.

.. toctree::
   :maxdepth: 2
   :caption: Contents

   tutorial/index
   reference/index
   library/index
   toolchain/index

.. toctree::
   :maxdepth: 1
   :caption: Appendix

   reference/grammar
   glossary

Indices and tables
==================

* :ref:`genindex`
* :ref:`search`
