=========================
``std/eeprom`` --- EEPROM
=========================

.. code-block:: text

   import std/eeprom

Byte-wise access to the on-chip EEPROM, which retains its contents across power
cycles. Both routines wait for any in-progress EEPROM operation to finish before
starting, so they are safe to call back-to-back.

.. function:: @eeprom_read($addr: u16) -> u8

   Return the byte stored at EEPROM address ``$addr``. Waits for the EEPROM to be
   ready, then reads.

.. function:: @eeprom_write($addr: u16, $val: u8)

   Store byte ``$val`` at EEPROM address ``$addr``. Waits for readiness first.

   .. note::

      EEPROM writes are slow (on the order of a few milliseconds each) and the
      cells have a finite endurance (typically ~100,000 write cycles). Avoid
      writing in tight loops; write only when a value actually changes.

.. function:: @_eeprom_wait()

   Internal: block until any pending EEPROM write completes. Used by both public
   routines.

Example
=======

A boot counter that survives resets:

.. code-block:: text

   target atmega328p
   import std/eeprom

   @main {
       ram imut $boots: u8 = @eeprom_read(0)  # read the count saved last power-up
       @eeprom_write(0, $boots + 1)           # store it incremented (survives reset)
       loop * { }
   }