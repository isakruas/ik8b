=============================================
``std/boot`` --- Flash self-programming (SPM)
=============================================

.. code-block:: text

   import std/boot

``std/boot`` wraps the classic AVR **Store-Program-Memory** protocol so a
program running in the Boot Loader Section can rewrite the device's own Flash —
the basis of a firmware bootloader. The helpers are built on the
:func:`@spm` intrinsic (see :doc:`/reference/intrinsics`).

The module defines a per-device ``%SPM_CTRL_REG`` register constant — the
SPMCSR/SPMCR address, which differs between parts (for example ``0x57`` on
ATmega48/88/168/328 and ATtiny25/45/85, ``0x68`` on ATmega64/128) — sourced from
the avr-gcc device definitions. The ``@boot_*`` helpers pass it to ``@spm`` for
you, so you never hard-code an address. Parts without flash self-programming map
``%SPM_CTRL_REG`` to ``0x0000``; ``@spm`` is not available on them (and the
reduced ``AVRrc`` core has no SPM at all).

Requirements
============

* The program must be a **bootloader**: declare ``boot <addr>`` at the top so it
  is located in the Boot Loader Section, and set the device's ``BOOTRST`` /
  ``BOOTSZ`` fuses to match. On most ATmega parts ``SPM`` is only allowed from
  the boot section.
* **Disable interrupts** around programming (call :func:`@cli` first), since the
  ``SPM`` sequence is timing-critical.
* Addresses are **byte** addresses into Flash; a page is ``PAGESIZE`` words.

API
===

.. function:: @boot_page_erase($addr: u16)

   Erase the Flash page that contains byte address ``$addr``.

.. function:: @boot_page_fill($addr: u16, $word: u16)

   Load one 16-bit ``$word`` into the temporary page buffer. Only the in-page
   word-offset bits of ``$addr`` matter for buffer fills.

.. function:: @boot_page_write($addr: u16)

   Write the filled page buffer to Flash at page byte address ``$addr``.

.. function:: @boot_rww_enable()

   Re-enable the Read-While-Write section so the application can run again after
   a page write.

Writing one page
================

.. code-block:: text

   import std/boot

   @cli()
   @boot_page_erase($page_addr)
   ram mut $off: u16 = 0
   loop ... {
       @boot_page_fill($page_addr + $off, $word)
       $off + 2 -> $off
   }
   @boot_page_write($page_addr)
   @boot_rww_enable()

where ``$page_addr`` is the page's byte address in Flash. To hand control to the
freshly written application, jump to it with :func:`@goto` (typically
``@goto(0)``).
