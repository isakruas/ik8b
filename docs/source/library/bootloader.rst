==================================================
``std/bootloader`` --- Serial firmware bootloader
==================================================

.. code-block:: text

   import std/bootloader

A ready-made serial bootloader that lives in the Boot Loader Section and
rewrites the *application* section of Flash with an image streamed over USART0 by
the IDE. It builds on :doc:`boot` (SPM), :doc:`uart`, and :doc:`crc`.

Everything that depends only on the chip — the Flash page size and the start of
the boot section — is selected automatically from the declared ``target``, the
same way :doc:`uart` and :doc:`gpio` pick their registers. Each per-target block
also carries its own ``boot`` directive, so importing the module automatically
locates the program in the Boot Loader Section: you do not write a ``boot
<addr>`` line yourself. The only thing you supply is the UART divisor for your
crystal and baud rate.

.. code-block:: text

   target atmega32
   import std/bootloader

   @main { @bootloader_run(51) }   # 51 = 8 MHz / (16 * 9600) - 1

See :doc:`uart` for how to compute the UBRR divisor from your clock and baud.

Supported targets
=================

Only chips that have a hardware UART, self-programming (SPM), and a real boot
section whose application area fits below 64 KB are included — for example the
ATmega8/88, ATmega16/32, ATmega64/640, ATmega164/324/644 families, the
AT90CAN and AT90PWM parts, and the ATtiny828. Importing the module on an
unlisted target leaves ``PAGE_SIZE`` / ``BOOT_ORIGIN`` undefined, so the build
fails fast rather than producing a bootloader that cannot self-program.

API
===

.. function:: @bootloader_run($ubrr: u16)

   The entry point. Initialises USART0 at divisor ``$ubrr``, then waits a short
   startup window for the IDE to send the sync magic. If nothing syncs in time it
   jumps to ``0x0000`` and runs whatever application is already in Flash, so a
   normally-flashed board boots without the IDE attached. If sync is seen it
   services the upload protocol below in a loop, programming pages as they
   arrive and finally jumping to the new application on the ``RUN`` command.

   ``$ubrr`` is ``F_CPU / (16 * baud) - 1`` for the board's crystal and baud.

The remaining ``@bl_*`` functions (``@bl_read_into``, ``@bl_resync``,
``@bl_wait_sync``, ``@bl_write_page``, ``@bl_dispatch``) are internal helpers
used by :func:`@bootloader_run`.

Safety
======

The bootloader can never erase or overwrite itself:

* Every frame is CRC-16 checked; a bad CRC is NAKed and ignored.
* A ``WRITE`` is rejected unless the page address is page-aligned and the whole
  page lies strictly below the boot section, so writes are confined to the
  application area.
* Interrupts are disabled around every SPM sequence.

Wire protocol
=============

Host (IDE) talks to the target; multi-byte integers are big-endian. Every frame
is prefixed with the 3-byte sync magic ``0x1B 'i' 'k'``, which also lets the
bootloader resynchronise after a garbled frame.

.. code-block:: text

   Frame  host -> target:  0x1B 'i' 'k'  CMD  LEN_HI LEN_LO  payload[LEN]  CRC_HI CRC_LO
                           CRC-16/ARC (poly 0xA001, init 0) over CMD, LEN_HI, LEN_LO, payload.
   Reply  target -> host:  0x06 (ACK) or 0x15 (NAK), then command-specific bytes.

=========== ===== =================================== ==============================================
Command     Code  Payload                             Reply
=========== ===== =================================== ==============================================
``HELLO``   0x01  (none)                              ACK, VER, PAGE_HI, PAGE_LO, ORIGIN_HI, ORIGIN_LO
``WRITE``   0x02  ADDR_HI ADDR_LO + one page of data  ACK on success, NAK if rejected
``RUN``     0x04  (none)                              ACK, then jump to the application at ``0x0000``
=========== ===== =================================== ==============================================

``HELLO`` lets the host discover the device's page size and boot-section origin
before streaming pages, so a single host tool drives any supported target.
