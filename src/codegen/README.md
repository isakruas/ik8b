`src/codegen/` is organized around one SSA-based AVR backend:

1. `model.rs` defines the target feature model, symbolic instruction IR, and mutable backend state.
2. `pipeline.rs` coordinates compilation: reset state, validate vectors, compute reachable functions, lower the full AST to SSA, allocate SRAM homes, emit reachable functions, and validate hardware aliases.
3. The target-independent SSA middle-end lives directly under `src/codegen/`:
   - `types.rs` defines the IR type lattice.
   - `build_ast.rs` lowers parser AST into SSA.
   - `builder.rs` implements SSA construction.
   - `function.rs` stores blocks, values, instructions, and stack slots.
   - `opt.rs` performs SSA simplification and dead-code cleanup.
   - `regalloc.rs`, `coloring.rs`, and `spill.rs` allocate registers.
   - `print.rs` renders the textual IR dump (`--emit-ir`).
   - `emit_avr.rs` selects AVR instructions.
4. `emitter.rs` owns small helpers for `CodeGenerator` state and pass-1 instruction emission.
5. `assembler.rs` performs peephole optimization, label resolution, branch relaxation, and Intel HEX emission.
