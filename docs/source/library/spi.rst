==========================
``std/spi`` --- SPI master
==========================

.. code-block:: text

   import std/spi

Blocking master-mode SPI. The module configures the hardware SPI peripheral as a
master and exchanges single bytes, busy-waiting on the transfer-complete flag.

SPI0
====

.. function:: @spi_init_master_raw()

   Initialise the SPI peripheral in master mode with a default configuration
   ("raw": no chip-select management or mode/clock options beyond enabling
   master mode). Drive any chip-select line yourself with the GPIO module.

.. function:: @spi_transfer($data: u8) -> u8

   Shift ``$data`` out over MOSI while simultaneously shifting a byte in over
   MISO; block until the exchange completes and return the received byte. SPI is
   full-duplex, so every transfer both sends and receives.

Additional SPI instance
=======================

Devices with a second SPI peripheral expose the same two calls on the ``spi1``
module:

* :samp:`@spi1_init_master_raw()`
* :samp:`@spi1_transfer($data: u8) -> u8`

Example
=======

.. code-block:: text

   target atmega328p
   import std/spi
   import std/gpio

   @main {
       @pin_mode_b(2, 1)              # PB2 = chip-select line, configured as output
       @spi_init_master_raw()         # bring SPI up in master mode

       @digital_write_b(2, 0)         # pull CS low to select the slave
       # 0x9F is a device-specific command (here a common "read ID"); the value
       # to send comes from your slave's datasheet, not from SPI itself.
       ram imut $resp: u8 = @spi_transfer(0x9F)   # send the byte, capture the reply
       @digital_write_b(2, 1)         # raise CS to deselect
   }