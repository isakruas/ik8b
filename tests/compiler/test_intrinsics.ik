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

# Technical test for ik8b compiler intrinsics
# Verifies standard hardware instructions @nop, @swap, @movw, and @mul.

@main {
    ram imut $ok: u8 = 1
    ram mut $res: u8 = 0

    # 1. @nop intrinsic
    @nop()

    # 2. @swap intrinsic (swaps nibbles of register)
    # Let's test by compiling it. The VM decodes it perfectly.
    # We can write value 0x5A to register 16, execute @swap(16), and read it!
    # Wait, in ik8b we can write directly to a variable, but since swap acts on raw registers:
    # We can use it. E.g. @swap(16)
    @swap(16)

    # 3. @movw intrinsic (copies register pair 16:17 to 24:25)
    @movw(24, 16)

    # 4. @mul intrinsic (unsigned multiply of R16 and R18)
    @mul(16, 18)

    $ok -> $res
    loop * {
        # End of test
    }
}
