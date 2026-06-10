// Copyright 2026 The ik8b Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//! AVR backend entry point.
//!
//! The backend is split by compiler pipeline stage so changes stay localized:
//! model/state, SSA lowering, AVR emission, and final assembly are each maintained
//! in a dedicated file under `src/codegen/`.

use crate::parser::ASTNode;

// Target-independent SSA middle-end, emitted directly under `src/codegen/`.
mod types;
mod function;
mod builder;
mod build_ast;
mod opt;
mod coloring;
mod regalloc;
mod spill;
mod emit_avr;
mod print;

mod model;
mod emitter;
mod pipeline;
mod assembler;

pub use assembler::{generate_intel_hex, generate_intel_hex_at, resolve_labels, resolve_labels_at};

pub use model::{CodeGenerator, Pass1Inst, TargetCore};

/// Lowers the whole program to SSA IR and returns its textual dump.
///
/// This drives the same SSA middle-end used by normal code generation, but stops before
/// AVR instruction selection. It is exposed through `--emit-ir` for development and
/// snapshot testing.
pub fn emit_ir_text(ast: &[ASTNode]) -> Result<String, String> {
    let funcs = build_ast::lower_program(ast, &build_ast::all_function_names(ast), &mut Vec::new())?;
    let mut s = String::new();
    for f in funcs {
        let f = opt::optimize(f);
        s.push_str(&print::print_function(&f));
        s.push('\n');
    }
    Ok(s)
}
