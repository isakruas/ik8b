============================
Installing and building ik8b
============================

The compiler is a single Rust binary. The repository ships a ``Makefile`` that
builds it inside a standard Rust container, so you do not need a local Rust
toolchain.

Getting the source
==================

The standard library and supporting submodules are pulled in through Git
submodules, so clone recursively::

   git clone --recurse-submodules https://github.com/isakruas/ik8b.git
   cd ik8b

If you already cloned without ``--recurse-submodules``::

   git submodule update --init --recursive

Building the compiler
=====================

Build the native ``./ik8b`` binary::

   make build

When it finishes you have an executable ``./ik8b`` in the repository root. Check
that it runs::

   ./ik8b version
   ./ik8b info

``info`` prints the compiler version and a summary of how many devices each AVR
core family supports.

Compiling a program
===================

The compiler reads one ``.ik`` file and writes an Intel HEX image::

   ./ik8b path/to/program.ik -o program.hex

Every program must name its target device with a top-level ``target``
declaration (see :doc:`firstprogram`); the compiler refuses to build without
one because the device determines the register map, memory sizes, and interrupt
vector table.

Flashing
========

The output is ordinary Intel HEX, so any AVR programmer works. With
``avrdude`` over a serial bootloader::

   avrdude -p m328p -c arduino -P /dev/ttyACM0 -U flash:w:program.hex:i

Adjust the part (``-p``), programmer (``-c``), and port (``-P``) for your board.

Running the tests
=================

The project's regression suite compiles a body of programs and runs them on a
bundled AVR virtual machine across several MCUs::

   make test

Other targets validate interrupt-vector binding (``make test-interrupts``) and
runtime interrupt delivery in the VM (``make test-vm-interrupts``).

.. note::

   Per the project convention, build and test go through the container-based
   ``make`` targets rather than invoking ``cargo`` directly.
