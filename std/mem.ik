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
# Complete Memory Utilities Library
# -------------------------------------------------------------

# Copies $len bytes from Program Flash memory area $src to SRAM $dest.
@memcpy_P($dest: ptr ram u8, $src: ptr flash u8, $len: u16) {
    loop 0..$len -> $i {
        *($src + $i) -> *($dest + $i)
    }
}

# Fills the first $len bytes of the SRAM memory area $dest with constant byte $val.
@memset($dest: ptr ram u8, $val: u8, $len: u16) {
    loop 0..$len -> $i {
        $val -> *($dest + $i)
    }
}

# Compares the first $len bytes of SRAM memory areas $s1 and $s2.
# Returns 0 if identical, otherwise returns the difference of the first differing bytes.
@memcmp($s1: ptr ram u8, $s2: ptr ram u8, $len: u16) -> i16 {
    loop 0..$len -> $i {
        ram imut $b1: u8 = *($s1 + $i)
        ram imut $b2: u8 = *($s2 + $i)
        ? $b1 != $b2 {
            ram imut $diff: i16 = $b1 - $b2
            return $diff
        }
    }
    return 0
}

# Copies $len bytes from memory area $src to memory area $dest in SRAM.
@memcpy($dest: ptr ram u8, $src: ptr ram u8, $len: u16) {
    loop 0..$len -> $i {
        *($src + $i) -> *($dest + $i)
    }
}

# Copies $len bytes from memory area $src to $dest, correctly handling overlapping memory regions.
@memmove($dest: ptr ram u8, $src: ptr ram u8, $len: u16) {
    ? $dest < $src {
        loop 0..$len -> $i {
            *($src + $i) -> *($dest + $i)
        }
    } : {
        ? $dest > $src {
            loop 0..$len -> $step {
                ram imut $i: u16 = $len - 1 - $step
                *($src + $i) -> *($dest + $i)
            }
        }
    }
}

# Locates the first occurrence of character $c in the first $n bytes of memory area $s.
@memchr($s: ptr ram u8, $c: u8, $n: u16) -> ptr ram u8 {
    loop 0..$n -> $i {
        ram imut $ch: u8 = *($s + $i)
        ? $ch == $c {
            return $s + $i
        }
    }
    return 0
}

# Locates the last occurrence of character $c in the first $n bytes of memory area $s.
@memrchr($s: ptr ram u8, $c: u8, $n: u16) -> ptr ram u8 {
    loop 0..$n -> $step {
        ram imut $i: u16 = $n - 1 - $step
        ram imut $ch: u8 = *($s + $i)
        ? $ch == $c {
            return $s + $i
        }
    }
    return 0
}

# Copies bytes from memory area $src to $dest, stopping when character $c is met.
# Returns a pointer to the byte after $c in $dest, or 0 if $c was not found in $len bytes.
@memccpy($dest: ptr ram u8, $src: ptr ram u8, $c: u8, $len: u16) -> ptr ram u8 {
    loop 0..$len -> $i {
        ram imut $ch: u8 = *($src + $i)
        $ch -> *($dest + $i)
        ? $ch == $c {
            return $dest + $i + 1
        }
    }
    return 0
}
