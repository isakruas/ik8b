=================================
``std/adc`` --- Analog-to-digital
=================================

.. code-block:: text

   import std/adc

Reads from the on-chip Analog-to-Digital Converter. The module configures the
ADC and performs blocking single conversions on a selected input channel.

.. function:: @adc_init()

   Initialise and enable the ADC with a default configuration suitable for
   single conversions. Call once before reading.

.. function:: @adc_read($channel: u8) -> u16

   Select input ``$channel``, start a conversion, block until it completes, and
   return the full-resolution result (a 10-bit value, 0–1023, on classic AVR
   ADCs). The channel numbering follows the device's ADC multiplexer.

.. function:: @adc_read_8bit($channel: u8) -> u8

   As :func:`@adc_read`, but return only the most-significant 8 bits of the
   conversion (0–255). Convenient when 8-bit resolution is enough and you want a
   single-byte result.

Example
=======

.. code-block:: text

   target atmega328p
   import std/adc
   import std/uart

   @main {
       @uart_init(103)                         # serial, to report readings
       @adc_init()                             # enable the ADC (call once)

       loop * {
           ram imut $raw: u16 = @adc_read(0)   # convert channel ADC0 -> 0..1023
           # ... do something with the 10-bit reading in $raw ...
       }
   }
