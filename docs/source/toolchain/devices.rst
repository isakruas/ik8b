=================
Supported devices
=================

The ``target`` declaration selects one of the devices below. The compiler
supports **350** AVR-8 parts across five core families. The table is produced by
the compiler itself; regenerate it any time with::

   ./ik8b list-devices

Core families
=============

============ ======================================================================
Family       Notes
============ ======================================================================
``AVRe``     Classic AVR core.
``AVRePlus`` Classic core with the extended instruction set (e.g. hardware MUL).
``AVRrc``    Reduced core (ATtiny "reduced core"); no hardware multiplier.
``AVRxm``    XMEGA core.
``AVRxt``    Newer "AVRxt" core (megaAVR 0-series, tinyAVR 0/1/2-series, etc.).
============ ======================================================================

The core family determines which instructions are available, and the compiler
enforces the differences at compile time:

* The :func:`@mul` intrinsic and the fixed-point (``r8``/``r16``) multiply and
  divide runtime require a hardware multiplier — rejected on ``AVRe`` and
  ``AVRrc`` (integer ``*`` falls back to a shift-add loop there).
* ``eeprom`` storage uses the classic access protocol — rejected on ``AVRxt``,
  ``AVRxm``, and ``AVRrc`` (see :doc:`/reference/memory`).
* ``flash`` data reads use ``LPM`` — rejected on ``AVRrc``.
* The :func:`@spm` intrinsic requires self-programming support — rejected on
  ``AVRrc`` (see :doc:`/reference/intrinsics`).
* On ``AVRrc`` the generated code restricts itself to the reduced register
  file (``r16``–``r31``) and avoids the instructions the reduced core lacks
  (``MOVW``, ``ADIW``/``SBIW``, ``LDD``/``STD`` with displacement, two-word
  ``LDS``/``STS``). The bundled simulator enforces this: executing a reserved
  encoding on an ``AVRrc`` device stops with an illegal-instruction error.
* Parts with 8 KB of flash or less (any core) have no ``JMP``/``CALL``
  instructions and use **1-word ``RJMP`` vector slots**; larger parts use the
  fixed 2-word ``JMP`` slots. On the small parts a relative jump reaches the
  whole flash by program-counter wraparound, which the compiler encodes and
  the simulator models.

The columns below are: core family, device name (use this exact name in
``target``), SRAM bytes, Flash bytes, EEPROM bytes, and the SRAM start address.

Device table
============

.. code-block:: text

   CORE       DEVICE                 SRAM    FLASH   EEPROM SRAM_START
   ----------------------------------------------------------------------
   AVRe       at43usb320              512    65536        1 0x0060
   AVRe       at43usb355             1024    24576        1 0x0060
   AVRe       at76c711               1952    16384        1 0x0060
   AVRe       at86rf401               128     2048      128 0x0060
   AVRe       at90c8534               256     8192      512 0x0060
   AVRe       at90s1200                 0     1024       64 0x0060
   AVRe       at90s2313               128     2048      128 0x0060
   AVRe       at90s2323               128     2048      128 0x0060
   AVRe       at90s2333               128     2048      128 0x0060
   AVRe       at90s2343               128     2048      128 0x0060
   AVRe       at90s4414               256     4096      256 0x0060
   AVRe       at90s4433               128     4096      256 0x0060
   AVRe       at90s4434               256     4096      256 0x0060
   AVRe       at90s8515               512     8192      512 0x0060
   AVRe       at90s8535               512     8192      512 0x0060
   AVRe       at90usb162              512    16384      512 0x0100
   AVRe       at90usb82               512     8192      512 0x0100
   AVRe       ata5272                 512     8192      512 0x0100
   AVRe       ata5505                 512    16384      512 0x0100
   AVRe       ata6616c                512     8192      512 0x0100
   AVRe       ata6617c                512    16384      512 0x0100
   AVRe       ata664251               512    16384      512 0x0100
   AVRe       atmega103              4000   131072     4096 0x0060
   AVRe       atmega16u2              512    16384      512 0x0100
   AVRe       atmega32u2             1024    32768     1024 0x0100
   AVRe       atmega8u2               512     8192      512 0x0100
   AVRe       attiny11                  0     1024        1 0x0060
   AVRe       attiny12                  0     1024       64 0x0060
   AVRe       attiny13                 64     1024       64 0x0060
   AVRe       attiny13a                64     1024       64 0x0060
   AVRe       attiny15                  0     1024       64 0x0060
   AVRe       attiny1634             1024    16384      256 0x0100
   AVRe       attiny167               512    16384      512 0x0100
   AVRe       attiny22                128     2048      128 0x0060
   AVRe       attiny2313              128     2048      128 0x0060
   AVRe       attiny2313a             128     2048      128 0x0060
   AVRe       attiny24                128     2048      128 0x0060
   AVRe       attiny24a               128     2048      128 0x0060
   AVRe       attiny25                128     2048      128 0x0060
   AVRe       attiny26                128     2048      128 0x0060
   AVRe       attiny261               128     2048      128 0x0060
   AVRe       attiny261a              128     2048      128 0x0060
   AVRe       attiny28                  0     2048        1 0x0060
   AVRe       attiny4313              256     4096      256 0x0060
   AVRe       attiny43u               256     4096       64 0x0060
   AVRe       attiny44                256     4096      256 0x0060
   AVRe       attiny441               256     4096      256 0x0100
   AVRe       attiny44a               256     4096      256 0x0060
   AVRe       attiny45                256     4096      256 0x0060
   AVRe       attiny461               256     4096      256 0x0060
   AVRe       attiny461a              256     4096      256 0x0060
   AVRe       attiny48                256     4096       64 0x0100
   AVRe       attiny828               512     8192      256 0x0100
   AVRe       attiny84                512     8192      512 0x0060
   AVRe       attiny841               512     8192      512 0x0100
   AVRe       attiny84a               512     8192      512 0x0060
   AVRe       attiny85                512     8192      512 0x0060
   AVRe       attiny861               512     8192      512 0x0060
   AVRe       attiny861a              512     8192      512 0x0060
   AVRe       attiny87                512     8192      512 0x0100
   AVRe       attiny88                512     8192       64 0x0100
   AVRePlus   at90can128             4096   131072     4096 0x0100
   AVRePlus   at90can32              2048    32768     1024 0x0100
   AVRePlus   at90can64              4096    65536     2048 0x0100
   AVRePlus   at90pwm1                512     8192      512 0x0100
   AVRePlus   at90pwm161             1024    16384      512 0x0100
   AVRePlus   at90pwm2                512     8192      512 0x0100
   AVRePlus   at90pwm216             1024    16384      512 0x0100
   AVRePlus   at90pwm2b               512     8192      512 0x0100
   AVRePlus   at90pwm3                512     8192      512 0x0100
   AVRePlus   at90pwm316             1024    16384      512 0x0100
   AVRePlus   at90pwm3b               512     8192      512 0x0100
   AVRePlus   at90pwm81               256     8192      512 0x0100
   AVRePlus   at90scr100             4096    65536     2048 0x0100
   AVRePlus   at90usb1286            8192   131072     4096 0x0100
   AVRePlus   at90usb1287            8192   131072     4096 0x0100
   AVRePlus   at90usb646             4096    65536     2048 0x0100
   AVRePlus   at90usb647             4096    65536     2048 0x0100
   AVRePlus   at94k                  4000    32768        1 0x0060
   AVRePlus   ata5702m322            1024    65536     2304 0x0200
   AVRePlus   ata5782                1024    53248     1024 0x0200
   AVRePlus   ata5790                 512    16384     2048 0x0100
   AVRePlus   ata5790n                512    16384     2048 0x0100
   AVRePlus   ata5795                 512     8192     2048 0x0100
   AVRePlus   ata5831                1024    53248     1024 0x0200
   AVRePlus   ata6285                 512     8192      320 0x0100
   AVRePlus   ata6286                 512     8192      320 0x0100
   AVRePlus   ata6289                 512     8192      320 0x0100
   AVRePlus   ata6612c               1024     8192      512 0x0100
   AVRePlus   ata6613c               1024    16384      512 0x0100
   AVRePlus   ata6614q               2048    32768     1024 0x0100
   AVRePlus   atmega128              4096   131072     4096 0x0100
   AVRePlus   atmega1280             8192   131072     4096 0x0200
   AVRePlus   atmega1281             8192   131072     4096 0x0200
   AVRePlus   atmega1284            16384   131072     4096 0x0100
   AVRePlus   atmega1284p           16384   131072     4096 0x0100
   AVRePlus   atmega1284rfr2        16384   131072     4096 0x0200
   AVRePlus   atmega128a             4096   131072     4096 0x0100
   AVRePlus   atmega128rfa1         16384   131072     4096 0x0200
   AVRePlus   atmega128rfr2         16384   131072     4096 0x0200
   AVRePlus   atmega16               1024    16384      512 0x0060
   AVRePlus   atmega161              1024    16384      512 0x0060
   AVRePlus   atmega162              1024    16384      512 0x0100
   AVRePlus   atmega163              1024    16384      512 0x0060
   AVRePlus   atmega164a             1024    16384      512 0x0100
   AVRePlus   atmega164p             1024    16384      512 0x0100
   AVRePlus   atmega164pa            1024    16384      512 0x0100
   AVRePlus   atmega165              1024    16384      512 0x0100
   AVRePlus   atmega165a             1024    16384      512 0x0100
   AVRePlus   atmega165p             1024    16384      512 0x0100
   AVRePlus   atmega165pa            1024    16384      512 0x0100
   AVRePlus   atmega168              1024    16384      512 0x0100
   AVRePlus   atmega168a             1024    16384      512 0x0100
   AVRePlus   atmega168p             1024    16384      512 0x0100
   AVRePlus   atmega168pa            1024    16384      512 0x0100
   AVRePlus   atmega168pb            1024    16384      512 0x0100
   AVRePlus   atmega169              1024    16384      512 0x0100
   AVRePlus   atmega169a             1024    16384      512 0x0100
   AVRePlus   atmega169p             1024    16384      512 0x0100
   AVRePlus   atmega169pa            1024    16384      512 0x0100
   AVRePlus   atmega16a              1024    16384      512 0x0060
   AVRePlus   atmega16hva             512    16384      256 0x0100
   AVRePlus   atmega16hva2           1024    16384      256 0x0100
   AVRePlus   atmega16hvb            1024    16384      512 0x0100
   AVRePlus   atmega16hvbrevb        1024    16384      512 0x0100
   AVRePlus   atmega16m1             1024    16384      512 0x0100
   AVRePlus   atmega16u4             1280    16384      512 0x0100
   AVRePlus   atmega2560             8192   262144     4096 0x0200
   AVRePlus   atmega2561             8192   262144     4096 0x0200
   AVRePlus   atmega2564rfr2        32768   262144     8192 0x0200
   AVRePlus   atmega256rfr2         32768   262144     8192 0x0200
   AVRePlus   atmega32               2048    32768     1024 0x0060
   AVRePlus   atmega323              2048    32768     1024 0x0060
   AVRePlus   atmega324a             2048    32768     1024 0x0100
   AVRePlus   atmega324p             2048    32768     1024 0x0100
   AVRePlus   atmega324pa            2048    32768     1024 0x0100
   AVRePlus   atmega324pb            2048    32768     1024 0x0100
   AVRePlus   atmega325              2048    32768     1024 0x0100
   AVRePlus   atmega3250             2048    32768     1024 0x0100
   AVRePlus   atmega3250a            2048    32768     1024 0x0100
   AVRePlus   atmega3250p            2048    32768     1024 0x0100
   AVRePlus   atmega3250pa           2048    32768     1024 0x0100
   AVRePlus   atmega325a             2048    32768     1024 0x0100
   AVRePlus   atmega325p             2048    32768     1024 0x0100
   AVRePlus   atmega325pa            2048    32768     1024 0x0100
   AVRePlus   atmega328              2048    32768     1024 0x0100
   AVRePlus   atmega328p             2048    32768     1024 0x0100
   AVRePlus   atmega328pb            2048    32768     1024 0x0100
   AVRePlus   atmega329              2048    32768     1024 0x0100
   AVRePlus   atmega3290             2048    32768     1024 0x0100
   AVRePlus   atmega3290a            2048    32768     1024 0x0100
   AVRePlus   atmega3290p            2048    32768     1024 0x0100
   AVRePlus   atmega3290pa           2048    32768     1024 0x0100
   AVRePlus   atmega329a             2048    32768     1024 0x0100
   AVRePlus   atmega329p             2048    32768     1024 0x0100
   AVRePlus   atmega329pa            2048    32768     1024 0x0100
   AVRePlus   atmega32a              2048    32768     1024 0x0060
   AVRePlus   atmega32c1             2048    32768     1024 0x0100
   AVRePlus   atmega32hvb            2048    32768     1024 0x0100
   AVRePlus   atmega32hvbrevb        2048    32768     1024 0x0100
   AVRePlus   atmega32m1             2048    32768     1024 0x0100
   AVRePlus   atmega32u4             2560    32768     1024 0x0100
   AVRePlus   atmega32u6             2560    32768     1024 0x0100
   AVRePlus   atmega406              2048    40960      512 0x0100
   AVRePlus   atmega48                512     4096      256 0x0100
   AVRePlus   atmega48a               512     4096      256 0x0100
   AVRePlus   atmega48p               512     4096      256 0x0100
   AVRePlus   atmega48pa              512     4096      256 0x0100
   AVRePlus   atmega48pb              512     4096      256 0x0100
   AVRePlus   atmega64               4096    65536     2048 0x0100
   AVRePlus   atmega640              8192    65536     4096 0x0200
   AVRePlus   atmega644              4096    65536     2048 0x0100
   AVRePlus   atmega644a             4096    65536     2048 0x0100
   AVRePlus   atmega644p             4096    65536     2048 0x0100
   AVRePlus   atmega644pa            4096    65536     2048 0x0100
   AVRePlus   atmega644rfr2          8192    65536     2048 0x0200
   AVRePlus   atmega645              4096    65536     2048 0x0100
   AVRePlus   atmega6450             4096    65536     2048 0x0100
   AVRePlus   atmega6450a            4096    65536     2048 0x0100
   AVRePlus   atmega6450p            4096    65536     2048 0x0100
   AVRePlus   atmega645a             4096    65536     2048 0x0100
   AVRePlus   atmega645p             4096    65536     2048 0x0100
   AVRePlus   atmega649              4096    65536     2048 0x0100
   AVRePlus   atmega6490             4096    65536     2048 0x0100
   AVRePlus   atmega6490a            4096    65536     2048 0x0100
   AVRePlus   atmega6490p            4096    65536     2048 0x0100
   AVRePlus   atmega649a             4096    65536     2048 0x0100
   AVRePlus   atmega649p             4096    65536     2048 0x0100
   AVRePlus   atmega64a              4096    65536     2048 0x0100
   AVRePlus   atmega64c1             4096    65536     2048 0x0100
   AVRePlus   atmega64hve            4096    65536     1024 0x0100
   AVRePlus   atmega64hve2           4096    65536     1024 0x0100
   AVRePlus   atmega64m1             4096    65536     2048 0x0100
   AVRePlus   atmega64rfr2           8192    65536     2048 0x0200
   AVRePlus   atmega8                1024     8192      512 0x0060
   AVRePlus   atmega8515              512     8192      512 0x0060
   AVRePlus   atmega8535              512     8192      512 0x0060
   AVRePlus   atmega88               1024     8192      512 0x0100
   AVRePlus   atmega88a              1024     8192      512 0x0100
   AVRePlus   atmega88p              1024     8192      512 0x0100
   AVRePlus   atmega88pa             1024     8192      512 0x0100
   AVRePlus   atmega88pb             1024     8192      512 0x0100
   AVRePlus   atmega8a               1024     8192      512 0x0060
   AVRePlus   atmega8hva              512     8192      256 0x0100
   AVRePlus   m3000                  4096    65536        1 0x1000
   AVRrc      attiny10                 32     1024        1 0x0040
   AVRrc      attiny20                128     2048        1 0x0040
   AVRrc      attiny4                  32      512        1 0x0040
   AVRrc      attiny40                256     4096        1 0x0040
   AVRrc      attiny5                  32      512        1 0x0040
   AVRrc      attiny9                  32     1024        1 0x0040
   AVRxm      atxmega128a1           8192   139264     2048 0x2000
   AVRxm      atxmega128a1u          8192   139264     2048 0x2000
   AVRxm      atxmega128a3           8192   139264     2048 0x2000
   AVRxm      atxmega128a3u          8192   139264     2048 0x2000
   AVRxm      atxmega128a4u          8192   139264     2048 0x2000
   AVRxm      atxmega128b1           8192   139264     2048 0x2000
   AVRxm      atxmega128b3           8192   139264     2048 0x2000
   AVRxm      atxmega128c3           8192   139264     2048 0x2000
   AVRxm      atxmega128d3           8192   139264     2048 0x2000
   AVRxm      atxmega128d4           8192   139264     2048 0x2000
   AVRxm      atxmega16a4            2048    20480     1024 0x2000
   AVRxm      atxmega16a4u           2048    20480     1024 0x2000
   AVRxm      atxmega16c4            2048    20480     1024 0x2000
   AVRxm      atxmega16d4            2048    20480     1024 0x2000
   AVRxm      atxmega192a3          16384   204800     2048 0x2000
   AVRxm      atxmega192a3u         16384   204800     2048 0x2000
   AVRxm      atxmega192c3          16384   204800     2048 0x2000
   AVRxm      atxmega192d3          16384   204800     2048 0x2000
   AVRxm      atxmega256a3          16384   270336     4096 0x2000
   AVRxm      atxmega256a3b         16384   270336     4096 0x2000
   AVRxm      atxmega256a3bu        16384   270336     4096 0x2000
   AVRxm      atxmega256a3u         16384   270336     4096 0x2000
   AVRxm      atxmega256c3          16384   270336     4096 0x2000
   AVRxm      atxmega256d3          16384   270336     4096 0x2000
   AVRxm      atxmega32a4            4096    36864     1024 0x2000
   AVRxm      atxmega32a4u           4096    36864     1024 0x2000
   AVRxm      atxmega32c3            4096    36864     1024 0x2000
   AVRxm      atxmega32c4            4096    36864     1024 0x2000
   AVRxm      atxmega32d3            4096    36864     1024 0x2000
   AVRxm      atxmega32d4            4096    36864     1024 0x2000
   AVRxm      atxmega32e5            4096    36864     1024 0x2000
   AVRxm      atxmega384c3          32768   401408     4096 0x2000
   AVRxm      atxmega384d3          32768   401408     4096 0x2000
   AVRxm      atxmega64a1            4096    69632     2048 0x2000
   AVRxm      atxmega64a1u           4096    69632     2048 0x2000
   AVRxm      atxmega64a3            4096    69632     2048 0x2000
   AVRxm      atxmega64a3u           4096    69632     2048 0x2000
   AVRxm      atxmega64a4u           4096    69632     2048 0x2000
   AVRxm      atxmega64b1            4096    69632     2048 0x2000
   AVRxm      atxmega64b3            4096    69632     2048 0x2000
   AVRxm      atxmega64c3            4096    69632     2048 0x2000
   AVRxm      atxmega64d3            4096    69632     2048 0x2000
   AVRxm      atxmega64d4            4096    69632     2048 0x2000
   AVRxm      atxmega8e5             1024    10240      512 0x2000
   AVRxt      avr64du28              8192    65536     5376 0x6000
   AVRxt      avr64du32              8192    65536     5376 0x6000
   AVRxt      atmega1608             2048    16384     5376 0x3800
   AVRxt      atmega1609             2048    16384     5376 0x3800
   AVRxt      atmega3208             4096    32768     5376 0x3000
   AVRxt      atmega3209             4096    32768     5376 0x3000
   AVRxt      atmega4808             6144    49152     5376 0x2800
   AVRxt      atmega4809             6144    49152     5376 0x2800
   AVRxt      atmega808              1024     8192     5376 0x3C00
   AVRxt      atmega809              1024     8192     5376 0x3C00
   AVRxt      attiny1604             1024    16384     5376 0x3C00
   AVRxt      attiny1606             1024    16384     5376 0x3C00
   AVRxt      attiny1607             1024    16384     5376 0x3C00
   AVRxt      attiny1614             2048    16384     5376 0x3800
   AVRxt      attiny1616             2048    16384     5376 0x3800
   AVRxt      attiny1617             2048    16384     5376 0x3800
   AVRxt      attiny1624             2048    16384     5376 0x3800
   AVRxt      attiny1626             2048    16384     5376 0x3800
   AVRxt      attiny1627             2048    16384     5376 0x3800
   AVRxt      attiny202               128     2048     5184 0x3F80
   AVRxt      attiny204               128     2048     5184 0x3F80
   AVRxt      attiny212               128     2048     5184 0x3F80
   AVRxt      attiny214               128     2048     5184 0x3F80
   AVRxt      attiny3214             2048    32768     5376 0x3800
   AVRxt      attiny3216             2048    32768     5376 0x3800
   AVRxt      attiny3217             2048    32768     5376 0x3800
   AVRxt      attiny3224             3072    32768     5376 0x3400
   AVRxt      attiny3226             3072    32768     5376 0x3400
   AVRxt      attiny3227             3072    32768     5376 0x3400
   AVRxt      attiny402               256     4096     5248 0x3F00
   AVRxt      attiny404               256     4096     5248 0x3F00
   AVRxt      attiny406               256     4096     5248 0x3F00
   AVRxt      attiny412               256     4096     5248 0x3F00
   AVRxt      attiny414               256     4096     5248 0x3F00
   AVRxt      attiny416               256     4096     5248 0x3F00
   AVRxt      attiny417               256     4096     5248 0x3F00
   AVRxt      attiny424               512     4096     5248 0x3E00
   AVRxt      attiny426               512     4096     5248 0x3E00
   AVRxt      attiny427               512     4096     5248 0x3E00
   AVRxt      attiny804               512     8192     5248 0x3E00
   AVRxt      attiny806               512     8192     5248 0x3E00
   AVRxt      attiny807               512     8192     5248 0x3E00
   AVRxt      attiny814               512     8192     5248 0x3E00
   AVRxt      attiny816               512     8192     5248 0x3E00
   AVRxt      attiny817               512     8192     5248 0x3E00
   AVRxt      attiny824              1024     8192     5248 0x3C00
   AVRxt      attiny826              1024     8192     5248 0x3C00
   AVRxt      attiny827              1024     8192     5248 0x3C00
   AVRxt      avr128da28            16384   131072     5632 0x4000
   AVRxt      avr128da32            16384   131072     5632 0x4000
   AVRxt      avr128da48            16384   131072     5632 0x4000
   AVRxt      avr128da64            16384   131072     5632 0x4000
   AVRxt      avr128db28            16384   131072     5632 0x4000
   AVRxt      avr128db32            16384   131072     5632 0x4000
   AVRxt      avr128db48            16384   131072     5632 0x4000
   AVRxt      avr128db64            16384   131072     5632 0x4000
   AVRxt      avr16dd14              2048    16384     5376 0x7800
   AVRxt      avr16dd20              2048    16384     5376 0x7800
   AVRxt      avr16dd28              2048    16384     5376 0x7800
   AVRxt      avr16dd32              2048    16384     5376 0x7800
   AVRxt      avr16ea28              2048    16384     5632 0x7800
   AVRxt      avr16ea32              2048    16384     5632 0x7800
   AVRxt      avr16ea48              2048    16384     5632 0x7800
   AVRxt      avr16eb14              2048    16384     5632 0x7800
   AVRxt      avr16eb20              2048    16384     5632 0x7800
   AVRxt      avr16eb28              2048    16384     5632 0x7800
   AVRxt      avr16eb32              2048    16384     5632 0x7800
   AVRxt      avr32da28              4096    32768     5632 0x7000
   AVRxt      avr32da32              4096    32768     5632 0x7000
   AVRxt      avr32da48              4096    32768     5632 0x7000
   AVRxt      avr32db28              4096    32768     5632 0x7000
   AVRxt      avr32db32              4096    32768     5632 0x7000
   AVRxt      avr32db48              4096    32768     5632 0x7000
   AVRxt      avr32dd14              4096    32768     5376 0x7000
   AVRxt      avr32dd20              4096    32768     5376 0x7000
   AVRxt      avr32dd28              4096    32768     5376 0x7000
   AVRxt      avr32dd32              4096    32768     5376 0x7000
   AVRxt      avr32ea28              4096    32768     5632 0x7000
   AVRxt      avr32ea32              4096    32768     5632 0x7000
   AVRxt      avr32ea48              4096    32768     5632 0x7000
   AVRxt      avr64da28              8192    65536     5632 0x6000
   AVRxt      avr64da32              8192    65536     5632 0x6000
   AVRxt      avr64da48              8192    65536     5632 0x6000
   AVRxt      avr64da64              8192    65536     5632 0x6000
   AVRxt      avr64db28              8192    65536     5632 0x6000
   AVRxt      avr64db32              8192    65536     5632 0x6000
   AVRxt      avr64db48              8192    65536     5632 0x6000
   AVRxt      avr64db64              8192    65536     5632 0x6000
   AVRxt      avr64dd14              8192    65536     5376 0x6000
   AVRxt      avr64dd20              8192    65536     5376 0x6000
   AVRxt      avr64dd28              8192    65536     5376 0x6000
   AVRxt      avr64dd32              8192    65536     5376 0x6000
   AVRxt      avr64ea28              6144    65536     5632 0x6800
   AVRxt      avr64ea32              6144    65536     5632 0x6800
   AVRxt      avr64ea48              6144    65536     5632 0x6800
