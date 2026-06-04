====================
The ``ik8b`` command
====================

The compiler is a single executable that turns one ``.ik`` source file into an
Intel HEX image of AVR instruction words.

Synopsis
========

.. code-block:: text

   ./ik8b <file.ik> [-o <out.hex>] [--report]
   ./ik8b info
   ./ik8b version
   ./ik8b license
   ./ik8b list-devices
   ./ik8b help

Compiling
=========

Give the compiler a source file. The device is taken from the file's mandatory
``target`` declaration, not from a command-line flag::

   ./ik8b blink.ik -o blink.hex

``-o <out.hex>``
   Path of the Intel HEX output. Defaults to ``out.hex`` if omitted.

``--report``
   Print a build summary covering Program (Flash), SRAM, EEPROM, and register
   usage. The report also enforces the device's memory budgets: if the program
   exceeds the available Flash, SRAM, or EEPROM for the selected ``target``, the
   build **fails**. The report prints a machine-readable ``SRAM_BYTES=<n>`` line
   before the normal human-readable summary, which the test harness consumes.

Use ``--report`` in CI and whenever you want to know how close you are to a
device's limits.

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

``list-devices`` (``--list-devices``)
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
``make test``                Compile + run the VM regression suite.
``make test-interrupts``     Validate interrupt-vector binding, all devices.
``make test-vm-interrupts``  Validate runtime interrupt delivery in the VM.
``make clean``               Remove build artifacts.
============================ ===============================================
