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

 
import std/string

@main {
    ram mut $ok: u8 = 1

    # 1. strlen
    ram str $msg = "hello"
    ? @strlen($msg) != 5 { 0 -> $ok }

    # 2. strcpy
    ram mut $str_buf: u8[8] = 0
    @strcpy(&$str_buf[0], $msg)
    ? $str_buf[0] != 104 { 0 -> $ok } # 'h'
    ? $str_buf[4] != 111 { 0 -> $ok } # 'o'
    ? $str_buf[5] != 0 { 0 -> $ok }

    # 3. strncpy
    ram mut $nc_buf: u8[8] = 99
    @strncpy(&$nc_buf[0], "ab", 4)
    ? $nc_buf[0] != 97 { 0 -> $ok } # 'a'
    ? $nc_buf[1] != 98 { 0 -> $ok } # 'b'
    ? $nc_buf[2] != 0 { 0 -> $ok }
    ? $nc_buf[3] != 0 { 0 -> $ok }
    ? $nc_buf[4] != 99 { 0 -> $ok }

    # 4. strcat & strncat
    @strcat(&$nc_buf[0], "cd")
    ? $nc_buf[2] != 99 { 0 -> $ok } # 'c'
    ? $nc_buf[3] != 100 { 0 -> $ok } # 'd'
    ? $nc_buf[4] != 0 { 0 -> $ok }

    @strncat(&$nc_buf[0], "efg", 2)
    ? $nc_buf[4] != 101 { 0 -> $ok } # 'e'
    ? $nc_buf[5] != 102 { 0 -> $ok } # 'f'
    ? $nc_buf[6] != 0 { 0 -> $ok }

    # 5. strcmp & strncmp
    ? @strcmp($msg, "hello") != 0 { 0 -> $ok }
    ? @strncmp("abc", "abd", 2) != 0 { 0 -> $ok }
    ? @strncmp("abc", "abd", 3) >= 0 { 0 -> $ok }

    # 6. strchr & strrchr
    ram ptr u8 $sch = @strchr("hello", 108) # 'l'
    ? $sch != ("hello" + 2) { 0 -> $ok }

    ram ptr u8 $srch = @strrchr("hello", 108)
    ? $srch != ("hello" + 3) { 0 -> $ok }

    # 7. strstr
    ram ptr u8 $sstr = @strstr("hello world", "world")
    ? $sstr != ("hello world" + 6) { 0 -> $ok }

    # 8. strspn, strcspn, strpbrk
    ? @strspn("hello", "helo") != 5 { 0 -> $ok }
    ? @strcspn("hello", "world") != 2 { 0 -> $ok }

    ram ptr u8 $spbrk = @strpbrk("hello", "ol")
    ? $spbrk != ("hello" + 2) { 0 -> $ok }

    # 9. Case conversions
    ? @tolower(65) != 97 { 0 -> $ok }
    ? @toupper(97) != 65 { 0 -> $ok }

    # 10. Character classifications
    ? !@isspace(32) { 0 -> $ok }
    ? !@isdigit(49) { 0 -> $ok }
    ? !@isalpha(97) { 0 -> $ok }
    ? !@isalnum(49) { 0 -> $ok }
    ? !@isxdigit(97) { 0 -> $ok }
    ? !@islower(97) { 0 -> $ok }
    ? !@isupper(65) { 0 -> $ok }

    # Force success status into R16 by storing into an SRAM array
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]

    loop * {}
}
