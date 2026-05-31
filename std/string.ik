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
# Complete String and Character Utility Library
# -------------------------------------------------------------

# =============================================================
# 1. NUL-Terminated String Manipulation
# =============================================================

# Computes the length of a NUL-terminated string in SRAM.
@strlen($s: str ram) -> u16 {
    ram mut $len: u16 = 0
    loop * {
        ram imut $ch: u8 = *($s + $len)
        ? $ch == 0 { return $len }
        $len + 1 -> $len
    }
    return $len
}

# Copies a NUL-terminated string from $src to SRAM buffer $dest.
@strcpy($dest: ptr ram u8, $src: str ram) {
    ram mut $i: u16 = 0
    loop * {
        ram imut $ch: u8 = *($src + $i)
        $ch -> *($dest + $i)
        ? $ch == 0 { return }
        $i + 1 -> $i
    }
}

# Copies up to $n characters from $src to $dest. Pads with NUL if $src is shorter than $n.
@strncpy($dest: ptr ram u8, $src: str ram, $n: u16) {
    ram mut $i: u16 = 0
    ram mut $pad: bool = false
    loop 0..$n -> $step {
        ? $pad {
            0 -> *($dest + $step)
        } : {
            ram imut $ch: u8 = *($src + $i)
            $ch -> *($dest + $step)
            ? $ch == 0 {
                true -> $pad
            } : {
                $i + 1 -> $i
            }
        }
    }
}

# Appends string $src to the end of string $dest.
@strcat($dest: ptr ram u8, $src: str ram) {
    ram imut $len: u16 = @strlen($dest)
    @strcpy($dest + $len, $src)
}

# Appends up to $n characters from $src to $dest, and NUL-terminates the result.
@strncat($dest: ptr ram u8, $src: str ram, $n: u16) {
    ram imut $len: u16 = @strlen($dest)
    ram mut $i: u16 = 0
    loop 0..$n -> $step {
        ram imut $ch: u8 = *($src + $i)
        $ch -> *($dest + $len + $step)
        ? $ch == 0 { return }
        $i + 1 -> $i
    }
    0 -> *($dest + $len + $n)
}

# Compares two NUL-terminated strings lexicographically.
# Returns 0 if identical, or the difference of the first non-matching bytes.
@strcmp($s1: str ram, $s2: str ram) -> i16 {
    ram mut $i: u16 = 0
    loop * {
        ram imut $b1: u8 = *($s1 + $i)
        ram imut $b2: u8 = *($s2 + $i)
        ? $b1 != $b2 {
            ram imut $diff: i16 = $b1 - $b2
            return $diff
        }
        ? $b1 == 0 { return 0 }
        $i + 1 -> $i
    }
    return 0
}

# Compares up to $n characters of two strings lexicographically.
@strncmp($s1: str ram, $s2: str ram, $n: u16) -> i16 {
    loop 0..$n -> $i {
        ram imut $b1: u8 = *($s1 + $i)
        ram imut $b2: u8 = *($s2 + $i)
        ? $b1 != $b2 {
            ram imut $diff: i16 = $b1 - $b2
            return $diff
        }
        ? $b1 == 0 { return 0 }
    }
    return 0
}

# Finds the first occurrence of character $c in string $s. Returns pointer or 0.
@strchr($s: str ram, $c: u8) -> ptr ram u8 {
    ram mut $i: u16 = 0
    loop * {
        ram imut $ch: u8 = *($s + $i)
        ? $ch == $c { return $s + $i }
        ? $ch == 0 { return 0 }
        $i + 1 -> $i
    }
    return 0
}

# Finds the last occurrence of character $c in string $s. Returns pointer or 0.
@strrchr($s: str ram, $c: u8) -> ptr ram u8 {
    ram imut $len: u16 = @strlen($s)
    loop 0..($len + 1) -> $step {
        ram imut $idx: u16 = $len - $step
        ram imut $ch: u8 = *($s + $idx)
        ? $ch == $c { return $s + $idx }
    }
    return 0
}

# Finds the first occurrence of substring $needle in string $haystack.
@strstr($haystack: str ram, $needle: str ram) -> ptr ram u8 {
    ram imut $n_len: u16 = @strlen($needle)
    ? $n_len == 0 { return $haystack }
    ram imut $h_len: u16 = @strlen($haystack)
    ? $h_len < $n_len { return 0 }
    
    ram imut $limit: u16 = $h_len - $n_len + 1
    loop 0..$limit -> $i {
        ram mut $match: bool = true
        loop 0..$n_len -> $j {
            ram imut $hc: u8 = *($haystack + $i + $j)
            ram imut $nc: u8 = *($needle + $j)
            ? $hc != $nc { false -> $match }
        }
        ? $match { return $haystack + $i }
    }
    return 0
}

# Computes the length of the initial segment of $s consisting entirely of characters in $accept.
@strspn($s: str ram, $accept: str ram) -> u16 {
    ram mut $i: u16 = 0
    loop * {
        ram imut $ch: u8 = *($s + $i)
        ? $ch == 0 { return $i }
        ram ptr u8 $found = @strchr($accept, $ch)
        ? $found == 0 { return $i }
        $i + 1 -> $i
    }
    return $i
}

# Computes the length of the initial segment of $s consisting entirely of characters NOT in $reject.
@strcspn($s: str ram, $reject: str ram) -> u16 {
    ram mut $i: u16 = 0
    loop * {
        ram imut $ch: u8 = *($s + $i)
        ? $ch == 0 { return $i }
        ram ptr u8 $found = @strchr($reject, $ch)
        ? $found != 0 { return $i }
        $i + 1 -> $i
    }
    return $i
}

# Finds the first character in string $s that matches any character in string $accept.
@strpbrk($s: str ram, $accept: str ram) -> ptr ram u8 {
    ram mut $i: u16 = 0
    loop * {
        ram imut $ch: u8 = *($s + $i)
        ? $ch == 0 { return 0 }
        ram ptr u8 $found = @strchr($accept, $ch)
        ? $found != 0 { return $s + $i }
        $i + 1 -> $i
    }
    return 0
}

# =============================================================
# 2. Character Classification & Conversion
# =============================================================

# Converts an uppercase letter to lowercase.
@tolower($c: u8) -> u8 {
    ? $c >= 65 {
        ? $c <= 90 { return $c + 32 }
    }
    return $c
}

# Converts a lowercase letter to uppercase.
@toupper($c: u8) -> u8 {
    ? $c >= 97 {
        ? $c <= 122 { return $c - 32 }
    }
    return $c
}

# Checks for whitespace characters (' ', '\t', '\r', '\n', '\v', '\f').
@isspace($c: u8) -> bool {
    ? $c == 32 { return true }
    ? $c >= 9 {
        ? $c <= 13 { return true }
    }
    return false
}

# Checks for a digit ('0' through '9').
@isdigit($c: u8) -> bool {
    ? $c >= 48 {
        ? $c <= 57 { return true }
    }
    return false
}

# Checks for an alphabetic character.
@isalpha($c: u8) -> bool {
    ? $c >= 65 {
        ? $c <= 90 { return true }
    }
    ? $c >= 97 {
        ? $c <= 122 { return true }
    }
    return false
}

# Checks for an alphanumeric character.
@isalnum($c: u8) -> bool {
    ram imut $alpha: bool = @isalpha($c)
    ? $alpha { return true }
    ram imut $digit: bool = @isdigit($c)
    ? $digit { return true }
    return false
}

# Checks for a hexadecimal digit ('0'-'9', 'A'-'F', 'a'-'f').
@isxdigit($c: u8) -> bool {
    ram imut $digit: bool = @isdigit($c)
    ? $digit { return true }
    ? $c >= 65 {
        ? $c <= 70 { return true }
    }
    ? $c >= 97 {
        ? $c <= 102 { return true }
    }
    return false
}

# Checks for a lowercase alphabetic character.
@islower($c: u8) -> bool {
    ? $c >= 97 {
        ? $c <= 122 { return true }
    }
    return false
}

# Checks for an uppercase alphabetic character.
@isupper($c: u8) -> bool {
    ? $c >= 65 {
        ? $c <= 90 { return true }
    }
    return false
}
