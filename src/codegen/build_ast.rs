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

//! Lowers the parser AST (`ASTNode::Func`/`Isr`) into the typed SSA IR.
//!
//! AST-to-SSA lowering.
//! Scalar `$` variables become SSA values via the Braun builder; array-typed and
//! address-taken variables are backed by stack slots and accessed through
//! `stack_addr`/`load`/`store`. Hardware registers (`%NAME`) become `hw_read`/
//! `hw_write`. Intrinsics and user calls become `call`/`call_indirect`; their exact
//! AVR semantics are resolved later in instruction selection.

use super::builder::Builder;
use super::function::*;
use super::model::is_intrinsic_function;
use super::types::{IrType, Space, Width};
use crate::parser::{ASTNode, Expr, Stmt};
use std::collections::{HashMap, HashSet};

/// Program-wide facts needed for type inference of calls and constants.
pub struct ProgramInfo {
    /// `@fn` -> declared return type string.
    pub fn_ret: HashMap<String, String>,
    /// `@fn` -> declared parameter type strings (for argument coercion at call sites).
    pub fn_params: HashMap<String, Vec<String>>,
    /// `%CONST` / named const -> declared type string.
    pub const_ty: HashMap<String, String>,
    /// `%CONST` (name as written, with `%`) -> declared address/value. Lets an
    /// intrinsic that needs a register *address* as a compile-time literal (e.g.
    /// `@spm`'s SPMCSR operand) accept a per-device hardware-register constant.
    pub const_addr: HashMap<String, i32>,
}

impl ProgramInfo {
    pub fn from_ast(ast: &[ASTNode]) -> Self {
        let mut fn_ret = HashMap::new();
        let mut fn_params = HashMap::new();
        let mut const_ty = HashMap::new();
        let mut const_addr = HashMap::new();
        for node in ast {
            match node {
                ASTNode::Func {
                    name,
                    ret_ty,
                    params,
                    ..
                } => {
                    fn_ret.insert(name.clone(), ret_ty.clone());
                    fn_params.insert(
                        name.clone(),
                        params.iter().map(|(_, t)| t.clone()).collect(),
                    );
                }
                ASTNode::Const { name, ty, value } => {
                    const_ty.insert(name.clone(), ty.clone());
                    const_addr.insert(name.clone(), *value);
                }
                ASTNode::Isr { .. } => {}
            }
        }
        ProgramInfo {
            fn_ret,
            fn_params,
            const_ty,
            const_addr,
        }
    }

    fn has_function(&self, name: &str) -> bool {
        self.fn_ret.contains_key(name)
    }

    fn is_direct_callee(&self, name: &str) -> bool {
        self.has_function(name) || is_intrinsic_function(name)
    }
}

/// Lowers every reachable function/ISR in a program to SSA IR. Unreachable
/// functions are skipped: they are never emitted anyway, and compiling dead code
/// can hit lowering corner cases that a live program never reaches (e.g. a
/// peripheral helper whose per-device address constants are all zero on a part
/// that lacks that peripheral, which constant-folds a guard into a degenerate
/// branch). ISRs are roots and always lowered.
/// Every top-level function name in the program (used to lower all functions, e.g.
/// for IR inspection or unit tests, rather than only those reachable from `@main`).
pub fn all_function_names(ast: &[ASTNode]) -> HashSet<String> {
    ast.iter()
        .filter_map(|n| match n {
            ASTNode::Func { name, .. } => Some(name.clone()),
            _ => None,
        })
        .collect()
}

pub fn lower_program(
    ast: &[ASTNode],
    reachable: &HashSet<String>,
    warnings: &mut Vec<String>,
) -> Result<Vec<IrFunction>, String> {
    let info = ProgramInfo::from_ast(ast);
    for node in ast {
        if let ASTNode::Const { name, ty, value } = node {
            if name.starts_with('%') {
                // For a `%REG` constant the declared type is the register's width and
                // the value is its address, which only has to fit the data address space.
                if *value < 0 || *value > 0xFFFF {
                    return Err(format!(
                        "Type Error: hardware register '{}' address {} is outside the 16-bit address space",
                        name, value
                    ));
                }
            } else if !literal_fits(i64::from(*value), IrType::from_decl(ty)) {
                return Err(format!(
                    "Type Error: constant '{}' value {} does not fit in type '{}'",
                    name, value, ty
                ));
            }
        }
    }
    let mut out = Vec::new();
    for node in ast {
        match node {
            ASTNode::Func {
                name,
                params,
                ret_ty,
                body,
            } => {
                if reachable.contains(name) {
                    out.push(lower_function(name, params, ret_ty, body, &info, warnings)?);
                }
            }
            ASTNode::Isr { vector, body } => {
                let isr_name = format!("__isr_{}", vector);
                out.push(lower_function(&isr_name, &[], "void", body, &info, warnings)?);
            }
            ASTNode::Const { .. } => {}
        }
    }
    Ok(out)
}

fn lower_function(
    name: &str,
    params: &[(String, String)],
    ret_ty: &str,
    body: &[Stmt],
    info: &ProgramInfo,
    warnings: &mut Vec<String>,
) -> Result<IrFunction, String> {
    let mut lo = Lower::new(name, IrType::from_decl(ret_ty), info);

    // Collect declared variable types and the slot-backed set before walking the body.
    for (pn, pt) in params {
        lo.var_decl.insert(pn.clone(), pt.clone());
    }
    collect_decls(body, &mut lo.var_decl);
    collect_immutable(body, &mut lo.immutable);
    collect_slot_backed(body, &lo.var_decl, &mut lo.slot_backed);

    // Entry-block ABI parameters bind to SSA variables (scalars) or stack slots.
    for (pn, pt) in params {
        let ty = IrType::from_decl(pt);
        if lo.slot_backed.contains(pn) {
            // Address-taken parameter: materialize a slot and store the incoming value.
            let slot = lo.ensure_slot(pn);
            let var = lo.b.intern_var(pn, ty);
            let v = lo.b.append_param(var, ty);
            let addr = lo.b.stack_addr(slot, IrType::Ptr { space: Space::Ram });
            lo.b.store(Space::Ram, addr, v);
        } else {
            let var = lo.b.intern_var(pn, ty);
            lo.b.append_param(var, ty);
        }
    }
    lo.b.seal_block(lo.b.entry());

    lo.lower_block(body)?;

    // A fall-through end with no explicit return: emit a void/zero return.
    if !lo.b.is_filled(lo.b.current_block()) {
        let rv = lo.ret_ty_default();
        lo.b.ret(rv);
    }

    warnings.append(&mut lo.warnings);
    Ok(lo.b.finalize())
}

struct Lower<'a> {
    b: Builder,
    info: &'a ProgramInfo,
    ret_ty: IrType,
    fn_name: String,
    var_decl: HashMap<String, String>,
    slot_backed: HashSet<String>,
    slots: HashMap<String, StackSlot>,
    /// Names declared `imut` (immutable). Assigning to one is a compile error.
    immutable: HashSet<String>,
    /// Targets already warned about implicit narrowing (one warning per target).
    narrow_warned: HashSet<String>,
    /// Non-fatal diagnostics produced while lowering this function; collected
    /// into `CodeGenerator::warnings` so front ends decide how to present them.
    warnings: Vec<String>,
    temp_id: u32,
}

impl<'a> Lower<'a> {
    fn new(name: &str, ret_ty: IrType, info: &'a ProgramInfo) -> Self {
        Lower {
            b: Builder::new(name, ret_ty),
            info,
            ret_ty,
            fn_name: name.to_string(),
            var_decl: HashMap::new(),
            slot_backed: HashSet::new(),
            slots: HashMap::new(),
            immutable: HashSet::new(),
            narrow_warned: HashSet::new(),
            warnings: Vec::new(),
            temp_id: 0,
        }
    }

    fn ret_ty_default(&mut self) -> Option<Value> {
        match self.ret_ty {
            IrType::Void => None,
            ty => Some(self.b.iconst(0, ty)),
        }
    }

    fn ensure_slot(&mut self, name: &str) -> StackSlot {
        if let Some(&s) = self.slots.get(name) {
            return s;
        }
        let decl = self.var_decl.get(name).cloned().unwrap_or_else(|| "u8".to_string());
        let size = decl_byte_size(&decl);
        let slot = self.b.f.new_stack_slot(size, self.var_space(name), name);
        self.slots.insert(name.to_string(), slot);
        slot
    }

    // ---- type inference ----

    fn var_ty(&self, name: &str) -> IrType {
        self.var_decl
            .get(name)
            .map(|t| IrType::from_decl(t))
            .unwrap_or(IrType::U8)
    }

    /// Best-effort type of an expression. `expected` biases literal width/sign/frac.
    fn expr_ty(&self, e: &Expr, expected: Option<IrType>) -> IrType {
        match e {
            Expr::Literal(v) => {
                match expected {
                    Some(t @ IrType::Int { .. }) | Some(t @ IrType::Ptr { .. }) => t,
                    _ if *v > 255 || *v < 0 => IrType::U16,
                    _ => IrType::U8,
                }
            }
            Expr::FloatLiteral(_) => expected.unwrap_or(IrType::Int {
                width: Width::W16,
                signed: true,
                frac: 8,
            }),
            Expr::StringLit(_) | Expr::AddrOf(_) => IrType::Ptr { space: Space::Ram },
            Expr::Deref(inner) => self.pointee_ty(inner),
            Expr::VarRef(name) => {
                if let Some(rest) = name.strip_prefix('%') {
                    self.info
                        .const_ty
                        .get(name)
                        .or_else(|| self.info.const_ty.get(rest))
                        .map(|t| IrType::from_decl(t))
                        .unwrap_or(IrType::U8)
                } else if let Some(t) = self.info.const_ty.get(name) {
                    // Plain value constant.
                    IrType::from_decl(t)
                } else {
                    self.var_ty(name)
                }
            }
            Expr::BinOp { left, op, right } => {
                if op == "[]" {
                    return self.elem_ty(left);
                }
                if is_cmp_or_logical(op) {
                    return IrType::Bool;
                }
                // Infer operands from THEIR OWN types, not the outer expected type. Passing
                // `expected` down would re-type an integer literal as fixed-point in a
                // fixed-point context (e.g. `$u16 * 256` inside an r16 expression would
                // wrongly become a Q8.8 multiply). A binop's type is governed by its
                // operands; context only coerces the final result.
                let lt = self.expr_ty(left, None);
                let rt = self.expr_ty(right, None);
                let base = join_ty(lt, rt);
                match (base, expected) {
                    (
                        IrType::Int { frac: 0, .. },
                        Some(exp @ IrType::Int { frac: 0, .. }),
                    ) => join_ty(base, exp),
                    (
                        IrType::Int { frac, .. },
                        Some(exp @ IrType::Int { .. }),
                    ) if frac > 0 => join_ty(base, exp),
                    _ => base,
                }
            }
            Expr::UnaryOp { op, expr } => {
                if op == "!" {
                    IrType::Bool
                } else {
                    self.expr_ty(expr, expected)
                }
            }
            Expr::Call { name, .. } => self
                .info
                .fn_ret
                .get(name)
                .map(|t| IrType::from_decl(t))
                .unwrap_or(IrType::U8),
        }
    }

    /// Element type of an array variable reference (the `left` of a `[]`).
    fn elem_ty(&self, base: &Expr) -> IrType {
        if let Expr::VarRef(name) = base {
            if let Some(decl) = self.var_decl.get(name) {
                if decl.starts_with("str ") {
                    return IrType::U8;
                }
                return IrType::from_decl(decl);
            }
        }
        IrType::U8
    }

    /// Pointee type of a pointer-valued expression (for `*p`).
    fn pointee_ty(&self, ptr: &Expr) -> IrType {
        match ptr {
            Expr::VarRef(name) => {
                if let Some(decl) = self.var_decl.get(name) {
                    if let Some(rest) = decl.strip_prefix("ptr ") {
                        let mut it = rest.splitn(2, ' ');
                        let _space = it.next();
                        if let Some(pointee) = it.next() {
                            return IrType::from_decl(pointee);
                        }
                    }
                }
            }
            Expr::BinOp { left, op, .. } if op == "+" || op == "-" => {
                return self.pointee_ty(left);
            }
            _ => {}
        }
        IrType::U8
    }

    fn pointer_space(&self, ptr: &Expr) -> Space {
        match ptr {
            Expr::VarRef(name) => {
                if let Some(decl) = self.var_decl.get(name) {
                    if let Some(rest) = decl.strip_prefix("ptr ") {
                        if let Some(sp) = rest.split(' ').next() {
                            return super::types::space_from_str(sp);
                        }
                    }
                    if let Some(rest) = decl.strip_prefix("str ") {
                        return super::types::space_from_str(rest.trim());
                    }
                }
            }
            Expr::StringLit(_) => return Space::Ram,
            Expr::BinOp { left, op, .. } if op == "+" || op == "-" => {
                return self.pointer_space(left);
            }
            Expr::AddrOf(inner) => {
                if matches!(&**inner, Expr::VarRef(name) if name.starts_with('@')) {
                    return Space::Flash;
                }
                return Space::Ram;
            }
            _ => {}
        }
        Space::Ram
    }

    // ---- statements ----

    fn lower_block(&mut self, stmts: &[Stmt]) -> Result<(), String> {
        for s in stmts {
            if self.b.is_filled(self.b.current_block()) {
                // Unreachable tail after a terminator; start a fresh block to keep
                // construction well-formed.
                let cont = self.b.create_block();
                self.b.seal_block(cont);
                self.b.switch_to_block(cont);
            }
            self.lower_stmt(s)?;
        }
        Ok(())
    }

    fn lower_stmt(&mut self, s: &Stmt) -> Result<(), String> {
        match s {
            Stmt::VarDecl { name, ty, expr, .. } => {
                self.var_decl.insert(name.clone(), ty.clone());
                let it = IrType::from_decl(ty);
                // A `flash str` keeps its bytes in program memory (read on demand via LPM),
                // never copied into SRAM. The handle is the flash byte address of the data.
                if ty == "str flash" {
                    if let Expr::StringLit(s) = expr {
                        let v = self.b.symbol_addr(
                            format!("$fstr:{}", s),
                            IrType::Ptr { space: Space::Flash },
                        );
                        let var = self.b.intern_var(name, IrType::Ptr { space: Space::Flash });
                        self.b.def_var(var, v);
                        return Ok(());
                    }
                }
                if self.slot_backed.contains(name) {
                    let slot = self.ensure_slot(name);
                    if !ty.contains('[') {
                        // Scalar slot init: store the initial value at the base.
                        // Coerce to the declared type so a wider initializer narrows
                        // (e.g. `ram $b: u8 = <u16>` truncates), matching assignment.
                        let v = self.lower_expr(expr, Some(it))?;
                        let v = self.coerce_to(v, it);
                        let space = self.var_space(name);
                        let addr = self.b.stack_addr(slot, IrType::Ptr { space });
                        self.b.store(space, addr, v);
                    } else if !ty.starts_with("flash ") && !ty.starts_with("eeprom ") {
                        // RAM array init: fill every element with the initializer value
                        // (RAM is not zeroed at reset). A LOOP is used rather than unrolled
                        // stores so a large array (e.g. `u8[128]`) does not explode into
                        // hundreds of instructions / register pressure.
                        self.lower_array_init(name, slot, ty, expr)?;
                    }
                } else {
                    // Coerce to the declared type so a wider initializer narrows
                    // (e.g. `ram $x: u8 = <u16>` truncates), matching assignment.
                    let v = self.lower_expr(expr, Some(it))?;
                    let v = self.coerce_to(v, it);
                    let var = self.b.intern_var(name, it);
                    self.b.def_var(var, v);
                }
                Ok(())
            }
            Stmt::Assign { expr, target, op } => self.lower_assign(target, expr, op),
            Stmt::Conditional {
                cond,
                then_block,
                else_block,
            } => self.lower_conditional(cond, then_block, else_block.as_deref()),
            Stmt::LoopRange {
                start,
                end,
                var_name,
                body,
            } => self.lower_loop_range(start, end, var_name, body),
            Stmt::LoopInfinite { body } => self.lower_loop_infinite(body),
            Stmt::Switch {
                expr,
                cases,
                default,
            } => self.lower_switch(expr, cases, default.as_deref()),
            Stmt::Return { val } => {
                let rv = match val {
                    Some(e) => Some(self.lower_expr(e, Some(self.ret_ty))?),
                    None => self.ret_ty_default(),
                };
                self.b.ret(rv);
                Ok(())
            }
            Stmt::ExprStmt { expr } => {
                self.lower_expr_effect(expr)?;
                Ok(())
            }
        }
    }

    fn lower_assign(&mut self, target: &Expr, expr: &Expr, op: &str) -> Result<(), String> {
        // Reject writes to immutable (`imut`) variables, including writes to their
        // array elements (`imut $a[i] -> ...`). Hardware registers (`%REG`) are exempt.
        if let Some(base) = assign_base_var(target) {
            if !base.starts_with('%') && self.immutable.contains(base) {
                return Err(format!(
                    "Immutability Error: cannot assign to immutable variable '{}'. Declare it with `mut` to allow assignment.",
                    base
                ));
            }
            if base.starts_with('$') && !self.var_decl.contains_key(base) {
                return Err(format!(
                    "Semantic Error: undefined variable '{}' in function '{}' (declare it first, e.g. `ram mut {}: u8 = 0`)",
                    base, self.fn_name, base
                ));
            }
            if !base.starts_with('$') && !base.starts_with('%') {
                return Err(format!(
                    "Semantic Error: cannot assign to '{}'; only variables ($), hardware registers (%), array elements and dereferenced pointers are assignable",
                    base
                ));
            }
        }

        let tty = self.expr_ty(target, None);
        self.warn_if_narrowing(target, expr, tty);
        // Compound assignment: target = target <op> expr.
        let rhs = if op == "->" {
            let r = self.lower_expr(expr, Some(tty))?;
            self.coerce_to(r, tty)
        } else {
            let cur = self.lower_expr(target, Some(tty))?;
            let cur = self.coerce_to(cur, tty);
            let e = self.lower_expr(expr, Some(tty))?;
            let e = self.coerce_to(e, tty);
            let compound = op.strip_prefix("->").unwrap_or(op);
            let bop = bin_op(compound).ok_or_else(|| format!("unsupported compound op '{}'", op))?;
            self.b.binary(bop, cur, e, tty)
        };

        match target {
            Expr::VarRef(name) if name.starts_with('%') => {
                self.b.hw_write(hw_reg_name(name), rhs);
                Ok(())
            }
            Expr::VarRef(name) if self.slot_backed.contains(name) => {
                let slot = self.ensure_slot(name);
                let space = self.var_space(name);
                let addr = self.b.stack_addr(slot, IrType::Ptr { space });
                self.b.store(space, addr, rhs);
                Ok(())
            }
            Expr::VarRef(name) => {
                let var = self.b.intern_var(name, tty);
                self.b.def_var(var, rhs);
                Ok(())
            }
            Expr::BinOp { left, op: idx, right } if idx == "[]" => {
                let addr = self.array_elem_addr(left, right)?;
                let space = self.array_space(left);
                self.b.store(space, addr, rhs);
                Ok(())
            }
            Expr::Deref(inner) => {
                let space = self.pointer_space(inner);
                let addr = self.lower_expr(inner, Some(IrType::Ptr { space }))?;
                self.b.store(space, addr, rhs);
                Ok(())
            }
            _ => Err("unsupported assignment target".to_string()),
        }
    }

    /// Fills a RAM array slot with `init` in every element, using a byte-offset loop so
    /// the emitted code size is independent of the array length.
    fn lower_array_init(
        &mut self,
        name: &str,
        slot: StackSlot,
        ty: &str,
        init: &Expr,
    ) -> Result<(), String> {
        let elem_ty = IrType::from_decl(ty);
        let count = array_count(ty);
        if count == 0 {
            return Ok(());
        }
        let esz = elem_ty.bytes().max(1);
        let v = self.lower_expr(init, Some(elem_ty))?;
        let v = self.coerce_to(v, elem_ty);
        let base = self.b.stack_addr(slot, IrType::Ptr { space: Space::Ram });

        // Small arrays: unrolled stores (cheaper than a loop's overhead).
        if count <= 4 {
            for i in 0..count {
                let addr = if i == 0 {
                    base
                } else {
                    let off = self.b.iconst((i * esz) as i64, IrType::U16);
                    self.b
                        .binary(BinOp::Add, base, off, IrType::Ptr { space: Space::Ram })
                };
                self.b.store(Space::Ram, addr, v);
            }
            return Ok(());
        }

        // Loop over byte offsets 0, esz, 2*esz, ... < count*esz.
        let ity = IrType::U16;
        let ovar = self.b.intern_var(&format!("$arrinit_{}_{}", name, slot.0), ity);
        let zero = self.b.iconst(0, ity);
        self.b.def_var(ovar, zero);
        let endv = self.b.iconst((count * esz) as i64, ity);
        let step = self.b.iconst(esz as i64, ity);

        let header = self.b.create_block();
        let body = self.b.create_block();
        let exit = self.b.create_block();
        self.b.jump(header);

        self.b.switch_to_block(header);
        let off = self.b.use_var(ovar);
        let cond = self.b.icmp(Cond::Lt, off, endv);
        self.b.branch(cond, body, exit);

        self.b.seal_block(body);
        self.b.switch_to_block(body);
        let off_b = self.b.use_var(ovar);
        let addr = self
            .b
            .binary(BinOp::Add, base, off_b, IrType::Ptr { space: Space::Ram });
        self.b.store(Space::Ram, addr, v);
        let next = self.b.binary(BinOp::Add, off_b, step, ity);
        self.b.def_var(ovar, next);
        self.b.jump(header);

        self.b.seal_block(header);
        self.b.seal_block(exit);
        self.b.switch_to_block(exit);
        Ok(())
    }

    fn lower_conditional(
        &mut self,
        cond: &Expr,
        then_block: &[Stmt],
        else_block: Option<&[Stmt]>,
    ) -> Result<(), String> {
        let c = self.lower_cond(cond)?;
        let then_b = self.b.create_block();
        let else_b = self.b.create_block();
        let merge = self.b.create_block();
        let else_target = if else_block.is_some() { else_b } else { merge };
        self.b.branch(c, then_b, else_target);

        // then
        self.b.seal_block(then_b);
        self.b.switch_to_block(then_b);
        self.lower_block(then_block)?;
        if !self.b.is_filled(self.b.current_block()) {
            self.b.jump(merge);
        }

        // else
        if let Some(eb) = else_block {
            self.b.seal_block(else_b);
            self.b.switch_to_block(else_b);
            self.lower_block(eb)?;
            if !self.b.is_filled(self.b.current_block()) {
                self.b.jump(merge);
            }
        } else {
            // else_b unused; seal it so finalize is well-formed (no preds).
            self.b.seal_block(else_b);
        }

        self.b.seal_block(merge);
        self.b.switch_to_block(merge);
        Ok(())
    }

    fn lower_loop_range(
        &mut self,
        start: &Expr,
        end: &Expr,
        var_name: &str,
        body: &[Stmt],
    ) -> Result<(), String> {
        let ity = IrType::U16;
        self.var_decl.insert(var_name.to_string(), "u16".to_string());
        let var = self.b.intern_var(var_name, ity);

        let s = self.lower_expr(start, Some(ity))?;
        let s = self.coerce_to(s, ity);
        self.b.def_var(var, s);
        // End bound is loop-invariant; compute once before the header. Widen to the
        // induction width so the header comparison is u16-vs-u16.
        let e = self.lower_expr(end, Some(ity))?;
        let e = self.coerce_to(e, ity);

        let header = self.b.create_block();
        let bodyb = self.b.create_block();
        let exit = self.b.create_block();
        self.b.jump(header);
        // header left open (back-edge pending).

        self.b.switch_to_block(header);
        let iv = self.b.use_var(var);
        let cond = self.b.icmp(Cond::Lt, iv, e);
        self.b.branch(cond, bodyb, exit);

        self.b.seal_block(bodyb);
        self.b.switch_to_block(bodyb);
        self.lower_block(body)?;
        if !self.b.is_filled(self.b.current_block()) {
            let iv2 = self.b.use_var(var);
            let one = self.b.iconst(1, ity);
            let next = self.b.binary(BinOp::Add, iv2, one, ity);
            self.b.def_var(var, next);
            self.b.jump(header);
        }

        self.b.seal_block(header);
        self.b.seal_block(exit);
        self.b.switch_to_block(exit);
        Ok(())
    }

    fn lower_loop_infinite(&mut self, body: &[Stmt]) -> Result<(), String> {
        let header = self.b.create_block();
        self.b.jump(header);
        self.b.switch_to_block(header);
        self.lower_block(body)?;
        if !self.b.is_filled(self.b.current_block()) {
            self.b.jump(header);
        }
        self.b.seal_block(header);
        // Code after an infinite loop is unreachable; continue in a fresh sealed block.
        let dead = self.b.create_block();
        self.b.seal_block(dead);
        self.b.switch_to_block(dead);
        Ok(())
    }

    fn lower_switch(
        &mut self,
        expr: &Expr,
        cases: &[(Expr, Vec<Stmt>)],
        default: Option<&[Stmt]>,
    ) -> Result<(), String> {
        let sty = self.expr_ty(expr, None);
        let subject = self.lower_expr(expr, Some(sty))?;
        let merge = self.b.create_block();

        for (case_expr, case_body) in cases {
            let cv = self.lower_expr(case_expr, Some(sty))?;
            let cv = self.coerce_to(cv, sty);
            let eq = self.b.icmp(Cond::Eq, subject, cv);
            let case_b = self.b.create_block();
            let next_b = self.b.create_block();
            self.b.branch(eq, case_b, next_b);

            self.b.seal_block(case_b);
            self.b.switch_to_block(case_b);
            self.lower_block(case_body)?;
            if !self.b.is_filled(self.b.current_block()) {
                self.b.jump(merge);
            }

            self.b.seal_block(next_b);
            self.b.switch_to_block(next_b);
        }

        if let Some(db) = default {
            self.lower_block(db)?;
        }
        if !self.b.is_filled(self.b.current_block()) {
            self.b.jump(merge);
        }
        self.b.seal_block(merge);
        self.b.switch_to_block(merge);
        Ok(())
    }

    // ---- expressions ----

    /// Lowers an expression that is used purely for effect (e.g. a call statement).
    fn lower_expr_effect(&mut self, e: &Expr) -> Result<(), String> {
        match e {
            Expr::Call { .. } => {
                self.lower_call(e, IrType::Void)?;
                Ok(())
            }
            _ => {
                // Evaluate and discard.
                let _ = self.lower_expr(e, None)?;
                Ok(())
            }
        }
    }

    /// Lowers a condition expression to a `Bool` value.
    fn lower_cond(&mut self, e: &Expr) -> Result<Value, String> {
        match e {
            Expr::BinOp { left, op, right } if is_cmp(op) => {
                let lt = self.expr_ty(left, None);
                let rt = self.expr_ty(right, None);
                let cty = join_ty(lt, rt);
                let l = self.lower_expr(left, Some(cty))?;
                let r = self.lower_expr(right, Some(cty))?;
                let l = self.coerce_to(l, cty);
                let r = self.coerce_to(r, cty);
                Ok(self.b.icmp(cmp_cond(op).unwrap(), l, r))
            }
            Expr::BinOp { left, op, right } if op == "&&" || op == "||" => {
                self.lower_short_circuit(left, right, op == "&&")
            }
            Expr::UnaryOp { op, expr } if op == "!" => {
                let v = self.lower_cond(expr)?;
                Ok(self.b.unary(UnOp::LogicalNot, v, IrType::Bool))
            }
            _ => {
                // Truthiness: value != 0.
                let ty = self.expr_ty(e, None);
                let v = self.lower_expr(e, Some(ty))?;
                let zero = self.b.iconst(0, ty);
                Ok(self.b.icmp(Cond::Ne, v, zero))
            }
        }
    }

    fn lower_short_circuit(&mut self, left: &Expr, right: &Expr, is_and: bool) -> Result<Value, String> {
        let lhs = self.lower_cond(left)?;
        let rhs_b = self.b.create_block();
        let const_b = self.b.create_block();
        let merge = self.b.create_block();
        let tmp_name = format!("$__sc{}", self.temp_id);
        self.temp_id += 1;
        let tmp = self.b.intern_var(&tmp_name, IrType::Bool);

        let cur = self.b.current_block();
        if is_and {
            self.b.branch(lhs, rhs_b, const_b);
        } else {
            self.b.branch(lhs, const_b, rhs_b);
        }
        self.b.seal_block(cur);

        self.b.switch_to_block(rhs_b);
        let rhs = self.lower_cond(right)?;
        self.b.def_var(tmp, rhs);
        self.b.jump(merge);
        self.b.seal_block(rhs_b);

        self.b.switch_to_block(const_b);
        let k = self.b.iconst(if is_and { 0 } else { 1 }, IrType::Bool);
        self.b.def_var(tmp, k);
        self.b.jump(merge);
        self.b.seal_block(const_b);

        self.b.switch_to_block(merge);
        self.b.seal_block(merge);
        Ok(self.b.use_var(tmp))
    }

    /// Implicit narrowing (e.g. a u16 value assigned to a u8 target) truncates to the
    /// low byte(s) at runtime. That is defined behavior (see docs: reference/types),
    /// but it is easy to hit by accident in a plain `$a -> $b` assignment where no
    /// type is visible at the site, so each narrowed target warns once. Declarations
    /// (`ram imut $x: u8 = <wider expr>`) never warn: the narrower type written at
    /// the site IS the language's explicit-conversion idiom. Also exempt: literals
    /// (range-checked against the target type instead) and expressions that provably
    /// fit the target width (`$u16 & 0xFF`, `$u16 >> 8`, `$u16 % 10`, ...).
    fn warn_if_narrowing(&mut self, target: &Expr, expr: &Expr, tty: IrType) {
        if matches!(expr, Expr::Literal(_) | Expr::FloatLiteral(_)) {
            return;
        }
        let sty = self.expr_ty(expr, None);
        if !matches!(sty, IrType::Int { frac: 0, .. }) || !matches!(tty, IrType::Int { frac: 0, .. }) {
            return;
        }
        if sty.bytes() <= tty.bytes() {
            return;
        }
        if self.expr_max_bits(expr) <= u32::from(tty.bytes()) * 8 {
            return;
        }
        let desc = match assign_base_var(target) {
            Some(base) => base.to_string(),
            None => return,
        };
        if self.narrow_warned.insert(desc.clone()) {
            self.warnings.push(format!(
                "implicit narrowing from {} to {} in assignment to '{}' in function '{}'; the value is truncated (mask with `& 0xFF` or shift to state the intent)",
                sty, tty, desc, self.fn_name
            ));
        }
    }

    /// Conservative upper bound on the significant bits of an expression's value,
    /// used only to suppress the narrowing warning when the value provably fits.
    fn expr_max_bits(&self, e: &Expr) -> u32 {
        let full = |s: &Self, e: &Expr| u32::from(s.expr_ty(e, None).bytes()) * 8;
        match e {
            Expr::Literal(v) => {
                if *v < 0 {
                    16
                } else {
                    32 - (*v as u32).leading_zeros()
                }
            }
            Expr::BinOp { left, op, right } => {
                let lb = self.expr_max_bits(left);
                let rb = self.expr_max_bits(right);
                match op.as_str() {
                    "&" => lb.min(rb),
                    "|" | "^" => lb.max(rb),
                    ">>" => match &**right {
                        Expr::Literal(n) if *n >= 0 => lb.saturating_sub(*n as u32),
                        _ => lb,
                    },
                    // Division by a power-of-two literal drops that many bits.
                    "/" => match &**right {
                        Expr::Literal(n) if *n > 0 && (*n & (*n - 1)) == 0 => {
                            lb.saturating_sub((*n as u32).trailing_zeros())
                        }
                        _ => lb,
                    },
                    // The remainder is strictly below the divisor.
                    "%" => match &**right {
                        Expr::Literal(n) if *n > 0 => 32 - ((*n as u32) - 1).leading_zeros(),
                        _ => lb.min(rb),
                    },
                    _ => full(self, e),
                }
            }
            _ => full(self, e),
        }
    }

    fn lower_expr(&mut self, e: &Expr, expected: Option<IrType>) -> Result<Value, String> {
        match e {
            Expr::Literal(v) => {
                let ty = self.expr_ty(e, expected);
                if !literal_fits(i64::from(*v), ty) {
                    return Err(format!(
                        "Type Error: literal {} does not fit in type '{}' in function '{}'",
                        v, ty, self.fn_name
                    ));
                }
                Ok(self.b.iconst(*v as i64, ty))
            }
            Expr::FloatLiteral(v) => {
                let ty = self.expr_ty(e, expected);
                let frac = ty.frac();
                let scaled = (*v * f64::from(1u32 << frac)).round() as i64;
                Ok(self.b.iconst(scaled, ty))
            }
            Expr::StringLit(s) => {
                // A string literal is the address of NUL-terminated data; isel emits the
                // data and resolves the symbol. Use a content-tagged symbol for now.
                Ok(self
                    .b
                    .symbol_addr(format!("$str:{}", s), IrType::Ptr { space: Space::Ram }))
            }
            Expr::AddrOf(inner) => self.lower_addr_of(inner),
            Expr::Deref(inner) => {
                let space = self.pointer_space(inner);
                let pointee = self.pointee_ty(inner);
                let addr = self.lower_expr(inner, Some(IrType::Ptr { space }))?;
                Ok(self.b.load(space, addr, pointee))
            }
            Expr::VarRef(name) => self.lower_var_ref(name),
            Expr::BinOp { left, op, right } if op == "[]" => {
                let addr = self.array_elem_addr(left, right)?;
                let space = self.array_space(left);
                let ety = self.elem_ty(left);
                Ok(self.b.load(space, addr, ety))
            }
            Expr::BinOp { left, op, right } if is_cmp(op) || op == "&&" || op == "||" => {
                self.lower_cond(e).map(|v| {
                    let _ = (left, op, right);
                    v
                })
            }
            Expr::BinOp { left, op, right } => {
                let ty = self.expr_ty(e, expected);
                let l = self.lower_expr(left, Some(ty))?;
                let r = self.lower_expr(right, Some(ty))?;
                let l = self.coerce_to(l, ty);
                let r = self.coerce_to(r, ty);
                // Fixed-point `*`/`/` need Q-format scale correction (a 32-bit intermediate,
                // done by a runtime routine) ONLY when BOTH operands are fixed-point. When
                // one operand is a plain integer (e.g. `$q88 / 3`, `$q88 * 2`), it is a scale
                // by an integer = plain integer arithmetic on the raw value — NOT a Q-format
                // op (using the routine there would be off by 2^frac).
                let both_fixed = self.expr_ty(left, None).is_fixed()
                    && self.expr_ty(right, None).is_fixed();
                if both_fixed && (op == "*" || op == "/") {
                    if ty.width() == Width::W8 {
                        let wide_ty = IrType::I16;
                        let lw = self.coerce_to(l, wide_ty);
                        let rw = self.coerce_to(r, wide_ty);
                        let shift = self.b.iconst(ty.frac() as i64, wide_ty);
                        let wide = if op == "*" {
                            let prod = self.b.binary(BinOp::Mul, lw, rw, wide_ty);
                            self.b.binary(BinOp::Shr, prod, shift, wide_ty)
                        } else {
                            let num = self.b.binary(BinOp::Shl, lw, shift, wide_ty);
                            self.b.binary(BinOp::Div, num, rw, wide_ty)
                        };
                        return Ok(self.coerce_to(wide, ty));
                    }
                    if ty.width() != Width::W16 {
                        return Err("backend: unsupported fixed-point mul/div width".to_string());
                    }
                    let callee = if op == "*" { "@__fmul16" } else { "@__fdiv16" };
                    return self
                        .b
                        .call(callee, vec![l, r], ty)
                        .ok_or_else(|| "fixed-point routine returned void".to_string());
                }
                let bop = bin_op(op).ok_or_else(|| format!("unsupported binary op '{}'", op))?;
                Ok(self.b.binary(bop, l, r, ty))
            }
            Expr::UnaryOp { op, expr } => {
                if op == "!" {
                    return self.lower_cond(e);
                }
                let ty = self.expr_ty(expr, expected);
                let v = self.lower_expr(expr, Some(ty))?;
                let uop = match op.as_str() {
                    "-" => UnOp::Neg,
                    "~" => UnOp::Bnot,
                    _ => return Err(format!("unsupported unary op '{}'", op)),
                };
                Ok(self.b.unary(uop, v, ty))
            }
            Expr::Call { .. } => {
                let ty = self.expr_ty(e, expected);
                self.lower_call(e, ty)?
                    .ok_or_else(|| "void call used as a value".to_string())
            }
        }
    }

    fn lower_var_ref(&mut self, name: &str) -> Result<Value, String> {
        if name.starts_with('%') {
            return Ok(self.b.hw_read(hw_reg_name(name), self.var_ref_hw_ty(name)));
        }
        // A bare `@fn` in value position is almost always a missing `&`; there is no
        // implicit function-to-pointer decay.
        if name.starts_with('@') {
            if self.info.has_function(name) || is_intrinsic_function(name) {
                return Err(format!(
                    "Semantic Error: function '{}' used as a value; use '&{}' to take its address",
                    name, name
                ));
            }
            return Err(format!("Semantic Error: undefined function '{}'", name));
        }
        // A plain (non-`%`) named constant folds to its compile-time value, so a
        // bit mask or command word becomes an immediate operand instead of a load.
        if !name.starts_with('$') {
            if let Some(&val) = self.info.const_addr.get(name) {
                let ty = self
                    .info
                    .const_ty
                    .get(name)
                    .map(|t| IrType::from_decl(t))
                    .unwrap_or(IrType::U8);
                return Ok(self.b.iconst(val as i64, ty));
            }
            return Err(format!(
                "Semantic Error: undefined constant '{}' (no `const {}` is declared for the selected target)",
                name, name
            ));
        }
        if !self.var_decl.contains_key(name) {
            return Err(format!(
                "Semantic Error: undefined variable '{}' in function '{}'",
                name, self.fn_name
            ));
        }
        if self.slot_backed.contains(name) {
            // Arrays decay to their base address. Address-taken scalars live in a slot
            // too, but reading the variable must load the scalar value, not the slot
            // address (the address is produced only by explicit `&$var`).
            let slot = self.ensure_slot(name);
            let space = self.var_space(name);
            let addr = self.b.stack_addr(slot, IrType::Ptr { space });
            let is_array = self.var_decl.get(name).map_or(false, |d| d.contains('['));
            if is_array {
                return Ok(addr);
            }
            return Ok(self.b.load(space, addr, self.var_ty(name)));
        }
        let ty = self.var_ty(name);
        let var = self.b.intern_var(name, ty);
        Ok(self.b.use_var(var))
    }

    fn var_ref_hw_ty(&self, name: &str) -> IrType {
        let rest = name.strip_prefix('%').unwrap_or(name);
        self.info
            .const_ty
            .get(name)
            .or_else(|| self.info.const_ty.get(rest))
            .map(|t| IrType::from_decl(t))
            .unwrap_or(IrType::U8)
    }

    fn lower_addr_of(&mut self, inner: &Expr) -> Result<Value, String> {
        match inner {
            // `&@func` is the code address of a function (a function pointer), not a data
            // slot. It resolves to the function's word address in flash for indirect calls.
            Expr::VarRef(name) if name.starts_with('@') => {
                if is_intrinsic_function(name) {
                    return Err(format!(
                        "Semantic Error: cannot take address of intrinsic function '{}'",
                        name
                    ));
                }
                if !self.info.has_function(name) {
                    return Err(format!("Semantic Error: undefined function '{}'", name));
                }
                Ok(self
                    .b
                    .symbol_addr(name.clone(), IrType::Ptr { space: Space::Flash }))
            }
            Expr::VarRef(name) => {
                if !name.starts_with('$') {
                    return Err(format!(
                        "Semantic Error: cannot take address of '{}'; constants and hardware registers have no data address",
                        name
                    ));
                }
                if !self.var_decl.contains_key(name) {
                    return Err(format!(
                        "Semantic Error: undefined variable '{}' in function '{}'",
                        name, self.fn_name
                    ));
                }
                let slot = self.ensure_slot(name);
                self.slot_backed.insert(name.clone());
                let space = self.var_space(name);
                Ok(self.b.stack_addr(slot, IrType::Ptr { space }))
            }
            Expr::BinOp { left, op, right } if op == "[]" => self.array_elem_addr(left, right),
            _ => Err("address-of is only supported on variables and array elements".to_string()),
        }
    }

    fn array_space(&self, base: &Expr) -> Space {
        if let Expr::VarRef(name) = base {
            return self.var_space(name);
        }
        Space::Ram
    }

    fn var_space(&self, name: &str) -> Space {
        if let Some(decl) = self.var_decl.get(name) {
            if decl.starts_with("flash ") {
                return Space::Flash;
            }
            if decl.starts_with("eeprom ") {
                return Space::Eeprom;
            }
            // String handles carry their storage as a suffix: `str flash` / `str ram`.
            if let Some(rest) = decl.strip_prefix("str ") {
                return super::types::space_from_str(rest.trim());
            }
        }
        Space::Ram
    }

    /// Computes the address of `base[index]` as `stack_addr(base) + index*elem_size`.
    fn array_elem_addr(&mut self, base: &Expr, index: &Expr) -> Result<Value, String> {
        let name = match base {
            Expr::VarRef(n) => n.clone(),
            _ => return Err("array indexing is only supported on named variables".to_string()),
        };
        if !name.starts_with('$') {
            return Err(format!(
                "Semantic Error: cannot index '{}'; only array or pointer variables ($) are indexable",
                name
            ));
        }
        if !self.var_decl.contains_key(&name) {
            return Err(format!(
                "Semantic Error: undefined variable '{}' in function '{}'",
                name, self.fn_name
            ));
        }
        let ety = self.elem_ty(base);
        let elem_size = ety.bytes().max(1);

        // Base address: a named array is slot-backed; a pointer variable holds an address.
        let base_addr = if self.slot_backed.contains(&name) || self.var_decl.get(&name).map_or(false, |d| d.contains('[')) {
            let slot = self.ensure_slot(&name);
            self.slot_backed.insert(name.clone());
            let space = self.var_space(&name);
            self.b.stack_addr(slot, IrType::Ptr { space })
        } else {
            // Pointer-typed variable: its value is the base address.
            let var = self.b.intern_var(&name, IrType::U16);
            self.b.use_var(var)
        };

        let idx = self.lower_expr(index, Some(IrType::U16))?;
        let idx16 = self.widen_to_u16(idx);
        let off = if elem_size == 1 {
            idx16
        } else {
            let sz = self.b.iconst(elem_size as i64, IrType::U16);
            self.b.binary(BinOp::Mul, idx16, sz, IrType::U16)
        };
        Ok(self
            .b
            .binary(BinOp::Add, base_addr, off, IrType::Ptr { space: self.var_space(&name) }))
    }

    fn widen_to_u16(&mut self, v: Value) -> Value {
        self.coerce_to(v, IrType::U16)
    }

    /// Inserts a width cast so `v` matches `ty`'s width, which is required before any
    /// binary op or comparison whose operands must share a width (e.g. a u16 loop
    /// induction variable compared against a u8 bound). Widening sign-extends signed
    /// sources and zero-extends unsigned ones; narrowing truncates.
    fn coerce_to(&mut self, v: Value, ty: IrType) -> Value {
        let vt = self.b.f.value_type(v);
        if vt.width() == ty.width() {
            return v;
        }
        let op = if vt.width() == Width::W8 {
            if vt.is_signed() {
                CastOp::Sext
            } else {
                CastOp::Zext
            }
        } else {
            CastOp::Trunc
        };
        self.b.cast(op, v, ty)
    }

    fn lower_call(&mut self, e: &Expr, ret: IrType) -> Result<Option<Value>, String> {
        let (name, args) = match e {
            Expr::Call { name, args } => (name, args),
            _ => return Err("not a call".to_string()),
        };

        // Indirect call: `@$var(...)` carries the callee variable in the name.
        if let Some(var) = name.strip_prefix("@$") {
            let vname = format!("${}", var);
            let ptr = self.lower_var_ref(&vname)?;
            let mut avals = Vec::with_capacity(args.len());
            for a in args {
                let aty = self.expr_ty(a, None);
                avals.push(self.lower_expr(a, Some(aty))?);
            }
            return Ok(self.b.call_indirect(ptr, avals, ret));
        }

        // Coerce each argument to its declared parameter type, so a value that infers
        // narrower than the parameter (e.g. the literal 255 -> u8 passed to a u16 param)
        // is widened to fill the full argument register pair.
        if !self.info.is_direct_callee(name) {
            return Err(format!("Semantic Error: undefined function '{}'", name));
        }

        let param_tys = self.info.fn_params.get(name).cloned();
        let mut avals = Vec::with_capacity(args.len());
        for (i, a) in args.iter().enumerate() {
            // `@spm`'s first operand is the SPMCSR *address*, which the backend needs
            // as a compile-time literal. SPMCSR lives at a different address on
            // different parts, so std/boot.ik passes a per-device `const %SPM_CTRL_REG`
            // here. Resolve such a hardware-register constant to its declared address
            // instead of emitting a register read.
            if name == "@spm" && i == 0 {
                if let Expr::VarRef(reg) = a {
                    if reg.starts_with('%') {
                        let addr = *self.info.const_addr.get(reg).ok_or_else(|| {
                            format!("Intrinsic @spm: unknown hardware register constant '{}'", reg)
                        })?;
                        avals.push(self.b.iconst(addr as i64, IrType::U16));
                        continue;
                    }
                }
            }
            // `@burn`'s literal cycle count is consumed at compile time by the
            // backend (which chunks it into delay loops), so it may exceed the
            // 16-bit value range that applies to ordinary literals.
            if name == "@burn" && i == 0 {
                if let Expr::Literal(n) = a {
                    if *n < 0 {
                        return Err(
                            "Intrinsic @burn expects a non-negative cycle count".to_string()
                        );
                    }
                    avals.push(self.b.iconst(i64::from(*n), IrType::U16));
                    continue;
                }
            }
            let pty = param_tys
                .as_ref()
                .and_then(|p| p.get(i))
                .map(|t| IrType::from_decl(t));
            let aty = pty.unwrap_or_else(|| self.expr_ty(a, None));
            let v = self.lower_expr(a, Some(aty))?;
            let v = self.coerce_to(v, aty);
            avals.push(v);
        }
        Ok(self.b.call(name.clone(), avals, ret))
    }
}

// ----------------------------------------------------------------------------------
// AST pre-passes and small helpers
// ----------------------------------------------------------------------------------

/// Returns the base variable name an assignment writes to: the variable itself for a
/// plain `$x -> ...`, or the array's name for an element store `$a[i] -> ...`. Returns
/// `None` for pointer-deref stores (those concern the pointee, not the pointer's mutability).
fn assign_base_var(target: &Expr) -> Option<&str> {
    match target {
        Expr::VarRef(name) => Some(name),
        Expr::BinOp { left, op, .. } if op == "[]" => assign_base_var(left),
        _ => None,
    }
}

/// Collects the names of all `imut` (immutable) variables declared in `stmts`, recursing
/// into nested blocks. Mirrors `collect_decls`'s traversal.
fn collect_immutable(stmts: &[Stmt], out: &mut HashSet<String>) {
    for s in stmts {
        match s {
            Stmt::VarDecl { name, is_mut: false, .. } => {
                out.insert(name.clone());
            }
            Stmt::LoopRange { body, .. } | Stmt::LoopInfinite { body } => {
                collect_immutable(body, out);
            }
            Stmt::Conditional {
                then_block,
                else_block,
                ..
            } => {
                collect_immutable(then_block, out);
                if let Some(eb) = else_block {
                    collect_immutable(eb, out);
                }
            }
            Stmt::Switch { cases, default, .. } => {
                for (_, body) in cases {
                    collect_immutable(body, out);
                }
                if let Some(db) = default {
                    collect_immutable(db, out);
                }
            }
            _ => {}
        }
    }
}

fn collect_decls(stmts: &[Stmt], out: &mut HashMap<String, String>) {
    for s in stmts {
        match s {
            Stmt::VarDecl { name, ty, .. } => {
                out.insert(name.clone(), ty.clone());
            }
            Stmt::LoopRange { var_name, body, .. } => {
                out.insert(var_name.clone(), "u16".to_string());
                collect_decls(body, out);
            }
            Stmt::LoopInfinite { body } => collect_decls(body, out),
            Stmt::Conditional {
                then_block,
                else_block,
                ..
            } => {
                collect_decls(then_block, out);
                if let Some(eb) = else_block {
                    collect_decls(eb, out);
                }
            }
            Stmt::Switch { cases, default, .. } => {
                for (_, body) in cases {
                    collect_decls(body, out);
                }
                if let Some(db) = default {
                    collect_decls(db, out);
                }
            }
            _ => {}
        }
    }
}

/// A variable must live in a stack slot if it is an array, or if its address is taken
/// anywhere (so it has a stable data-space address).
fn collect_slot_backed(stmts: &[Stmt], decls: &HashMap<String, String>, out: &mut HashSet<String>) {
    for (name, ty) in decls {
        if ty.contains('[') {
            out.insert(name.clone());
        }
    }
    walk_addr_taken_stmts(stmts, out);
}

fn walk_addr_taken_stmts(stmts: &[Stmt], out: &mut HashSet<String>) {
    for s in stmts {
        match s {
            Stmt::VarDecl { expr, .. } => walk_addr_taken_expr(expr, out),
            Stmt::Assign { expr, target, .. } => {
                walk_addr_taken_expr(expr, out);
                walk_addr_taken_expr(target, out);
            }
            Stmt::ExprStmt { expr } => walk_addr_taken_expr(expr, out),
            Stmt::Return { val: Some(e) } => walk_addr_taken_expr(e, out),
            Stmt::Conditional {
                cond,
                then_block,
                else_block,
            } => {
                walk_addr_taken_expr(cond, out);
                walk_addr_taken_stmts(then_block, out);
                if let Some(eb) = else_block {
                    walk_addr_taken_stmts(eb, out);
                }
            }
            Stmt::LoopRange {
                start, end, body, ..
            } => {
                walk_addr_taken_expr(start, out);
                walk_addr_taken_expr(end, out);
                walk_addr_taken_stmts(body, out);
            }
            Stmt::LoopInfinite { body } => walk_addr_taken_stmts(body, out),
            Stmt::Switch {
                expr,
                cases,
                default,
            } => {
                walk_addr_taken_expr(expr, out);
                for (ce, body) in cases {
                    walk_addr_taken_expr(ce, out);
                    walk_addr_taken_stmts(body, out);
                }
                if let Some(db) = default {
                    walk_addr_taken_stmts(db, out);
                }
            }
            _ => {}
        }
    }
}

fn walk_addr_taken_expr(e: &Expr, out: &mut HashSet<String>) {
    match e {
        Expr::AddrOf(inner) => {
            // &$x or &$arr[i]
            match &**inner {
                Expr::VarRef(name) => {
                    out.insert(name.clone());
                }
                Expr::BinOp { left, op, .. } if op == "[]" => {
                    if let Expr::VarRef(name) = &**left {
                        out.insert(name.clone());
                    }
                }
                _ => {}
            }
            walk_addr_taken_expr(inner, out);
        }
        Expr::Deref(inner) => walk_addr_taken_expr(inner, out),
        Expr::UnaryOp { expr, .. } => walk_addr_taken_expr(expr, out),
        Expr::BinOp { left, right, .. } => {
            walk_addr_taken_expr(left, out);
            walk_addr_taken_expr(right, out);
        }
        Expr::Call { args, .. } => {
            for a in args {
                walk_addr_taken_expr(a, out);
            }
        }
        _ => {}
    }
}

/// True when integer literal `v` is representable in `ty`'s bit width. Both
/// interpretations of the bit pattern are accepted — `u8 = -15` stores 0xF1 and
/// `i8 = 0xFF` stores -1 (two's complement storage, see test_literals) — so only
/// values that do not fit in the width at all are rejected. Fixed-point types are
/// exempt: an integer literal there is a raw-value operand (see the fixed-point
/// mul/div note in `lower_expr`).
fn literal_fits(v: i64, ty: IrType) -> bool {
    match ty {
        IrType::Int { width, frac: 0, .. } => {
            let bits = match width {
                Width::W8 => 8,
                Width::W16 => 16,
            };
            v >= -(1i64 << (bits - 1)) && v < (1i64 << bits)
        }
        _ => true,
    }
}

fn decl_byte_size(decl: &str) -> u16 {
    let core = strip_storage(decl);
    if let Some(open) = core.find('[') {
        let base = &core[..open];
        let count: u16 = core[open + 1..]
            .trim_end_matches(']')
            .trim()
            .parse()
            .unwrap_or(1);
        return count.max(1) * IrType::from_decl(base).bytes().max(1);
    }
    IrType::from_decl(core).bytes().max(1)
}

/// Element count of an array type like `u8[8]` (1 if not an array).
fn array_count(ty: &str) -> u16 {
    let core = strip_storage(ty);
    if let Some(open) = core.find('[') {
        core[open + 1..]
            .trim_end_matches(']')
            .trim()
            .parse()
            .unwrap_or(1)
    } else {
        1
    }
}

fn strip_storage(ty: &str) -> &str {
    if let Some(r) = ty.strip_prefix("flash ") {
        r
    } else if let Some(r) = ty.strip_prefix("eeprom ") {
        r
    } else {
        ty
    }
}

fn hw_reg_name(name: &str) -> String {
    name.strip_prefix('%').unwrap_or(name).to_string()
}

fn is_cmp(op: &str) -> bool {
    matches!(op, "==" | "!=" | "<" | ">" | "<=" | ">=")
}

fn is_cmp_or_logical(op: &str) -> bool {
    is_cmp(op) || op == "&&" || op == "||"
}

fn cmp_cond(op: &str) -> Option<Cond> {
    Some(match op {
        "==" => Cond::Eq,
        "!=" => Cond::Ne,
        "<" => Cond::Lt,
        "<=" => Cond::Le,
        ">" => Cond::Gt,
        ">=" => Cond::Ge,
        _ => return None,
    })
}

fn bin_op(op: &str) -> Option<BinOp> {
    Some(match op {
        "+" => BinOp::Add,
        "-" => BinOp::Sub,
        "*" => BinOp::Mul,
        "/" => BinOp::Div,
        "%" => BinOp::Rem,
        "&" => BinOp::And,
        "|" => BinOp::Or,
        "^" => BinOp::Xor,
        "<<" => BinOp::Shl,
        ">>" => BinOp::Shr,
        _ => return None,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lexer::Lexer;
    use crate::parser::Parser;

    fn lower_src(src: &str) -> Result<Vec<IrFunction>, String> {
        let toks = Lexer::new(src).tokenize().expect("lex");
        let ast = Parser::new(toks).parse().expect("parse");
        lower_program(&ast, &all_function_names(&ast), &mut Vec::new())
    }

    fn lower_err(src: &str) -> String {
        match lower_src(src) {
            Ok(_) => panic!("expected lowering to fail"),
            Err(err) => err,
        }
    }

    #[test]
    fn rejects_undefined_direct_call() {
        let err = lower_err("target atmega328p\n@main { @missing() }\n");
        assert!(
            err.contains("undefined function '@missing'"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn rejects_undefined_function_address() {
        let err = lower_err(
            "target atmega328p\n@main {\n  ram mut $fp: fn() = &@missing\n}\n",
        );
        assert!(
            err.contains("undefined function '@missing'"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn allows_declared_functions_and_intrinsics() {
        lower_src(
            "target atmega328p\n@callee() { }\n@main { @callee() @nop() @burn(1) }\n",
        )
        .expect("declared functions and intrinsics should lower");
    }

    #[test]
    fn rejects_undefined_variable_read() {
        let err = lower_err(
            "target atmega328p\nconst %PORTB: u8 = 0x25\n@main {\n  $typo -> %PORTB\n}\n",
        );
        assert!(
            err.contains("undefined variable '$typo'"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn rejects_undefined_variable_write() {
        let err = lower_err("target atmega328p\n@main {\n  5 -> $typo\n}\n");
        assert!(
            err.contains("undefined variable '$typo'"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn rejects_undefined_constant() {
        let err = lower_err(
            "target atmega328p\nconst %PORTB: u8 = 0x25\n@main {\n  NO_SUCH_MASK -> %PORTB\n}\n",
        );
        assert!(
            err.contains("undefined constant 'NO_SUCH_MASK'"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn rejects_undefined_variable_address_and_index() {
        let err = lower_err(
            "target atmega328p\n@main {\n  ram ptr u8 $p = &$ghost\n}\n",
        );
        assert!(err.contains("undefined variable '$ghost'"), "unexpected error: {}", err);
        let err = lower_err(
            "target atmega328p\nconst %PORTB: u8 = 0x25\n@main {\n  $ghost[2] -> %PORTB\n}\n",
        );
        assert!(err.contains("undefined variable '$ghost'"), "unexpected error: {}", err);
    }

    #[test]
    fn rejects_assignment_to_constant() {
        let err = lower_err(
            "target atmega328p\nconst MASK: u8 = 3\n@main {\n  5 -> MASK\n}\n",
        );
        assert!(err.contains("cannot assign to 'MASK'"), "unexpected error: {}", err);
    }

    #[test]
    fn rejects_bare_function_reference() {
        let err = lower_err(
            "target atmega328p\nconst %PORTB: u8 = 0x25\n@f() -> u8 { return 1 }\n@main {\n  ram mut $x: u8 = 0\n  @f -> $x\n  $x -> %PORTB\n}\n",
        );
        assert!(
            err.contains("function '@f' used as a value"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn rejects_out_of_range_literal() {
        let err = lower_err("target atmega328p\n@main {\n  ram mut $x: u8 = 300\n}\n");
        assert!(
            err.contains("literal 300 does not fit in type 'u8'"),
            "unexpected error: {}",
            err
        );
        let err = lower_err("target atmega328p\n@main {\n  ram mut $x: u16 = 70000\n}\n");
        assert!(
            err.contains("literal 70000 does not fit in type 'u16'"),
            "unexpected error: {}",
            err
        );
    }

    #[test]
    fn accepts_bit_pattern_literals() {
        // Two's-complement storage: `u8 = -15` (0xF1) and `i8 = 0xFF` (-1) are
        // deliberate idioms (see tests/compiler/test_literals.ik).
        lower_src(
            "target atmega328p\n@main {\n  ram mut $a: u8 = -15\n  ram mut $b: i8 = 0xFF\n  ram mut $c: u16 = 0xFFFF\n  ram mut $d: i16 = -32768\n}\n",
        )
        .expect("width-fitting literals should lower");
    }

    #[test]
    fn rejects_out_of_range_const() {
        let err = lower_err("target atmega328p\nconst MASK: u8 = 300\n@main { }\n");
        assert!(
            err.contains("constant 'MASK' value 300 does not fit"),
            "unexpected error: {}",
            err
        );
    }
}

/// Width/sign/frac join used for binary arithmetic result typing: widen to 16-bit if
/// either side is, prefer signed/fixed when present.
fn join_ty(a: IrType, b: IrType) -> IrType {
    let width = if a.width() == Width::W16 || b.width() == Width::W16 {
        Width::W16
    } else {
        Width::W8
    };
    let signed = a.is_signed() || b.is_signed();
    let frac = a.frac().max(b.frac());
    IrType::Int {
        width,
        signed,
        frac,
    }
}
