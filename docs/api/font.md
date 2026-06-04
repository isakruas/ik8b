# std/font

5x8 ASCII font helpers and rendering routines. The module includes font data
derived from the classic GLCD/Adafruit GFX font set.

## API

```ik8b
@font_width() -> u8
@font_height() -> u8
@font_advance() -> u8
@font_get_col($char: u8, $col: u8) -> u8
@font_get_glyph($char: u8, $dest: ptr ram u8)
@font_render($str: str ram, $dest: ptr ram u8, $max_cols: u16) -> u16
@font_text_cols($str: str ram) -> u16
@font_render_capacity() -> u16
@font_render_buf($str: str ram, $out_cols: ptr ram u16) -> ptr ram u8
@font_stream($str: str ram, $sink: fn(u8))
@font_fold($str: str ram, $init: u8, $sink: fn(u8,u8)->u8) -> u8
```

## Behavior

- Glyph width: 5 columns.
- Height: 8 bits per column.
- Advance: 6 columns, including a blank spacer column.
- `@font_get_col` returns `0` when `col > 4`.
- `@font_render` writes columns to the caller buffer up to `max_cols`.
- `@font_render_buf` uses an internal 128-byte scratch buffer and overwrites it
  on each call.
- `@font_stream` sends columns to a `fn(u8)` callback.
- `@font_fold` applies an accumulator callback.

## Example

```ik8b
target atmega328p
import std/font

@main {
    ram str $s = "A"
    ram mut $cols: u16 = 0
    ram ptr u8 $buf = @font_render_buf($s, &$cols)
    loop * {}
}
```
