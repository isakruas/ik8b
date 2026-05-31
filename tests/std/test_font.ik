# Copyright 2026 The ik8b Authors.
#
# Technical test for std/font.ik

import std/font

@main {
    ram mut $ok: u8 = 1
    ram mut $b: u8 = 0

    # Test Space character (' ', ascii 32)
    @font_get_col(32, 0) -> $b
    ? $b != 0 { 100 -> $ok }

    # Test 'A' character (ascii 65)
    # The letter 'A' is at 65 * 5 = 325
    # The columns for 'A' in the standard font are: 0x7C 0x12 0x11 0x12 0x7C (124, 18, 17, 18, 124)
    @font_get_col(65, 0) -> $b
    ? $b != 124 { 101 -> $ok }

    @font_get_col(65, 1) -> $b
    ? $b != 18 { 102 -> $ok }

    @font_get_col(65, 2) -> $b
    ? $b != 17 { 103 -> $ok }

    @font_get_col(65, 4) -> $b
    ? $b != 124 { 104 -> $ok }

    # Test out of bounds column
    @font_get_col(65, 5) -> $b
    ? $b != 0 { 105 -> $ok }

    # Test control char 10 (newline symbol in glcdfont)
    @font_get_col(10, 0) -> $b
    ? $b != 255 { 106 -> $ok }
    
    # Test control char 10 column 1
    @font_get_col(10, 1) -> $b
    ? $b != 231 {
        $b -> $ok
    }

    # ---- Glyph geometry constants ----
    @font_width()   -> $b
    ? $b != 5 { 110 -> $ok }
    @font_height()  -> $b
    ? $b != 8 { 111 -> $ok }
    @font_advance() -> $b
    ? $b != 6 { 112 -> $ok }

    # ---- font_get_glyph: copy the 5 columns of 'A' into a buffer ----
    ram mut $glyph: u8[5] = 0
    @font_get_glyph(65, &$glyph[0])
    ? $glyph[0] != 124 { 120 -> $ok }
    ? $glyph[1] != 18  { 121 -> $ok }
    ? $glyph[2] != 17  { 122 -> $ok }
    ? $glyph[3] != 18  { 123 -> $ok }
    ? $glyph[4] != 124 { 124 -> $ok }

    # ---- font_render: render "AB" into a column stream ----
    # 12 columns expected: 5 glyph + 1 spacing per char.
    ram mut $cols: u8[16] = 0
    ram mut $n: u16 = 0
    @font_render("AB", &$cols[0], 16) -> $n
    ? $n != 12 { 130 -> $ok }

    # Each rendered column must match font_get_col, with a blank spacer.
    @font_get_col(65, 0) -> $b
    ? $cols[0] != $b { 131 -> $ok }
    @font_get_col(65, 4) -> $b
    ? $cols[4] != $b { 132 -> $ok }
    ? $cols[5] != 0 { 133 -> $ok }   # spacing after 'A'
    @font_get_col(66, 0) -> $b
    ? $cols[6] != $b { 134 -> $ok }
    @font_get_col(66, 4) -> $b
    ? $cols[10] != $b { 135 -> $ok }
    ? $cols[11] != 0 { 136 -> $ok }  # spacing after 'B'

    # ---- font_render: $max_cols must cap the output ----
    ram mut $small: u8[8] = 0
    @font_render("AB", &$small[0], 3) -> $n
    ? $n != 3 { 140 -> $ok }
    @font_get_col(65, 2) -> $b
    ? $small[2] != $b { 141 -> $ok }

    # ---- font_text_cols: columns needed = chars * 6 ----
    @font_text_cols("AB") -> $n
    ? $n != 12 { 150 -> $ok }
    @font_text_cols("hello world") -> $n
    ? $n != 66 { 151 -> $ok }
    @font_text_cols("") -> $n
    ? $n != 0 { 152 -> $ok }

    # ---- font_render_capacity ----
    @font_render_capacity() -> $n
    ? $n != 128 { 160 -> $ok }

    # ---- font_render_buf: library allocates, returns ptr + count ----
    ram mut $rn: u16 = 0
    ram ptr u8 $rp = @font_render_buf("AB", &$rn)
    ? $rn != 12 { 170 -> $ok }
    @font_get_col(65, 0) -> $b
    ? *($rp + 0) != $b { 171 -> $ok }
    @font_get_col(66, 4) -> $b
    ? *($rp + 10) != $b { 172 -> $ok }
    ? *($rp + 11) != 0 { 173 -> $ok }   # trailing spacing column

    $ok -> $ok
    loop * {}
}
