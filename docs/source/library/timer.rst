========================
``std/timer`` --- Timers
========================

.. code-block:: text

   import std/timer

Direct control of the two general-purpose timer/counters. **Timer0** is 8-bit
(counts and compare values are ``u8``); **Timer1** is 16-bit (``u16``). The
module covers prescaler selection, compare values, reading and writing the
count, Clear-Timer-on-Compare (CTC) mode, and enabling the compare-A interrupt.

Pair these with an :doc:`/reference/interrupts` ``isr`` handler (for example
``TIMER0_COMPA``) to run code at a fixed rate.

.. _timer-prescaler-values:

Prescaler values
================

``set_prescaler`` takes the timer's **clock-select** value, which both starts
the timer and divides the CPU clock. That is why the examples pass ``3`` (= /64)
rather than a frequency. The mapping is the same for Timer0 and Timer1:

===== ==================================
Value Clock source
===== ==================================
0     stopped (timer off)
1     clk / 1 (no prescaling)
2     clk / 8
3     clk / 64
4     clk / 256
5     clk / 1024
6     external pin, falling edge
7     external pin, rising edge
===== ==================================

The interrupt rate in CTC mode is then
``F_CPU / prescaler / (compare_a + 1)``. For example ``16 MHz / 64 / (249 + 1)``
= 1000 Hz, the configuration used below.

Timer0 (8-bit)
==============

.. function:: @timer0_set_prescaler($prescaler: u8)

   Select Timer0's clock source/prescaler using the timer's clock-select bit
   pattern (e.g. the value choosing /1, /8, /64, /256, /1024).

.. function:: @timer0_set_compare_a($val: u8)

   Set the Output Compare A value. In CTC mode the timer resets when the count
   reaches this value.

.. function:: @timer0_set_compare_b($val: u8)

   Set the Output Compare B value.

.. function:: @timer0_read() -> u8

   Return the current counter value.

.. function:: @timer0_write($val: u8)

   Set the counter to ``$val``.

.. function:: @timer0_ctc_mode()

   Put Timer0 into Clear-Timer-on-Compare (CTC) mode, so it counts up to compare
   A and resets, giving a periodic tick.

.. function:: @timer0_enable_compa_int()

   Unmask the Timer0 compare-match-A interrupt. The handler still requires the
   global interrupt enable (:func:`@sei`) and an ``isr TIMER0_COMPA`` (name is
   device-dependent).

Timer1 (16-bit)
===============

.. function:: @timer1_set_prescaler($prescaler: u8)

   Select Timer1's clock source/prescaler.

.. function:: @timer1_set_compare_a($val: u16)

   Set the 16-bit Output Compare A value.

.. function:: @timer1_set_compare_b($val: u16)

   Set the 16-bit Output Compare B value.

.. function:: @timer1_read() -> u16

   Return the current 16-bit counter value.

.. function:: @timer1_write($val: u16)

   Set the 16-bit counter to ``$val``.

.. function:: @timer1_ctc_mode()

   Put Timer1 into CTC mode (counts up to compare A and resets).

.. function:: @timer1_enable_compa_int()

   Unmask the Timer1 compare-match-A interrupt.

Example
=======

A 1 kHz tick on an ATmega328P at 16 MHz (16 MHz / 64 / 250 = 1000 Hz):

.. code-block:: text

   target atmega328p
   import std/timer

   ram mut $ticks: u16 = 0            # shared between the ISR and main

   isr TIMER0_COMPA {                 # runs on every compare-match
       1 ->+ $ticks                   # count one tick
   }

   @main {
       @timer0_ctc_mode()             # count up to compare-A, then reset to 0
       @timer0_set_compare_a(249)     # reset after 250 counts (0..249)
       @timer0_set_prescaler(3)       # /64 -> 16 MHz / 64 / 250 = 1000 Hz
       @timer0_enable_compa_int()     # unmask this timer's compare-A interrupt
       @sei()                         # globally enable interrupts
       loop * { }                     # the ISR does the work; main just spins
   }