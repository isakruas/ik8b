# Copyright 2026 The ik8b Authors.
#
# Validates std/font @font_stream (void callback) by streaming the column
# bytes into a persistent EEPROM accumulator and comparing against @font_fold.
# Uses EEPROM, so it is automatically skipped on cores without it.

import std/font
import std/eeprom

# Accumulator callbacks. The void sink XORs each streamed byte into EEPROM[0].
@fxor($acc: u8, $b: u8) -> u8 { return $acc ^ $b }
@ee_sink($b: u8) {
    ram imut $cur: u8 = @eeprom_read(0)
    @eeprom_write(0, $cur ^ $b)
}

@main {
    ram mut $ok: u8 = 1

    @eeprom_write(0, 0)
    @font_stream("Hi", &@ee_sink)
    ram imut $streamed: u8 = @eeprom_read(0)

    ram imut $folded: u8 = @font_fold("Hi", 0, &@fxor)
    ? $streamed != $folded { 0 -> $ok }

    $ok -> $ok
    loop * {}
}
