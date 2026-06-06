============
Memory model
============

The AVR is a Harvard-architecture machine with three distinct address spaces.
ik makes those spaces explicit in the language: a value's **storage space** is
declared up front and is part of how the compiler accesses it. There is no heap
and no automatic memory management; all storage is statically placed.

The three storage spaces
========================

============ ============================================================
Keyword      Space
============ ============================================================
``ram``      SRAM — fast, volatile read/write data and the stack.
``eeprom``   On-chip EEPROM — small, byte-addressable, non-volatile.
``flash``    Program memory — large, non-volatile, read-only at run time.
============ ============================================================

Choosing the space is a real decision: SRAM is scarce (often a few hundred to a
few thousand bytes — see :doc:`/toolchain/devices`), EEPROM survives power loss
but is slow to write and wears out, and Flash is plentiful but read-only while
the program runs. The compiler emits the correct access sequence for each space
(a plain load/store for SRAM, the EEPROM access protocol, or an ``LPM`` from
Flash), and it tracks the space in pointer types so a flash pointer is never
dereferenced as if it were SRAM.

Scalar declarations
===================

A scalar (or array) variable is declared as::

   <space> <mut|imut> $name : <type> [ "[" <len> "]" ] = <init>

.. code-block:: text

   ram    mut  $counter: u8       = 0
   ram    imut $limit:   u16      = 1000
   eeprom mut  $boot_count: u16   = 0
   flash  imut $sine_lut: u8[256] = 0
   ram    mut  $buffer:  u8[64]   = 0

* The **space** comes first and is mandatory.
* **Mutability** is ``mut`` (read/write) or ``imut`` (write-once / immutable).
* The **type** is a primitive type or a function type (``fn(...)``); pointer and
  string variables use their own declaration forms below.
* An optional ``[len]`` makes it an array; the single initialiser fills all
  elements.
* The initialiser is mandatory.

Pointer declarations
====================

A pointer declaration leads with the space the pointer **points into**, the
``ptr`` keyword, the pointee type, the name, and an initialiser:

.. code-block:: text

   ram mut $value: u8 = 7
   ram ptr u8 $p = &$value          # points into SRAM

   flash imut $tbl: u8[4] = 0
   flash ptr u8 $fp = &$tbl[0]      # points into program memory

The pointer variable always lives in SRAM; the leading space describes its
*target*. Read and write through it with the ``*`` dereference operator:

.. code-block:: text

   *$p -> $value          # store through the pointer
   ram imut $x: u8 = *$p  # load through the pointer

Pointer arithmetic works in element units and is commonly used to walk buffers:

.. code-block:: text

   *($p + 1) -> $next     # the byte after *$p

String declarations
===================

A string declaration uses the ``str`` keyword and a space of either ``ram`` or
``flash``:

.. code-block:: text

   ram   str $greeting = "hello"     # mutable copy in SRAM
   flash str $banner   = "ik\n"    # stored in program memory

* ``ram str`` places a writable, NUL-terminated copy in SRAM. This is the form
  the string library consumes (its parameters are typed ``str ram``).
* ``flash str`` stores the bytes in program memory. Use
  :func:`@memcpy_P <memcpy_P>` to copy a flash string into an SRAM buffer when a
  function needs ``str ram``.

The library functions that work on strings are documented in
:doc:`/library/string`, :doc:`/library/conv`, and :doc:`/library/mem`.

Register aliases
================

Memory-mapped peripheral registers are reached through **register aliases**,
declared at top level with ``const`` and the ``%`` sigil:

.. code-block:: text

   const %PORTB: u16 = 0x0025
   const %DDRB:  u16 = 0x0024

The value is the register's I/O data-space address for the current ``target``.
Once declared, a ``%`` alias is read and written like any other location:

.. code-block:: text

   0x20 -> %PORTB                 # write
   ram imut $pins: u8 = %PORTB    # read

Most programs do not declare these by hand; the peripheral modules in the
standard library declare the aliases they need inside ``? target == ...`` blocks
so the right address is used for every supported device.

Value constants
===============

``const`` **without** the ``%`` sigil declares a plain compile-time *value*
constant — a bit mask, a command word, a feature flag — rather than a memory
address:

.. code-block:: text

   const TWINT_BIT: u8  = 0x80
   const SPI_ENABLE: u8 = 0x51

A reference to such a name folds directly to its immediate value, so it
generates no load:

.. code-block:: text

   ? ($status & TWINT_BIT) != 0 { ... }   # ANDI with 0x80, not a memory read

The distinction is exactly the sigil: ``%NAME`` is *the register at that
address* (read/written at run time), while ``NAME`` is *the constant value*
itself. Use ``%`` for peripheral registers and bare ``const`` for masks and
command/configuration words. The standard-library peripheral modules follow
this split (e.g. ``%TWI0_CTRL_REG`` is a register, ``TWI0_INT_MASK`` is a value).

No heap, no hidden copies
=========================

There is no dynamic allocation in ik. Every byte of data has a statically
known home: a global, a function-local in SRAM, EEPROM, or Flash. Library
functions never allocate on your behalf — when one needs a buffer, you pass a
pointer to storage you declared. This keeps memory use exact and analysable,
which is what the ``--report`` build option measures (see
:doc:`/toolchain/cli`).
