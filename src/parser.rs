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

use std::fs;
use crate::lexer::{Token, TokenKind};

/// Represents a top-level construct in the parsed Abstract Syntax Tree (AST).
#[derive(Debug, Clone)]
pub enum ASTNode {
    /// A hardware or register constant declaration (e.g. `const %PORTB: u16 = 0x25`).
    Const { name: String, ty: String, value: i32 },
    /// A subroutine declaration with parameters, return type, and body.
    Func { name: String, params: Vec<(String, String)>, ret_ty: String, body: Vec<Stmt> },
    /// An interrupt service routine bound to a named device vector (e.g.
    /// `isr TIMER0_COMPA { ... }`). Has no parameters or return value; the
    /// backend emits a vector-table jump, a full context save/restore, and `reti`.
    Isr { vector: String, body: Vec<Stmt> },
}

/// Represents statements that execute sequentially in a subroutine body.
#[derive(Debug, Clone)]
pub enum Stmt {
    /// Variable declaration, supporting optional array dimensions and immutability validation (e.g. `val $x: u8 = 10`).
    VarDecl { name: String, ty: String, expr: Expr, is_mut: bool },
    /// Assignment of an expression to a target register, variable, or array element, supporting compound operators.
    Assign { expr: Expr, target: Expr, op: String },
    /// An infinite loop loop block `loop * { ... }`.
    LoopInfinite { body: Vec<Stmt> },
    /// A range-based loop iterating from start to end with an induction variable `loop start..end -> $i { ... }`.
    LoopRange { start: Expr, end: Expr, var_name: String, body: Vec<Stmt> },
    /// Conditional branch `? condition { then } [ : { else } ]`.
    Conditional { cond: Expr, then_block: Vec<Stmt>, else_block: Option<Vec<Stmt>> },
    /// A comparative jump table matching an expression value against multiple branches.
    Switch { expr: Expr, cases: Vec<(Expr, Vec<Stmt>)>, default: Option<Vec<Stmt>> },
    /// Return statement, optionally carrying a return expression.
    Return { val: Option<Expr> },
    /// An expression executed solely for its side effects (e.g. a subroutine call).
    ExprStmt { expr: Expr },
}

/// Represents an expression that evaluates to a value.
#[derive(Debug, Clone)]
pub enum Expr {
    /// Integer literal.
    Literal(i32),
    /// Fractional literal (e.g. `3.14`); resolved to a scaled fixed-point integer in the backend.
    FloatLiteral(f64),
    /// String literal (e.g. `"hi"`); lowered to NUL-terminated byte data.
    StringLit(String),
    /// Address-of a variable/element (prefix `&`); yields a 16-bit address.
    AddrOf(Box<Expr>),
    /// Pointer dereference (prefix `*`); reads through a pointer in its target memory space.
    Deref(Box<Expr>),
    /// Variable or constant reference.
    VarRef(String),
    /// Binary operator expression (e.g. additions, comparisons, bitwise ops).
    BinOp { left: Box<Expr>, op: String, right: Box<Expr> },
    /// Prefix unary operator expression (e.g. prefix `!`, `~`, `-`).
    UnaryOp { op: String, expr: Box<Expr> },
    /// A subroutine call, including intrinsic invocations.
    Call { name: String, args: Vec<Expr> },
}

/// Recursive descent parser that translates a token stream into an Abstract Syntax Tree.
pub struct Parser {
    tokens: Vec<Token>,
    idx: usize,
    pub active_target: String,
}

impl Parser {
    /// Instantiates a new Parser for the given token vector.
    pub fn new(tokens: Vec<Token>) -> Self {
        Self {
            tokens,
            idx: 0,
            active_target: "".to_string(),
        }
    }

    /// Looks ahead at a token relative to the current scanning index without consuming it.
    fn peek(&self, offset: usize) -> Option<&Token> {
        self.tokens.get(self.idx + offset)
    }

    /// Consumes the current token if it matches the expected kind, advancing the index.
    /// Returns a syntax error showing the line and expected token on mismatch.
    fn consume(&mut self, expected_kind: Option<TokenKind>) -> Result<Token, String> {
        let tok = self.peek(0).ok_or_else(|| "Unexpected EOF".to_string())?.clone();
        if let Some(kind) = expected_kind {
            let matches = match (&tok.kind, &kind) {
                (TokenKind::Keyword(a), TokenKind::Keyword(b)) => a == b,
                (TokenKind::Type(a), TokenKind::Type(b)) => a == b,
                (TokenKind::Identifier(a), TokenKind::Identifier(b)) => a == b,
                (TokenKind::Number(a), TokenKind::Number(b)) => a == b,
                (TokenKind::Arrow, TokenKind::Arrow) => true,
                (TokenKind::CompoundArrow(a), TokenKind::CompoundArrow(b)) => a == b,
                (TokenKind::Symbol(a), TokenKind::Symbol(b)) => a == b,
                _ => false,
            };
            if !matches {
                return Err(format!("Expected token {:?}, got {:?} at line {}", kind, tok.kind, tok.line));
            }
        }
        self.idx += 1;
        Ok(tok)
    }

    /// True when the next token is on the same source line as the previously consumed token.
    /// Used to prevent an expression from accidentally consuming the next statement in a
    /// semicolon-free grammar.
    fn can_take_infix_here(&self) -> bool {
        if self.idx == 0 {
            return true;
        }
        let prev_line = self.tokens[self.idx - 1].line;
        match self.peek(0) {
            Some(tok) => tok.line == prev_line,
            None => false,
        }
    }

    /// Parses a type specification used by function parameters/returns.
    /// Supports primitive types plus `ptr <space> <pointee>` and `str <space>`, with optional
    /// array suffix `[N]`.
    fn parse_type_spec(&mut self) -> Result<String, String> {
        let tok = self.consume(None)?;
        let mut ty = match tok.kind {
            TokenKind::Type(t) => Ok(t),
            TokenKind::Keyword(ref kw) if kw == "ptr" => {
                let space_tok = self.consume(None)?;
                let space = match space_tok.kind {
                    TokenKind::Keyword(ref s) if s == "ram" || s == "flash" || s == "eeprom" => s.clone(),
                    _ => return Err(format!("Expected pointer space (ram/flash/eeprom) after 'ptr': {:?} at line {}", space_tok, space_tok.line)),
                };
                let pointee = self.parse_type_spec()?;
                Ok(format!("ptr {} {}", space, pointee))
            }
            TokenKind::Keyword(ref kw) if kw == "str" => {
                let space_tok = self.consume(None)?;
                let space = match space_tok.kind {
                    TokenKind::Keyword(ref s) if s == "ram" => s.clone(),
                    _ => return Err(format!("Expected string space 'ram' after 'str': {:?} at line {}", space_tok, space_tok.line)),
                };
                Ok(format!("str {}", space))
            }
            // Function-pointer type: `fn(T1, T2, ...)` with an optional `-> R`
            // return type. Canonicalized as e.g. `fn(u8)` or `fn(u8,u16)->u8`.
            TokenKind::Keyword(ref kw) if kw == "fn" => {
                self.consume(Some(TokenKind::Symbol("(".to_string())))?;
                let mut arg_tys: Vec<String> = Vec::new();
                loop {
                    if let Some(t) = self.peek(0) {
                        if let TokenKind::Symbol(ref s) = t.kind {
                            if s == ")" { break; }
                        }
                    }
                    arg_tys.push(self.parse_type_spec()?);
                    if let Some(t) = self.peek(0) {
                        if let TokenKind::Symbol(ref s) = t.kind {
                            if s == "," { self.consume(None)?; continue; }
                        }
                    }
                    break;
                }
                self.consume(Some(TokenKind::Symbol(")".to_string())))?;
                let mut ret = "void".to_string();
                if let Some(t) = self.peek(0) {
                    if let TokenKind::Arrow = t.kind {
                        self.consume(Some(TokenKind::Arrow))?;
                        ret = self.parse_type_spec()?;
                    }
                }
                Ok(format!("fn({}){}", arg_tys.join(","), if ret == "void" { String::new() } else { format!("->{}", ret) }))
            }
            _ => Err(format!("Expected type specifier, got {:?} at line {}", tok, tok.line)),
        }?;

        if let Some(next_tok) = self.peek(0) {
            if self.can_take_infix_here() {
                if let TokenKind::Symbol(ref sym) = next_tok.kind {
                    if sym == "[" {
                        self.consume(None)?;
                        let size_tok = self.consume(None)?;
                        let size = match size_tok.kind {
                            TokenKind::Number(n) => n,
                            _ => return Err(format!("Expected array size number: {:?} at line {}", size_tok, size_tok.line)),
                        };
                        self.consume(Some(TokenKind::Symbol("]".to_string())))?;
                        ty = format!("{}[{}]", ty, size);
                    }
                }
            }
        }

        Ok(ty)
    }

    /// Top-level parse loop. Scans through the token stream and parses all import,
    /// constant, and function declarations.
    pub fn parse(&mut self) -> Result<Vec<ASTNode>, String> {
        let mut nodes = Vec::new();
        while self.peek(0).is_some() {
            let tok = self.peek(0).unwrap().clone();
            match tok.kind {
                TokenKind::Keyword(ref kw) if kw == "import" => {
                    let imported_nodes = self.parse_import()?;
                    nodes.extend(imported_nodes);
                }
                TokenKind::Keyword(ref kw) if kw == "const" => {
                    nodes.push(self.parse_const()?);
                }
                TokenKind::Keyword(ref kw) if kw == "target" => {
                    self.consume(Some(TokenKind::Keyword("target".to_string())))?;
                    let name_tok = self.consume(None)?;
                    let ns_name = match name_tok.kind {
                        TokenKind::Identifier(ref n) => n.clone(),
                        _ => return Err(format!("Expected target name, got {:?} at line {}", name_tok, name_tok.line)),
                    };
                    self.active_target = ns_name;
                }
                TokenKind::Symbol(ref sym) if sym == "?" => {
                    self.consume(Some(TokenKind::Symbol("?".to_string())))?;
                    let left_tok = self.consume(None)?;
                    let _left = match left_tok.kind {
                        TokenKind::Keyword(ref kw) if kw == "target" => kw.clone(),
                        _ => return Err(format!("Expected 'target' in compile-time check, got {:?} at line {}", left_tok, left_tok.line)),
                    };
                    self.consume(Some(TokenKind::Symbol("==".to_string())))?;
                    let right_tok = self.consume(None)?;
                    let right = match right_tok.kind {
                        TokenKind::Identifier(ref id) => id.clone(),
                        _ => return Err(format!("Expected identifier in compile-time check, got {:?} at line {}", right_tok, right_tok.line)),
                    };
                    self.consume(Some(TokenKind::Symbol("{".to_string())))?;
                    
                    let mut block_nodes = Vec::new();
                    while let Some(t) = self.peek(0) {
                        if let TokenKind::Symbol(ref s) = t.kind {
                            if s == "}" {
                                break;
                            }
                        }
                        
                        let block_tok = self.peek(0).unwrap().clone();
                        match block_tok.kind {
                            TokenKind::Keyword(ref kw) if kw == "import" => {
                                let imported = self.parse_import()?;
                                block_nodes.extend(imported);
                            }
                            TokenKind::Keyword(ref kw) if kw == "const" => {
                                block_nodes.push(self.parse_const()?);
                            }
                            TokenKind::Keyword(ref kw) if kw == "isr" => {
                                block_nodes.push(self.parse_isr()?);
                            }
                            TokenKind::Identifier(ref name) if name.starts_with('@') => {
                                block_nodes.push(self.parse_function()?);
                            }
                            _ => return Err(format!("Expected top-level declaration in conditional block, got {:?} at line {}", block_tok, block_tok.line)),
                        }
                    }
                    self.consume(Some(TokenKind::Symbol("}".to_string())))?;
                    
                    if self.active_target == right {
                        nodes.extend(block_nodes);
                    }
                }
                TokenKind::Keyword(ref kw) if kw == "isr" => {
                    nodes.push(self.parse_isr()?);
                }
                TokenKind::Identifier(ref name) if name.starts_with('@') => {
                    nodes.push(self.parse_function()?);
                }
                _ => return Err(format!("Expected top-level declaration (target, import, const, function or isr), got {:?} at line {}", tok, tok.line)),
            }
        }
        Ok(nodes)
    }

    /// Parses an `import` statement, recursively loading, lexing, and parsing
    /// the target file, and merging its AST nodes into the current compilation unit.
    fn parse_import(&mut self) -> Result<Vec<ASTNode>, String> {
        self.consume(Some(TokenKind::Keyword("import".to_string())))?;
        let path_tok = self.consume(None)?;
        let path = match path_tok.kind {
            TokenKind::Identifier(ref name) => name.clone(),
            _ => return Err(format!("Expected module name after import, got {:?} at line {}", path_tok, path_tok.line)),
        };
        
        let mut candidates = Vec::new();

        // 1. Current working directory
        candidates.push(std::path::PathBuf::from(format!("{}.ik", path)));

        // Helper to strip "std/" prefix if present
        let std_subpath = if path.starts_with("std/") {
            Some(&path["std/".len()..])
        } else {
            None
        };

        // 2. Env variable IK8B_STD_PATH
        if let Ok(env_path) = std::env::var("IK8B_STD_PATH") {
            let env_dir = std::path::PathBuf::from(env_path);
            candidates.push(env_dir.join(format!("{}.ik", path)));
            if let Some(sub_str) = std_subpath {
                candidates.push(env_dir.join(format!("{}.ik", sub_str)));
            }
        }

        // 3. Relative to the executable
        if let Ok(exe_path) = std::env::current_exe() {
            if let Some(exe_dir) = exe_path.parent() {
                candidates.push(exe_dir.join(format!("{}.ik", path)));
                if let Some(sub_str) = std_subpath {
                    candidates.push(exe_dir.join("std").join(format!("{}.ik", sub_str)));
                    candidates.push(exe_dir.join("../std").join(format!("{}.ik", sub_str)));
                    candidates.push(exe_dir.join("../../std").join(format!("{}.ik", sub_str)));
                }
            }
        }

        // Try reading each candidate
        let mut imported_source = None;
        let mut tried_paths = Vec::new();

        for candidate in candidates {
            if let Ok(source) = fs::read_to_string(&candidate) {
                imported_source = Some((candidate, source));
                break;
            } else {
                tried_paths.push(candidate.to_string_lossy().into_owned());
            }
        }

        let (_resolved_path, source) = match imported_source {
            Some(res) => res,
            None => {
                return Err(format!(
                    "Could not read imported file '{}' at line {}. Tried paths:\n  - {}",
                    path,
                    path_tok.line,
                    tried_paths.join("\n  - ")
                ));
            }
        };
            
        let mut lexer = crate::lexer::Lexer::new(&source);
        let tokens = lexer.tokenize()?;
        
        let mut parser = Parser::new(tokens);
        parser.active_target = self.active_target.clone();
        let ast = parser.parse()?;
        
        Ok(ast)
    }

    /// Parses a hardware register or address constant declaration.
    /// Syntax: `const %NAME: Type = Value`
    fn parse_const(&mut self) -> Result<ASTNode, String> {
        self.consume(Some(TokenKind::Keyword("const".to_string())))?;
        let name_tok = self.consume(None)?;
        let name = match name_tok.kind {
            TokenKind::Identifier(ref n) if n.starts_with('%') => n.clone(),
            _ => return Err(format!("Constant name must start with %: {:?} at line {}", name_tok, name_tok.line)),
        };
        self.consume(Some(TokenKind::Symbol(":".to_string())))?;
        let ty_tok = self.consume(None)?;
        let ty = match ty_tok.kind {
            TokenKind::Type(ref t) => t.clone(),
            _ => return Err(format!("Expected type: {:?} at line {}", ty_tok, ty_tok.line)),
        };
        self.consume(Some(TokenKind::Symbol("=".to_string())))?;
        let val_tok = self.consume(None)?;
        let value = match val_tok.kind {
            TokenKind::Number(v) => v,
            _ => return Err(format!("Expected number: {:?} at line {}", val_tok, val_tok.line)),
        };
        Ok(ASTNode::Const { name, ty, value })
    }

    /// Parses a subroutine or function declaration.
    /// Syntax: `@name([$param: Type, ...]) [-> ReturnType] { Block }`
    fn parse_function(&mut self) -> Result<ASTNode, String> {
        let name_tok = self.consume(None)?;
        let name = match name_tok.kind {
            TokenKind::Identifier(ref n) if n.starts_with('@') => n.clone(),
            _ => return Err(format!("Function name must start with @: {:?} at line {}", name_tok, name_tok.line)),
        };

        let mut params = Vec::new();
        if let Some(tok) = self.peek(0) {
            if let TokenKind::Symbol(ref sym) = tok.kind {
                if sym == "(" {
                    self.consume(Some(TokenKind::Symbol("(".to_string())))?;
                    while let Some(t) = self.peek(0) {
                        if let TokenKind::Symbol(ref s) = t.kind {
                            if s == ")" {
                                break;
                            }
                        }
                        let param_tok = self.consume(None)?;
                        let param_name = match param_tok.kind {
                            TokenKind::Identifier(ref p) if p.starts_with('$') => p.clone(),
                            _ => return Err(format!("Parameter must start with $: {:?} at line {}", param_tok, param_tok.line)),
                        };
                        self.consume(Some(TokenKind::Symbol(":".to_string())))?;
                        let param_ty = self.parse_type_spec()?;
                        params.push((param_name, param_ty));
                        
                        if let Some(next_t) = self.peek(0) {
                            if let TokenKind::Symbol(ref s) = next_t.kind {
                                if s == "," {
                                    self.consume(None)?;
                                }
                            }
                        }
                    }
                    self.consume(Some(TokenKind::Symbol(")".to_string())))?;
                }
            }
        }

        let mut ret_ty = "void".to_string();
        if let Some(tok) = self.peek(0) {
            if let TokenKind::Arrow = tok.kind {
                self.consume(Some(TokenKind::Arrow))?;
                ret_ty = self.parse_type_spec()?;
            }
        }

        let body = self.parse_block()?;
        Ok(ASTNode::Func { name, params, ret_ty, body })
    }

    /// Parses an interrupt service routine declaration.
    /// Syntax: `isr VECTOR_NAME { Block }`
    fn parse_isr(&mut self) -> Result<ASTNode, String> {
        self.consume(Some(TokenKind::Keyword("isr".to_string())))?;
        let vec_tok = self.consume(None)?;
        let vector = match vec_tok.kind {
            TokenKind::Identifier(ref v) => v.clone(),
            _ => return Err(format!("Expected an interrupt vector name after 'isr', got {:?} at line {}", vec_tok, vec_tok.line)),
        };
        let body = self.parse_block()?;
        Ok(ASTNode::Isr { vector, body })
    }

    /// Parses a curly-bracket enclosed block containing zero or more statements.
    fn parse_block(&mut self) -> Result<Vec<Stmt>, String> {
        self.consume(Some(TokenKind::Symbol("{".to_string())))?;
        let mut stmts = Vec::new();
        while let Some(tok) = self.peek(0) {
            if let TokenKind::Symbol(ref sym) = tok.kind {
                if sym == "}" {
                    break;
                }
            }

            // Handle compile-time target check inside blocks
            if let TokenKind::Symbol(ref sym) = tok.kind {
                if sym == "?" {
                    if let Some(next_tok) = self.peek(1) {
                        if let TokenKind::Keyword(ref kw) = next_tok.kind {
                            if kw == "target" {
                                self.consume(None)?; // '?'
                                self.consume(None)?; // 'target'
                                self.consume(Some(TokenKind::Symbol("==".to_string())))?;
                                let right_tok = self.consume(None)?;
                                let right = match right_tok.kind {
                                    TokenKind::Identifier(ref id) => id.clone(),
                                    _ => return Err(format!("Expected identifier in compile-time check, got {:?} at line {}", right_tok, right_tok.line)),
                                };
                                let block_stmts = self.parse_block()?;
                                if self.active_target == right {
                                    stmts.extend(block_stmts);
                                }
                                continue;
                            }
                        }
                    }
                }
            }

            stmts.push(self.parse_statement()?);
        }
        self.consume(Some(TokenKind::Symbol("}".to_string())))?;
        Ok(stmts)
    }

    /// Parses a single statement from the input token stream.
    /// Supports variable declarations (`val`/`mut`), conditionals (`?`), infinite loops,
    /// range-based loops, switches, return statements, and expression statements (assignments).
    fn parse_statement(&mut self) -> Result<Stmt, String> {
        let tok = self.peek(0).ok_or_else(|| "Unexpected EOF in statement".to_string())?.clone();
        match tok.kind {
            TokenKind::Keyword(ref kw) if kw == "ram" || kw == "eeprom" || kw == "flash" => {
                let storage = kw.as_str();
                self.consume(None)?;

                // Pointer declaration: `<space> ptr <T> $name = <init>`. The leading space is the
                // pointed-to memory space; the pointer variable itself is a 16-bit value in SRAM.
                if matches!(self.peek(0).map(|t| &t.kind), Some(TokenKind::Keyword(k)) if k == "ptr") {
                    self.consume(None)?; // ptr
                    let inner = self.parse_type_spec()?;
                    let name_tok = self.consume(None)?;
                    let name = match name_tok.kind {
                        TokenKind::Identifier(ref n) if n.starts_with('$') => n.clone(),
                        _ => return Err(format!("Pointer variable must start with $: {:?} at line {}", name_tok, name_tok.line)),
                    };
                    self.consume(Some(TokenKind::Symbol("=".to_string())))?;
                    let expr = self.parse_expr()?;
                    let ty = format!("ptr {} {}", storage, inner);
                    return Ok(Stmt::VarDecl { name, ty, expr, is_mut: true });
                }

                // String declaration: `ram str $name = "..."` or `flash str $name = "..."`.
                if matches!(self.peek(0).map(|t| &t.kind), Some(TokenKind::Keyword(k)) if k == "str") {
                    self.consume(None)?; // str
                    if storage != "ram" && storage != "flash" {
                        return Err(format!("String variables currently support only RAM or flash storage (got '{}') at line {}", storage, tok.line));
                    }
                    let name_tok = self.consume(None)?;
                    let name = match name_tok.kind {
                        TokenKind::Identifier(ref n) if n.starts_with('$') => n.clone(),
                        _ => return Err(format!("String variable must start with $: {:?} at line {}", name_tok, name_tok.line)),
                    };
                    self.consume(Some(TokenKind::Symbol("=".to_string())))?;
                    let expr = self.parse_expr()?;
                    let ty = format!("str {}", storage);
                    return Ok(Stmt::VarDecl { name, ty, expr, is_mut: storage != "flash" });
                }

                let next_tok = self.peek(0).ok_or_else(|| format!("Expected mutability specifier after {}", kw))?.clone();
                let is_mut = match next_tok.kind {
                    TokenKind::Keyword(ref k) if k == "mut" || k == "imut" => {
                        let im = k == "mut";
                        self.consume(None)?;
                        im
                    }
                    _ => return Err(format!("Expected mutability specifier (mut or imut) after {}: {:?} at line {}", kw, next_tok, next_tok.line)),
                };

                if storage == "flash" && is_mut {
                    return Err(format!("flash variables must be immutable: flash imut expected at line {}", tok.line));
                }

                let name_tok = self.consume(None)?;
                let name = match name_tok.kind {
                    TokenKind::Identifier(ref n) if n.starts_with('$') => n.clone(),
                    _ => return Err(format!("Variable must start with $: {:?} at line {}", name_tok, name_tok.line)),
                };
                self.consume(Some(TokenKind::Symbol(":".to_string())))?;
                // Function-pointer locals (`fn(...) [-> R]`) use the full type
                // grammar; everything else is a primitive type token.
                let mut ty = if matches!(self.peek(0).map(|t| &t.kind), Some(TokenKind::Keyword(k)) if k == "fn") {
                    self.parse_type_spec()?
                } else {
                    let ty_tok = self.consume(None)?;
                    match ty_tok.kind {
                        TokenKind::Type(ref t) => t.clone(),
                        _ => return Err(format!("Expected type: {:?} at line {}", ty_tok, ty_tok.line)),
                    }
                };
                if let Some(next_tok) = self.peek(0) {
                    if let TokenKind::Symbol(ref sym) = next_tok.kind {
                        if sym == "[" {
                            self.consume(None)?;
                            let size_tok = self.consume(None)?;
                            let size = match size_tok.kind {
                                TokenKind::Number(n) => n,
                                _ => return Err(format!("Expected array size number: {:?} at line {}", size_tok, size_tok.line)),
                            };
                            self.consume(Some(TokenKind::Symbol("]".to_string())))?;
                            ty = format!("{}[{}]", ty, size);
                        }
                    }
                }
                self.consume(Some(TokenKind::Symbol("=".to_string())))?;
                let expr = self.parse_expr()?;
                
                let final_ty = if storage == "eeprom" {
                    format!("eeprom {}", ty)
                } else if storage == "flash" {
                    format!("flash {}", ty)
                } else {
                    ty
                };
                Ok(Stmt::VarDecl { name, ty: final_ty, expr, is_mut })
            }
            TokenKind::Keyword(ref kw) if kw == "mut" || kw == "imut" => {
                return Err(format!("Syntax Error: Variable declarations must explicitly specify a storage location (ram, eeprom, or flash) before the mutability specifier at line {}", tok.line));
            }
            TokenKind::Keyword(ref kw) if kw == "loop" => {
                self.consume(None)?;
                let loop_tok = self.peek(0).ok_or_else(|| "Unexpected EOF after loop".to_string())?.clone();
                if let TokenKind::Symbol(ref sym) = loop_tok.kind {
                    if sym == "*" {
                        self.consume(None)?;
                        let body = self.parse_block()?;
                        return Ok(Stmt::LoopInfinite { body });
                    }
                }
                
                let start_expr = self.parse_expr()?;
                self.consume(Some(TokenKind::Symbol("..".to_string())))?;
                let end_expr = self.parse_expr()?;
                self.consume(Some(TokenKind::Arrow))?;
                let var_tok = self.consume(None)?;
                let var_name = match var_tok.kind {
                    TokenKind::Identifier(ref n) if n.starts_with('$') => n.clone(),
                    _ => return Err(format!("Loop variable must start with $: {:?} at line {}", var_tok, var_tok.line)),
                };
                let body = self.parse_block()?;
                Ok(Stmt::LoopRange { start: start_expr, end: end_expr, var_name, body })
            }
            TokenKind::Keyword(ref kw) if kw == "return" => {
                self.consume(None)?;
                let mut val = None;
                if let Some(t) = self.peek(0) {
                    if let TokenKind::Symbol(ref sym) = t.kind {
                        if sym != "}" {
                            val = Some(self.parse_expr()?);
                        }
                    } else {
                        val = Some(self.parse_expr()?);
                    }
                }
                Ok(Stmt::Return { val })
            }
            TokenKind::Keyword(ref kw) if kw == "switch" => {
                self.consume(None)?;
                let expr = self.parse_expr()?;
                self.consume(Some(TokenKind::Symbol("{".to_string())))?;
                
                let mut cases = Vec::new();
                let mut default = None;
                
                while let Some(tok) = self.peek(0) {
                    if let TokenKind::Symbol(ref sym) = tok.kind {
                        if sym == "}" {
                            break;
                        }
                        if sym == "*" {
                            self.consume(None)?;
                            self.consume(Some(TokenKind::Arrow))?;
                            let body = self.parse_block()?;
                            default = Some(body);
                            continue;
                        }
                    }
                    
                    let case_expr = self.parse_expr()?;
                    self.consume(Some(TokenKind::Arrow))?;
                    let body = self.parse_block()?;
                    cases.push((case_expr, body));
                }
                
                self.consume(Some(TokenKind::Symbol("}".to_string())))?;
                Ok(Stmt::Switch { expr, cases, default })
            }
            TokenKind::Symbol(ref sym) if sym == "?" => {
                self.consume(None)?;
                let cond = self.parse_expr()?;
                let then_block = self.parse_block()?;
                let mut else_block = None;
                if let Some(t) = self.peek(0) {
                    if let TokenKind::Symbol(ref s) = t.kind {
                        if s == ":" {
                            self.consume(None)?;
                            else_block = Some(self.parse_block()?);
                        }
                    }
                }
                Ok(Stmt::Conditional { cond, then_block, else_block })
            }
            _ => {
                let expr = self.parse_expr()?;
                if let Some(t) = self.peek(0) {
                    match t.kind {
                        TokenKind::Arrow => {
                            self.consume(None)?;
                            let target = self.parse_expr()?;
                            return Ok(Stmt::Assign { expr, target, op: "->".to_string() });
                        }
                        TokenKind::CompoundArrow(ref op) => {
                            let op_str = op.clone();
                            self.consume(None)?;
                            let target = self.parse_expr()?;
                            return Ok(Stmt::Assign { expr, target, op: op_str });
                        }
                        _ => {}
                    }
                }
                Ok(Stmt::ExprStmt { expr })
            }
        }
    }

    /// Entry point for parsing expressions, initiating the recursive precedence climber.
    fn parse_expr(&mut self) -> Result<Expr, String> {
        self.parse_logical_or()
    }

    /// Parses logical OR expressions (`||`), which have the lowest precedence.
    fn parse_logical_or(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_logical_and()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "||" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_logical_and()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    /// Parses logical AND expressions (`&&`).
    fn parse_logical_and(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_bitwise_or()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "&&" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_bitwise_or()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    /// Parses bitwise OR expressions (`|`).
    fn parse_bitwise_or(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_bitwise_xor()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "|" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_bitwise_xor()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    /// Parses bitwise XOR expressions (`^`).
    fn parse_bitwise_xor(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_bitwise_and()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "^" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_bitwise_and()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    fn parse_bitwise_and(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_equality()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "&" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_equality()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    fn parse_equality(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_relational()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "==" || op == "!=" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_relational()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    fn parse_relational(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_additive()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "<" || op == ">" || op == "<=" || op == ">=" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_additive()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    fn parse_additive(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_multiplicative()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "+" || op == "-" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_multiplicative()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    fn parse_multiplicative(&mut self) -> Result<Expr, String> {
        let mut left = self.parse_unary()?;
        while let Some(tok) = self.peek(0) {
            if !self.can_take_infix_here() {
                break;
            }
            if let TokenKind::Symbol(ref op) = tok.kind {
                if op == "*" || op == "/" || op == "%" {
                    let op_str = op.clone();
                    self.consume(None)?;
                    let right = self.parse_unary()?;
                    left = Expr::BinOp {
                        left: Box::new(left),
                        op: op_str,
                        right: Box::new(right),
                    };
                    continue;
                }
            }
            break;
        }
        Ok(left)
    }

    fn parse_unary(&mut self) -> Result<Expr, String> {
        if let Some(tok) = self.peek(0) {
            if let TokenKind::Symbol(ref sym) = tok.kind {
                if sym == "!" || sym == "~" || sym == "-" {
                    let op_str = sym.clone();
                    self.consume(None)?;
                    let expr = self.parse_unary()?;
                    return Ok(Expr::UnaryOp { op: op_str, expr: Box::new(expr) });
                }
                // In operand position, `&` is address-of and `*` is dereference (distinct from the
                // infix bitwise-AND / multiply consumed by the binary-precedence parsers).
                if sym == "&" {
                    self.consume(None)?;
                    let expr = self.parse_unary()?;
                    return Ok(Expr::AddrOf(Box::new(expr)));
                }
                if sym == "*" {
                    self.consume(None)?;
                    let expr = self.parse_unary()?;
                    return Ok(Expr::Deref(Box::new(expr)));
                }
            }
        }
        self.parse_primary()
    }

    fn parse_primary(&mut self) -> Result<Expr, String> {
        let tok = self.peek(0).ok_or_else(|| "Unexpected EOF in primary expression".to_string())?.clone();
        match tok.kind {
            TokenKind::Number(val) => {
                self.consume(None)?;
                Ok(Expr::Literal(val))
            }
            TokenKind::Float(val) => {
                self.consume(None)?;
                Ok(Expr::FloatLiteral(val))
            }
            TokenKind::Str(ref s) => {
                let s = s.clone();
                self.consume(None)?;
                Ok(Expr::StringLit(s))
            }
            TokenKind::Identifier(ref name) => {
                let name_str = name.clone();
                self.consume(None)?;
                if name_str.starts_with('@') {
                    if let Some(next_tok) = self.peek(0) {
                        if !self.can_take_infix_here() {
                            return Ok(Expr::VarRef(name_str));
                        }
                        if let TokenKind::Symbol(ref sym) = next_tok.kind {
                            if sym == "(" {
                                self.consume(Some(TokenKind::Symbol("(".to_string())))?;
                                let mut args = Vec::new();
                                while let Some(t) = self.peek(0) {
                                    if let TokenKind::Symbol(ref s) = t.kind {
                                        if s == ")" {
                                            break;
                                        }
                                    }
                                    args.push(self.parse_expr()?);
                                    if let Some(next_t) = self.peek(0) {
                                        if let TokenKind::Symbol(ref s) = next_t.kind {
                                            if s == "," {
                                                self.consume(None)?;
                                            }
                                        }
                                    }
                                }
                                self.consume(Some(TokenKind::Symbol(")".to_string())))?;
                                return Ok(Expr::Call { name: name_str, args });
                            }
                        }
                    }
                } else {
                    if let Some(next_tok) = self.peek(0) {
                        if !self.can_take_infix_here() {
                            return Ok(Expr::VarRef(name_str));
                        }
                        if let TokenKind::Symbol(ref sym) = next_tok.kind {
                            if sym == "[" {
                                self.consume(Some(TokenKind::Symbol("[".to_string())))?;
                                let index_expr = self.parse_expr()?;
                                self.consume(Some(TokenKind::Symbol("]".to_string())))?;
                                return Ok(Expr::BinOp {
                                    left: Box::new(Expr::VarRef(name_str)),
                                    op: "[]".to_string(),
                                    right: Box::new(index_expr),
                                });
                            }
                        }
                    }
                }
                Ok(Expr::VarRef(name_str))
            }
            TokenKind::Symbol(ref sym) => {
                if sym == "(" {
                    self.consume(Some(TokenKind::Symbol("(".to_string())))?;
                    let expr = self.parse_expr()?;
                    self.consume(Some(TokenKind::Symbol(")".to_string())))?;
                    Ok(expr)
                } else {
                    Err(format!("Unexpected symbol in expression: {} at line {}", sym, tok.line))
                }
            }
            _ => Err(format!("Unexpected token in expression: {:?} at line {}", tok, tok.line)),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lexer::Lexer;

    #[test]
    fn test_valid_variable_declaration() {
        let code = "
        @main {
            ram mut $ok: u8 = 1
            ram imut $x: u16 = 2
            eeprom mut $y: u8 = 3
            flash imut $z: u8 = 4
        }
        ";
        let mut lexer = Lexer::new(code);
        let tokens = lexer.tokenize().unwrap();
        let mut parser = Parser::new(tokens);
        let result = parser.parse();
        assert!(result.is_ok(), "Expected valid code to compile, but got: {:?}", result);
    }

    #[test]
    fn test_invalid_variable_declarations() {
        // Without storage space (mut)
        let code_mut = "
        @main {
            mut $ok: u8 = 1
        }
        ";
        let mut lexer = Lexer::new(code_mut);
        let tokens = lexer.tokenize().unwrap();
        let mut parser = Parser::new(tokens);
        let result = parser.parse();
        assert!(result.is_err());
        let err_msg = result.err().unwrap();
        assert!(err_msg.contains("Syntax Error: Variable declarations must explicitly specify a storage location"));

        // Without storage space (imut)
        let code_imut = "
        @main {
            imut $ok: u8 = 1
        }
        ";
        let mut lexer2 = Lexer::new(code_imut);
        let tokens2 = lexer2.tokenize().unwrap();
        let mut parser2 = Parser::new(tokens2);
        let result2 = parser2.parse();
        assert!(result2.is_err());
        let err_msg2 = result2.err().unwrap();
        assert!(err_msg2.contains("Syntax Error: Variable declarations must explicitly specify a storage location"));
    }
}
