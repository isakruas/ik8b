================================
``std/pwm`` --- Pulse-width mod.
================================

.. code-block:: text

   import std/pwm

Fast-PWM setup helpers for the two common timers. **Timer0** is 8-bit, so its
duty values are ``u8`` (0–255). **Timer1** is 16-bit, so its duty values are
``u16``. Each timer drives two independent output-compare channels, ``A`` and
``B``.

The typical sequence is: init the timer in fast-PWM mode with a prescaler, set a
duty cycle for a channel, then enable that channel's physical output pin.

The ``$prescaler`` argument is the timer's clock-select value (so the examples
pass ``3`` for a /64 prescaler, not a frequency). It uses the same mapping as the
timer module — see :ref:`timer-prescaler-values`. The PWM frequency is then
``F_CPU / prescaler / 256`` for the 8-bit Timer0 (and ``/ 65536`` for the 16-bit
Timer1 in its full-resolution modes). The duty cycle is independent of the
prescaler: ``0`` is always-low and the maximum count is always-high.

Timer0 (8-bit)
==============

.. function:: @pwm0_init_fast($prescaler: u8)

   Configure Timer0 for fast-PWM with the given clock ``$prescaler`` select
   value (the bit pattern for the timer's clock-source bits).

.. function:: @pwm0_set_duty_a($duty: u8)

   Set the duty cycle of channel A (0 = always low, 255 = always high).

.. function:: @pwm0_set_duty_b($duty: u8)

   Set the duty cycle of channel B.

.. function:: @pwm0_enable_output_a()

   Connect channel A to its output pin so the PWM waveform is driven on the pin.

.. function:: @pwm0_enable_output_b()

   Connect channel B to its output pin.

.. function:: @pwm0_stop()

   Stop Timer0 (disable its clock source), halting PWM output.

Timer1 (16-bit)
===============

.. function:: @pwm1_init_fast($prescaler: u8)

   Configure Timer1 for fast-PWM with the given clock ``$prescaler`` select
   value.

.. function:: @pwm1_set_duty_a($duty: u16)

   Set the 16-bit duty cycle of channel A.

.. function:: @pwm1_set_duty_b($duty: u16)

   Set the 16-bit duty cycle of channel B.

.. function:: @pwm1_enable_output_a()

   Connect channel A to its output pin.

.. function:: @pwm1_enable_output_b()

   Connect channel B to its output pin.

.. function:: @pwm1_stop()

   Stop Timer1, halting PWM output.

Example
=======

Fade is driven by changing the duty; here a fixed 25% on Timer0 channel A:

.. code-block:: text

   target atmega328p
   import std/pwm
   import std/gpio

   @main {
       @pin_mode_d(6, 1)              # OC0A is on PD6 -> drive it as an output
       @pwm0_init_fast(3)             # Timer0 fast-PWM, /64 prescaler
       @pwm0_set_duty_a(64)           # duty = 64/255 ~= 25 % on channel A
       @pwm0_enable_output_a()        # connect channel A to the PD6 pin

       loop * { }                     # the timer keeps generating the waveform
   }