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

/// Represents the different classes of lexical tokens in the ik8b language.
#[derive(Debug, Clone, PartialEq)]
pub enum TokenKind {
    /// Language keywords (e.g. `const`, `mut`, `val`, `loop`, `return`, `import`, `switch`).
    Keyword(String),
    /// Supported primitive types (e.g. `u8`, `u16`, `void`).
    Type(String),
    /// Variable and function identifiers, typically prefixed with context sigils ($, %, @).
    Identifier(String),
    /// Integer numeric literals (decimal, hexadecimal) or character literals evaluated to ASCII codes.
    Number(i32),
    /// The standard assignment symbol `->`.
    Arrow,
    /// Compound assignment and modification operators (e.g. `->+`, `->-`, `->&`, `->|`, `->^`).
    CompoundArrow(String),
    /// Operators, brackets, and general punctuation symbols (e.g. `{`, `}`, `(`, `)`, `+`, `==`, `&&`).
    Symbol(String),
}

/// Combines a parsed TokenKind with its source file line number for high-fidelity error reporting.
#[derive(Debug, Clone)]
pub struct Token {
    pub kind: TokenKind,
    pub line: usize,
}

/// Lexical analyzer that scans ik8b source code and produces a stream of tokens.
pub struct Lexer {
    /// The source code character array.
    source: Vec<char>,
    /// The current scanning index.
    idx: usize,
    /// The current source line number.
    line: usize,
}

impl Lexer {
    /// Instantiates a new Lexer for the provided source code.
    pub fn new(source: &str) -> Self {
        Self {
            source: source.chars().collect(),
            idx: 0,
            line: 1,
        }
    }

    /// Iterates through the source character array, performing lexical analysis to produce
    /// a vector of parsed `Token`s. Returns a compilation-friendly lexical error message on failure.
    pub fn tokenize(&mut self) -> Result<Vec<Token>, String> {
        let mut tokens = Vec::new();
        while self.idx < self.source.len() {
            let c = self.source[self.idx];
            
            // Handle line tracking
            if c == '\n' {
                self.line += 1;
                self.idx += 1;
            } else if c.is_whitespace() {
                self.idx += 1;
            } else if c == '#' {
                // Comments begin with '#' and extend to the end of the line
                while self.idx < self.source.len() && self.source[self.idx] != '\n' {
                    self.idx += 1;
                }
            } else if self.starts_with("->+") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->+".to_string()), line: self.line });
                self.idx += 3;
            } else if self.starts_with("->-") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->-".to_string()), line: self.line });
                self.idx += 3;
            } else if self.starts_with("->&") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->&".to_string()), line: self.line });
                self.idx += 3;
            } else if self.starts_with("->|") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->|".to_string()), line: self.line });
                self.idx += 3;
            } else if self.starts_with("->^") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->^".to_string()), line: self.line });
                self.idx += 3;
            } else if self.starts_with("->") {
                tokens.push(Token { kind: TokenKind::Arrow, line: self.line });
                self.idx += 2;
            } else if self.starts_with("..") {
                tokens.push(Token { kind: TokenKind::Symbol("..".to_string()), line: self.line });
                self.idx += 2;
            } else if self.starts_with("==") {
                tokens.push(Token { kind: TokenKind::Symbol("==".to_string()), line: self.line });
                self.idx += 2;
            } else if self.starts_with("!=") {
                tokens.push(Token { kind: TokenKind::Symbol("!=".to_string()), line: self.line });
                self.idx += 2;
            } else if self.starts_with("<=") {
                tokens.push(Token { kind: TokenKind::Symbol("<=".to_string()), line: self.line });
                self.idx += 2;
            } else if self.starts_with(">=") {
                tokens.push(Token { kind: TokenKind::Symbol(">=".to_string()), line: self.line });
                self.idx += 2;
            } else if self.starts_with("&&") {
                tokens.push(Token { kind: TokenKind::Symbol("&&".to_string()), line: self.line });
                self.idx += 2;
            } else if self.starts_with("||") {
                tokens.push(Token { kind: TokenKind::Symbol("||".to_string()), line: self.line });
                self.idx += 2;
            } else if "{}():=?*<>,+-/&|^[]!~".contains(c) {
                tokens.push(Token { kind: TokenKind::Symbol(c.to_string()), line: self.line });
                self.idx += 1;
            } else if c == '\'' {
                // Character literals enclosed in single quotes (e.g. 'A', '\n')
                self.idx += 1;
                if self.idx >= self.source.len() {
                    return Err(format!("Unterminated character literal at line {}", self.line));
                }
                let char_val = if self.source[self.idx] == '\\' {
                    self.idx += 1;
                    if self.idx >= self.source.len() {
                        return Err(format!("Unterminated escape sequence in character literal at line {}", self.line));
                    }
                    let escape_char = self.source[self.idx];
                    self.idx += 1;
                    match escape_char {
                        'n' => '\n' as i32,
                        'r' => '\r' as i32,
                        't' => '\t' as i32,
                        '0' => '\0' as i32,
                        '\\' => '\\' as i32,
                        '\'' => '\'' as i32,
                        _ => return Err(format!("Invalid escape character '\\{}' at line {}", escape_char, self.line)),
                    }
                } else {
                    let cv = self.source[self.idx] as i32;
                    self.idx += 1;
                    cv
                };
                if self.idx >= self.source.len() || self.source[self.idx] != '\'' {
                    return Err(format!("Expected closing single quote at line {}", self.line));
                }
                self.idx += 1;
                tokens.push(Token { kind: TokenKind::Number(char_val), line: self.line });
            } else if c.is_digit(10) || (c == '-' && self.idx + 1 < self.source.len() && self.source[self.idx+1].is_digit(10)) {
                // Numeric Literals: matches base-10 decimals or base-16 hexadecimals (starting with 0x)
                let mut val_str = String::new();
                if self.starts_with("0x") {
                    val_str.push_str("0x");
                    self.idx += 2;
                    while self.idx < self.source.len() && self.source[self.idx].is_ascii_hexdigit() {
                        val_str.push(self.source[self.idx]);
                        self.idx += 1;
                    }
                } else {
                    if c == '-' {
                        val_str.push('-');
                        self.idx += 1;
                    }
                    while self.idx < self.source.len() && self.source[self.idx].is_digit(10) {
                        val_str.push(self.source[self.idx]);
                        self.idx += 1;
                    }
                }
                
                let val = if val_str.starts_with("0x") {
                    i32::from_str_radix(&val_str[2..], 16).map_err(|e| e.to_string())?
                } else {
                    val_str.parse::<i32>().map_err(|e| e.to_string())?
                };
                tokens.push(Token { kind: TokenKind::Number(val), line: self.line });
            } else if c.is_alphabetic() || "$@%_".contains(c) {
                // Identifiers: matches names, potentially including context sigils ($, %, @)
                let mut ident = String::new();
                while self.idx < self.source.len() && (self.source[self.idx].is_alphanumeric() || "$@%_./".contains(self.source[self.idx])) {
                    ident.push(self.source[self.idx]);
                    self.idx += 1;
                }
                
                if ident == "%" {
                    tokens.push(Token { kind: TokenKind::Symbol("%".to_string()), line: self.line });
                } else {
                    match ident.as_str() {
                        "mut" | "loop" | "return" | "import" | "switch" | "namespace" | "imut" | "ram" | "eeprom" | "flash" | "const" => {
                            tokens.push(Token { kind: TokenKind::Keyword(ident), line: self.line });
                        }
                        "u8" | "u16" | "void" => {
                            tokens.push(Token { kind: TokenKind::Type(ident), line: self.line });
                        }
                        "true" => {
                            tokens.push(Token { kind: TokenKind::Number(1), line: self.line });
                        }
                        "false" => {
                            tokens.push(Token { kind: TokenKind::Number(0), line: self.line });
                        }
                        _ => {
                            tokens.push(Token { kind: TokenKind::Identifier(ident), line: self.line });
                        }
                    }
                }
            } else {
                return Err(format!("Unexpected character '{}' at line {}", c, self.line));
            }
        }
        Ok(tokens)
    }

    /// Non-destructive check to see if the source code starting at the current index
    /// matches a prefix sequence.
    fn starts_with(&self, s: &str) -> bool {
        if self.idx + s.len() > self.source.len() {
            return false;
        }
        for (i, c) in s.chars().enumerate() {
            if self.source[self.idx + i] != c {
                return false;
            }
        }
        true
    }
}
