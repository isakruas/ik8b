===============================
``std/ringbuf`` --- Ring buffer
===============================

.. code-block:: text

   import std/ringbuf

A byte-oriented circular (FIFO) buffer. In keeping with the library's
no-allocation rule, the buffer is **entirely caller-owned**: you declare the
storage array and the three bookkeeping bytes (head, tail, count), and pass
pointers to them on every call. This lets you have as many independent ring
buffers as you like with no hidden state — a common need for UART RX/TX queues.

State you provide
=================

For each ring buffer, declare:

* ``$buf`` — the data array, ``u8[size]``;
* ``$head`` — one ``u8`` write index;
* ``$tail`` — one ``u8`` read index;
* ``$count`` — one ``u8`` holding the current number of stored bytes;

and pass ``$size`` (the capacity) where required. Pointers to ``$head``,
``$tail``, and ``$count`` are passed so the functions can update them in place.

Operations
==========

.. function:: @ringbuf_init($buf: ptr ram u8, $head: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8)

   Initialise an empty ring buffer, zeroing the head, tail, and count.

.. function:: @ringbuf_push($buf: ptr ram u8, $head: ptr ram u8, $count: ptr ram u8, $size: u8, $val: u8) -> u8

   Append ``$val`` to the buffer. Returns non-zero on success, or ``0`` if the
   buffer was full (the value is not stored). ``$size`` is the buffer capacity.

.. function:: @ringbuf_pop($buf: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8, $size: u8) -> u8

   Remove and return the oldest byte. Check :func:`@ringbuf_empty` first; popping
   an empty buffer has no valid byte to return.

.. function:: @ringbuf_peek($buf: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8) -> u8

   Return the oldest byte without removing it.

.. function:: @ringbuf_count($count: ptr ram u8) -> u8

   Return the number of bytes currently stored.

.. function:: @ringbuf_full($count: ptr ram u8, $size: u8) -> u8

   Return non-zero if the buffer is full (count equals ``$size``).

.. function:: @ringbuf_empty($count: ptr ram u8) -> u8

   Return non-zero if the buffer is empty (count is zero).

.. function:: @ringbuf_clear($head: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8)

   Discard all contents by resetting head, tail, and count to zero.

Example
=======

.. code-block:: text

   import std/ringbuf

   ram mut $buf:   u8[16] = 0        # the storage (capacity 16)
   ram mut $head:  u8 = 0            # write index   (book-keeping you own)
   ram mut $tail:  u8 = 0            # read index
   ram mut $count: u8 = 0            # how many bytes are currently stored

   @main {
       @ringbuf_init(&$buf[0], &$head, &$tail, &$count)   # zero head/tail/count

       @ringbuf_push(&$buf[0], &$head, &$count, 16, 65)   # enqueue 'A' (65)
       @ringbuf_push(&$buf[0], &$head, &$count, 16, 66)   # enqueue 'B' (66)

       ? @ringbuf_empty(&$count) == 0 {                   # anything to read?
           ram imut $c: u8 = @ringbuf_pop(&$buf[0], &$tail, &$count, 16)  # dequeue oldest -> 'A'
       }
       loop * { }
   }