# Copyright 2026 The ik8b Authors.
# SPDX-License-Identifier: Apache-2.0
#
# Demonstrates the @swtch context-switch intrinsic with a real cooperative
# round-robin scheduler over TWO processes.
#
# @swtch(old_sp_ptr, new_sp) saves the callee-saved register file (r2-r15) and a
# resume address onto the current stack, writes the resulting stack pointer
# through `old_sp_ptr`, loads `new_sp`, and returns into the target context.
# Call it with interrupts disabled. Each process gets its own stack; a process
# is "bootstrapped" by writing its entry address onto a fresh stack so the first
# switch returns into it.
#
# Build + simulate, then peek the counters to see both processes ran:
#   ik8b build examples/demo_context_switch.ik -o cs.hex
#   ik8bvm run cs.hex --mcu atmega328p --limit 2000000 --peek 0x0206 --peek-len 2
#   (CNT0 @0x0206 and CNT1 @0x0208 each reach 6; DONE @0x020A = 1)

target atmega328p

# Fixed kernel state (ik has no global `ram`, so shared state lives at fixed
# addresses reachable by every process).
const SCHED_SP: u16 = 0x0200   # scheduler's saved stack pointer
const P0_SP:    u16 = 0x0202   # process 0 saved stack pointer
const P1_SP:    u16 = 0x0204   # process 1 saved stack pointer
const CNT0:     u16 = 0x0206   # times process 0 ran
const CNT1:     u16 = 0x0208   # times process 1 ran
const DONE:     u16 = 0x020A   # set when the scheduler completes its run
const S0_TOP:   u16 = 0x033F   # top of process 0's stack (0x0300..0x033F)
const S1_TOP:   u16 = 0x037F   # top of process 1's stack (0x0340..0x037F)

# Each process bumps its own counter, then yields back to the scheduler.
@worker0() {
    loop * {
        ram ptr u16 $c = CNT0
        *$c + 1 -> *$c
        ram ptr u16 $ss = SCHED_SP
        @swtch(P0_SP, *$ss)            # save my SP to P0_SP, resume the scheduler
    }
}
@worker1() {
    loop * {
        ram ptr u16 $c = CNT1
        *$c + 1 -> *$c
        ram ptr u16 $ss = SCHED_SP
        @swtch(P1_SP, *$ss)
    }
}

# Prepare a fresh stack so the first switch RETs into `entry`. RET pops a byte
# address; &@fn is a word address, so convert (word*2). Hardware return-address
# byte order: high byte at the top of the stack.
@boot_task($top: u16, $sp_slot: u16, $entry_word: u16) {
    ram imut $eb: u16 = $entry_word * 2
    ram ptr u8 $s = $top
    ($eb / 256) -> *$s
    ($eb & 0xFF) -> *($s - 1)
    ram ptr u16 $slot = $sp_slot
    $top - 2 -> *$slot
}

@main {
    ram ptr u16 $c0 = CNT0
    ram ptr u16 $c1 = CNT1
    ram ptr u16 $dn = DONE
    0 -> *$c0
    0 -> *$c1
    0 -> *$dn

    @boot_task(S0_TOP, P0_SP, &@worker0)
    @boot_task(S1_TOP, P1_SP, &@worker1)

    # Round-robin: 12 switches, alternating the two processes. The scheduler
    # regains control after each one (the resume path of @swtch).
    loop 0..12 -> $r {
        ? ($r & 1) == 0 {
            ram ptr u16 $p = P0_SP
            @swtch(SCHED_SP, *$p)
        } : {
            ram ptr u16 $p = P1_SP
            @swtch(SCHED_SP, *$p)
        }
    }

    1 -> *$dn                          # every switch round-tripped successfully
    loop * {}
}
