====================================
``std/atomic`` --- Critical sections
====================================

.. code-block:: text

   import std/atomic

A critical section guards a sequence of operations from being interrupted. This
matters whenever the main program and an interrupt service routine share a
multi-byte variable: an interrupt could fire between the two byte accesses of a
16-bit read, yielding a torn value. The pattern here disables interrupts, does
the shared access, then restores the **previous** interrupt state — so it nests
correctly and never enables interrupts that were not already on.

.. function:: @atomic_start() -> u8

   Begin a critical section. Saves the current status register (SREG, which holds
   the global interrupt-enable bit), disables interrupts, and returns the saved
   SREG value. Pass that value to :func:`@atomic_end`.

.. function:: @atomic_end($sreg_val: u8)

   End a critical section by restoring the SREG value returned from
   :func:`@atomic_start`. Interrupts are re-enabled only if they were enabled
   before the matching :func:`@atomic_start`.

Example
=======

Safely snapshot a 16-bit counter shared with an ISR:

.. code-block:: text

   import std/atomic

   ram mut $ticks: u16 = 0          # written by an ISR elsewhere

   @read_ticks() -> u16 {
       ram imut $saved: u8 = @atomic_start()  # disable interrupts, remember old state
       ram imut $snap: u16 = $ticks           # read both bytes with no ISR in between
       @atomic_end($saved)                    # restore interrupts to how they were
       return $snap                           # hand back the consistent snapshot
   }

Keep critical sections as short as possible: every cycle spent with interrupts
disabled adds latency to every other interrupt in the system.
