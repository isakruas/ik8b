=========================
``std/crc`` --- Checksums
=========================

.. code-block:: text

   import std/crc

Cyclic redundancy checks over a block of bytes in SRAM, for validating data
integrity (serial frames, EEPROM contents, 1-Wire devices, and similar). Both
functions process ``$len`` bytes starting at ``$data``.

.. function:: @crc8($data: ptr ram u8, $len: u16) -> u8

   Compute the **CRC-8 Dallas/Maxim** checksum (polynomial ``0x31``, reflected
   ``0x8C``) over ``$len`` bytes at ``$data``. This is the CRC used by 1-Wire
   devices such as the DS18B20.

.. function:: @crc16($data: ptr ram u8, $len: u16) -> u16

   Compute the **CRC-16 IBM/ANSI** checksum (polynomial ``0x8005``, reflected
   ``0xA001``) over ``$len`` bytes at ``$data``. This is the CRC used by Modbus
   RTU and many other byte protocols.

Example
=======

.. code-block:: text

   import std/crc

   @main {
       ram mut $data: u8[4] = 0       # the bytes to checksum
       0x12 -> $data[0]               # fill them in
       0x34 -> $data[1]
       0x56 -> $data[2]
       0x78 -> $data[3]

       ram imut $c8:  u8  = @crc8(&$data[0], 4)   # 8-bit CRC over the 4 bytes
       ram imut $c16: u16 = @crc16(&$data[0], 4)  # 16-bit CRC over the same 4 bytes
       loop * { }
   }