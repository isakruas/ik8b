==============================
``std/wdt`` --- Watchdog timer
==============================

.. code-block:: text

   import std/wdt

The watchdog timer resets the microcontroller if the program fails to "kick" it
within a configured timeout — a standard safety net against lockups. Enable it,
then call :func:`@wdt_reset` regularly in your main loop; if a hang stops the
resets, the watchdog fires and restarts the device.

Timeout (prescaler) values
==========================

:func:`@wdt_enable` takes the watchdog **prescaler** value, which selects the
timeout. That is why the example passes ``6`` rather than ``1000``: ``6`` selects
the ~1 second timeout. The values map roughly as follows on classic AVR (the
exact times scale with the watchdog oscillator and vary slightly by device):

===== ==================
Value Approx. timeout
===== ==================
0     16 ms
1     32 ms
2     64 ms
3     0.125 s
4     0.25 s
5     0.5 s
6     1 s
7     2 s
8     4 s
9     8 s
===== ==================

Values 8 and 9 (4 s / 8 s) require the wider prescaler field present on most
modern AVR parts. Pick a timeout comfortably longer than your worst-case loop
iteration so normal operation never trips it.

.. function:: @wdt_enable($prescaler: u8)

   Enable the watchdog with a timeout selected by ``$prescaler`` — see the table
   above for the value-to-timeout mapping.

.. function:: @wdt_reset()

   Reset (kick) the watchdog timer, restarting its countdown. Call this often
   enough that it is reached before the timeout elapses. Implemented around the
   AVR ``WDR`` instruction.

.. function:: @wdt_disable()

   Disable the watchdog timer.

Example
=======

.. code-block:: text

   target atmega328p
   import std/wdt

   @main {
       @wdt_enable(6)                 # arm the watchdog, ~1 s timeout (device-dependent)
       loop * {
           @do_work()                 # your real work; must finish within the timeout
           @wdt_reset()               # "kick" the watchdog to prove we are alive
       }
   }