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
    println!("ik8b {} - AVR-8 source compiler", VERSION);
    println!();
    println!("Usage:");
    println!("  {} <file.ik> [-o <out.hex>] [--report]", program);
    println!("  {} info", program);
    println!("  {} version", program);
    println!("  {} license", program);
    println!("  {} list-devices", program);
    println!("  {} help", program);
    println!();
    println!("Aliases:");
    println!("  -h, --help          Show this help text");
    println!("  -V, --version       Print compiler version");
    println!("  --info              Print compiler and target support summary");
    println!("  --license           Print license information");
    println!("  --list-devices      List supported target devices");
    println!();
    println!("Compile options:");
    println!("  -o <out.hex>        Output Intel HEX file (default: out.hex)");
    println!("  --report            Print SRAM_BYTES=<n> before the normal build report");
    println!();
    println!("The target device is selected by a mandatory top-level namespace,");
    println!("e.g. declare `namespace atmega328p` at the top of the source file.");
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

fn parse_compile_args(args: &[String]) -> Result<(String, String, bool), String> {
    let input_file = args[1].clone();
    let mut output_file = "out.hex".to_string();
    let mut report = false;
    let mut idx = 2;

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
            "-h" | "--help" | "help" => {
                return Err("Help must be requested without an input file".to_string());
            }
            "-V" | "--version" | "version" => {
                return Err("Version must be requested without an input file".to_string());
            }
            "--info" | "info" => {
                return Err("Info must be requested without an input file".to_string());
            }
            "--license" | "license" => {
                return Err("License must be requested without an input file".to_string());
            }
            "--list-devices" | "list-devices" => {
                return Err("Device listing must be requested without an input file".to_string());
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

    Ok((input_file, output_file, report))
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let program = args.first().map(String::as_str).unwrap_or("ik8b");

    if args.len() < 2 {
        print_help(program);
        process::exit(1);
    }

    match args[1].as_str() {
        "-h" | "--help" | "help" => {
            print_help(program);
            return;
        }
        "-V" | "--version" | "version" => {
            print_version();
            return;
        }
        "--info" | "info" => {
            print_info(program);
            return;
        }
        "--license" | "license" => {
            print_license();
            return;
        }
        "--list-devices" | "list-devices" => {
            print_device_table();
            return;
        }
        option if option.starts_with('-') => {
            eprintln!("Unknown command or option: {}", option);
            eprintln!("Run `{} help` for usage.", program);
            process::exit(1);
        }
        _ => {}
    }

    let (input_file, output_file, report) = match parse_compile_args(&args) {
        Ok(parsed) => parsed,
        Err(e) => {
            eprintln!("CLI Error: {}", e);
            eprintln!("Run `{} help` for usage.", program);
            process::exit(1);
        }
    };
    
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
    
    // The target device is selected by the mandatory top-level `namespace`
    // declaration (e.g. `namespace atmega328p`). Core and memory layout are
    // resolved from the device table, so no --core/--sram-start flags are needed.
    let device_name = parser.active_namespace.trim().to_string();
    if device_name.is_empty() {
        eprintln!("Device Error: a top-level device namespace is required.");
        eprintln!("  Declare the target at the top of the source, e.g.: namespace atmega328p");
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
    // Highest usable SRAM byte for this device, so the stack-collision guard
    // scales with parts that have more than the classic 2 KB.
    if device.sram_size > 0 {
        let top = (sram_start as u32 + device.sram_size - 1).min(0xFFFF) as u16;
        codegen.set_sram_top(top);
    }
    let insts = match codegen.compile(&ast) {
        Ok(i) => i,
        Err(e) => {
            eprintln!("Compilation Error: {}", e);
            process::exit(1);
        }
    };
    
    // 4. Resolve Labels
    let opcodes = codegen::resolve_labels(&insts);
    
    // 4b. Device memory-budget check + usage report.
    let prog_bytes = opcodes.len() as u32 * 2;
    let sram_bytes = codegen.sram_used() as u32;
    let eeprom_bytes = codegen.eeprom_used() as u32;

    let mut over_budget = false;
    let pct_val = |used: u32, total: u32| -> u32 {
        if total == 0 { 0 } else { used * 100 / total }
    };
    
    if report {
     
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
        
        let regs_used = codegen.total_registers_used.len() as u32;
        println!(
            "  Registers: {:5} /    14 R  [{}]  {:3}%",
            regs_used,
            make_progress_bar(regs_used, 14),
            pct_val(regs_used, 14)
        );
        println!("└──────────────────────────────────────────────────────────────┘");
        println!();
        
    }
    
    if over_budget {
        process::exit(1);
    }

    // 5. Generate Intel HEX
    let hex_content = codegen::generate_intel_hex(&opcodes);
    
    // 6. Write output
    match fs::write(&output_file, hex_content) {
        Ok(_) => println!("Successfully compiled {} directly to Intel HEX: {}", input_file, output_file),
        Err(e) => {
            eprintln!("Error writing output HEX file: {}", e);
            process::exit(1);
        }
    }
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
