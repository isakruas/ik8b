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
- `--report`: Prints the number of SRAM bytes the program's globals consume as `SRAM_BYTES=<n>` (useful in CI).

### Clean build artifacts
```bash
make clean
```
