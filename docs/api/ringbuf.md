# std/ringbuf

Caller-owned byte ring buffer.

## API

```ik8b
@ringbuf_init($buf: ptr ram u8, $head: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8)
@ringbuf_push($buf: ptr ram u8, $head: ptr ram u8, $count: ptr ram u8, $size: u8, $val: u8) -> u8
@ringbuf_pop($buf: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8, $size: u8) -> u8
@ringbuf_full($count: ptr ram u8, $size: u8) -> u8
@ringbuf_empty($count: ptr ram u8) -> u8
@ringbuf_count($count: ptr ram u8) -> u8
@ringbuf_clear($head: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8)
@ringbuf_peek($buf: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8) -> u8
```

## Behavior

- `push` returns `1` on success and `0` when full.
- `pop` returns the removed byte or `0` when empty.
- `peek` returns the next byte or `0` when empty.
- `count`, `head`, and `tail` are owned by the caller.

## Example

```ik8b
target atmega328p
import std/ringbuf

@main {
    ram mut $buf: u8[4] = 0
    ram mut $head: u8 = 0
    ram mut $tail: u8 = 0
    ram mut $count: u8 = 0
    @ringbuf_init(&$buf[0], &$head, &$tail, &$count)
    ram mut $ok: u8 = @ringbuf_push(&$buf[0], &$head, &$count, 4, 65)
    ram mut $ch: u8 = @ringbuf_pop(&$buf[0], &$tail, &$count, 4)
    loop * {}
}
```

## Notes

Since `pop` and `peek` return `0` when empty, stored byte value `0` is
ambiguous unless the caller checks `ringbuf_empty` first.
