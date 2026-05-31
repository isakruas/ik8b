@main {
    # Store binary data in flash program memory
    flash str $font = "\x00\x00\x00\x00\x00\x3E\x5B\x4F\x5B\x3E\x3E\x6B"

    ram mut $ok: u8 = 1

    # First byte is 0x00
    ram mut $b: u8 = $font[0]
    ? $b != 0 { 0 -> $ok }

    # 6th byte is 0x3E
    $font[5] -> $b
    ? $b != 62 { 0 -> $ok }

    # 8th byte is 0x4F (79)
    $font[7] -> $b
    ? $b != 79 { 0 -> $ok }

    # Multiple flash strings must each resolve to their own bytes: every
    # string shares one blob label plus its own offset. A regression here
    # makes the second string read from flash address ~0 (the vector table).
    flash str $msg = "Hi\x07"
    $msg[0] -> $b
    ? $b != 72 { 0 -> $ok }   # 'H'
    $msg[1] -> $b
    ? $b != 105 { 0 -> $ok }  # 'i'
    $msg[2] -> $b
    ? $b != 7 { 0 -> $ok }

    # The first string must still read correctly after the second exists.
    $font[5] -> $b
    ? $b != 62 { 0 -> $ok }

    # Validate output
    $ok -> $ok
    loop * {}
}
