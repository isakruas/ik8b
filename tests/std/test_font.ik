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

    $ok -> $ok
    loop * {}
}
