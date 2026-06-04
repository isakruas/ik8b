==============================
``std/conv`` --- Number/string
==============================

.. code-block:: text

   import std/conv

Conversions between integers and their textual representations, in decimal and
hexadecimal. The "to string" routines write into a ``ptr ram u8`` buffer you
provide and size; the "parse" routines read a NUL-terminated ``str ram``.

Parsing (string → integer)
==========================

.. function:: @atoi($s: str ram) -> i16

   Parse a decimal string into a signed 16-bit integer. A leading ``-`` is
   honoured.

.. function:: @atou($s: str ram) -> u16

   Parse a decimal string into an unsigned 16-bit integer.

.. function:: @atou_hex($s: str ram) -> u16

   Parse a hexadecimal string into an unsigned 16-bit integer. An optional
   leading ``0x`` or ``0X`` prefix is accepted.

Formatting (integer → string)
=============================

.. function:: @itoa($val: i16, $buf: ptr ram u8)

   Format signed integer ``$val`` as a NUL-terminated decimal string in ``$buf``.
   Size ``$buf`` for the longest result (sign, up to 5 digits, NUL — at least 7
   bytes).

.. function:: @utoa($val: u16, $buf: ptr ram u8)

   Format unsigned integer ``$val`` as a NUL-terminated decimal string in
   ``$buf`` (up to 5 digits plus NUL — at least 6 bytes).

.. function:: @utoa_hex($val: u16, $buf: ptr ram u8)

   Format unsigned integer ``$val`` as a NUL-terminated hexadecimal string in
   ``$buf`` (up to 4 hex digits plus NUL — at least 5 bytes).

Example
=======

.. code-block:: text

   import std/conv
   import std/uart

   @main {
       @uart_init(103)                 # serial up, in case you want to print

       ram mut $buf: u8[8] = 0         # output buffer you own (room for digits + NUL)
       @utoa(1234, &$buf[0])           # format the number -> $buf now holds "1234"

       ram imut $n: u16 = @atou("4321")  # parse text back to a number -> 4321
       loop * { }
   }
