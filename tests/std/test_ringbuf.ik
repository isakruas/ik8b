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

import std/ringbuf

@main {
    ram mut $ok: u8 = 1
    ram mut $buf: u8[5] = 0
    ram mut $head: u8 = 0
    ram mut $tail: u8 = 0
    ram mut $count: u8 = 0

    @ringbuf_init(&$buf[0], &$head, &$tail, &$count)

    ? @ringbuf_empty(&$count) != 1 { 0 -> $ok }

    @ringbuf_push(&$buf[0], &$head, &$count, 5, 10)
    @ringbuf_push(&$buf[0], &$head, &$count, 5, 20)

    ? @ringbuf_count(&$count) != 2 { 0 -> $ok }
    ? @ringbuf_peek(&$buf[0], &$tail, &$count) != 10 { 0 -> $ok }

    ram imut $v1: u8 = @ringbuf_pop(&$buf[0], &$tail, &$count, 5)
    ? $v1 != 10 { 0 -> $ok }

    ram imut $v2: u8 = @ringbuf_pop(&$buf[0], &$tail, &$count, 5)
    ? $v2 != 20 { 0 -> $ok }

    ? @ringbuf_empty(&$count) != 1 { 0 -> $ok }

    @ringbuf_push(&$buf[0], &$head, &$count, 5, 1)
    @ringbuf_push(&$buf[0], &$head, &$count, 5, 2)
    @ringbuf_push(&$buf[0], &$head, &$count, 5, 3)
    @ringbuf_push(&$buf[0], &$head, &$count, 5, 4)
    @ringbuf_push(&$buf[0], &$head, &$count, 5, 5)

    ? @ringbuf_full(&$count, 5) != 1 { 0 -> $ok }

    ram imut $p: u8 = @ringbuf_push(&$buf[0], &$head, &$count, 5, 6)
    ? $p != 0 { 0 -> $ok } 

    @ringbuf_clear(&$head, &$tail, &$count)
    ? @ringbuf_empty(&$count) != 1 { 0 -> $ok }

    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]
    loop * {}
}
