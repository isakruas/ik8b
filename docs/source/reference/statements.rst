==========
Statements
==========

Statements appear inside a block (``{ ... }``) and run top to bottom. The
statement forms are: variable declarations, assignments, loops, conditionals,
switches, returns, and bare expressions.

Variable declarations
=====================

The three declaration forms — scalar/array, pointer, and string — are described
in full in :doc:`memory`. In summary:

.. code-block:: text

   ram mut $i: u8 = 0                 # scalar
   ram mut $buf: u8[8] = 0            # array
   ram ptr u8 $p = &$buf[0]          # pointer
   ram str $s = "hi"                 # string

A declaration always names a storage space, gives the variable an explicit type,
and supplies an initialiser.

Assignment
==========

Assignment is an arrow pointing at the destination. The plain form stores the
left value into the right location:

.. code-block:: text

   42 -> $counter
   $a -> $b
   10 -> $buf[$i]
   $v -> *$p

The compound forms read-modify-write the destination with one operator:

============ ========================= ===============================
Operator     Effect on ``dst``         Equivalent
============ ========================= ===============================
``->``       store                     ``dst = value``
``->+``      add                       ``dst = dst + value``
``->-``      subtract                  ``dst = dst - value``
``->&``      bitwise AND               ``dst = dst & value``
``->|``      bitwise OR                ``dst = dst | value``
``->^``      bitwise XOR               ``dst = dst ^ value``
============ ========================= ===============================

The destination of a compound assignment is evaluated as both source and target,
so ``5 ->+ $buf[$i]`` adds 5 to that array element in place.

Conditionals
============

A conditional is introduced by ``?`` followed by an expression and a block. An
optional ``:`` introduces the else block:

.. code-block:: text

   ? $x > 100 {
       0 -> $x
   }

   ? $ready {
       @go()
   } : {
       @wait()
   }

There is no ``elif``; chain by nesting another ``?`` inside the ``:`` block, or
use ``switch`` for value dispatch. The condition is any expression; nonzero is
true.

Switch
======

``switch`` dispatches on a single value. Each case is an expression, an arrow,
and a block. ``*`` is the wildcard default:

.. code-block:: text

   switch $cmd {
       1 -> {
           @start()
       }
       2 -> {
           @stop()
       }
       * -> {
           @ignore()
       }
   }

The selector may itself be an expression (``switch $val + 5 { ... }``). The
default branch, if present, comes last.

Loops
=====

There are two loop forms.

**Infinite loop** — ``loop *`` runs its body forever. This is how an embedded
``@main`` spins:

.. code-block:: text

   loop * {
       @poll()
   }

**Range loop** — iterates an induction variable over a half-open range
``start..end``, binding the variable after a ``->`` arrow:

.. code-block:: text

   loop 0..8 -> $i {
       @shift_out($i)        # $i = 0,1,2,...,7
   }

The bounds are expressions evaluated to give the range; the loop visits ``start``
up to but not including ``end``. The induction variable is scoped to the loop
body.

Return
======

``return`` exits the current function. In a function with a return type, it
carries a value; in a ``void`` function it stands alone:

.. code-block:: text

   @square($x: u16) -> u16 {
       return $x * $x
   }

   @maybe($x: u8) {
       ? $x == 0 {
           return            # early exit, no value
       }
       @do_work($x)
   }

Expression statements
=====================

A bare expression — most often a function call made for its side effects — is a
statement on its own:

.. code-block:: text

   @uart_println()
   @digital_write_b(5, 1)

Compile-time blocks inside a body
=================================

Inside a block you may also place a compile-time ``? target == <device>`` block,
which conditionally compiles its statements for a particular device. This is the
statement-level counterpart of the top-level conditional and is documented in
:doc:`conditional-compilation`.
