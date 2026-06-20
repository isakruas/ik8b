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

# Validates the @swtch context-switch intrinsic across every device that has the
# r2-r15 callee-saved register file (the reduced AVRrc core is rejected with a
# "Memory Error", which the test harness treats as a skip).
#
# The test builds a second stack, bootstraps it so a RET lands at @reached's
# entry, then switches into it. Control reaches @reached ONLY if @swtch correctly
# saved the outgoing context, stored the old SP, loaded the new SP, and returned
# into the bootstrapped frame. @reached forces 1 into R16 (the suite's PASS
# signal) and spins; if @swtch were broken, control would fall through @main and
# R16 would never become 1.

@reached() -> u8 {
    ram mut $ok: u8 = 1
    ram mut $res: u8[1] = 0
    $ok -> $res[0]              # force the PASS value (1) into R16
    loop * {}
    return 1
}

@main {
    ram mut $stk: u8[48] = 0
    ram mut $old_sp: u16 = 0

    # Bootstrap the fresh stack so a RET pops @reached's entry address. RET pops
    # a BYTE address, while &@reached is a word address, so convert (word*2).
    # Byte order matches the hardware return address: high byte at the top.
    ram imut $entry: u16 = &@reached
    ram imut $eb: u16 = $entry * 2
    ram imut $top: u16 = &$stk[47]
    ($eb / 256) -> $stk[47]        # return-address high byte
    ($eb & 0xFF) -> $stk[46]       # return-address low byte
    ram imut $new_sp: u16 = $top - 2

    # Switch. On success this never returns here.
    @swtch(&$old_sp, $new_sp)

    # Only reached if the switch failed to transfer control.
    ram mut $fail: u8[1] = 0
    0 -> $fail[0]                  # force 0 into R16 -> FAIL
    loop * {}
}
