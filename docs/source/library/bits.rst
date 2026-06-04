=================================
``std/bits`` --- Bit manipulation
=================================

.. code-block:: text

   import std/bits

Bit-level utilities: rotations, population count, parity, and bit reversal, in
8- and 16-bit widths. These complement the language's built-in bitwise
operators (``&``, ``|``, ``^``, ``~``) with operations that have no single
operator.

Rotation
========

.. function:: @rotl8($val: u8, $n: u8) -> u8

   Rotate the 8-bit value ``$val`` left by ``$n`` bit positions (bits shifted out
   of the top re-enter at the bottom).

.. function:: @rotr8($val: u8, $n: u8) -> u8

   Rotate the 8-bit value ``$val`` right by ``$n`` bit positions.

.. function:: @rotl16($val: u16, $n: u8) -> u16

   Rotate the 16-bit value ``$val`` left by ``$n`` bit positions.

.. function:: @rotr16($val: u16, $n: u8) -> u16

   Rotate the 16-bit value ``$val`` right by ``$n`` bit positions.

Counting and parity
===================

.. function:: @popcount8($val: u8) -> u8

   Return the number of set bits (1s) in the 8-bit value ``$val``.

.. function:: @popcount16($val: u16) -> u8

   Return the number of set bits in the 16-bit value ``$val``.

.. function:: @parity8($val: u8) -> u8

   Return the parity of ``$val``: ``1`` if it has an odd number of set bits,
   ``0`` if even.

Reversal
========

.. function:: @reverse8($val: u8) -> u8

   Return ``$val`` with its 8 bits in reverse order (bit 0 ↔ bit 7, etc.).

.. function:: @reverse16($val: u16) -> u16

   Return ``$val`` with its 16 bits in reverse order.

Example
=======

.. code-block:: text

   import std/bits

   @main {
       ram imut $r: u8 = @rotl8(0x81, 1)    # rotate left by 1: 1000_0001 -> 0000_0011 = 0x03
       ram imut $c: u8 = @popcount8(0xF0)   # count the set bits in 1111_0000 = 4
       ram imut $v: u8 = @reverse8(0x01)    # reverse the bit order: 0x01 -> 0x80
       loop * { }
   }