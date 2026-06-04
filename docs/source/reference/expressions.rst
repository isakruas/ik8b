===========
Expressions
===========

An expression computes a value. ik expressions use conventional operator
precedence; all binary levels are left-associative and may be chained.

Primary expressions
===================

A primary expression is the smallest unit:

* a numeric literal (``42``, ``0xF0``), a fixed-point literal (``3.14``), a
  boolean (``true``/``false``), or a character literal (``'A'``);
* a string literal (``"text"``);
* a variable, register, or array element (``$x``, ``%PORTB``, ``$buf[i]``);
* a function call (``@name(args)`` or indirect ``@$ptr(args)``);
* a parenthesised expression (``( ... )``).

Operator precedence
===================

From **lowest** to **highest** binding. Operators in the same row share a
precedence level and associate left to right.

==== ====================================== ==========================
Prec Operators                              Description
==== ====================================== ==========================
1    ``||``                                 logical OR (short-circuit)
2    ``&&``                                 logical AND (short-circuit)
3    ``|``                                  bitwise OR
4    ``^``                                  bitwise XOR
5    ``&``                                  bitwise AND
6    ``==`` ``!=``                          equality
7    ``<`` ``>`` ``<=`` ``>=``              relational
8    ``+`` ``-``                            additive
9    ``*`` ``/`` ``%``                      multiplicative
10   ``!`` ``~`` ``-`` ``&`` ``*`` (unary)  unary prefix (right-assoc.)
==== ====================================== ==========================

Use parentheses to make intent explicit; the unary minus in
``(-$val) -> $res`` is parenthesised in the standard examples for exactly this
reason.

Arithmetic operators
====================

``+``, ``-``, ``*``, ``/``, ``%`` perform integer arithmetic at the operands'
width. Division and modulo are integer operations. On fixed-point ``r16``
values, prefer the :doc:`/library/math` routines, which rescale correctly.

Integer arithmetic **wraps** at the type width (modular arithmetic). For
example, ``-$val`` on a ``u8`` holding 5 yields ``0xFB`` (251), the two's
complement byte; on a ``u16`` it yields ``0xFFFB`` (65531).

Bitwise operators
=================

``&``, ``|``, ``^`` are bitwise AND, OR, XOR. ``~`` is unary bitwise NOT
(one's complement): ``~5`` on a ``u8`` is ``0xFA`` (250).

Comparison operators
====================

``==``, ``!=``, ``<``, ``<=``, ``>``, ``>=`` compare two values and yield a
boolean (1 or 0). They are the conditions you put after ``?`` and inside loop
bounds.

Logical operators
=================

``&&`` and ``||`` are short-circuiting logical AND and OR over boolean (nonzero
= true) operands. ``!`` is logical NOT: ``!0`` is 1, ``!$x`` is 1 when ``$x`` is
zero and 0 otherwise.

Address-of and dereference
==========================

In **operand** (unary, prefix) position:

* ``&expr`` takes the address of a location, producing a pointer. ``&$value``
  is a pointer to ``$value``; ``&@func`` is a function pointer to ``@func``.
* ``*expr`` dereferences a pointer, reading or writing the pointed-to value.
  ``*$p`` reads, and ``*$p -> $x`` reads through ``$p``, while ``$v -> *$p``
  writes through it.

These are syntactically distinct from the infix ``&`` (bitwise AND) and ``*``
(multiply): the parser decides based on position. ``&`` and ``*`` between two
operands are the binary operators; at the front of an operand they are
address-of and dereference.

Array indexing
==============

``base[index]`` selects an element. The index is any expression, so dynamic
indexing is allowed, and an indexed element is a valid assignment target:

.. code-block:: text

   $buf[0]       # read element 0
   $buf[$i]      # read element $i (runtime index)
   10 -> $buf[2] # write element 2

Function calls
==============

A direct call names the function with its ``@`` sigil:

.. code-block:: text

   @delay_ms(500)
   ram imut $n: u16 = @square(7)

An **indirect** call goes through a function-pointer variable, combining the
sigils as ``@$var``:

.. code-block:: text

   ram imut $f: fn(u8) -> u8 = &@double
   ram imut $r: u8 = @$f(21)

Argument expressions are evaluated and passed in order. See :doc:`functions` for
the calling convention and :doc:`intrinsics` for the compiler-provided ``@``
operations that look like calls but emit single instructions.
