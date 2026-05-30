#!/bin/bash
# Copyright 2026 The ik8b Authors.

set -e

VM_BIN="./bin/avr_vm"

MCUS=(
    "atmega328p"
    "atmega2560"
    "atmega168"
    "atmega8"
    "atmega88"
    "at90can128"
    "at90usb1287"
    "attiny3227"
    "avr128da32"
    "avr64da32"
)

[ -x "$VM_BIN" ] || { echo "Missing $VM_BIN. Run: make build"; exit 1; }

echo "=========================================================="
echo "Running compatibility tests across ${#MCUS[@]} distinct MCUs..."
echo "=========================================================="

overall_fail=0

for mcu in "${MCUS[@]}"; do
    printf "MCU Profile: %-15s ... " "$mcu"
    mcu_fail=0

    for f in tests/test_*.ik; do
        name=$(basename "$f" .ik)
        if [ "$name" = "test_helper" ]; then
            continue
        fi

        tmp=$(mktemp)
        {
            echo "namespace $mcu"
            echo
            cat "$f"
        } > "$tmp"

        ./ik8b "$tmp" -o "tests/$name.hex" > /dev/null || true
        rm -f "$tmp"

        out=$($VM_BIN "tests/$name.hex" -mmcu="$mcu" -n 8000 -d 2>&1 || true)
        r16=$(echo "$out" | grep -o 'R16 = 0x[0-9A-Fa-f]*' | awk '{print $3}' || true)

        if [ "$r16" != "0x01" ]; then
            mcu_fail=$((mcu_fail+1))
            overall_fail=$((overall_fail+1))
            echo ""
            echo "  -> [FAIL] Test '$name' on MCU '$mcu' returned R16 = '$r16'"
        fi
    done

    if [ $mcu_fail -eq 0 ]; then
        echo "PASS"
    else
        echo "FAIL ($mcu_fail tests failed)"
    fi
done

echo "=========================================================="
if [ $overall_fail -eq 0 ]; then
    echo "SUCCESS: 100% compatibility verified across all target profiles."
    exit 0
else
    echo "FAILURE: $overall_fail compatibility conflicts detected."
    exit 1
fi
