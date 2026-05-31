# Copyright 2026 The ik8b Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -------------------------------------------------------------
# Bit Manipulation and Rotation Library
# -------------------------------------------------------------

# Rotates an 8-bit value left by $n bits.
@rotl8($val: u8, $n: u8) -> u8 {
    ram imut $shift: u8 = $n & 7
    ram mut $res: u8 = $val
    loop 0..$shift -> $i {
        ram imut $carry: u8 = ($res & 128) / 128
        $res * 2 + $carry -> $res
    }
    return $res
}

# Rotates an 8-bit value right by $n bits.
@rotr8($val: u8, $n: u8) -> u8 {
    ram imut $shift: u8 = $n & 7
    ram mut $res: u8 = $val
    loop 0..$shift -> $i {
        ram imut $carry: u8 = $res & 1
        $res / 2 -> $res
        ? $carry != 0 {
            $res + 128 -> $res
        }
    }
    return $res
}

# Rotates a 16-bit value left by $n bits.
@rotl16($val: u16, $n: u8) -> u16 {
    ram imut $shift: u8 = $n & 15
    ram mut $res: u16 = $val
    loop 0..$shift -> $i {
        ram imut $carry: u16 = ($res & 32768) / 32768
        $res * 2 + $carry -> $res
    }
    return $res
}

# Rotates a 16-bit value right by $n bits.
@rotr16($val: u16, $n: u8) -> u16 {
    ram imut $shift: u8 = $n & 15
    ram mut $res: u16 = $val
    loop 0..$shift -> $i {
        ram imut $carry: u16 = $res & 1
        $res / 2 -> $res
        ? $carry != 0 {
            $res + 32768 -> $res
        }
    }
    return $res
}

# Counts the number of set bits (1s) in an 8-bit value (population count).
@popcount8($val: u8) -> u8 {
    ram mut $count: u8 = 0
    ram mut $v: u8 = $val
    loop 0..8 -> $i {
        ? ($v & 1) != 0 {
            $count + 1 -> $count
        }
        $v / 2 -> $v
    }
    return $count
}

# Counts the number of set bits (1s) in a 16-bit value.
@popcount16($val: u16) -> u8 {
    ram mut $count: u8 = 0
    ram mut $v: u16 = $val
    loop 0..16 -> $i {
        ? ($v & 1) != 0 {
            $count + 1 -> $count
        }
        $v / 2 -> $v
    }
    return $count
}

# Returns the parity of an 8-bit value (1 if odd number of set bits, 0 otherwise).
@parity8($val: u8) -> u8 {
    ram imut $cnt: u8 = @popcount8($val)
    return $cnt & 1
}

# Reverses the bits of an 8-bit value.
@reverse8($val: u8) -> u8 {
    ram mut $res: u8 = 0
    ram mut $v: u8 = $val
    loop 0..8 -> $i {
        $res * 2 -> $res
        $res | ($v & 1) -> $res
        $v / 2 -> $v
    }
    return $res
}

# Reverses the bits of a 16-bit value.
@reverse16($val: u16) -> u16 {
    ram mut $res: u16 = 0
    ram mut $v: u16 = $val
    loop 0..16 -> $i {
        $res * 2 -> $res
        $res | ($v & 1) -> $res
        $v / 2 -> $v
    }
    return $res
}
