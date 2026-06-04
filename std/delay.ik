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
# Delay Library (portable across all AVR cores)
# -------------------------------------------------------------
# For precise, cycle-accurate timing (e.g. bit-banging SPI/I2C), you can use the
# `@burn(N)` intrinsic directly. It accepts either:
# 1. A literal constant (e.g. `@burn(4)`), emitting exact padding instructions.
# 2. A variable, generating a precise inline loop (exactly 4 cycles per iteration).
#
# Note: real-world timing also depends on the chip actually running at the clock
# returned by @cpu_mhz(). ATmega parts ship on the internal RC oscillator (often
# 1 MHz); set the fuses for your crystal, or return the clock the chip is really
# using.
#
# Projects using @delay_ms/@delay_us must define:
#
#     @cpu_mhz() -> u16 { return 16 }
#
# Use @_delay_ms/@_delay_us directly when one call needs an explicit clock.

# Delays ~$ms milliseconds at a CPU clock of $clock_mhz MHz (e.g. 8 or 16).
@_delay_ms($ms: u16, $clock_mhz: u16) {
    # One ms at $clock_mhz MHz is clock_mhz*1000 cycles.
    # The dynamic `@burn($iters)` loop guarantees exactly 4 cycles per iteration.
    # Therefore, we need (clock_mhz*1000/4) iterations per ms.
    # The total would overflow u16, so it is spent in $ms chunks.
    ram imut $iters_per_ms: u16 = $clock_mhz * 1000 / 4
    loop 0..$ms -> $x {
        @burn($iters_per_ms)
    }
}

# Delays ~$ms milliseconds using the project-wide CPU clock from @cpu_mhz().
@delay_ms($ms: u16) {
    @_delay_ms($ms, @cpu_mhz())
}

# Delays ~$us microseconds at a CPU clock of $clock_mhz MHz.
# Range: $us * $clock_mhz must fit in 16 bits (~16000 us at 16 MHz); for longer
# waits use @delay_ms. Very short waits are dominated by call overhead.
@_delay_us($us: u16, $clock_mhz: u16) {
    # One us at $clock_mhz MHz is clock_mhz cycles.
    # The dynamic `@burn($iters)` loop guarantees exactly 4 cycles per iteration.
    ram mut $iters: u16 = $us * $clock_mhz / 4
    ? $iters == 0 {
        1 -> $iters
    }
    @burn($iters)
}

# Delays ~$us microseconds using the project-wide CPU clock from @cpu_mhz().
@delay_us($us: u16) {
    @_delay_us($us, @cpu_mhz())
}
