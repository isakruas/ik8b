==========================
``std/string`` --- Strings
==========================

.. code-block:: text

   import std/string

Operations on NUL-terminated SRAM strings, plus the usual character
classification predicates. Inputs typed ``str ram`` are NUL-terminated strings
in SRAM; outputs and in-place targets are ``ptr ram u8`` buffers you must size
and own (there is no allocation).

Length and copying
==================

.. function:: @strlen($s: str ram) -> u16

   Return the number of bytes in ``$s`` before its NUL terminator.

.. function:: @strcpy($dest: ptr ram u8, $src: str ram)

   Copy ``$src``, including its NUL terminator, into ``$dest``. ``$dest`` must be
   large enough.

.. function:: @strncpy($dest: ptr ram u8, $src: str ram, $n: u16)

   Copy up to ``$n`` characters from ``$src`` into ``$dest``. If ``$src`` is
   shorter than ``$n``, the remainder of ``$dest`` is padded with NUL bytes.

.. function:: @strcat($dest: ptr ram u8, $src: str ram)

   Append ``$src`` to the end of the existing string in ``$dest``.

.. function:: @strncat($dest: ptr ram u8, $src: str ram, $n: u16)

   Append up to ``$n`` characters of ``$src`` to ``$dest`` and NUL-terminate the
   result.

Comparison
==========

.. function:: @strcmp($s1: str ram, $s2: str ram) -> i16

   Compare two strings lexicographically. Return ``0`` if equal, otherwise the
   signed difference of the first pair of differing bytes.

.. function:: @strncmp($s1: str ram, $s2: str ram, $n: u16) -> i16

   As :func:`@strcmp`, but compare at most ``$n`` characters.

Searching
=========

.. function:: @strchr($s: str ram, $c: u8) -> ptr ram u8

   Return a pointer to the first occurrence of byte ``$c`` in ``$s``, or ``0`` if
   it does not occur.

.. function:: @strrchr($s: str ram, $c: u8) -> ptr ram u8

   Return a pointer to the **last** occurrence of byte ``$c`` in ``$s``, or
   ``0``.

.. function:: @strstr($haystack: str ram, $needle: str ram) -> ptr ram u8

   Return a pointer to the first occurrence of the substring ``$needle`` in
   ``$haystack``, or ``0`` if it is not found.

.. function:: @strpbrk($s: str ram, $accept: str ram) -> ptr ram u8

   Return a pointer to the first character in ``$s`` that is any of the
   characters in ``$accept``, or ``0``.

.. function:: @strspn($s: str ram, $accept: str ram) -> u16

   Return the length of the initial run of ``$s`` made up entirely of characters
   from ``$accept``.

.. function:: @strcspn($s: str ram, $reject: str ram) -> u16

   Return the length of the initial run of ``$s`` made up entirely of characters
   **not** in ``$reject``.

Case conversion
===============

.. function:: @tolower($c: u8) -> u8

   Return the lowercase form of ``$c`` if it is an uppercase letter, otherwise
   ``$c`` unchanged.

.. function:: @toupper($c: u8) -> u8

   Return the uppercase form of ``$c`` if it is a lowercase letter, otherwise
   ``$c`` unchanged.

Character classification
========================

Each predicate returns a ``bool``.

.. function:: @isspace($c: u8) -> bool

   True for whitespace: space, ``\t``, ``\r``, ``\n``, ``\v``, ``\f``.

.. function:: @isdigit($c: u8) -> bool

   True for a decimal digit ``'0'``–``'9'``.

.. function:: @isalpha($c: u8) -> bool

   True for an alphabetic letter.

.. function:: @isalnum($c: u8) -> bool

   True for a letter or a digit.

.. function:: @isxdigit($c: u8) -> bool

   True for a hexadecimal digit (``0``–``9``, ``A``–``F``, ``a``–``f``).

.. function:: @islower($c: u8) -> bool

   True for a lowercase letter.

.. function:: @isupper($c: u8) -> bool

   True for an uppercase letter.

Example
=======

.. code-block:: text

   import std/string

   @main {
       ram str $name = "ik"             # a NUL-terminated string in SRAM
       ram mut $copy: u8[8] = 0         # destination buffer you own (8 bytes)

       @strcpy(&$copy[0], $name)        # copy $name (incl. NUL) into $copy
       ram imut $n: u16 = @strlen($name)         # length, not counting NUL -> 4
       ram imut $eq: i16 = @strcmp($name, "ik")  # 0 means the strings are equal
       loop * { }                       # embedded programs never return
   }
