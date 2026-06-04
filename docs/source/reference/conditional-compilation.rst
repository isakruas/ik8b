===================================
Targets and conditional compilation
===================================

An ik program is compiled for one device at a time, chosen by a ``target``
declaration. The target drives the register map, memory sizes, and interrupt
vectors, and it can be tested at compile time to include device-specific code.

The ``target`` declaration
==========================

Every program must declare its device at top level:

.. code-block:: text

   target atmega328p

The identifier is one of the supported device names (see
:doc:`/toolchain/devices`, or run ``./ik8b list-devices``). The compiler refuses
to build a source file with no ``target``, because nothing about the hardware is
known without it.

There is exactly one effective target per compilation. An imported file does not
re-declare a different target; it inherits the target of the program being
compiled.

Compile-time conditionals
=========================

A ``? target == <device> { ... }`` block includes its contents only when the
selected target matches. At **top level** it gates declarations:

.. code-block:: text

   ? target == atmega328p {
       const %ADMUX:  u16 = 0x007C
       const %ADCSRA: u16 = 0x007A
   }

   ? target == atmega32a {
       const %ADMUX:  u16 = 0x0027
       const %ADCSRA: u16 = 0x0026
   }

This is exactly how the standard library's peripheral modules define the correct
register addresses for each device: a long series of per-device ``? target ==``
blocks, only one of which survives compilation. Everything in a non-matching
block is dropped entirely — it is not compiled, so it costs nothing and need not
even be valid for other devices.

A ``? target == <device>`` block may also appear **inside a function body**,
where it gates statements rather than top-level declarations:

.. code-block:: text

   @setup {
       ? target == atmega328p {
           0x07 -> %ADCSRA
       }
   }

Note the difference from the runtime conditional ``? expr { ... }`` in
:doc:`statements`: the compile-time form's condition is specifically
``target == <identifier>`` and is resolved by the compiler, emitting code for
the matching device only.

Writing portable modules
========================

Combining register aliases (``const %REG``) with ``? target ==`` blocks is the
idiom for portable, multi-device code:

.. code-block:: text

   ? target == atmega328p { const %PORTB: u16 = 0x0025 }
   ? target == atmega32a  { const %PORTB: u16 = 0x0038 }

   @led_on { 0x20 -> %PORTB }

The same source then compiles correctly for either device by changing only the
``target`` line. The standard library is built this way; its peripheral modules
support the full device table out of the box.
