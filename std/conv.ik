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
# Complete Type Conversion Library
# -------------------------------------------------------------

# Parses a NUL-terminated decimal string to a signed 16-bit integer.
@atoi($s: str ram) -> i16 {
    ram mut $res: i16 = 0
    ram mut $sign: i16 = 1
    ram mut $i: u16 = 0

    ram imut $first: u8 = *($s)
    ? $first == 45 { # '-'
        -1 -> $sign
        1 -> $i
    } : {
        ? $first == 43 { # '+'
            1 -> $i
        }
    }

    loop * {
        ram imut $ch: u8 = *($s + $i)
        ? $ch < 48 { return $res * $sign }
        ? $ch > 57 { return $res * $sign }

        ram imut $digit: i16 = $ch - 48
        $res * 10 + $digit -> $res
        $i + 1 -> $i
    }

    return $res * $sign
}

# Parses a NUL-terminated decimal string to an unsigned 16-bit integer.
@atou($s: str ram) -> u16 {
    ram mut $res: u16 = 0
    ram mut $i: u16 = 0
    loop * {
        ram imut $ch: u8 = *($s + $i)
        ? $ch < 48 { return $res }
        ? $ch > 57 { return $res }
        
        ram imut $digit: u16 = $ch - 48
        $res * 10 + $digit -> $res
        $i + 1 -> $i
    }
    return $res
}

# Formats a signed 16-bit integer as a NUL-terminated decimal string.
@itoa($val: i16, $buf: ptr ram u8) {
    ram mut $v: i16 = $val
    ram mut $i: u16 = 0

    ? $v == 0 {
        48 -> *($buf)
        0 -> *($buf + 1)
        return
    }

    ram mut $is_neg: bool = false
    ? $v < 0 {
        true -> $is_neg
        0 - $v -> $v
    }

    ram mut $temp: u8[6] = 0
    ram mut $t_idx: u16 = 0
    loop 0..6 -> $step {
        ? $v != 0 {
            ram imut $rem: i16 = $v % 10
            ram imut $digit: u8 = $rem + 48
            $digit -> $temp[$t_idx]
            $t_idx + 1 -> $t_idx
            $v / 10 -> $v
        }
    }

    ? $is_neg {
        45 -> *($buf + $i)
        $i + 1 -> $i
    }

    loop 0..$t_idx -> $step {
        ram imut $rev_idx: u16 = $t_idx - 1 - $step
        ram imut $ch: u8 = $temp[$rev_idx]
        $ch -> *($buf + $i)
        $i + 1 -> $i
    }

    0 -> *($buf + $i)
}

# Formats an unsigned 16-bit integer as a NUL-terminated decimal string.
@utoa($val: u16, $buf: ptr ram u8) {
    ram mut $v: u16 = $val
    ram mut $i: u16 = 0

    ? $v == 0 {
        48 -> *($buf)
        0 -> *($buf + 1)
        return
    }

    ram mut $temp: u8[5] = 0
    ram mut $t_idx: u16 = 0
    loop 0..5 -> $step {
        ? $v != 0 {
            ram imut $rem: u16 = $v % 10
            ram imut $digit: u8 = $rem + 48
            $digit -> $temp[$t_idx]
            $t_idx + 1 -> $t_idx
            $v / 10 -> $v
        }
    }

    loop 0..$t_idx -> $step {
        ram imut $rev_idx: u16 = $t_idx - 1 - $step
        ram imut $ch: u8 = $temp[$rev_idx]
        $ch -> *($buf + $i)
        $i + 1 -> $i
    }

    0 -> *($buf + $i)
}

# Formats an unsigned 16-bit integer as a NUL-terminated hexadecimal string.
@utoa_hex($val: u16, $buf: ptr ram u8) {
    ram mut $v: u16 = $val
    ram mut $i: u16 = 0

    ? $v == 0 {
        48 -> *($buf)
        0 -> *($buf + 1)
        return
    }

    ram mut $temp: u8[5] = 0
    ram mut $t_idx: u16 = 0
    loop 0..5 -> $step {
        ? $v != 0 {
            ram imut $rem: u16 = $v & 15
            ram mut $digit: u8 = 0
            ? $rem < 10 {
                $rem + 48 -> $digit
            } : {
                $rem - 10 + 65 -> $digit # 'A'
            }
            $digit -> $temp[$t_idx]
            $t_idx + 1 -> $t_idx
            $v / 16 -> $v
        }
    }

    loop 0..$t_idx -> $step {
        ram imut $rev_idx: u16 = $t_idx - 1 - $step
        ram imut $ch: u8 = $temp[$rev_idx]
        $ch -> *($buf + $i)
        $i + 1 -> $i
    }

    0 -> *($buf + $i)
}

# Parses a NUL-terminated hexadecimal string to an unsigned 16-bit integer.
# Supports optional leading "0x" or "0X".
@atou_hex($s: str ram) -> u16 {
    ram mut $res: u16 = 0
    ram mut $i: u16 = 0
    
    ram imut $c0: u8 = *($s)
    ram imut $c1: u8 = *($s + 1)
    ? $c0 == 48 { # '0'
        ? $c1 == 120 { # 'x'
            2 -> $i
        } : {
            ? $c1 == 88 { # 'X'
                2 -> $i
            }
        }
    }
    
    loop * {
        ram imut $ch: u8 = *($s + $i)
        ram mut $digit: u16 = 0
        ram mut $valid: bool = false
        ? $ch >= 48 {
            ? $ch <= 57 {
                $ch - 48 -> $digit
                true -> $valid
            }
        }
        ? $ch >= 65 {
            ? $ch <= 70 {
                $ch - 65 + 10 -> $digit
                true -> $valid
            }
        }
        ? $ch >= 97 {
            ? $ch <= 102 {
                $ch - 97 + 10 -> $digit
                true -> $valid
            }
        }
        
        ? $valid {
            $res * 16 + $digit -> $res
            $i + 1 -> $i
        } : {
            return $res
        }
    }
    return $res
}
