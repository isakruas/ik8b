========
Glossary
========

.. glossary::

   sigil
      A leading symbol that classifies a name: ``$`` for a variable, ``@`` for a
      function, ``%`` for a hardware register alias. The sigil is part of the
      token, so the lexer never has to guess what a bare word means.

   storage space
      The memory region a value lives in: ``ram`` (SRAM), ``eeprom``, or
      ``flash`` (program memory). It is declared explicitly and is part of a
      pointer's type. See :doc:`reference/memory`.

   target
      The microcontroller a program is compiled for, fixed by the top-level
      ``target`` declaration. It determines the register map, memory sizes, and
      interrupt vector table. See :doc:`reference/conditional-compilation`.

   register alias
      A ``const %NAME: u16 = <addr>`` declaration binding a ``%`` name to a
      peripheral register's I/O address for the current target.

   intrinsic
      A built-in ``@`` operation recognised by the code generator that emits
      specific AVR instructions inline instead of being a real function call —
      for example :func:`@nop`, :func:`@sei`, :func:`@burn`. See
      :doc:`reference/intrinsics`.

   ISR
      Interrupt Service Routine: a handler bound to a hardware interrupt vector
      with the ``isr`` keyword. See :doc:`reference/interrupts`.

   fixed-point
      The representation used for fractional values in place of floating point.
      ``r8`` is Q4.4 and ``r16`` is Q8.8 — an integer scaled by a power of two.
      See :doc:`reference/types`.

   Q8.8
      A fixed-point format with 8 integer bits and 8 fractional bits, stored as a
      16-bit integer equal to the real value times 256. The type ``r16`` and the
      :doc:`library/math` library use it.

   intrinsic register argument
      A literal register index (0–31) passed to a register-level intrinsic such
      as :func:`@swap`, :func:`@movw`, or :func:`@mul`. It must be a compile-time
      constant, not a variable.

   Intel HEX
      The textual object format the compiler emits, describing AVR instruction
      words for flashing. The toolchain produces nothing else — no ELF, no
      linker step.

   function pointer
      A value of type ``fn(...) -> ...`` holding the address of a function,
      created with ``&@name`` and called with ``@$var(...)``. See
      :doc:`reference/functions`.
