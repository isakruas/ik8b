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
    /// Fractional numeric literals (e.g. `3.14`), scaled to fixed-point at the declaration site.
    Float(f64),
    /// String literals (e.g. `"hello"`), lowered to NUL-terminated byte data in flash or SRAM.
    Str(String),
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
pub struct Lexer<'a> {
    /// The source code string slice.
    source: &'a str,
    /// The current scanning byte index.
    idx: usize,
    /// The current source line number.
    line: usize,
}

impl<'a> Lexer<'a> {
    /// Instantiates a new Lexer for the provided source code.
    pub fn new(source: &'a str) -> Self {
        Self {
            source,
            idx: 0,
            line: 1,
        }
    }

    /// Iterates through the source character array, performing lexical analysis to produce
    /// a vector of parsed `Token`s. Returns a compilation-friendly lexical error message on failure.
    pub fn tokenize(&mut self) -> Result<Vec<Token>, String> {
        let mut tokens = Vec::new();
        while self.idx < self.source.len() {
            let c = self.source[self.idx..].chars().next().unwrap();
            
            // Handle line tracking
            if c == '\n' {
                self.line += 1;
                self.idx += 1;
            } else if c.is_whitespace() {
                self.idx += c.len_utf8();
            } else if c == '#' {
                // Comments begin with '#' and extend to the end of the line
                while let Some(ch) = self.source[self.idx..].chars().next() {
                    if ch == '\n' {
                        break;
                    }
                    self.idx += ch.len_utf8();
                }
            } else if self.source[self.idx..].starts_with("->+") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->+".to_string()), line: self.line });
                self.idx += 3;
            } else if self.source[self.idx..].starts_with("->-") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->-".to_string()), line: self.line });
                self.idx += 3;
            } else if self.source[self.idx..].starts_with("->&") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->&".to_string()), line: self.line });
                self.idx += 3;
            } else if self.source[self.idx..].starts_with("->|") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->|".to_string()), line: self.line });
                self.idx += 3;
            } else if self.source[self.idx..].starts_with("->^") {
                tokens.push(Token { kind: TokenKind::CompoundArrow("->^".to_string()), line: self.line });
                self.idx += 3;
            } else if self.source[self.idx..].starts_with("->") {
                tokens.push(Token { kind: TokenKind::Arrow, line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with("..") {
                tokens.push(Token { kind: TokenKind::Symbol("..".to_string()), line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with("==") {
                tokens.push(Token { kind: TokenKind::Symbol("==".to_string()), line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with("!=") {
                tokens.push(Token { kind: TokenKind::Symbol("!=".to_string()), line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with("<=") {
                tokens.push(Token { kind: TokenKind::Symbol("<=".to_string()), line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with(">=") {
                tokens.push(Token { kind: TokenKind::Symbol(">=".to_string()), line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with("&&") {
                tokens.push(Token { kind: TokenKind::Symbol("&&".to_string()), line: self.line });
                self.idx += 2;
            } else if self.source[self.idx..].starts_with("||") {
                tokens.push(Token { kind: TokenKind::Symbol("||".to_string()), line: self.line });
                self.idx += 2;
            } else if "{}():=?*<>,+-/&|^[]!~".contains(c) {
                tokens.push(Token { kind: TokenKind::Symbol(c.to_string()), line: self.line });
                self.idx += c.len_utf8();
            } else if c == '\'' {
                // Character literals enclosed in single quotes (e.g. 'A', '\n')
                self.idx += 1;
                if self.idx >= self.source.len() {
                    return Err(format!("Unterminated character literal at line {}", self.line));
                }
                let next_char = self.source[self.idx..].chars().next().unwrap();
                let char_val = if next_char == '\\' {
                    self.idx += 1;
                    if self.idx >= self.source.len() {
                        return Err(format!("Unterminated escape sequence in character literal at line {}", self.line));
                    }
                    let escape_char = self.source[self.idx..].chars().next().unwrap();
                    self.idx += escape_char.len_utf8();
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
                    self.idx += next_char.len_utf8();
                    next_char as i32
                };
                if !self.source[self.idx..].starts_with('\'') {
                    return Err(format!("Expected closing single quote at line {}", self.line));
                }
                self.idx += 1;
                tokens.push(Token { kind: TokenKind::Number(char_val), line: self.line });
            } else if c == '"' {
                // String literals enclosed in double quotes (e.g. "hello\n")
                self.idx += 1;
                let mut s = String::new();
                loop {
                    if self.idx >= self.source.len() {
                        return Err(format!("Unterminated string literal at line {}", self.line));
                    }
                    let ch = self.source[self.idx..].chars().next().unwrap();
                    if ch == '"' {
                        self.idx += 1;
                        break;
                    } else if ch == '\\' {
                        self.idx += 1;
                        if self.idx >= self.source.len() {
                            return Err(format!("Unterminated escape sequence in string literal at line {}", self.line));
                        }
                        let e = self.source[self.idx..].chars().next().unwrap();
                        self.idx += e.len_utf8();
                        match e {
                            'n' => { s.push('\n'); },
                            'r' => { s.push('\r'); },
                            't' => { s.push('\t'); },
                            '0' => { s.push('\0'); },
                            '\\' => { s.push('\\'); },
                            '"' => { s.push('"'); },
                            'x' => {
                                if self.idx + 2 <= self.source.len() {
                                    let hex_str = &self.source[self.idx..self.idx+2];
                                    if let Ok(val) = u8::from_str_radix(hex_str, 16) {
                                        self.idx += 2;
                                        s.push(val as char);
                                    } else {
                                        return Err(format!("Invalid hex escape '\\x{}' at line {}", hex_str, self.line));
                                    }
                                } else {
                                    return Err(format!("Unterminated hex escape at line {}", self.line));
                                }
                            }
                            _ => return Err(format!("Invalid escape character '\\{}' at line {}", e, self.line)),
                        };
                    } else {
                        if ch == '\n' {
                            self.line += 1;
                        }
                        s.push(ch);
                        self.idx += ch.len_utf8();
                    }
                }
                tokens.push(Token { kind: TokenKind::Str(s), line: self.line });
            } else if c.is_digit(10) || (c == '-' && self.source[self.idx..].chars().nth(1).map_or(false, |ch| ch.is_digit(10))) {
                // Numeric Literals: matches base-10 decimals or base-16 hexadecimals (starting with 0x)
                let mut val_str = String::new();
                if self.source[self.idx..].starts_with("0x") {
                    val_str.push_str("0x");
                    self.idx += 2;
                    while let Some(ch) = self.source[self.idx..].chars().next() {
                        if ch.is_ascii_hexdigit() {
                            val_str.push(ch);
                            self.idx += ch.len_utf8();
                        } else {
                            break;
                        }
                    }
                } else {
                    if c == '-' {
                        val_str.push('-');
                        self.idx += 1;
                    }
                    while let Some(ch) = self.source[self.idx..].chars().next() {
                        if ch.is_digit(10) {
                            val_str.push(ch);
                            self.idx += ch.len_utf8();
                        } else {
                            break;
                        }
                    }
                    // Fractional part
                    if self.source[self.idx..].starts_with('.') && self.source[self.idx+1..].chars().next().map_or(false, |ch| ch.is_digit(10)) {
                        val_str.push('.');
                        self.idx += 1;
                        while let Some(ch) = self.source[self.idx..].chars().next() {
                            if ch.is_digit(10) {
                                val_str.push(ch);
                                self.idx += ch.len_utf8();
                            } else {
                                break;
                            }
                        }
                        let fval = val_str.parse::<f64>().map_err(|e| e.to_string())?;
                        tokens.push(Token { kind: TokenKind::Float(fval), line: self.line });
                        continue;
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
                while let Some(ch) = self.source[self.idx..].chars().next() {
                    if ch.is_alphanumeric() || "$@%_./".contains(ch) {
                        ident.push(ch);
                        self.idx += ch.len_utf8();
                    } else {
                        break;
                    }
                }
                
                if ident == "%" {
                    tokens.push(Token { kind: TokenKind::Symbol("%".to_string()), line: self.line });
                } else {
                    match ident.as_str() {
                        "mut" | "loop" | "return" | "import" | "switch" | "target" | "imut" | "ram" | "eeprom" | "flash" | "const" | "ptr" | "str" | "fn" | "isr" => {
                            tokens.push(Token { kind: TokenKind::Keyword(ident), line: self.line });
                        }
                        "u8" | "u16" | "void" | "i8" | "i16" | "bool" | "char" | "r8" | "r16" => {
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
}
