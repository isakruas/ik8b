===================
Handling interrupts
===================

Interrupts are first-class in ik. You declare a handler with the ``isr``
keyword followed by the **vector name** for your device, and the compiler wires
it into the interrupt vector table — including the full register save/restore
and the ``reti`` at the end.

An interrupt service routine
============================

.. code-block:: text

   target atmega328p

   import std/timer

   const %PORTB: u16 = 0x0025
   const %DDRB:  u16 = 0x0024

   ram mut $ticks: u16 = 0

   # Fires every time Timer0 reaches its compare-A value.
   isr TIMER0_COMPA {
       1 ->+ $ticks
       0x20 ->^ %PORTB        # toggle PB5
   }

   @main {
       0x20 -> %DDRB
       @timer0_ctc_mode()
       @timer0_set_compare_a(249)
       @timer0_set_prescaler(3)      # /64 prescaler
       @timer0_enable_compa_int()    # unmask the Timer0 compare-A interrupt
       @sei()                        # globally enable interrupts

       loop * { }                    # the ISR does all the work
   }

The pieces
==========

``isr TIMER0_COMPA { ... }``
   Binds a handler to the named vector. The name must be one that exists for the
   selected ``target`` — ``TIMER0_COMPA`` on an ATmega328P, ``TIMER0_COMP`` on
   an ATmega32A, ``INT0`` for the external interrupt, and so on. The compiler
   validates the name against the device's vector table and emits a jump from
   the right table slot. An ISR takes no parameters and returns no value. The
   full list of valid names for your device is in
   :doc:`/reference/interrupt-vectors`.

Per-peripheral enable, then global enable
   Two gates must open before an interrupt fires. First unmask the specific
   source (here ``@timer0_enable_compa_int()`` sets the timer's interrupt-mask
   bit). Then enable interrupts globally with the :func:`@sei` intrinsic. Use
   :func:`@cli` to disable them globally again.

Sharing data with the main loop
===============================

An ISR and ``@main`` communicate through ordinary variables — typically a
file-scope ``ram mut`` variable, as ``$ticks`` above. Because an interrupt can
fire between any two instructions, reads and writes of multi-byte variables that
the main code shares with an ISR should be made **atomic**. The ``std/atomic``
module gives you a critical section that saves and restores the global interrupt
flag:

.. code-block:: text

   import std/atomic

   @main {
       # ... set up the ISR as above ...
       loop * {
           ram imut $saved: u8 = @atomic_start()   # disable interrupts, save SREG
           ram imut $snapshot: u16 = $ticks         # safe 16-bit read
           @atomic_end($saved)                      # restore SREG (re-enables if it was on)

           @use($snapshot)
       }
   }

See :doc:`/reference/interrupts` for the full rules, the relationship between
``isr`` and the vector table, and the list of relevant intrinsics. The complete
vector-name set is device-specific; the toolchain validates it for you and the
test suite (``make test-interrupts``) exercises every device.
