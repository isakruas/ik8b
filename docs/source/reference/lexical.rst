=================
Lexical structure
=================

An ik program is a sequence of tokens produced from UTF-8/ASCII source text.
This page defines those tokens: sigils, identifiers, literals, and comments.

Sigils
======

Every named entity carries a leading **sigil** that tells the lexer what kind of
name it is. The sigil is part of the token, so the same bare word can name a
variable, a function, and a register without ambiguity.

============ ============================ ==============================
Sigil        Names a                      Example
============ ============================ ==============================
``$``        variable / parameter         ``$counter``, ``$buf``
``@``        function (or call target)    ``@main``, ``@delay_ms``
``%``        hardware register alias      ``%PORTB``, ``%DDRB``
============ ============================ ==============================

A function call uses the function sigil directly: ``@name(args)``. An *indirect*
call through a function-pointer variable combines both sigils: ``@$var(args)``.
Taking the address of a function for a function pointer is written ``&@name``.

Identifiers
===========

After its sigil, an identifier begins with a letter or underscore and continues
with letters, digits, underscores, and — to support import paths — ``/`` and
``.``:

.. productionlist:: ik
   Identifier: (`Letter` | "_") { `Letter` | `Digit` | "_" | "/" | "." }

The ``/`` and ``.`` characters are what let an ``import`` name a nested path such
as ``std/gpio``.

Keywords
========

The following words are reserved and may not be used as identifiers:

.. hlist::
   :columns: 4

   * ``import``
   * ``target``
   * ``const``
   * ``isr``
   * ``mut``
   * ``imut``
   * ``ram``
   * ``eeprom``
   * ``flash``
   * ``ptr``
   * ``str``
   * ``fn``
   * ``loop``
   * ``switch``
   * ``return``
   * ``true``
   * ``false``
   * ``u8``
   * ``u16``
   * ``i8``
   * ``i16``
   * ``bool``
   * ``char``
   * ``r8``
   * ``r16``
   * ``void``

Numeric literals
================

Integers are decimal or hexadecimal:

.. productionlist:: ik
   Number: `DecimalNumber` | `HexNumber`
   DecimalNumber: ["-"] `Digit` { `Digit` }
   HexNumber: "0x" `HexDigit` { `HexDigit` }

Examples: ``42``, ``-7``, ``0xF0``, ``0x2A``.

A literal containing a decimal point is a **fixed-point** literal. It is
resolved at compile time into the scaled integer representation of an ``r8`` or
``r16`` value — there is no floating-point hardware or type involved:

.. productionlist:: ik
   FloatLiteral: ["-"] `Digit` { `Digit` } "." `Digit` { `Digit` }

Examples: ``3.14``, ``-0.5``, ``1.0``.

Boolean literals
================

``true`` and ``false`` are lexed directly as the numeric constants ``1`` and
``0``. To the parser they are ordinary ``Number`` tokens, which is why a
``bool`` is interchangeable with a small integer.

Character literals
==================

A character literal is a single quoted character and evaluates to its byte
value:

.. code-block:: text

   'A'      # 65
   '0'      # 48
   '\n'     # 10

Supported escapes inside a character literal are ``\n``, ``\r``, ``\t``, ``\0``,
``\\`` and ``\'``. Hex escapes (``\xHH``) and ``\"`` are **not** valid in a
character literal.

String literals
===============

A string literal is text in double quotes:

.. code-block:: text

   "hello"
   "line\n"
   "byte \x1B here"

String escapes are ``\n``, ``\r``, ``\t``, ``\0``, ``\\``, ``\"`` and the hex
escape ``\xHH`` (two hex digits). Strings are stored NUL-terminated; see
:doc:`memory` for how a string literal becomes a ``ram str`` or ``flash str``.

Comments
========

A comment runs from ``#`` to the end of the line:

.. code-block:: text

   0x20 -> %PORTB   # drive PB5 high

There is no block-comment form.

Whitespace
==========

Spaces, tabs, and newlines separate tokens but are otherwise insignificant —
ik is not indentation-sensitive. Blocks are delimited by ``{`` and ``}``.
