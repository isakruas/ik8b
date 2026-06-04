# Testing and Validation

## Main Suite

```sh
make test
```

This target builds the compiler and runs the repository tests. Compiler tests
live in `tests/test_*.ik`; standard library tests live in `tests/std/`.

Many `tests/test_*.ik` files do not contain `target`, because the test harness
injects the target when running the file against selected devices.

## Build Only

```sh
make build
```

This produces `./ik8b`.

## Validate One Program Manually

Create a `.ik` file with `target` and `@main`, then compile it:

```sh
./ik8b app.ik -o /tmp/app.hex --report
```

Minimal example:

```ik8b
target atmega328p

@main {
    ram mut $ok: u8 = 1
    loop * {}
}
```

## Interrupt Tests

```sh
make test-interrupts
make test-vm-interrupts
```

There is also a broader script:

```sh
FULL_ALL_DEVICES=1 tests/test_vm_interrupts.sh
```

## AVR VM

The `Makefile` expects the VM at `tools/avr-vm/bin/avr_vm`. When needed, build
the VM inside `tools/avr-vm`.

## Test Pattern

Tests usually compute a success byte, store it in memory, and keep the program
alive with `loop * {}`. This avoids depending on an operating system or external
runtime.

```ik8b
@main {
    ram mut $ok: u8 = 1
    ram mut $res_arr: u8[1] = 0
    $ok -> $res_arr[0]
    loop * {}
}
```

## Checklist for Documentation Examples

When adding a new example:

1. Include `target`.
2. Include `@main`.
3. Use imports that exist under `std/`.
4. Avoid unsupported syntax such as `while`, `=>`, `_` as default, or `<<`.
5. Compile the example with `./ik8b example.ik -o /tmp/example.hex`.
