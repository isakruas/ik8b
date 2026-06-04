=============================
``std/mem`` --- Memory blocks
=============================

.. code-block:: text

   import std/mem

Routines that operate on raw byte blocks in SRAM, plus a helper to copy from
program memory. Lengths are byte counts; pointers are caller-owned.

.. function:: @memcpy($dest: ptr ram u8, $src: ptr ram u8, $len: u16)

   Copy ``$len`` bytes from ``$src`` to ``$dest`` in SRAM. The regions must not
   overlap; use :func:`@memmove` if they might.

.. function:: @memmove($dest: ptr ram u8, $src: ptr ram u8, $len: u16)

   Copy ``$len`` bytes from ``$src`` to ``$dest``, correctly handling the case
   where the two regions overlap.

.. function:: @memcpy_P($dest: ptr ram u8, $src: ptr flash u8, $len: u16)

   Copy ``$len`` bytes from **program (Flash) memory** ``$src`` into SRAM
   ``$dest``. This is how you bring ``flash``-resident data (such as a
   ``flash str``) into SRAM where the rest of the library can use it.

.. function:: @memset($dest: ptr ram u8, $val: u8, $len: u16)

   Fill the first ``$len`` bytes at ``$dest`` with the constant byte ``$val``.

.. function:: @memcmp($s1: ptr ram u8, $s2: ptr ram u8, $len: u16) -> i16

   Compare the first ``$len`` bytes of ``$s1`` and ``$s2``. Return ``0`` if they
   are identical, otherwise the signed difference of the first differing pair of
   bytes.

.. function:: @memchr($s: ptr ram u8, $c: u8, $n: u16) -> ptr ram u8

   Return a pointer to the first occurrence of byte ``$c`` within the first
   ``$n`` bytes of ``$s``, or ``0`` if not found.

.. function:: @memrchr($s: ptr ram u8, $c: u8, $n: u16) -> ptr ram u8

   Return a pointer to the **last** occurrence of byte ``$c`` within the first
   ``$n`` bytes of ``$s``, or ``0``.

.. function:: @memccpy($dest: ptr ram u8, $src: ptr ram u8, $c: u8, $len: u16) -> ptr ram u8

   Copy bytes from ``$src`` to ``$dest``, stopping after the first byte equal to
   ``$c`` is copied. Return a pointer to the byte in ``$dest`` just past the
   copied ``$c``, or ``0`` if ``$c`` did not appear within ``$len`` bytes.

Example
=======

.. code-block:: text

   import std/mem

   @main {
       ram mut $a: u8[8] = 0          # two 8-byte blocks
       ram mut $b: u8[8] = 0

       @memset(&$a[0], 0xFF, 8)       # fill block a with 0xFF
       @memcpy(&$b[0], &$a[0], 8)     # copy a -> b (regions must not overlap)
       ram imut $same: i16 = @memcmp(&$a[0], &$b[0], 8)  # 0 -> the blocks are identical
       loop * { }
   }