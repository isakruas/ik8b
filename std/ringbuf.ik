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
# Ring Buffer Library (Pure Software)
# -------------------------------------------------------------

@ringbuf_init($buf: ptr ram u8, $head: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8) {
    0 -> *$head
    0 -> *$tail
    0 -> *$count
}

@ringbuf_push($buf: ptr ram u8, $head: ptr ram u8, $count: ptr ram u8, $size: u8, $val: u8) -> u8 {
    ram imut $c: u8 = *$count
    ? $c == $size {
        return 0
    }
    
    ram imut $h: u8 = *$head
    $val -> *($buf + $h)
    
    ram mut $h_next: u8 = $h + 1
    ? $h_next == $size { 0 -> $h_next }
    $h_next -> *$head
    
    $c + 1 -> *$count
    return 1
}

@ringbuf_pop($buf: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8, $size: u8) -> u8 {
    ram imut $c: u8 = *$count
    ? $c == 0 {
        return 0
    }
    
    ram imut $t: u8 = *$tail
    ram imut $val: u8 = *($buf + $t)
    
    ram mut $t_next: u8 = $t + 1
    ? $t_next == $size { 0 -> $t_next }
    $t_next -> *$tail
    
    $c - 1 -> *$count
    return $val
}

@ringbuf_full($count: ptr ram u8, $size: u8) -> u8 {
    ram imut $c: u8 = *$count
    ? $c == $size {
        return 1
    }
    return 0
}

@ringbuf_empty($count: ptr ram u8) -> u8 {
    ram imut $c: u8 = *$count
    ? $c == 0 {
        return 1
    }
    return 0
}

@ringbuf_count($count: ptr ram u8) -> u8 {
    return *$count
}

@ringbuf_clear($head: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8) {
    0 -> *$head
    0 -> *$tail
    0 -> *$count
}

@ringbuf_peek($buf: ptr ram u8, $tail: ptr ram u8, $count: ptr ram u8) -> u8 {
    ram imut $c: u8 = *$count
    ? $c == 0 {
        return 0
    }
    ram imut $t: u8 = *$tail
    return *($buf + $t)
}
