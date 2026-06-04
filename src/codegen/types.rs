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

//! Types carried by SSA values.
//!
//! The mid-end tracks signedness, fixed-point scale, pointer address space, and
//! zero-sized/void results explicitly.

/// Memory address space for pointers, loads, and stores.
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub enum Space {
    Ram,
    Flash,
    Eeprom,
}

/// Scalar bit width. AVR is an 8-bit core; 16-bit values occupy register pairs.
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub enum Width {
    W8,
    W16,
}

impl Width {
    pub fn bytes(self) -> u16 {
        match self {
            Width::W8 => 1,
            Width::W16 => 2,
        }
    }
}

/// The type of an SSA value.
///
/// `Int` unifies plain integers and fixed-point: `frac == 0` is a plain integer;
/// `frac > 0` is a Qm.n fixed-point value (`r8` -> Q4.4 -> frac 4, `r16` -> Q8.8 ->
/// frac 8). `signed` distinguishes `i*`/`r*` from `u*`. Booleans are a distinct
/// 1-bit logical type stored in a byte. Pointers are always 16-bit addresses tagged
/// with the space they point into.
#[derive(Clone, Copy, PartialEq, Eq, Hash, Debug)]
pub enum IrType {
    Void,
    Bool,
    Int { width: Width, signed: bool, frac: u8 },
    Ptr { space: Space },
}

impl IrType {
    pub const U8: IrType = IrType::Int { width: Width::W8, signed: false, frac: 0 };
    pub const U16: IrType = IrType::Int { width: Width::W16, signed: false, frac: 0 };
    pub const I8: IrType = IrType::Int { width: Width::W8, signed: true, frac: 0 };
    pub const I16: IrType = IrType::Int { width: Width::W16, signed: true, frac: 0 };

    /// Byte footprint of a value of this type.
    pub fn bytes(self) -> u16 {
        match self {
            IrType::Void => 0,
            IrType::Bool => 1,
            IrType::Int { width, .. } => width.bytes(),
            IrType::Ptr { .. } => 2,
        }
    }

    pub fn width(self) -> Width {
        match self {
            IrType::Void | IrType::Bool => Width::W8,
            IrType::Int { width, .. } => width,
            IrType::Ptr { .. } => Width::W16,
        }
    }

    pub fn is_signed(self) -> bool {
        matches!(self, IrType::Int { signed: true, .. })
    }

    /// Fractional bits for fixed-point types, else 0.
    pub fn frac(self) -> u8 {
        match self {
            IrType::Int { frac, .. } => frac,
            _ => 0,
        }
    }

    pub fn is_fixed(self) -> bool {
        self.frac() > 0
    }

    /// Maps a front-end declared type string to its SSA type.
    ///
    /// Storage qualifiers (`flash `/`eeprom `) and array suffixes (`[N]`) describe
    /// where/how a *variable* is stored, not the type of a scalar SSA value, so they
    /// are stripped here; the array/aggregate handling lives in the lowering. Pointer,
    /// string-handle, and function-pointer types are all 16-bit addresses.
    pub fn from_decl(ty: &str) -> IrType {
        let ty = ty.trim();
        if let Some(rest) = ty.strip_prefix("ptr ") {
            let space = rest.split(' ').next().unwrap_or("ram");
            return IrType::Ptr { space: space_from_str(space) };
        }
        if let Some(space) = ty.strip_prefix("str ") {
            return IrType::Ptr { space: space_from_str(space) };
        }
        if ty.starts_with("fn(") {
            // Function pointers are 16-bit code addresses (flash space).
            return IrType::Ptr { space: Space::Flash };
        }
        let core = if let Some(r) = ty.strip_prefix("flash ") {
            r
        } else if let Some(r) = ty.strip_prefix("eeprom ") {
            r
        } else {
            ty
        };
        let base = core.split('[').next().unwrap_or(core).trim();
        match base {
            "u8" | "char" => IrType::U8,
            "u16" => IrType::U16,
            "i8" => IrType::I8,
            "i16" => IrType::I16,
            "bool" => IrType::Bool,
            "r8" => IrType::Int { width: Width::W8, signed: true, frac: 4 },
            "r16" => IrType::Int { width: Width::W16, signed: true, frac: 8 },
            "void" => IrType::Void,
            // Unknown types are rejected earlier by `validate_type`; default to u8.
            _ => IrType::U8,
        }
    }
}

pub fn space_from_str(s: &str) -> Space {
    match s {
        "flash" => Space::Flash,
        "eeprom" => Space::Eeprom,
        _ => Space::Ram,
    }
}

impl std::fmt::Display for IrType {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            IrType::Void => write!(f, "void"),
            IrType::Bool => write!(f, "bool"),
            IrType::Int { width, signed, frac } => {
                let w = match width {
                    Width::W8 => 8,
                    Width::W16 => 16,
                };
                if *frac > 0 {
                    write!(f, "q{}.{}", w - frac, frac)
                } else {
                    write!(f, "{}{}", if *signed { "i" } else { "u" }, w)
                }
            }
            IrType::Ptr { space } => write!(f, "ptr<{:?}>", space),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn decl_mapping() {
        assert_eq!(IrType::from_decl("u8"), IrType::U8);
        assert_eq!(IrType::from_decl("char"), IrType::U8);
        assert_eq!(IrType::from_decl("i16"), IrType::I16);
        assert_eq!(IrType::from_decl("bool"), IrType::Bool);
        assert_eq!(IrType::from_decl("r8").frac(), 4);
        assert_eq!(IrType::from_decl("r16").frac(), 8);
        assert!(IrType::from_decl("r16").is_signed());
        assert_eq!(IrType::from_decl("u8[4]"), IrType::U8);
        assert_eq!(IrType::from_decl("flash u16"), IrType::U16);
        assert_eq!(
            IrType::from_decl("ptr ram u8"),
            IrType::Ptr { space: Space::Ram }
        );
        assert_eq!(
            IrType::from_decl("ptr flash u8"),
            IrType::Ptr { space: Space::Flash }
        );
        assert_eq!(IrType::from_decl("fn(u8)->u8").bytes(), 2);
    }

    #[test]
    fn sizes() {
        assert_eq!(IrType::U8.bytes(), 1);
        assert_eq!(IrType::U16.bytes(), 2);
        assert_eq!(IrType::Bool.bytes(), 1);
        assert_eq!(IrType::Ptr { space: Space::Ram }.bytes(), 2);
    }
}
