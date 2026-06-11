=========
Functions
=========

A function groups a block of statements under a name. Functions are top-level
declarations — they cannot be nested inside another function.

Declaration
===========

A function is named with the ``@`` sigil and may declare a parameter list and a
return type:

.. code-block:: text

   @add($a: u16, $b: u16) -> u16 {
       return $a + $b
   }

* The **parameter list** is in parentheses; each parameter is ``$name: Type``.
  If there are no parameters, the parentheses are optional.
* The **return type** follows ``->``. If omitted, the function returns nothing
  (``void``).
* The **body** is a block.

A few valid shapes:

.. code-block:: text

   @noop { }                          # no params, no return
   @tick() { 1 ->+ $ticks }           # empty params, no return
   @cpu_mhz() -> u16 { return 16 }     # no params, returns u16
   @clamp($x: u8, $lo: u8, $hi: u8) -> u8 { ... }

Parameter types may be any type usable as a value: primitives, ``ptr <space>
<type>``, ``str ram``, or a function type ``fn(...)``. Note that as a parameter
type, strings must be ``str ram`` (see :doc:`types`).

The entry point: ``@main``
==========================

``@main`` is an ordinary function that the compiler treats specially as the
program entry point. It takes no parameters and returns nothing. The compiler
generates the reset vector, stack initialisation, and the jump into ``@main``.
Because a microcontroller program never exits, ``@main`` typically ends in an
infinite ``loop *``.

Calling
=======

Call a function with its sigil and parenthesised arguments:

.. code-block:: text

   ram imut $s: u16 = @add(2, 3)
   @uart_println()

Arguments are expressions, evaluated and passed in order. A call to a function
that returns a value is itself an expression; a call to a ``void`` function is a
statement.

Calling convention
==================

The compiler uses a register-based calling convention:

* **Arguments** occupy register slots descending from ``r24``: the first
  argument is in ``r24`` (``r24:r25`` for a 16-bit value), the second in
  ``r22(:r23)``, and so on down to ``r16`` (``r18`` on the reduced ``AVRrc``
  core, whose register file is ``r16``–``r31``).
* **Surplus arguments** that do not fit the register slots travel on the
  hardware stack: the caller pushes them in ascending byte order so they sit
  just above the return address, the callee reads them with post-increment
  loads through ``Z``, and the caller pops them after the call returns.
* The **return value** travels in ``r24`` (``r24:r25`` for 16-bit values).
* **Callee-saved registers** (values kept live across calls) are ``r2``–``r15``
  on classic cores and ``r26``–``r28`` on ``AVRrc``; everything else is
  call-clobbered.

You do not manage any of this by hand, but it is useful to know when reading a
VM register trace while debugging (the ``--trace`` instruction trace on the
bundled VM shows the register state).

Function pointers
=================

A function-pointer type is ``fn(paramtypes) -> ret`` (see :doc:`types`). Obtain
a function pointer with the address-of operator on a function name, and call
through it with the indirect-call syntax ``@$var(...)``:

.. code-block:: text

   @double($x: u8) -> u8 { return $x * 2 }
   @triple($x: u8) -> u8 { return $x * 3 }

   @apply($f: fn(u8) -> u8, $v: u8) -> u8 {
       return @$f($v)            # indirect call
   }

   @main {
       ram imut $r1: u8 = @apply(&@double, 21)   # 42
       ram imut $r2: u8 = @apply(&@triple, 14)   # 42

       ram imut $g: fn(u8) -> u8 = &@double
       ram imut $r3: u8 = @$g(21)                # 42, direct via variable
   }

Lowering, in brief: ``&@func`` produces the function's code address; an indirect
call ``@$var(...)`` loads that address and performs an indirect call to it. A
function pointer's type must match the target function's parameters and return
type exactly. This mechanism is what lets library routines such as
:func:`@font_stream <font_stream>` and :func:`@font_fold <font_fold>` take a
caller-supplied callback.

Recursion and reentrancy
========================

Functions may call other functions, including indirectly through pointers. Be
mindful that the AVR has a small SRAM stack; deep or unbounded recursion can
overflow it. Library functions in ``std`` are written iteratively for this
reason (for example the math routines avoid recursion to prevent static-local
collisions and stack growth on AVR).
