===================
Compiler intrinsics
===================

A handful of ``@``-prefixed names are **intrinsics**: they are recognised by the
compiler's code generator and emit specific AVR instructions inline, rather than
being ordinary function calls. They use call syntax but have no function body and
no call overhead.

These are the only built-in functions. Everything else that looks like
``@name(...)`` is either one of your own functions or a standard-library routine
(which is itself written in ik).

.. function:: @nop()

   Emits a single ``NOP`` (no-operation) instruction — one wasted CPU cycle.
   Takes no arguments and returns nothing. Useful for precise one-cycle padding
   and as a placeholder where the hardware needs a settling cycle.

.. function:: @sei()

   Emits ``SEI`` — set the global interrupt enable bit (the I bit in SREG).
   After this, unmasked interrupt sources can fire. Takes no arguments, returns
   nothing. See :doc:`interrupts`.

.. function:: @cli()

   Emits ``CLI`` — clear the global interrupt enable bit, disabling all
   interrupts globally. Takes no arguments, returns nothing. The ``std/atomic``
   module builds critical sections on this.

.. function:: @wdr()

   Emits ``WDR`` — reset the watchdog timer ("kick the dog"). Takes no
   arguments, returns nothing. This is what :func:`@wdt_reset <wdt_reset>` in
   ``std/wdt`` is built on.

.. function:: @sleep()

   Emits ``SLEEP`` — enter the sleep mode previously selected/enabled in the
   device's sleep-control register. Takes no arguments, returns nothing. The
   ``std/sleep`` module configures the mode and then calls this.

.. function:: @break()

   Emits ``BREAK`` — the on-chip debug breakpoint instruction. Takes no
   arguments, returns nothing. It acts as a ``NOP`` when no debugger is attached.

.. function:: @burn($cycles)

   Emits a calibrated busy-wait that consumes ``$cycles`` CPU cycles. Returns
   nothing.

   * When ``$cycles`` is a **compile-time constant**, the compiler emits an
     unrolled/looped delay sized exactly for that count (a zero count emits
     nothing).
   * When ``$cycles`` is a **runtime value** (a ``u8`` or ``u16``), the compiler
     emits a counted loop that decrements the value to zero, preserving the
     registers it borrows.

   ``@burn`` is the primitive the :doc:`/library/delay` library is built on;
   prefer :func:`@delay_ms <delay_ms>` / :func:`@delay_us <delay_us>` for
   time-based waits, and use ``@burn`` directly only when you want an exact cycle
   count.

.. function:: @swap($reg)

   Emits ``SWAP`` on a literal register number, exchanging the high and low
   nibbles of that register. The argument must be a **literal register index**
   in the range 0–31. Returns nothing. This is a low-level escape hatch for
   hand-tuned register manipulation.

.. function:: @movw($rd, $rr)

   Emits a 16-bit register-pair move (``MOVW`` where available, or an equivalent
   pair of moves), copying the register pair ``$rr`` into ``$rd``. Both
   arguments must be **literal register indices** (0–31). Returns nothing.

.. function:: @mul($rd, $rr)

   Emits the hardware ``MUL`` instruction multiplying the two literal registers
   ``$rd`` and ``$rr`` (result in the R1:R0 pair, per the AVR convention). Both
   arguments must be **literal register indices** (0–31). Returns nothing.

   This intrinsic **requires a hardware multiplier**. On core families without
   one (such as the reduced-core ``AVRrc`` parts), the compiler rejects ``@mul``
   with an error rather than emitting an unsupported instruction.

.. function:: @goto($word_addr)

   Emits an unconditional ``JMP`` to the absolute Flash **word** address
   ``$word_addr`` (a literal). The address is never adjusted by a ``boot``
   origin, so it is the way a bootloader hands control to the application —
   typically ``@goto(0)``. Returns nothing.

.. function:: @spm($spmcsr, $cmd, $zaddr, $word)

   Runs the timed **Store-Program-Memory** sequence used for flash
   self-programming: it waits for any previous SPM to finish, writes ``$cmd``
   to the SPM control/status register at data address ``$spmcsr``, then issues
   ``SPM`` with ``Z = $zaddr`` (a byte address) and ``R1:R0 = $word``. The exact
   command (page erase / fill buffer / page write / RWW re-enable) is the
   caller's; ``$zaddr`` and ``$word`` must be 16-bit values.

   ``$spmcsr`` is the SPMCSR **address**, which differs per device. Rather than
   pass a literal, accept the per-device :doc:`std/boot </library/boot>`
   register constant — ``@spm`` resolves a ``%`` register constant to its
   address — or just use the ``@boot_*`` wrappers, which do this for you.
   Requires a core with SPM (not ``AVRrc``); interrupts should be disabled
   around the call. Returns nothing.

Notes
=====

* The register-level intrinsics (:func:`@swap`, :func:`@movw`, :func:`@mul`)
  take **literal** register numbers, not variables — the value must be a
  constant the compiler can resolve to a register index 0–31. Passing a
  non-literal, or an out-of-range index, is a compile error.
* None of the intrinsics that "do" something return a value; using one in a
  value position is an error.
* Because intrinsics expand inline, they are safe to use inside ISRs and tight
  loops where a real call's overhead would matter.
