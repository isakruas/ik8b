# ik8b Compiler

**ik8b** is a Rust-based compiler that translates the **ik** language directly into standard **Intel HEX** files for the AVR-8 architecture.

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

### Compile a source file to Intel HEX
```bash
./ik8b build <input.ik> -o <output.hex>
```

A bare `./ik8b <input.ik> -o <output.hex>` also works. The source must declare
its target, e.g. `target atmega328p`.

### Commands
```bash
./ik8b build <file.ik> [-o <out.hex>] [--emit <hex|ir>] [--report]
./ik8b run   <file.ik>                   # compile, then simulate
./ik8b sim   <file.hex> --mcu <device>   # simulate an existing HEX
./ik8b devices                           # list supported targets
./ik8b info | version | license | help
```

Run `./ik8b help` for the full list of options.

### Clean build artifacts
```bash
make clean
```

## Testing

```bash
make test               # compile + simulate the suite across all fitting MCUs
make test-interrupts    # validate interrupt-vector binding for all devices
make benchmark          # compare against avr-gcc C / asm
```

## Documentation

The language reference, standard-library reference, and toolchain guide are in
[`docs/`](docs/) (Sphinx). Build them with `make html` inside `docs/`.
