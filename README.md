# ik8b Compiler

The **ik8b** compiler is a Rust-based toolchain that translates source code written in the **ik8b** language directly into standard **Intel HEX** files for the AVR-8 architecture.

---

## Building and Compiling

### Clone with submodules
Clone the repository and initialize submodules in one step:
```bash
git clone --recurse-submodules https://github.com/isakruas/ik8b.git
```

If you already cloned the repository without submodules:
```bash
cd ik8b
git submodule update --init --recursive
```

After `git pull`, if submodule pointers changed:
```bash
git submodule update --recursive
```

### Build the compiler
Builds the native binary `./ik8b` via a standard Rust container:
```bash
make build
```

### Compile source files to Intel HEX
```bash
./ik8b <input.ik> -o <output.hex>
```

The source must declare a top-level target target, for example:
```ik
target atmega328p
```

### CLI commands
```bash
./ik8b help
./ik8b version
./ik8b info
./ik8b license
./ik8b list-devices
```

Flag aliases are also supported: `-h`, `--help`, `-V`, `--version`, `--info`,
`--license`, and `--list-devices`.

#### Compilation Options
- `-o <output.hex>`: Specifies the output Intel HEX file (defaults to `out.hex`).
- `--report`: Prints a build summary with Program/SRAM/EEPROM/register usage and fails compilation when a memory budget is exceeded.

### Import resolution
`import` paths are resolved in this order:
1. Current working directory (`<path>.ik`)
2. `IK8B_STD_PATH` (if set)
3. Paths relative to the compiler executable, including `std` fallbacks for `std/*` imports

### Clean build artifacts
```bash
make clean
```

## Testing

Run the full compiler + VM regression suite across supported MCUs:
```bash
make test
```

Validate interrupt vector binding coverage for all devices:
```bash
make test-interrupts
```

Validate runtime interrupt delivery in AVR-VM (representative cores):
```bash
make test-vm-interrupts
```

For exhaustive VM interrupt delivery checks across all listed devices/vectors:
```bash
FULL_ALL_DEVICES=1 tests/test_vm_interrupts.sh
```

AVR-VM CLI flags and interrupt injection options are documented in:
`tools/avr-vm/README.md`
