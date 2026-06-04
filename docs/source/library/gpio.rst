=================================
``std/gpio`` --- Digital I/O pins
=================================

.. code-block:: text

   import std/gpio

The GPIO module provides digital pin control, organised **per port**. Every
operation exists once for each port letter the architecture defines, with the
port letter as the function suffix.

Ports
=====

The module defines functions for ports ``a``, ``b``, ``c``, ``d``, ``e``, ``f``,
``g``, ``h``, ``j``, ``k``, ``l``, ``m``, ``q``, and ``r`` — the full set of AVR
port letters across the device family. **Only the ports that physically exist on
your selected** ``target`` **are usable**; calling into a port the device does
not have is not meaningful. The examples below use the ``_b`` port functions,
since PB5 is a common on-board LED pin.

Each port ``X`` exposes the same four operations. They are documented once for
port ``b``; substitute the letter for any other port.

Operations
==========

.. function:: @pin_mode_b($pin: u8, $mode: u8)

   Configure the direction of pin ``$pin`` (0–7) on the port. ``$mode`` is ``1``
   for output and ``0`` for input — this drives the port's Data Direction
   Register bit for that pin.

.. function:: @digital_write_b($pin: u8, $val: u8)

   Drive pin ``$pin`` (0–7) to ``$val``: ``1`` sets the pin high, ``0`` sets it
   low. On a pin configured as input, writing ``1`` enables the internal
   pull-up, per the AVR port model.

.. function:: @digital_read_b($pin: u8) -> u8

   Read pin ``$pin`` (0–7) and return ``1`` if it is high or ``0`` if it is low.

.. function:: @toggle_b($pin: u8)

   Flip the output state of pin ``$pin`` (0–7).

Other ports
===========

The identical set exists for every port letter:

* ``@pin_mode_a`` / ``@digital_write_a`` / ``@digital_read_a`` / ``@toggle_a``
* ``@pin_mode_c`` / ``@digital_write_c`` / ``@digital_read_c`` / ``@toggle_c``
* ``@pin_mode_d`` / ``@digital_write_d`` / ``@digital_read_d`` / ``@toggle_d``
* … and so on for ports ``e``, ``f``, ``g``, ``h``, ``j``, ``k``, ``l``, ``m``,
  ``q``, ``r``.

Example
=======

.. code-block:: text

   target atmega328p
   import std/gpio

   @main {
       @pin_mode_b(5, 1)              # PB5 as output (mode 1 = output)
       @pin_mode_b(0, 0)              # PB0 as input  (mode 0 = input)...
       @digital_write_b(0, 1)         # ...writing 1 to an input enables its pull-up

       loop * {
           ? @digital_read_b(0) == 0 {   # button pulls the pin low when pressed
               @toggle_b(5)              # flip the LED each time we read it low
           }
       }
   }