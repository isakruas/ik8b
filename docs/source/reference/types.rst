===========
Type system
===========

ik is strongly and statically typed. Every variable, parameter, and function
return has a type fixed at compile time, and the compiler checks that values
flow between compatible types. There is no implicit heap, no boxing, and no
runtime type information — a type is purely a compile-time description of the
bytes a value occupies.

Primitive types
===============

============ ======= ============================================================
Type         Size    Description
============ ======= ============================================================
``u8``       1 byte  Unsigned 8-bit integer, 0..255.
``u16``      2 bytes Unsigned 16-bit integer, 0..65535.
``i8``       1 byte  Signed 8-bit integer, -128..127 (two's complement).
``i16``      2 bytes Signed 16-bit integer, -32768..32767.
``bool``     1 byte  Boolean. ``true`` is 1, ``false`` is 0.
``char``     1 byte  A character / byte value.
``r8``       1 byte  Q4.4 fixed-point real number.
``r16``      2 bytes Q8.8 fixed-point real number.
``void``     —       No value. Only valid as a function return type.
============ ======= ============================================================

The integer width and signedness directly determine the AVR instructions the
compiler emits, so choosing ``u8`` over ``u16`` where a byte suffices produces
smaller, faster code.

.. note::

   The naming is deliberate: ``u``/``i`` for unsigned/signed integers and ``r``
   for the real (fixed-point) types, each followed by its bit width. ``bool``
   and ``char`` are byte-sized and interchangeable with ``u8`` in most contexts.

Fixed-point reals (``r8``, ``r16``)
===================================

ik has no floating-point unit and no ``float`` type. Fractional values are
represented in **fixed-point**:

* ``r8`` is **Q4.4** — 4 integer bits and 4 fractional bits in one byte.
* ``r16`` is **Q8.8** — 8 integer bits and 8 fractional bits in two bytes. The
  stored integer is the real value multiplied by 256.

A source literal with a decimal point (``3.14``) is converted to this scaled
representation at compile time. Arithmetic on fixed-point values is ordinary
integer arithmetic, except that multiplication and division must rescale; the
:doc:`/library/math` library provides correctly scaled ``r16`` operations and
the full set of math functions.

Because the format is fixed-point, range and precision are limited. Q8.8
``r16`` represents roughly -128.0 .. +127.996 in steps of ``1/256``. There is no
NaN or infinity; the math library's ``@isnan``/``@isinf`` predicates exist for
API completeness and reflect this (a fixed-point value is always finite).

Arrays
======

An array type is a primitive type followed by a compile-time length in brackets:

.. code-block:: text

   ram mut $buf:   u8[16] = 0
   ram imut $luts: u16[4] = 0

The length is a constant ``Number``; arrays are not dynamically sized. A single
initialiser value fills every element. Indexing with ``$buf[i]`` is valid in any
expression position, including as an assignment target, and the index may be a
runtime expression. See :doc:`statements` for declaration syntax and
:doc:`expressions` for indexing.

Pointer types
=============

A pointer type names both that it is a pointer and the memory space it points
into:

.. code-block:: text

   ptr ram   u8     # pointer to a u8 in SRAM
   ptr flash u8     # pointer to a u8 in program memory
   ptr eeprom u8    # pointer to a u8 in EEPROM

The pointed-to space (``ram``, ``eeprom``, ``flash``) is part of the type, which
is how the compiler knows whether a dereference must use a normal load, an LPM
from flash, or an EEPROM access sequence. The pointer variable itself always
lives in SRAM. Pointer declaration syntax is covered in :doc:`memory`.

String types
============

A string is a NUL-terminated byte sequence. As a *type specifier* — for a
parameter or return — only ``str ram`` is accepted:

.. code-block:: text

   @strlen($s: str ram) -> u16 { ... }

The ``flash str`` form exists only as a variable *declaration* (a string literal
placed in program memory), not as a parameter type. See :doc:`memory`.

Function types
==============

A function-pointer type is written with the ``fn`` keyword, a parenthesised
parameter-type list, and an optional return type:

.. code-block:: text

   fn(u8)                 # takes a u8, returns nothing
   fn(u8) -> u8           # takes a u8, returns a u8
   fn(u8, u8) -> u8       # takes two u8s, returns a u8
   fn()                   # takes nothing, returns nothing

A function type can be the declared type of a ``mut``/``imut`` variable, and you
populate it with ``&@name``. Calls go through ``@$var(...)``. See
:doc:`functions`.

Type compatibility
==================

ik does not silently mix unrelated types. The general rules are:

* Integer types of the same width and signedness are compatible.
* ``bool`` and ``char`` are byte-sized and interchangeable with ``u8`` in
  arithmetic and comparison contexts.
* Mixing signed and unsigned, or different widths, follows the operator rules in
  :doc:`expressions`; be explicit about widths to avoid surprises in wrapping
  behaviour.
* Pointers are only compatible when their pointee type **and** memory space
  match.
* A function pointer is compatible with a function whose parameter and return
  types match the ``fn(...)`` type exactly.

.. note::

   Not every type token that appears in the grammar is fully implemented in the
   current compiler. The toolchain includes a guardrail that rejects programs
   using a type whose code paths are not yet implemented, with a clear error,
   rather than miscompiling. If the compiler refuses a type, believe it.
