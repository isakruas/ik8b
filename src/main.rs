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

use std::env;
use std::fs;
use std::process;

mod lexer;
mod parser;
mod codegen;
mod devices;
mod vectors;

const VERSION: &str = env!("CARGO_PKG_VERSION");
const LICENSE: &str = "Apache-2.0";

fn print_help(program: &str) {
    println!("ik8b {} - AVR-8 source compiler and simulator", VERSION);
    println!();
    println!("Usage: {} <command> [arguments]", program);
    println!();
    println!("Commands:");
    println!("  build <file.ik>        Compile a source file to Intel HEX");
    println!("  run   <file.ik>        Compile, then simulate the result");
    println!("  sim   <file.hex>       Simulate an already-assembled HEX image");
    println!("  devices                List supported target devices");
    println!("  info                   Print compiler and target support summary");
    println!("  version                Print compiler version");
    println!("  license                Print license information");
    println!("  help                   Show this help text");
    println!();
    println!("Build options (build, run):");
    println!("  -o <out.hex>           Output Intel HEX path (default: out.hex)");
    println!("  --emit <hex|ir>        Output kind: hex (default) or SSA ir");
    println!("  --report               Print a memory-usage report (SRAM_BYTES=<n> first)");
    println!();
    println!("Simulation options (run, sim):");
    println!("  --mcu <device>         Target device (sim only; run uses the source target)");
    println!("  --trace                Print an instruction trace");
    println!("  --dump                 Dump registers/PC/SP/SREG at exit");
    println!("  --limit <N>            Stop after N instructions");
    println!("  --irq <V>              Raise interrupt vector V at startup");
    println!("  --irq-at <V:STEP>      Raise vector V once at instruction STEP");
    println!("  --irq-every <V:N>      Raise vector V every N instructions");
    println!("  --peek <addr>          Print data memory at <addr> on exit (hex or decimal)");
    println!("  --peek-len <N>         Number of bytes for --peek (default: 1)");
    println!();
    println!("The compile target is selected by a mandatory top-level declaration in the");
    println!("source, e.g. `target atmega328p`. The same simulation options are used by the");
    println!("standalone ik8bvm simulator. A bare `{} <file.ik>` is treated as `build`.", program);
}

fn print_version() {
    println!("ik8b {}", VERSION);
}

fn print_license() {
    println!("ik8b {}", VERSION);
    println!("License: {}", LICENSE);
    println!("Copyright 2026 The ik8b Authors");
    println!("Full text: LICENSE or https://www.apache.org/licenses/LICENSE-2.0");
}

fn print_info(program: &str) {
    let mut core_counts = std::collections::BTreeMap::<String, usize>::new();
    for device in devices::DEVICE_TABLE {
        *core_counts.entry(format!("{:?}", device.core)).or_insert(0) += 1;
    }

    println!("ik8b {}", VERSION);
    println!("License: {}", LICENSE);
    println!("Output: Intel HEX for AVR-8 instruction words");
    println!("Supported devices: {}", devices::DEVICE_TABLE.len());
    println!("Core families:");
    for (core, count) in core_counts {
        println!("  {:<8} {}", core, count);
    }
    println!();
    println!("Use `{} list-devices` for the full device table.", program);
}

fn print_device_table() {
    let mut rows: Vec<_> = devices::DEVICE_TABLE.iter().collect();
    rows.sort_by_key(|d| (format!("{:?}", d.core), d.name));

    println!(
        "{:<10} {:<18} {:>8} {:>8} {:>8} {:>10}",
        "CORE", "DEVICE", "SRAM", "FLASH", "EEPROM", "SRAM_START"
    );
    println!("{}", "-".repeat(70));
    for d in rows {
        println!(
            "{:<10} {:<18} {:>8} {:>8} {:>8} 0x{:04X}",
            format!("{:?}", d.core),
            d.name,
            d.sram_size,
            d.flash_size,
            d.eeprom_size,
            d.sram_start
        );
    }
}

pub struct SimConfig {
    pub simulate: bool,
    pub trace: bool,
    pub limit: u64,
    pub dump: bool,
    pub irq_init: Vec<u8>,
    pub irq_at: Vec<(u8, u64)>,
    pub irq_every: Vec<(u8, u64)>,
    pub peek: Option<u32>,
    pub peek_len: u32,
}

/// What a compile should write out.
#[derive(Clone, Copy, PartialEq)]
pub enum Emit {
    /// Intel HEX (default), written to the `-o` path.
    Hex,
    /// SSA intermediate representation, printed to stdout (no HEX written).
    Ir,
}

/// Parsed options for the `build` / `run` paths.
pub struct CompileOpts {
    pub input: String,
    pub output: String,
    pub report: bool,
    pub emit: Emit,
    pub sim: SimConfig,
}

/// Parses a `VEC:NUMBER` pair (used by `--irq-at` / `--irq-every`).
fn parse_pair(s: &str) -> Option<(u8, u64)> {
    let (v, n) = s.split_once(':')?;
    Some((v.parse().ok()?, n.parse().ok()?))
}

/// Parses an address/number in hex (`0x..`) or decimal (used by `--peek`).
fn parse_u32(s: &str) -> Option<u32> {
    s.strip_prefix("0x")
        .or_else(|| s.strip_prefix("0X"))
        .map(|h| u32::from_str_radix(h, 16))
        .unwrap_or_else(|| s.parse())
        .ok()
}

/// `ik8b --sim-hex <file.hex> --mcu <device> [--trace] [--limit N] [--dump]`
/// `        [--irq V] [--irq-at V:STEP] [--irq-every V:PERIOD]`
///
/// Runs an already-assembled Intel HEX image in the embedded ik8bvm simulator
/// (the same VM that powers `--simulate`), reporting the exact cycle and
/// instruction counts. Because it takes a raw hex it works for images produced
/// by any toolchain (ik8b, avr-gcc, hand-written asm), so the benchmark harness
/// can compare them on one cycle-accurate model without an external simulator.
/// The device's real core class drives per-core cycle timing. The simulation
/// flags are the same ones `--simulate` and the ik8bvm CLI use.
fn run_sim_hex(args: &[String]) -> ! {
    let mut hexfile: Option<String> = None;
    let mut mmcu: Option<String> = None;
    let mut trace = false;
    let mut dump = false;
    let mut max_instr: u64 = 0;
    let mut irq_init: Vec<u8> = Vec::new();
    let mut irq_at: Vec<(u8, u64)> = Vec::new();
    let mut irq_every: Vec<(u8, u64)> = Vec::new();
    let mut peek: Option<u32> = None;
    let mut peek_len: u32 = 1;

    let bad = |msg: &str| -> ! {
        eprintln!("--sim-hex: {}", msg);
        eprintln!("Usage: ik8b --sim-hex <file.hex> --mcu <device> [--trace] [--limit N] [--dump] [--peek ADDR] [--peek-len N]");
        process::exit(1);
    };

    let mut i = 2;
    while i < args.len() {
        let a = args[i].as_str();
        match a {
            "--trace" => trace = true,
            "--dump" => dump = true,
            "--mcu" => {
                i += 1;
                mmcu = args.get(i).cloned();
            }
            "--limit" => {
                i += 1;
                max_instr = args.get(i).and_then(|s| s.parse().ok()).unwrap_or_else(|| bad("--limit expects an instruction count"));
            }
            "--irq" => {
                i += 1;
                irq_init.push(args.get(i).and_then(|s| s.parse().ok()).unwrap_or_else(|| bad("--irq expects a vector number")));
            }
            "--irq-at" => {
                i += 1;
                irq_at.push(args.get(i).and_then(|s| parse_pair(s)).unwrap_or_else(|| bad("--irq-at expects VEC:STEP")));
            }
            "--irq-every" => {
                i += 1;
                irq_every.push(args.get(i).and_then(|s| parse_pair(s)).unwrap_or_else(|| bad("--irq-every expects VEC:PERIOD")));
            }
            "--peek" => {
                i += 1;
                peek = Some(args.get(i).and_then(|s| parse_u32(s)).unwrap_or_else(|| bad("--peek expects a data address")));
            }
            "--peek-len" => {
                i += 1;
                peek_len = args.get(i).and_then(|s| s.parse().ok()).unwrap_or_else(|| bad("--peek-len expects a byte count"));
            }
            other if !other.starts_with('-') && hexfile.is_none() => hexfile = Some(other.to_string()),
            other => bad(&format!("unexpected argument '{}'", other)),
        }
        i += 1;
    }

    let hex = hexfile.unwrap_or_else(|| bad("requires a hex file path"));
    let mmcu = mmcu.unwrap_or_else(|| bad("requires --mcu <device> (run `ik8b --list-devices`)"));

    let dev = ik8bvm::devices::AVR_DEVICE_TABLE
        .iter()
        .find(|d| d.name == mmcu)
        .unwrap_or_else(|| {
            eprintln!("--sim-hex: unknown device '{}' (run `ik8b --list-devices`)", mmcu);
            process::exit(1);
        });

    let mut vm = ik8bvm::core::AvrVm::new(
        dev.name.to_string(),
        dev.core,
        dev.flash_bytes,
        dev.sram_bytes,
        dev.eeprom_bytes,
        dev.sram_start,
    );
    vm.sp = dev.ram_end as u16;
    vm.trace = trace;

    if let Err(e) = ik8bvm::hw::load_hex(&mut vm, &hex) {
        eprintln!("--sim-hex: failed to load '{}': {}", hex, e);
        process::exit(1);
    }

    for v in irq_init {
        vm.raise_interrupt(v);
    }
    let mut at_pending: Vec<(u8, u64, bool)> = irq_at.iter().map(|&(v, s)| (v, s, false)).collect();
    let mut every_next: Vec<(u8, u64, u64)> = irq_every.iter().map(|&(v, p)| (v, p, p)).collect();

    let mut executed: u64 = 0;
    while vm.running {
        for ev in &mut at_pending {
            if !ev.2 && executed >= ev.1 {
                vm.raise_interrupt(ev.0);
                ev.2 = true;
            }
        }
        for ev in &mut every_next {
            if executed >= ev.2 {
                vm.raise_interrupt(ev.0);
                ev.2 += ev.1;
            }
        }
        vm.step();
        executed += 1;
        if max_instr > 0 && executed >= max_instr {
            break;
        }
    }

    if vm.trace {
        for line in &vm.trace_buf {
            println!("{}", line);
        }
    }
    if dump {
        println!("Registers:");
        for i in 0..32 {
            print!("R{:<2}=0x{:02X} ", i, vm.r[i]);
            if i % 8 == 7 {
                println!();
            }
        }
        println!("PC=0x{:06X} SP=0x{:04X} SREG=0x{:02X}", vm.pc, vm.sp, vm.sreg);
    }
    if let Some(addr) = peek {
        for k in 0..peek_len.max(1) {
            let a = addr + k;
            println!("MEM[0x{:04X}] = 0x{:02X}", a, vm.read_data(a));
        }
    }
    // Machine-readable summary parsed by the benchmark/test harnesses.
    println!("Instructions = {}", executed);
    println!("Cycles = {}", vm.cycles);
    println!("R16 = 0x{:02X}", vm.r[16]);

    process::exit(if vm.unknown_opcode { 2 } else { 0 });
}

/// Parses `build`/`run` options. `start` is the index of the input file in `args`
/// (1 for the bare `ik8b <file>` form, 2 after a `build`/`run` subcommand).
fn parse_compile_args(args: &[String], start: usize) -> Result<CompileOpts, String> {
    let input_file = args
        .get(start)
        .cloned()
        .ok_or_else(|| "missing input source file".to_string())?;
    let mut output_file = "out.hex".to_string();
    let mut report = false;
    let mut emit = Emit::Hex;
    let mut sim = SimConfig {
        simulate: false, trace: false, limit: 100_000_000, dump: false,
        irq_init: vec![], irq_at: vec![], irq_every: vec![],
        peek: None, peek_len: 1,
    };
    let mut idx = start + 1;

    while idx < args.len() {
        match args[idx].as_str() {
            "-o" => {
                idx += 1;
                if idx >= args.len() {
                    return Err("Missing output path after -o".to_string());
                }
                output_file = args[idx].clone();
            }
            "--report" => {
                report = true;
            }
            "--emit" => {
                idx += 1;
                emit = match args.get(idx).map(String::as_str) {
                    Some("hex") => Emit::Hex,
                    Some("ir") => Emit::Ir,
                    _ => return Err("--emit expects 'hex' or 'ir'".to_string()),
                };
            }
            "--simulate" => {
                sim.simulate = true;
            }
            // Simulation options below share one vocabulary with `--sim-hex` and the
            // ik8bvm simulator, so `--trace`/`--dump`/`--limit`/`--irq*` mean the same
            // thing everywhere. They only take effect together with `--simulate`.
            "--trace" => {
                sim.trace = true;
            }
            "--dump" => {
                sim.dump = true;
            }
            "--limit" => {
                idx += 1;
                match args.get(idx).and_then(|s| s.parse().ok()) {
                    Some(n) => sim.limit = n,
                    None => return Err("--limit expects an instruction count".to_string()),
                }
            }
            "--irq" => {
                idx += 1;
                match args.get(idx).and_then(|s| s.parse().ok()) {
                    Some(v) => sim.irq_init.push(v),
                    None => return Err("--irq expects a vector number".to_string()),
                }
            }
            "--irq-at" => {
                idx += 1;
                match args.get(idx).and_then(|s| parse_pair(s)) {
                    Some((v, s)) => sim.irq_at.push((v, s)),
                    None => return Err("--irq-at expects VEC:STEP".to_string()),
                }
            }
            "--irq-every" => {
                idx += 1;
                match args.get(idx).and_then(|s| parse_pair(s)) {
                    Some((v, n)) => sim.irq_every.push((v, n)),
                    None => return Err("--irq-every expects VEC:PERIOD".to_string()),
                }
            }
            "--peek" => {
                idx += 1;
                match args.get(idx).and_then(|s| parse_u32(s)) {
                    Some(a) => sim.peek = Some(a),
                    None => return Err("--peek expects a data address".to_string()),
                }
            }
            "--peek-len" => {
                idx += 1;
                match args.get(idx).and_then(|s| s.parse().ok()) {
                    Some(n) => sim.peek_len = n,
                    None => return Err("--peek-len expects a byte count".to_string()),
                }
            }
            other if other.starts_with('-') => {
                return Err(format!("Unknown option: {}", other));
            }
            other => {
                return Err(format!("Unexpected argument: {}", other));
            }
        }
        idx += 1;
    }

    Ok(CompileOpts { input: input_file, output: output_file, report, emit, sim })
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let program = args.first().map(String::as_str).unwrap_or("ik8b");

    if args.len() < 2 {
        print_help(program);
        process::exit(1);
    }

    match args[1].as_str() {
        "-h" | "--help" | "help" => print_help(program),
        "-V" | "--version" | "version" => print_version(),
        "--info" | "info" => print_info(program),
        "--license" | "license" => print_license(),
        "devices" | "--list-devices" | "list-devices" => print_device_table(),
        // `sim <file.hex> --mcu <dev>`: simulate an already-assembled image.
        "sim" | "--sim-hex" | "sim-hex" => run_sim_hex(&args),
        // `build <file.ik>`: compile only.
        "build" => run_compile(parse_or_exit(&args, 2, program)),
        // `run <file.ik>`: compile, then simulate.
        "run" => {
            let mut opts = parse_or_exit(&args, 2, program);
            opts.sim.simulate = true;
            run_compile(opts);
        }
        option if option.starts_with('-') => {
            eprintln!("Unknown command or option: {}", option);
            eprintln!("Run `{} help` for usage.", program);
            process::exit(1);
        }
        // Back-compat: a bare `ik8b <file.ik> [options]` is an implicit `build`
        // (and `--simulate` turns it into a `run`).
        _ => run_compile(parse_or_exit(&args, 1, program)),
    }
}

fn parse_or_exit(args: &[String], start: usize, program: &str) -> CompileOpts {
    match parse_compile_args(args, start) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("CLI Error: {}", e);
            eprintln!("Run `{} help` for usage.", program);
            process::exit(1);
        }
    }
}

/// Compiles a source file and (optionally) simulates it, then exits.
fn run_compile(opts: CompileOpts) -> ! {
    let CompileOpts { input: input_file, output: output_file, report, emit, sim } = opts;

    let source = match fs::read_to_string(&input_file) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Error reading input file: {}", e);
            process::exit(1);
        }
    };
    
    // 1. Lexer
    let mut lexer = lexer::Lexer::new(&source);
    let tokens = match lexer.tokenize() {
        Ok(t) => t,
        Err(e) => {
            eprintln!("Lexical Error: {}", e);
            process::exit(1);
        }
    };
    
    // 2. Parser
    let mut parser = parser::Parser::new(tokens);
    let ast = match parser.parse() {
        Ok(a) => a,
        Err(e) => {
            eprintln!("Syntax Error: {}", e);
            process::exit(1);
        }
    };
    
    // `--emit ir`: dump the SSA IR for the program and exit. Drives the new
    // middle-end without running AVR code generation.
    if emit == Emit::Ir {
        match codegen::emit_ir_text(&ast) {
            Ok(text) => {
                print!("{}", text);
                process::exit(0);
            }
            Err(e) => {
                eprintln!("IR Error: {}", e);
                process::exit(1);
            }
        }
    }

    // The target device is selected by the mandatory top-level `target`
    // declaration (e.g. `target atmega328p`). Core and memory layout are
    // resolved from the device table, so no --core/--sram-start flags are needed.
    let device_name = parser.active_target.trim().to_string();
    if device_name.is_empty() {
        eprintln!("Device Error: a top-level device target is required.");
        eprintln!("  Declare the target at the top of the source, e.g.: target atmega328p");
        process::exit(1);
    }
    let device = match devices::lookup_device(&device_name) {
        Some(d) => d,
        None => {
            eprintln!("Device Error: unknown device '{}'.", device_name);
            eprintln!("  Run `ik8b --list-devices` to list supported targets.");
            process::exit(1);
        }
    };
    let target_core = device.core.clone();
    let sram_start = device.sram_start;

    // 3. Code Generator
    let mut codegen = codegen::CodeGenerator::new();
    codegen.target_core = target_core;
    codegen.set_sram_start(sram_start);
    codegen.set_device_name(device.name);
    let insts = match codegen.compile(&ast) {
        Ok(i) => {
            for w in &codegen.warnings {
                eprintln!("Warning: {}", w);
            }
            i
        }
        Err(e) => {
            for w in &codegen.warnings {
                eprintln!("Warning: {}", w);
            }
            eprintln!("Compilation Error: {}", e);
            process::exit(1);
        }
    };
    
    // 4. Resolve Labels
    // A `boot <addr>` program is located at the Boot Loader Section start.
    let boot_origin_bytes: u32 = parser.boot_origin.unwrap_or(0);
    if let Some(addr) = parser.boot_origin {
        if addr % 2 != 0 || addr >= device.flash_size {
            eprintln!(
                "Device Error: boot address 0x{:X} must be even and within {}'s flash.",
                addr, device.name
            );
            process::exit(1);
        }
    }
    let assembled =
        codegen::resolve_labels_for(&insts, (boot_origin_bytes / 2) as i64, device.flash_size / 2);
    let opcodes = match assembled {
        Ok(opcodes) => opcodes,
        Err(e) => {
            eprintln!("Assembly Error: {}", e);
            process::exit(1);
        }
    };
    
    // 4b. Device memory-budget check + usage report.
    let prog_bytes = opcodes.len() as u32 * 2;
    let sram_bytes = codegen.sram_used() as u32;
    let eeprom_bytes = codegen.eeprom_used() as u32;

    let mut over_budget = false;
    let pct_val = |used: u32, total: u32| -> u32 {
        if total == 0 { 0 } else { used * 100 / total }
    };
    
    if report {
        println!("SRAM_BYTES={}", sram_bytes);
        println!();
        println!("ik8b Build Summary");
        println!("┌──────────────────────────────────────────────────────────────┐");
        println!("  Device:    {} ({:?})", device.name, device.core);
        
        let usable_flash = device.flash_size.saturating_sub(device.boot_size);
        if device.flash_size == 0 {
            println!("  Program:   {:5} B          [░░░░░░░░░░░░░░░░░░░░]   ?%", prog_bytes);
        } else {
            println!(
                "  Program:   {:5} / {:5} B  [{}]  {:3}%",
                prog_bytes,
                usable_flash,
                make_progress_bar(prog_bytes, usable_flash),
                pct_val(prog_bytes, usable_flash)
            );
            if prog_bytes > usable_flash {
                eprintln!("  Memory Error: program exceeds usable flash!");
                over_budget = true;
            }
        }
        
        if device.sram_size == 0 {
            println!("  SRAM:      {:5} B          [░░░░░░░░░░░░░░░░░░░░]   ?%", sram_bytes);
        } else {
            println!(
                "  SRAM:      {:5} / {:5} B  [{}]  {:3}%",
                sram_bytes,
                device.sram_size,
                make_progress_bar(sram_bytes, device.sram_size),
                pct_val(sram_bytes, device.sram_size)
            );
            if sram_bytes > device.sram_size {
                eprintln!("  Memory Error: static data exceeds SRAM!");
                over_budget = true;
            }
        }
        
        if device.eeprom_size == 0 {
            println!("  EEPROM:    {:5} B          [░░░░░░░░░░░░░░░░░░░░]   ?%", eeprom_bytes);
        } else {
            println!(
                "  EEPROM:    {:5} / {:5} B  [{}]  {:3}%",
                eeprom_bytes,
                device.eeprom_size,
                make_progress_bar(eeprom_bytes, device.eeprom_size),
                pct_val(eeprom_bytes, device.eeprom_size)
            );
            if eeprom_bytes > device.eeprom_size {
                eprintln!("  Memory Error: EEPROM data exceeds device capacity!");
                over_budget = true;
            }
        }
        
        println!("└──────────────────────────────────────────────────────────────┘");
        println!();
        
    }
    
    if over_budget {
        process::exit(1);
    }

    // 5. Generate Intel HEX (at the boot byte address when this is a bootloader)
    let hex_content = if parser.boot_origin.is_some() {
        codegen::generate_intel_hex_at(&opcodes, boot_origin_bytes)
    } else {
        codegen::generate_intel_hex(&opcodes)
    };
    
    // 6. Write output
    match fs::write(&output_file, &hex_content) {
        Ok(_) => println!("Successfully compiled {} directly to Intel HEX: {}", input_file, output_file),
        Err(e) => {
            eprintln!("Error writing output HEX file: {}", e);
            process::exit(1);
        }
    }

    if sim.simulate {
        println!("Starting simulation...");
        // Build the VM with the device's REAL core class, not a generic one: a few
        // encodings differ per core (notably the 1-word LDS/STS on the reduced AVRrc
        // core vs the 2-word forms elsewhere), so simulating with the wrong core would
        // mis-decode correct code. Take the core (and exact SP/RAM end) from the same
        // ik8bvm device table the standalone `sim` uses, so both agree with hardware.
        let (core, sp) = ik8bvm::devices::AVR_DEVICE_TABLE
            .iter()
            .find(|d| d.name == device.name)
            .map(|d| (d.core, d.ram_end as u16))
            .unwrap_or((
                ik8bvm::devices::AvrCoreClass::Unknown,
                device.sram_size as u16 + device.sram_start as u16 - 1,
            ));
        let mut vm = ik8bvm::core::AvrVm::new(
            device.name.to_string(),
            core,
            device.flash_size,
            device.sram_size,
            device.eeprom_size,
            device.sram_start as u32,
        );
        vm.sp = sp;
        vm.trace = sim.trace;
        ik8bvm::hw::load_hex(&mut vm, &output_file).expect("Failed to load hex into VM");

        for &vec in &sim.irq_init {
            vm.raise_interrupt(vec);
        }

        struct IrqAtEvent { vec: u8, step: u64, fired: bool }
        struct IrqEveryEvent { vec: u8, period: u64, next_at: u64 }

        let mut at_events: Vec<IrqAtEvent> = sim.irq_at.iter().map(|&(v, s)| IrqAtEvent { vec: v, step: s, fired: false }).collect();
        let mut every_events: Vec<IrqEveryEvent> = sim.irq_every.iter().map(|&(v, p)| IrqEveryEvent { vec: v, period: p, next_at: p }).collect();

        let mut executed = 0;
        while vm.running && executed < sim.limit {
            vm.step();
            executed += 1;

            for ev in &mut at_events {
                if !ev.fired && executed >= ev.step {
                    vm.raise_interrupt(ev.vec);
                    ev.fired = true;
                }
            }
            for ev in &mut every_events {
                if executed >= ev.next_at {
                    vm.raise_interrupt(ev.vec);
                    ev.next_at += ev.period;
                }
            }
        }
        println!("Simulation completed after {} cycles ({} instructions executed).", vm.cycles, executed);
        println!("R16 = 0x{:02X}", vm.r[16]);

        if sim.dump {
            println!("Registers:");
            for i in 0..32 {
                print!("R{:<2}=0x{:02X} ", i, vm.r[i]);
                if i % 8 == 7 { println!(); }
            }
            println!("PC=0x{:04X} SP=0x{:04X} SREG=0x{:02X}", vm.pc, vm.sp, vm.sreg);
        }

        if let Some(addr) = sim.peek {
            for k in 0..sim.peek_len.max(1) {
                let a = addr + k;
                println!("MEM[0x{:04X}] = 0x{:02X}", a, vm.read_data(a));
            }
        }
    }

    process::exit(0);
}

fn make_progress_bar(used: u32, total: u32) -> String {
    if total == 0 {
        return "░░░░░░░░░░░░░░░░░░░░".to_string();
    }
    let filled_len = ((used as f64 / total as f64) * 20.0).round() as usize;
    let filled_len = std::cmp::min(filled_len, 20);
    let mut bar = String::new();
    for _ in 0..filled_len {
        bar.push('█');
    }
    for _ in filled_len..20 {
        bar.push('░');
    }
    bar
}
