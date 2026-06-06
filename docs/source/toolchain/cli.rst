====================
The ``ik8b`` command
====================

The compiler is a single executable that turns one ``.ik`` source file into an
Intel HEX image of AVR instruction words, and also embeds the cycle-accurate
simulator. It is organised as **subcommands**.

Synopsis
========

.. code-block:: text

   ./ik8b build <file.ik> [-o <out.hex>] [--emit <hex|ir>] [--report]
   ./ik8b run   <file.ik> [-o <out.hex>] [--report] [<sim options>]
   ./ik8b sim   <file.hex> --mcu <device> [<sim options>]
   ./ik8b devices
   ./ik8b info
   ./ik8b version
   ./ik8b license
   ./ik8b help

A bare ``./ik8b <file.ik> ...`` (no subcommand) is accepted as a shorthand for
``build``, for convenience and backward compatibility.

Compiling — ``build``
=====================

Give the compiler a source file. The device is taken from the file's mandatory
``target`` declaration, not from a command-line flag::

   ./ik8b build blink.ik -o blink.hex

``-o <out.hex>``
   Path of the Intel HEX output. Defaults to ``out.hex`` if omitted.

``--emit <hex|ir>``
   What to produce: ``hex`` (the default) writes the Intel HEX image to ``-o``;
   ``ir`` prints the SSA intermediate representation to standard output and
   writes no HEX (useful for development and snapshot tests).

``--report``
   Print a build summary covering Program (Flash), SRAM, EEPROM, and register
   usage. The report also enforces the device's memory budgets: if the program
   exceeds the available Flash, SRAM, or EEPROM for the selected ``target``, the
   build **fails**. The report prints a machine-readable ``SRAM_BYTES=<n>`` line
   before the normal human-readable summary, which the test harness consumes.

Use ``--report`` in CI and whenever you want to know how close you are to a
device's limits.

Simulating — ``run`` and ``sim``
================================

The compiler embeds the same AVR virtual machine the test suite uses, so it can
run a program without any external tool:

* ``run <file.ik>`` compiles the source (taking the device from its ``target``)
  and then simulates the result.
* ``sim <file.hex>`` simulates an already-assembled Intel HEX image — produced by
  any toolchain (ik8b, ``avr-gcc``, hand-written assembly) — for the device
  given by ``--mcu``.

Both share one set of **simulation options**:

``--mcu <device>``
   Device to simulate (``sim`` only; ``run`` takes it from the source target).
   The device's real core class drives instruction decoding and per-core timing.

``--trace``
   Print a per-instruction execution trace (``PC=...`` lines).

``--dump``
   Dump the registers, PC, SP, and SREG at exit.

``--limit <N>``
   Stop after ``N`` instructions (default: a large bound).

``--irq <V>`` / ``--irq-at <V:STEP>`` / ``--irq-every <V:N>``
   Inject interrupt vector ``V`` — at startup, once at instruction ``STEP``, or
   every ``N`` instructions — to exercise ISR handling.

The standalone ``ik8bvm`` simulator binary accepts the **same** subcommands and
options (``ik8bvm run <file.hex> --mcu <device> ...``, ``ik8bvm devices``).

Informational commands
======================

These subcommands print information and exit without compiling.

``help`` (``-h``, ``--help``)
   Show usage text.

``version`` (``-V``, ``--version``)
   Print the compiler version.

``info`` (``--info``)
   Print a summary: version, license, output format, the total number of
   supported devices, and a per-core-family device count.

``license`` (``--license``)
   Print license information (the project is Apache-2.0).

``devices`` (``list-devices``, ``--list-devices``)
   Print the full table of supported devices with their core family, SRAM, Flash,
   EEPROM sizes, and SRAM start address. See :doc:`devices`.

Import resolution
=================

``import <path>`` (without the ``.ik`` extension) is resolved in this order:

#. the current working directory — ``<path>.ik``;
#. the directory named by the ``IK8B_STD_PATH`` environment variable, if set;
#. paths relative to the compiler executable, including the bundled ``std/``
   fallback used for ``std/*`` imports.

This is why ``import std/gpio`` resolves against the shipped standard library
regardless of where you run the compiler from.

Output format
=============

The output is standard **Intel HEX** describing AVR-8 instruction words, ready
for any programmer (``avrdude``, a serial bootloader, a hardware ISP, or the
bundled AVR virtual machine used by the test suite). The compiler emits no ELF,
no map file, and links nothing — the HEX is complete and self-contained.

Build and test targets
======================

The repository's ``Makefile`` wraps common workflows (these run inside a
container, so no local Rust toolchain is required):

============================ ===============================================
``make build``               Build the native ``./ik8b`` binary.
``make compile``             Compile the bundled blink example to ``out.hex``.
``make test``                Compile + simulate the regression suite (all MCUs).
``make test-interrupts``     Validate interrupt-vector binding, all devices.
``make benchmark``           Compare ik8b vs avr-gcc C/asm via the built-in ``sim``.
``make clean``               Remove build artifacts.
============================ ===============================================
