============
A tour of ik
============

This page walks the core of the language by example. Each snippet is valid ik
that you could drop inside an ``@main`` body. For the precise rules behind every
construct, follow the links into the :doc:`/reference/index`.

Variables and storage spaces
============================

Every variable declaration starts with a **storage space**, a **mutability**,
the ``$`` name, a type, and an initialiser:

.. code-block:: text

   ram  mut  $counter: u8  = 0      # mutable, lives in SRAM
   ram  imut $limit:   u8  = 100    # immutable (write-once)
   eeprom mut $boots:  u16 = 0      # persists across power cycles
   flash imut $table:  u8[4] = 0    # read-only, stored in program memory

* ``ram`` is SRAM, ``eeprom`` is the on-chip EEPROM, ``flash`` is program
  memory. The space is part of the variable's identity, not a hint.
* ``mut`` is read/write; ``imut`` is write-once. There is no separate ``const``
  for locals — ``imut`` is the immutable form. (``const`` is reserved for
  top-level register aliases; see below.)

See :doc:`/reference/memory` for the full memory model.

Assignment goes left to right
=============================

The defining syntactic choice of ik: assignment is an **arrow that points at
the destination**.

.. code-block:: text

   42 -> $counter        # store 42 into $counter
   $counter -> $other    # copy $counter into $other

There are compound forms that read-modify-write the destination:

.. code-block:: text

   5  ->+ $counter       # $counter = $counter + 5
   1  ->- $counter       # $counter = $counter - 1
   0xF0 ->& $flags       # $flags &= 0xF0
   0x01 ->| $flags       # $flags |= 0x01
   0x80 ->^ $flags       # $flags ^= 0x80

Types
=====

The primitive types are sized integers, a boolean, a character, and two
fixed-point types:

============ ====================================================
Type         Meaning
============ ====================================================
``u8``       unsigned 8-bit
``u16``      unsigned 16-bit
``i8``       signed 8-bit
``i16``      signed 16-bit
``bool``     boolean (``true`` = 1, ``false`` = 0)
``char``     character / byte
``r8``       Q4.4 fixed-point (8-bit)
``r16``      Q8.8 fixed-point (16-bit)
``void``     no value (function return only)
============ ====================================================

There are no floating-point types; fractional literals such as ``3.14`` are
resolved at compile time into the fixed-point ``r8``/``r16`` representation. The
math library operates entirely in ``r16`` (Q8.8). See :doc:`/reference/types`.

Operators
=========

ik has the usual set of operators with conventional precedence:

.. code-block:: text

   $a + $b        $a - $b      $a * $b     $a / $b    $a % $b
   $a & $b        $a | $b      $a ^ $b                 # bitwise
   $a && $b       $a || $b                             # logical, short-circuit
   $a == $b       $a != $b
   $a < $b        $a <= $b     $a > $b     $a >= $b
   !$a            ~$a          -$a                      # unary not / bitnot / negate
   &$a            *$p                                   # address-of / dereference

Literals can be decimal (``42``), hexadecimal (``0x2A``), boolean (``true`` /
``false``), or character (``'A'``, ``'\n'``). See
:doc:`/reference/expressions`.

Conditionals
============

The condition keyword is ``?``. There is no ``if``/``else`` keyword — ``?``
takes a block, and an optional ``:`` introduces the else block:

.. code-block:: text

   ? $counter > 100 {
       0 -> $counter
   } : {
       1 ->+ $counter
   }

For multi-way dispatch on a single value, use ``switch`` with ``->`` arrows and
a ``*`` wildcard default:

.. code-block:: text

   switch $cmd {
       1 -> { @start() }
       2 -> { @stop()  }
       * -> { @ignore() }       # default
   }

Loops
=====

Two loop forms cover the embedded cases:

.. code-block:: text

   loop * {                 # infinite loop
       @poll()
   }

   loop 0..8 -> $i {        # counted loop, $i takes 0,1,...,7
       @shift_out($i)
   }

The range loop binds its induction variable after the ``->`` arrow, consistent
with the rest of the language. The range is half-open: ``0..8`` visits 0 through
7. See :doc:`/reference/statements`.

Functions
=========

Functions are declared with the ``@`` sigil. Parameters and the return type are
optional:

.. code-block:: text

   @square($x: u16) -> u16 {
       return $x * $x
   }

   @greet {                 # no parameters, no return -> parentheses optional
       @uart_println()
   }

   @main {
       ram imut $n: u16 = @square(7)   # call with @name(args)
   }

``@main`` is just a function the compiler treats as the entry point. See
:doc:`/reference/functions`.

Arrays
======

Arrays carry a compile-time length in brackets and are indexed in the usual way.
The single initialiser fills every element:

.. code-block:: text

   ram mut $buf: u8[5] = 0      # five zeroed bytes
   10 -> $buf[0]
   20 -> $buf[1]
   ram imut $first: u8 = $buf[0]

   ram imut $i: u8 = 1
   $buf[$i] -> $first           # dynamic indexing is allowed

Pointers and strings
====================

Pointers name the space they point into. Dereference with ``*`` and take an
address with ``&``:

.. code-block:: text

   ram mut $value: u8 = 7
   ram ptr u8 $p = &$value      # pointer into SRAM
   *$p -> $value                # write through the pointer
   ram imut $got: u8 = *$p      # read through the pointer

Strings are NUL-terminated byte arrays. ``ram str`` lives in SRAM, ``flash str``
is stored in program memory:

.. code-block:: text

   ram str $msg = "hello"
   ram imut $len: u16 = @strlen($msg)

See :doc:`/reference/memory` for pointer/string declaration rules.

Function pointers
=================

A function-pointer type is written ``fn(args) -> ret``. Take the address of a
function with ``&@name`` and call indirectly with ``@$var(...)``:

.. code-block:: text

   @double($x: u8) -> u8 { return $x * 2 }

   @main {
       ram imut $f: fn(u8) -> u8 = &@double
       ram imut $r: u8 = @$f(21)     # indirect call -> 42
   }

This is how callback-driven library functions like ``@font_stream`` work. See
:doc:`/reference/functions`.

Talking to hardware
===================

Register aliases are declared at top level with ``const`` and a ``%`` name, then
assigned to like any other location:

.. code-block:: text

   const %PORTB: u16 = 0x0025

   @main {
       0x20 -> %PORTB           # write the port
       ram imut $pins: u8 = %PORTB   # read it back
   }

The right-hand-side value is the I/O address for the current ``target``. Most of
the time you let the standard library declare these for you.

Where to go next
================

* :doc:`stdlib` — using ``import`` and the standard library.
* :doc:`interrupts` — handling hardware interrupts.
* :doc:`/reference/index` — the precise rules for everything above.
