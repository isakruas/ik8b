#!/bin/bash
# Copyright 2026 The ik8b Authors.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
IK8B_BIN="$REPO_ROOT/ik8b"
VECTORS_RS="$REPO_ROOT/src/vectors.rs"

[ -x "$IK8B_BIN" ] || { echo "Missing $IK8B_BIN. Run: make -C $REPO_ROOT build"; exit 1; }
[ -f "$VECTORS_RS" ] || { echo "Missing $VECTORS_RS"; exit 1; }

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

pass=0
fail=0
checked_vectors=0

compile_expect_success() {
  local src="$1"
  local tag="$2"
  local out_hex="$tmpdir/$tag.hex"
  local out
  if ! out="$("$IK8B_BIN" "$src" -o "$out_hex" 2>&1)"; then
    echo "FAIL: expected success for $tag"
    echo "$out"
    fail=$((fail + 1))
    return 1
  fi
  pass=$((pass + 1))
  return 0
}

compile_expect_error() {
  local src="$1"
  local tag="$2"
  local pattern="$3"
  local out_hex="$tmpdir/$tag.hex"
  local out
  if out="$("$IK8B_BIN" "$src" -o "$out_hex" 2>&1)"; then
    echo "FAIL: expected error for $tag"
    fail=$((fail + 1))
    return 1
  fi
  if ! grep -q "$pattern" <<<"$out"; then
    echo "FAIL: wrong error for $tag"
    echo "$out"
    fail=$((fail + 1))
    return 1
  fi
  pass=$((pass + 1))
  return 0
}

echo "=========================================================="
echo "Interrupt vector compatibility check (all devices/all vectors)"
echo "=========================================================="

while IFS= read -r line; do
  dev="$(sed -n 's/^[[:space:]]*"\([^"]*\)".*/\1/p' <<<"$line")"
  slots_blob="$(sed -n 's/.*=> Some(&\[\(.*\)\]),[[:space:]]*$/\1/p' <<<"$line")"
  [ -z "$dev" ] && continue
  [ -z "$slots_blob" ] && continue

  src_base="$tmpdir/${dev}_base.ik"
  {
    echo "target $dev"
    echo
    echo "@main {"
    echo "  loop * {}"
    echo "}"
  } > "$src_base"
  compile_expect_success "$src_base" "${dev}_base" || continue

  src_reset="$tmpdir/${dev}_reset_forbidden.ik"
  {
    echo "target $dev"
    echo
    echo "isr RESET {"
    echo "}"
    echo
    echo "@main {"
    echo "  loop * {}"
    echo "}"
  } > "$src_reset"
  compile_expect_error "$src_reset" "${dev}_reset_forbidden" "targets RESET" || true

  first_non_reset=""
  while IFS= read -r slot; do
    name="$(sed -n 's/.*"\([^"]*\)".*/\1/p' <<<"$slot")"
    [ -z "$name" ] && continue
    if [ "$name" != "RESET" ]; then
      first_non_reset="$name"
      break
    fi
  done < <(grep -o '&\[[^]]*\]' <<<"$slots_blob")

  if [ -n "$first_non_reset" ]; then
    src_dup="$tmpdir/${dev}_dup.ik"
    {
      echo "target $dev"
      echo
      echo "isr $first_non_reset {"
      echo "}"
      echo "isr $first_non_reset {"
      echo "}"
      echo
      echo "@main {"
      echo "  loop * {}"
      echo "}"
    } > "$src_dup"
    compile_expect_error "$src_dup" "${dev}_dup" "duplicate ISR binding" || true
  fi

  idx=0
  while IFS= read -r slot; do
    name="$(sed -n 's/.*"\([^"]*\)".*/\1/p' <<<"$slot")"
    if [ "$idx" -gt 0 ] && [ -n "$name" ]; then
      checked_vectors=$((checked_vectors + 1))
      src_vec="$tmpdir/${dev}_${idx}_${name}.ik"
      {
        echo "target $dev"
        echo
        echo "isr $name {"
        echo "}"
        echo
        echo "@main {"
        echo "  loop * {}"
        echo "}"
      } > "$src_vec"
      compile_expect_success "$src_vec" "${dev}_${idx}_${name}" || true
    fi
    idx=$((idx + 1))
  done < <(grep -o '&\[[^]]*\]' <<<"$slots_blob")

done < <(rg '=> Some\(&\[' "$VECTORS_RS")

echo "=========================================================="
echo "Checked vector bindings: $checked_vectors"
echo "Compile checks passed:  $pass"
if [ "$fail" -ne 0 ]; then
  echo "Compile checks failed:  $fail"
  exit 1
fi
echo "SUCCESS: all interrupt vector declarations compile as expected."
