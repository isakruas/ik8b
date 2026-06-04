==========================
Using the standard library
==========================

The standard library lives in ``std/`` and is written in ik itself. Each
module is a separate file you pull in with ``import``.

Importing
=========

Import a module by path, without the ``.ik`` extension:

.. code-block:: text

   import std/gpio
   import std/delay
   import std/uart

You can also import your own files the same way (the blink example imports a
local ``examples/demo_delay``). Import resolution searches, in order:

#. the current working directory (``<path>.ik``);
#. the ``IK8B_STD_PATH`` directory, if that environment variable is set;
#. paths relative to the compiler executable, including the bundled ``std/``
   fallback for ``std/*`` imports.

So ``import std/gpio`` works from anywhere as long as you run the shipped
``./ik8b`` binary.

A UART "hello world"
====================

.. code-block:: text

   target atmega328p

   import std/uart

   @main {
       # 16 MHz, 9600 baud -> UBRR = 103. (UBRR = F_CPU / (16*baud) - 1.)
       @uart_init(103)

       loop * {
           @uart_print_char('H')
           @uart_print_char('i')
           @uart_println()        # sends CR + LF
       }
   }

Conventions across the library
==============================

A few rules hold throughout the standard library and are worth internalising:

* **No allocation.** Nothing in the library uses a heap. When a function needs
  scratch space, *you* provide the buffer and pass a pointer. For example
  :func:`@itoa <itoa>` takes a ``ptr ram u8`` destination you must size yourself.
* **Strings are caller-owned.** The string functions operate on ``str ram``
  (NUL-terminated SRAM strings) and ``ptr ram u8`` buffers. There are no
  ``str flash`` variants in those signatures.
* **Peripherals depend on the target.** Modules like ``std/gpio``, ``std/uart``,
  ``std/spi``, and ``std/adc`` resolve their register addresses from the
  ``target`` you selected, using compile-time ``? target == ...`` blocks. A
  function only makes sense on a device that actually has that peripheral.
* **The clock is a project constant.** Time-based modules (``std/delay``) call a
  ``@cpu_mhz()`` function that *you* define once per project. See below.

Defining your clock for ``std/delay``
=====================================

The delay library cannot know your board's clock, so it asks for it through a
function you provide:

.. code-block:: text

   import std/delay

   @cpu_mhz() -> u16 { return 16 }   # define once; match your real clock

   @main {
       loop * {
           @delay_ms(250)
       }
   }

If you call the underscore-prefixed primitives directly
(:func:`@_delay_ms <_delay_ms>`), you pass the clock explicitly and do not need
``@cpu_mhz``.

Callbacks and streaming
=======================

Some modules take a function pointer so they can stream data without buffering.
The font renderer is the canonical example — it walks text and hands each column
byte to *your* callback:

.. code-block:: text

   import std/font
   import std/spi

   @to_display($b: u8) { @spi_transfer($b) }

   @main {
       @spi_init_master_raw()
       @font_stream("Hello", &@to_display)   # O(1) SRAM, any length text
   }

The full per-module documentation, with every function signature and its
behaviour, is in the :doc:`/library/index`.
