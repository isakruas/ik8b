=============================
``std/sleep`` --- Sleep modes
=============================

.. code-block:: text

   import std/sleep

Helpers to put the CPU into one of the AVR sleep modes to save power. Each entry
function configures the sleep-mode bits and executes the sleep instruction; the
CPU wakes on an enabled interrupt. The deeper the sleep mode, the more is powered
down and the lower the current — but the fewer the sources that can wake it.

.. function:: @sleep_idle()

   Enter **Idle** mode: the CPU stops but timers, USART, ADC, SPI, and other
   peripherals keep running. Any interrupt wakes it. The lightest sleep, with the
   fastest wake-up.

.. function:: @sleep_standby()

   Enter **Standby** mode: like power-down but the main oscillator keeps running,
   so wake-up is faster at the cost of higher current than power-down.

.. function:: @sleep_powerdown()

   Enter **Power-down** mode: nearly everything stops, giving the lowest current
   draw. Only asynchronous sources (such as an external interrupt or the
   watchdog) can wake the device.

.. function:: @sleep_disable()

   Clear the sleep-enable bit so a stray sleep instruction cannot take effect.
   Call after waking if you want to guard against accidental re-entry.

Example
=======

.. code-block:: text

   target atmega328p
   import std/sleep

   isr INT0 { }                       # empty handler: its only job is to wake the CPU

   @main {
       @sei()                         # interrupts must be on, or we never wake
       loop * {
           @sleep_powerdown()         # lowest power; sleep here until INT0 fires
           @sleep_disable()           # clear sleep-enable so we don't re-sleep by accident
           @handle_event()            # handle whatever the interrupt signalled
       }
   }