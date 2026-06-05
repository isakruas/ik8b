//! Library surface of the ik8b compiler.
//!
//! The compiler ships as a binary (`main.rs`), but tooling such as the IDE needs
//! to reuse the *exact* same lexer, parser, device table and code generator
//! instead of re-implementing them (which would inevitably drift out of sync).
//! This module re-exports the compiler's internals so they can be linked as a
//! normal Rust dependency. It mirrors the module set declared in `main.rs`.

pub mod lexer;
pub mod parser;
pub mod codegen;
pub mod devices;
pub mod vectors;
