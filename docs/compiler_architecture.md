# Compiler Architecture

This page describes the organization of `src/`.

## Front End

- `main.rs`: CLI, file loading, target resolution, flags, and Intel HEX output.
- `lexer.rs`: tokenization.
- `parser.rs`: AST, imports, target blocks, and language syntax.
- `devices.rs`: AVR device table.
- `vectors.rs`: interrupt vector tables and aliases.

## Backend and Pipeline

`src/codegen/` contains the compilation pipeline.

| File | Responsibility |
| --- | --- |
| `model.rs` | target/core model, symbolic instructions, backend state |
| `pipeline.rs` | orchestration, vectors, reachability, lowering, emission, report |
| `types.rs` | SSA types and language-type mapping |
| `build_ast.rs` | AST-to-SSA lowering and primary type checking |
| `builder.rs` | SSA block/instruction construction |
| `function.rs` | SSA function representation |
| `opt.rs` | local optimizations |
| `regalloc.rs` | register allocation |
| `coloring.rs` | interference graph coloring |
| `spill.rs` | spills to memory |
| `emit_avr.rs` | AVR emission from allocated SSA |
| `emitter.rs` | emission helpers |
| `assembler.rs` | labels, branch relaxation, peephole, Intel HEX |
| `print.rs` | diagnostic IR printing |

## Detailed Flow

1. `main.rs` reads the root source file.
2. `parser.rs` resolves imports and `? target == ...` blocks.
3. The target is looked up in `devices.rs`.
4. `pipeline.rs` creates the vector table, validates ISRs, and defines
   reachability roots (`@main` and ISRs).
5. `build_ast.rs` lowers functions to typed SSA.
6. Reachable functions are optimized, allocated, and emitted.
7. SRAM, EEPROM, and flash data are accounted for.
8. `assembler.rs` resolves labels, picks final encodings, and writes Intel HEX.

## Reachability

The program starts from `@main` and ISRs. Direct calls add referenced functions.
Functions whose address is taken with `&@func` are also kept for indirect calls.

## Vectors

When the target has a known vector table, the compiler emits it at the start of
the program. Vectors not defined by the user point to a default `RETI` handler.

## Report and Validation

With `--report`, the compiler prints memory use. Before finishing, the pipeline
validates:

- target existence;
- `@main` existence;
- ISR vector names;
- duplicate vectors;
- flash, SRAM, and EEPROM limits;
- minimum stack headroom;
- collisions between hardware aliases and allocated SRAM.
