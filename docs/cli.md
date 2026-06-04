# CLI, Build, and Targets

Examples assume the local binary is named `./ik8b`.

## Usage

```sh
./ik8b <file.ik> [-o <output.hex>] [--report]
```

If `-o` is omitted, the default output file is `out.hex`.

## Commands

```sh
./ik8b help
./ik8b version
./ik8b info
./ik8b license
./ik8b list-devices
```

Accepted aliases:

- `-h`, `--help`
- `-V`, `--version`
- `--info`
- `--license`
- `--list-devices`

## Compilation Flags

- `-o <output.hex>`: choose the Intel HEX output path.
- `--report`: print memory use and build information.
- `--emit-ir`: diagnostic mode that prints SSA IR and exits before the AVR
  backend. This flag is accepted by the CLI, but it is not shown in the `help`
  text.

Example:

```sh
./ik8b app.ik -o app.hex --report
```

## Targets

The device is selected in source code:

```ik8b
target atmega328p
```

There is no CLI flag to switch targets. Compilation fails if no `target` is
found.

List supported devices with:

```sh
./ik8b list-devices
```

The device list shows core, device name, SRAM, flash, EEPROM, and SRAM start
address. The device table contains 350 devices across `AVRe`, `AVRePlus`,
`AVRrc`, `AVRxm`, and `AVRxt` cores.

## Imports

Imports use paths without the `.ik` extension:

```ik8b
import std/gpio
import std/delay
```

Import resolution searches:

1. Paths relative to the current working directory.
2. Paths listed in `IK8B_STD_PATH`.
3. Paths relative to the executable, including the bundled `std` directory.

Because target-dependent imports are resolved during parsing, place `target`
before imports that contain `? target == ...` blocks.

## Building the Compiler

The repository `Makefile` builds the Rust release binary through Docker:

```sh
make build
```

The expected result is `./ik8b`.

## Tests

Run the main test suite:

```sh
make test
```

This target builds the compiler and runs fitting compiler/std tests in `tests/`
against the AVR VM. The VM lives under `tools/avr-vm`.

Other relevant targets:

```sh
make test-interrupts
make test-vm-interrupts
make clean
```

See [Testing and Validation](testing.md) for details.
