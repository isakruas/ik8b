#!/bin/bash
# Copyright 2026 The ik8b Authors.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
IK8B_BIN="$REPO_ROOT/ik8b"
VM_BIN="$REPO_ROOT/tools/avr-vm/bin/avr_vm"
VECTORS_RS="$REPO_ROOT/src/vectors.rs"

[ -x "$IK8B_BIN" ] || { echo "Missing $IK8B_BIN. Run: make build"; exit 1; }
[ -x "$VM_BIN" ] || { echo "Missing $VM_BIN. Run: make -C tools/avr-vm"; exit 1; }
[ -f "$VECTORS_RS" ] || { echo "Missing $VECTORS_RS"; exit 1; }

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

FULL_ALL_DEVICES="${FULL_ALL_DEVICES:-0}"

pass=0
fail=0
ran=0

get_device_line() {
  local dev="$1"
  rg "^[[:space:]]*\"$dev\" => Some\\(&\\[" "$VECTORS_RS" | head -n1
}

pick_slots() {
  local dev="$1"
  local mode="$2" # "all" or "edge"
  local line
  line="$(get_device_line "$dev")"
  [ -z "$line" ] && return 0
  local blob
  blob="$(sed -n 's/.*=> Some(&\[\(.*\)\]),[[:space:]]*$/\1/p' <<<"$line")"
  [ -z "$blob" ] && return 0

  local idx=0
  local first_idx=""
  local first_name=""
  local last_idx=""
  local last_name=""
  while IFS= read -r slot; do
    local name
    name="$(sed -n 's/.*"\([^"]*\)".*/\1/p' <<<"$slot")"
    if [ "$idx" -gt 0 ] && [ -n "$name" ]; then
      if [ -z "$first_idx" ]; then
        first_idx="$idx"
        first_name="$name"
      fi
      last_idx="$idx"
      last_name="$name"
      if [ "$mode" = "all" ]; then
        printf "%s,%s\n" "$idx" "$name"
      fi
    fi
    idx=$((idx + 1))
  done < <(grep -o '&\[[^]]*\]' <<<"$blob")

  if [ "$mode" != "all" ] && [ -n "$first_idx" ]; then
    printf "%s,%s\n" "$first_idx" "$first_name"
    if [ -n "$last_idx" ] && [ "$last_idx" != "$first_idx" ]; then
      printf "%s,%s\n" "$last_idx" "$last_name"
    fi
  fi
}

run_vector_case() {
  local dev="$1"
  local vec_idx="$2"
  local vec_name="$3"
  local tag="${dev}_${vec_idx}_${vec_name}"
  local src="$tmpdir/$tag.ik"
  local hex="$tmpdir/$tag.hex"
  local out="$tmpdir/$tag.out"

  cat > "$src" <<EOF
namespace $dev

isr $vec_name {
  @cli()
}

@main {
  @sei()
  loop * {}
}
EOF

  if ! "$IK8B_BIN" "$src" -o "$hex" >/dev/null 2>&1; then
    echo "FAIL compile: $tag"
    fail=$((fail + 1))
    ran=$((ran + 1))
    return
  fi

  "$VM_BIN" "$hex" -mmcu="$dev" --irq="$vec_idx" -n 220 -t >"$out" 2>&1 || true
  if grep -q "IRQ vector $vec_idx" "$out" && grep -q "RETI" "$out"; then
    pass=$((pass + 1))
  else
    echo "FAIL vm irq: $tag"
    fail=$((fail + 1))
  fi
  ran=$((ran + 1))
}

run_schedule_sanity() {
  local dev="atmega328p"
  local src="$tmpdir/schedule.ik"
  local hex="$tmpdir/schedule.hex"
  local out_at="$tmpdir/schedule_at.out"
  local out_every="$tmpdir/schedule_every.out"

  cat > "$src" <<'EOF'
namespace atmega328p

isr INT0 {
  @cli()
}

@main {
  @sei()
  ram mut $acc: u16 = 0
  loop 0..240 -> $i {
    $i -> $acc
  }
  loop * {}
}
EOF

  "$IK8B_BIN" "$src" -o "$hex" >/dev/null 2>&1

  "$VM_BIN" "$hex" -mmcu="$dev" --irq-at=1:12 -n 80 -t >"$out_at" 2>&1 || true
  "$VM_BIN" "$hex" -mmcu="$dev" --irq-every=1:10 -n 120 -t >"$out_every" 2>&1 || true

  if grep -q "IRQ vector 1" "$out_at"; then
    pass=$((pass + 1))
  else
    echo "FAIL vm irq-at scheduling"
    fail=$((fail + 1))
  fi
  ran=$((ran + 1))
  local cnt
  cnt="$(grep -c "IRQ vector 1" "$out_every" || true)"
  if [ "${cnt:-0}" -ge 2 ]; then
    pass=$((pass + 1))
  else
    echo "FAIL vm irq-every scheduling (count=$cnt)"
    fail=$((fail + 1))
  fi
  ran=$((ran + 1))
}

echo "=========================================================="
echo "VM interrupt delivery test"
echo "=========================================================="

if [ "$FULL_ALL_DEVICES" = "1" ]; then
  while IFS= read -r dev; do
    while IFS=, read -r idx name; do
      [ -z "$idx" ] && continue
      run_vector_case "$dev" "$idx" "$name"
    done < <(pick_slots "$dev" all)
  done < <(rg -o '^[[:space:]]*"[^\"]+"' "$VECTORS_RS" | sed -E 's/^[[:space:]]*"([^"]+)".*/\1/')
else
  # Representative set covering all supported core families.
  DEVICES=(
    "attiny40"      # AVRrc
    "at43usb320"    # AVRe
    "atmega328p"    # AVRePlus
    "atxmega128a1"  # AVRxm
    "atmega1608"    # AVRxt
  )
  for dev in "${DEVICES[@]}"; do
    while IFS=, read -r idx name; do
      [ -z "$idx" ] && continue
      run_vector_case "$dev" "$idx" "$name"
    done < <(pick_slots "$dev" edge)
  done
fi

run_schedule_sanity

echo "=========================================================="
echo "VM IRQ checks ran:    $ran"
echo "VM IRQ checks passed: $pass"
if [ "$fail" -ne 0 ]; then
  echo "VM IRQ checks failed: $fail"
  exit 1
fi
echo "SUCCESS: VM interrupt delivery is working."
