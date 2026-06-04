========================
``std/delay`` --- Delays
========================

.. code-block:: text

   import std/delay

Blocking busy-wait delays, built on the :func:`@burn` intrinsic. Nothing here
uses a timer, so the delays hold the CPU and their accuracy depends on knowing
the clock frequency.

Defining your clock
===================

The public delay functions scale themselves to the CPU clock by calling a
``@cpu_mhz()`` function that **you define once per project**. It is not built in,
because only you know your board's clock. AVR parts often ship on the internal
RC oscillator (commonly 1 or 8 MHz); a common external-crystal clock is 16 MHz:

.. code-block:: text

   @cpu_mhz() -> u16 { return 16 }     # or 8, or 1, to match your hardware

If you do not want this dependency, call the underscore-prefixed primitives and
pass the clock explicitly.

Public delays
=============

.. function:: @delay_ms($ms: u16)

   Delay for approximately ``$ms`` milliseconds, using the project clock from
   ``@cpu_mhz()``.

.. function:: @delay_us($us: u16)

   Delay for approximately ``$us`` microseconds, using the project clock from
   ``@cpu_mhz()``. Very short waits are dominated by call overhead.

Explicit-clock primitives
=========================

.. function:: @_delay_ms($ms: u16, $clock_mhz: u16)

   Delay for approximately ``$ms`` milliseconds at a CPU clock of ``$clock_mhz``
   MHz (e.g. 8 or 16). The public :func:`@delay_ms` wraps this.

.. function:: @_delay_us($us: u16, $clock_mhz: u16)

   Delay for approximately ``$us`` microseconds at a CPU clock of ``$clock_mhz``
   MHz.

   The product ``$us * $clock_mhz`` must fit in 16 bits — about 16,000 µs at
   16 MHz. For longer waits use :func:`@delay_ms`.

Example
=======

.. code-block:: text

   target atmega328p
   import std/gpio
   import std/delay

   @cpu_mhz() -> u16 { return 16 }    # tell the delay library our clock is 16 MHz

   @main {
       @pin_mode_b(5, 1)              # LED pin as output
       loop * {
           @digital_write_b(5, 1)     # LED on
           @delay_ms(500)             # wait half a second
           @digital_write_b(5, 0)     # LED off
           @delay_ms(500)             # wait again -> a 1 Hz blink
       }
   }

.. seealso::

   :func:`@burn` in :doc:`/reference/intrinsics` — the cycle-accurate primitive
   these delays are built on. Use it directly when you need an exact cycle count
   rather than a time in ms/µs.
