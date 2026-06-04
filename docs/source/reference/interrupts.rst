==========
Interrupts
==========

An interrupt service routine (ISR) is a top-level handler bound to a hardware
interrupt **vector**. ik makes ISRs a first-class declaration so you never
write a vector table or a context save/restore by hand.

The ``isr`` declaration
=======================

.. code-block:: text

   isr <VECTOR_NAME> {
       # handler body
   }

For example, a Timer0 compare-match handler on an ATmega328P:

.. code-block:: text

   isr TIMER0_COMPA {
       1 ->+ $ticks
   }

An ISR:

* takes **no parameters** and returns **no value**;
* is bound by **vector name**, validated against the selected ``target``;
* causes the compiler to emit the jump from the correct vector-table slot, a
  full register/context save on entry, the matching restore on exit, and the
  ``reti`` (return-from-interrupt) instruction.

Vector names
============

The set of valid vector names is **device-specific**. The compiler knows the
ordered vector table for every supported device and checks your ``isr`` name
against it. Common examples:

============== =========================================================
Vector         Meaning (device-dependent)
============== =========================================================
``INT0``       External interrupt 0
``INT1``       External interrupt 1
``TIMER0_COMPA`` Timer/Counter0 compare match A (e.g. ATmega328P)
``TIMER0_COMP``  Timer/Counter0 compare match (e.g. ATmega32A)
``TIMER1_COMPA`` Timer/Counter1 compare match A
``USART_RX``     USART receive complete
``ADC``          ADC conversion complete
============== =========================================================

Because the exact names and their ordering differ between parts, the complete,
authoritative list of bindable vector names for **every** supported device is in
:doc:`interrupt-vectors`. Look up your ``target`` there to see exactly which
``isr`` names you may use. The compiler also validates the name for you and
rejects an unknown one; ``make test-interrupts`` checks vector binding for every
supported device, and ``make test-vm-interrupts`` checks runtime delivery on
representative cores.

Enabling an interrupt
=====================

Two independent gates must be open before a handler runs:

#. **The peripheral's interrupt-mask bit** must be set, so the source is
   allowed to request an interrupt. The peripheral libraries expose helpers for
   this — for example :func:`@timer0_enable_compa_int <timer0_enable_compa_int>`.
#. **The global interrupt flag** (the I bit in SREG) must be set. Do this with
   the :func:`@sei` intrinsic. Clear it with :func:`@cli`.

.. code-block:: text

   @timer0_enable_compa_int()   # unmask the specific source
   @sei()                       # globally enable interrupts

Sharing data and atomicity
==========================

An ISR communicates with the main program through ordinary variables, usually a
file-scope ``ram mut``. Because an interrupt can fire between any two
instructions, a multi-byte object shared between the main code and an ISR can be
read or written halfway through. Guard such accesses with a critical section
from :doc:`/library/atomic`:

.. code-block:: text

   import std/atomic

   ram imut $saved: u8 = @atomic_start()   # cli + return old SREG
   ram imut $snap: u16 = $ticks             # consistent 16-bit read
   @atomic_end($saved)                      # restore SREG (re-enables if it was on)

:func:`@atomic_start <atomic_start>` disables interrupts and returns the previous
SREG; :func:`@atomic_end <atomic_end>` restores it, so interrupts resume only if
they were enabled before. Keep ISRs and critical sections short — every cycle
spent with interrupts disabled adds latency to every other interrupt.

Related intrinsics
==================

* :func:`@sei` — set the global interrupt enable bit.
* :func:`@cli` — clear the global interrupt enable bit.

These, and the other compiler intrinsics, are documented in :doc:`intrinsics`.
