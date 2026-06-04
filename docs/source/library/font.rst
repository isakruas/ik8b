===============================
``std/font`` --- Text rendering
===============================

.. code-block:: text

   import std/font

A bitmap font for driving small displays. Each glyph is **5 columns wide and 8
pixels tall**: one byte per column, one bit per pixel. Rendering a character
emits its 5 glyph columns followed by 1 blank spacing column (an advance of 6).

The module offers three ways to consume rendered text, trading memory for
convenience:

* **Render to a buffer** you own (:func:`@font_render`) — you control the
  storage.
* **Render to a library buffer** (:func:`@font_render_buf`) — zero setup, but a
  shared static buffer.
* **Stream** column-by-column to a callback (:func:`@font_stream`,
  :func:`@font_fold`) — constant SRAM regardless of text length.

Font metrics
============

.. function:: @font_width() -> u8

   Glyph width in columns (bytes per character) — 5.

.. function:: @font_height() -> u8

   Glyph height in pixels (bits per column byte) — 8.

.. function:: @font_advance() -> u8

   Horizontal advance per character: glyph width plus one spacing column — 6.

Single glyphs
=============

.. function:: @font_get_col($char: u8, $col: u8) -> u8

   Return one column byte of the glyph for ASCII code ``$char``. ``$col`` is the
   column index 0–4; out-of-range columns return ``0``.

.. function:: @font_get_glyph($char: u8, $dest: ptr ram u8)

   Copy all 5 column bytes of ``$char``'s glyph into ``$dest`` (which must hold
   at least :func:`@font_width` = 5 bytes).

Sizing
======

.. function:: @font_text_cols($str: str ram) -> u16

   Number of columns a string needs when rendered: characters × advance (6 per
   character). Use it to size a buffer for :func:`@font_render`.

.. function:: @font_render_capacity() -> u16

   The column capacity of the internal buffer used by :func:`@font_render_buf`.
   Strings longer than this (in columns) are truncated there.

Render to a buffer
==================

.. function:: @font_render($str: str ram, $dest: ptr ram u8, $max_cols: u16) -> u16

   Render ``$str`` into the caller's buffer ``$dest`` as a stream of column
   bytes (5 glyph + 1 spacer per character). Writing stops once ``$max_cols``
   columns have been produced, so ``$dest`` is never overrun. Returns the number
   of columns actually written.

.. function:: @font_render_buf($str: str ram, $out_cols: ptr ram u8) -> ptr ram u8

   Convenience renderer that writes into a **library-owned** SRAM buffer, so you
   need not allocate or size anything. The produced column count is written to
   ``*$out_cols`` and a pointer to the column stream is returned.

   The buffer is a single static region shared across calls (there is no heap on
   AVR), so each call overwrites the previous result — copy the bytes out if you
   need to keep them. Output is capped at :func:`@font_render_capacity` columns.

Streaming (constant memory)
===========================

.. function:: @font_stream($str: str ram, $sink: fn(u8))

   Stream the column bitmap of ``$str`` to your callback ``$sink``, one byte at a
   time (5 glyph columns + 1 spacer per character). Nothing is buffered, so SRAM
   use is O(1) no matter how long the text is — ideal for pushing large text
   straight to a display.

   ``$sink`` is **your** function of type ``fn(u8)``; pass it with
   ``&@yourfunc``.

.. function:: @font_fold($str: str ram, $init: u8, $sink: fn(u8,u8)->u8) -> u8

   Fold the column bitmap of ``$str`` through your callback, threading an
   accumulator: ``$acc = sink($acc, column_byte)`` for every column, starting
   from ``$init``. Returns the final accumulator. Pure and allocation-free —
   handy for a checksum or CRC over rendered text, or any custom reduction.
   ``$sink`` has type ``fn(u8,u8)->u8`` taking ``(acc, byte)``.

Example
=======

Stream "Hi" straight to an SPI display, buffering nothing:

.. code-block:: text

   target atmega328p
   import std/font
   import std/spi

   @to_display($b: u8) { @spi_transfer($b) }   # your sink: push one column byte to the panel

   @main {
       @spi_init_master_raw()                  # bring up SPI for the display
       @font_stream("Hi", &@to_display)        # render "Hi", stream each column to @to_display

       # Or fold the same pixels into an XOR checksum, no display needed:
       ram imut $sum: u8 = @font_fold("Hi", 0, &@xor_acc)   # thread each byte through @xor_acc
       loop * { }
   }

   @xor_acc($acc: u8, $b: u8) -> u8 { return $acc ^ $b }   # combine accumulator with each byte