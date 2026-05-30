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

# Regression test for pointer/string types and unary statement boundaries.
namespace atmega328p

@id($p: ptr ram u8) -> ptr ram u8 {
    return $p
}

@first($s: str ram) -> u8 {
    return (*$s)
}

@main {
    ram mut $ok: u8 = 1

    ram mut $x: u8 = 5
    ram mut $y: u8 = 0
    ram ptr u8 $p = &$x

    # Unary-start statement must not be consumed by previous line.
    *$p -> $y
    ? $y != 5 {
        0 -> $ok
    }

    # Deref over pointer expression (not only plain variable).
    ram mut $arr: u8[2] = 0
    ram ptr u8 $a = &$arr[0]
    9 -> *($a + 1)
    ? $arr[1] != 9 {
        0 -> $ok
    }

    # Function signatures using ptr/str.
    ram ptr u8 $q = @id($p)
    *$q -> $y
    ? $y != 5 {
        0 -> $ok
    }

    ram str $s = "ok"
    ram mut $ch: u8 = @first($s)
    ? $ch != 111 {
        0 -> $ok
    }

    # EEPROM pointer read/write path (unsupported cores are skipped by harness on Memory Error).
    eeprom mut $ee: u8 = 7
    eeprom ptr u8 $ep = &$ee
    ram mut $rv: u8 = *$ep
    ? $rv != 7 {
        0 -> $ok
    }
    3 -> *$ep
    *$ep -> $rv
    ? $rv != 3 {
        0 -> $ok
    }

    $ok

    loop * {
        # End of test
    }
}
