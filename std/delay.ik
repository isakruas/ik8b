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
# Dynamic Cycle-Accurate Delay Library
# -------------------------------------------------------------

# Internal delay loop consuming ~4 clock cycles per iteration.
@_delay_cycles($cycles: u16) {
    ram mut $i: u16 = $cycles
    loop * {
        ? $i == 0 { return }
        $i - 1 -> $i
        @nop()
    }
}

# Delays for $ms milliseconds given a CPU clock frequency in MHz (e.g. 8 or 16).
@delay_ms($ms: u16, $clock_mhz: u16) {
    loop 0..$ms -> $x {
        # clock_mhz * 1000 is the number of cycles per millisecond.
        # Loop consumes ~4 cycles per iteration, so cycles / 4 = clock_mhz * 250.
        ram imut $cycles_per_ms: u16 = $clock_mhz * 250
        @_delay_cycles($cycles_per_ms)
    }
}

# Delays for $us microseconds given a CPU clock frequency in MHz (e.g. 8 or 16).
@delay_us($us: u16, $clock_mhz: u16) {
    # clock_mhz is the number of cycles per microsecond.
    # Loop consumes ~4 cycles per iteration, so cycles / 4 = clock_mhz / 4.
    ram imut $cycles_per_us: u16 = $clock_mhz / 4
    ram mut $final_cycles: u16 = $cycles_per_us * $us
    ? $final_cycles == 0 {
        1 -> $final_cycles
    }
    @_delay_cycles($final_cycles)
}
