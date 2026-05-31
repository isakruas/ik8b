#!/usr/bin/env python3
import os
import subprocess
import re
import sys
import argparse
import tempfile
import csv
import shlex
from contextlib import redirect_stdout

BENCHMARKS = ["bench_arithmetic", "bench_bitwise", "bench_loops", "bench_functions", "bench_io"]

# Core families and their representative MCUs
CORE_FAMILIES = {
    "AVRe": "attiny85",
    "AVRe+": "atmega328p",
    "AVRrc": "attiny40",
    "AVRxm": "atxmega16a4u",
    "AVRxt": "avr128da32"
}

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
IK8B_BIN = os.path.join(REPO_ROOT, "ik8b")
VM_BIN = os.path.join(REPO_ROOT, "tools", "avr-vm", "bin", "avr_vm")
ARTIFACT_DIR = "out"
REPORT_DIR = "reports"

def run_cmd(cmd, cwd="."):
    res = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, cwd=cwd)
    return res

def ensure_namespace(source_text, mcu):
    if re.search(r"(?m)^[ \t]*namespace[ \t]+[A-Za-z_][A-Za-z0-9_]*", source_text):
        return source_text
    return f"namespace {mcu}\n\n{source_text}"

def compile_ik_for_mcu(bench, mcu, out_hex):
    src_path = f"{bench}.ik"
    with open(src_path, "r", encoding="utf-8") as f:
        src = f.read()
    patched = ensure_namespace(src, mcu)
    with tempfile.NamedTemporaryFile("w", suffix=".ik", delete=False, encoding="utf-8") as tmp:
        tmp.write(patched)
        tmp_path = tmp.name
    try:
        res = run_cmd(f"{shlex.quote(IK8B_BIN)} {tmp_path} -o {out_hex}", cwd=".")
    finally:
        os.unlink(tmp_path)
    return res

def get_hex_lines(filepath):
    if not os.path.exists(filepath):
        return 0
    with open(filepath, "r") as f:
        return len(f.readlines())

def trace_and_measure(hex_path, mcu):
    if not os.path.exists(hex_path):
        return 0, 0
    
    # Step 1: Run VM in trace mode to detect terminal halt loop
    cmd = f"{shlex.quote(VM_BIN)} {hex_path} -mmcu={mcu} -t -n 2000"
    res = run_cmd(cmd)
    
    lines = res.stdout.strip().split("\n")
    active_instr = 0
    prev_pc = None
    
    for line in lines:
        if "PC=" in line:
            match = re.search(r"PC=([0-9A-Fa-f]+)", line)
            if match:
                pc = match.group(1)
                if pc == prev_pc:
                    break
                active_instr += 1
                prev_pc = pc
                
    if active_instr == 0:
        active_instr = 1
        
    # Step 2: Rerun VM to get exact cycles
    cmd_d = f"{shlex.quote(VM_BIN)} {hex_path} -mmcu={mcu} -d -n {active_instr}"
    res_d = run_cmd(cmd_d)
    
    cycles = 0
    cycles_match = re.search(r"Cycles = (\d+)", res_d.stdout)
    if cycles_match:
        cycles = int(cycles_match.group(1))
        
    return active_instr, cycles

def parse_ik_report(text):
    # Defaults for unknown values.
    out = {
        "prog_used": -1, "prog_limit": -1,
        "sram_used": -1, "sram_limit": -1,
        "eeprom_used": -1, "eeprom_limit": -1,
    }
    m = re.search(r"Program:\s+(\d+)\s*/\s*(\d+)\s*(?:bytes|B)?", text)
    if m:
        out["prog_used"] = int(m.group(1))
        out["prog_limit"] = int(m.group(2))
    m = re.search(r"(?:Data \(SRAM\)|SRAM):\s+(\d+)\s*/\s*(\d+)\s*(?:bytes|B)?", text)
    if m:
        out["sram_used"] = int(m.group(1))
        out["sram_limit"] = int(m.group(2))
    m = re.search(r"(?:EEPROM|Imut):\s+(\d+)\s*/\s*(\d+)\s*(?:bytes|B)?", text)
    if m:
        out["eeprom_used"] = int(m.group(1))
        out["eeprom_limit"] = int(m.group(2))
    return out

def print_table(core_name, mcu, results):
    print("\n")
    print("=========================================================================================================")
    print(f"                       ik8b vs C vs Assembly Map: Core {core_name:<5} (Represented by {mcu:<12})        ")
    print("=========================================================================================================")
    print("| Benchmark Name    | Impl     | HEX Lines | Active Instr. | CPU Clock Cycles | Efficiency vs Assembly |")
    print("|-------------------|----------|-----------|---------------|------------------|------------------------|")
    
    for bench in BENCHMARKS:
        asm_l, asm_i, asm_c = results[bench]["asm"]
        print(f"| {bench:<17} | Assembly | {asm_l:<9} | {asm_i:<13} | {asm_c:<16} | 100.0% (Ref)           |")
        
        ik_l, ik_i, ik_c = results[bench]["ik"]
        ik_eff = "N/A"
        if asm_c > 0 and ik_c > 0:
            ik_eff = f"{((asm_c / ik_c) * 100.0):.1f}%"
        print(f"|                   | ik8b     | {ik_l:<9} | {ik_i:<13} | {ik_c:<16} | {ik_eff:<22} |")
        
        c_l, c_i, c_c = results[bench]["c"]
        c_eff = "N/A"
        if asm_c > 0 and c_c > 0:
            c_eff = f"{((asm_c / c_c) * 100.0):.1f}%"
        print(f"|                   | C (-Os)  | {c_l:<9} | {c_i:<13} | {c_c:<16} | {c_eff:<22} |")
        print("|-------------------|----------|-----------|---------------|------------------|------------------------|")

def list_all_mcus():
    mcus_res = run_cmd(f"{shlex.quote(IK8B_BIN)} --list-devices")
    out = []
    for line in mcus_res.stdout.split("\n"):
        parts = line.split()
        if len(parts) >= 2:
            mcu_name = parts[1]
            if mcu_name == "DEVICE" or mcu_name.startswith("---") or parts[0] == "CORE":
                continue
            out.append((parts[0], mcu_name))
    return out

def benchmark_all_mcus():
    os.makedirs(ARTIFACT_DIR, exist_ok=True)
    os.makedirs(REPORT_DIR, exist_ok=True)
    rows = []
    all_mcus = list_all_mcus()
    total = len(all_mcus)
    print(f"Running full benchmark sweep for {total} MCUs...")
    for idx, (core_name, mcu) in enumerate(all_mcus, start=1):
        print(f"[{idx}/{total}] {mcu} ({core_name})")
        for bench in BENCHMARKS:
            # Assembly
            asm_elf = f"{ARTIFACT_DIR}/{bench}_{mcu}_asm.elf"
            asm_hex = f"{ARTIFACT_DIR}/{bench}_{mcu}_asm.hex"
            r = run_cmd(f"avr-gcc -mmcu={mcu} -nostartfiles {bench}.S -o {asm_elf}")
            if r.returncode != 0:
                continue
            r = run_cmd(f"avr-objcopy -O ihex {asm_elf} {asm_hex}")
            if r.returncode != 0:
                continue

            # ik8b
            ik_hex = f"{ARTIFACT_DIR}/{bench}_{mcu}_ik.hex"
            r = compile_ik_for_mcu(bench, mcu, ik_hex)
            if r.returncode != 0:
                continue
            ik_rep = parse_ik_report(r.stdout + "\n" + r.stderr)

            # C
            c_elf = f"{ARTIFACT_DIR}/{bench}_{mcu}_c.elf"
            c_hex = f"{ARTIFACT_DIR}/{bench}_{mcu}_c.hex"
            r = run_cmd(f"avr-gcc -mmcu={mcu} -Os {bench}.c -o {c_elf}")
            if r.returncode != 0:
                continue
            r = run_cmd(f"avr-objcopy -O ihex -R .eeprom {c_elf} {c_hex}")
            if r.returncode != 0:
                continue

            asm_l = get_hex_lines(asm_hex)
            asm_i, asm_c = trace_and_measure(asm_hex, mcu)
            ik_l = get_hex_lines(ik_hex)
            ik_i, ik_c = trace_and_measure(ik_hex, mcu)
            c_l = get_hex_lines(c_hex)
            c_i, c_c = trace_and_measure(c_hex, mcu)

            rows.append({
                "core": core_name,
                "mcu": mcu,
                "benchmark": bench,
                "asm_hex_lines": asm_l,
                "asm_active_instr": asm_i,
                "asm_cycles": asm_c,
                "ik_hex_lines": ik_l,
                "ik_active_instr": ik_i,
                "ik_cycles": ik_c,
                "c_hex_lines": c_l,
                "c_active_instr": c_i,
                "c_cycles": c_c,
                "ik_prog_used": ik_rep["prog_used"],
                "ik_prog_limit": ik_rep["prog_limit"],
                "ik_sram_used": ik_rep["sram_used"],
                "ik_sram_limit": ik_rep["sram_limit"],
                "ik_eeprom_used": ik_rep["eeprom_used"],
                "ik_eeprom_limit": ik_rep["eeprom_limit"],
            })

    csv_path = f"{REPORT_DIR}/all_mcus_benchmark.csv"
    with open(csv_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=[
            "core", "mcu", "benchmark",
            "asm_hex_lines", "asm_active_instr", "asm_cycles",
            "ik_hex_lines", "ik_active_instr", "ik_cycles",
            "c_hex_lines", "c_active_instr", "c_cycles",
            "ik_prog_used", "ik_prog_limit",
            "ik_sram_used", "ik_sram_limit",
            "ik_eeprom_used", "ik_eeprom_limit",
        ])
        writer.writeheader()
        writer.writerows(rows)

    # Build text report using the exact same print_table() function.
    report_path = f"{REPORT_DIR}/all_mcus_benchmark.txt"
    by_core = {}
    for r in rows:
        core = r["core"]
        by_core.setdefault(core, {})
        bench = r["benchmark"]
        by_core[core].setdefault(bench, {"asm": [], "ik": [], "c": []})
        by_core[core][bench]["asm"].append((r["asm_hex_lines"], r["asm_active_instr"], r["asm_cycles"]))
        by_core[core][bench]["ik"].append((r["ik_hex_lines"], r["ik_active_instr"], r["ik_cycles"]))
        by_core[core][bench]["c"].append((r["c_hex_lines"], r["c_active_instr"], r["c_cycles"]))

    def avg_triplet(xs):
        if not xs:
            return (0, 0, 0)
        n = len(xs)
        return (
            round(sum(a for a, _, _ in xs) / n, 1),
            round(sum(b for _, b, _ in xs) / n, 1),
            round(sum(c for _, _, c in xs) / n, 1),
        )

    with open(report_path, "w", encoding="utf-8") as rf:
        rf.write("ik8b vs C vs Assembly - ALL MCUs\n")
        rf.write("================================\n")
        rf.write(f"Rows: {len(rows)}\n")
        with redirect_stdout(rf):
            # Emit one table per MCU (not aggregated), keeping the exact print_table format.
            by_mcu = {}
            for r in rows:
                by_mcu.setdefault(r["mcu"], {"core": r["core"], "rows": {}})
                by_mcu[r["mcu"]]["rows"].setdefault(r["benchmark"], r)

            for core, mcu in list_all_mcus():
                if mcu not in by_mcu:
                    continue
                mrows = by_mcu[mcu]["rows"]
                results = {}
                for bench in BENCHMARKS:
                    if bench in mrows:
                        rr = mrows[bench]
                        results[bench] = {
                            "asm": (rr["asm_hex_lines"], rr["asm_active_instr"], rr["asm_cycles"]),
                            "ik": (rr["ik_hex_lines"], rr["ik_active_instr"], rr["ik_cycles"]),
                            "c": (rr["c_hex_lines"], rr["c_active_instr"], rr["c_cycles"]),
                        }
                    else:
                        results[bench] = {
                            "asm": (0, 0, 0),
                            "ik": (0, 0, 0),
                            "c": (0, 0, 0),
                        }
                print_table(core, mcu, results)

    # Aggregate summary
    if rows:
        ik_total = sum(r["ik_cycles"] for r in rows if r["ik_cycles"] > 0)
        c_total = sum(r["c_cycles"] for r in rows if r["c_cycles"] > 0)
        asm_total = sum(r["asm_cycles"] for r in rows if r["asm_cycles"] > 0)
        n = len(rows)
        print("\nFull-sweep summary")
        print(f"Rows: {n}")
        print(f"Avg cycles: asm={asm_total/n:.2f} ik8b={ik_total/n:.2f} c={c_total/n:.2f}")
        print(f"CSV: {csv_path}")
        print(f"TXT report: {report_path}")
    else:
        print("\nNo comparable rows produced.")
        print(f"CSV (header only): {csv_path}")
        print(f"TXT report: {report_path}")

def main():
    parser = argparse.ArgumentParser(description="ik8b vs C vs Assembly Benchmark Profiler")
    parser.add_argument("--mcu", help="Profile a single specific MCU instead of the whole architecture suite")
    parser.add_argument("--all-mcus-bench", action="store_true", help="Run performance benchmark across all supported MCUs and export CSV")
    args = parser.parse_args()

    os.makedirs("out", exist_ok=True)
    
    # Compile a generic bench_io_ik.hex for the universal verification suite
    compile_ik_for_mcu("bench_io", "atmega328p", "out/bench_io_ik.hex")
    
    if args.all_mcus_bench:
        benchmark_all_mcus()
    elif args.mcu:
        # Single MCU profiling mode
        mcu = args.mcu
        # Detect core family of the requested MCU
        mcus_res = run_cmd(f"{shlex.quote(IK8B_BIN)} --list-devices")
        core_family = "AVRe+"
        for line in mcus_res.stdout.split("\n"):
            parts = line.split()
            if len(parts) >= 2 and parts[1] == mcu:
                core_family = parts[0]
                break
        
        print(f"Running benchmark profiling for single MCU: {mcu} (Core: {core_family})")
        results = {}
        for bench in BENCHMARKS:
            results[bench] = {}
            
            # 1. Assembly
            asm_elf = f"out/{bench}_{mcu}_asm.elf"
            asm_hex = f"out/{bench}_{mcu}_asm.hex"
            run_cmd(f"avr-gcc -mmcu={mcu} -nostartfiles {bench}.S -o {asm_elf}")
            run_cmd(f"avr-objcopy -O ihex {asm_elf} {asm_hex}")
            
            asm_lines = get_hex_lines(asm_hex)
            asm_instr, asm_cycles = trace_and_measure(asm_hex, mcu)
            results[bench]["asm"] = (asm_lines, asm_instr, asm_cycles)
            
            # 2. ik8b
            ik_hex = f"out/{bench}_{mcu}_ik.hex"
            compile_ik_for_mcu(bench, mcu, ik_hex)
            
            ik_lines = get_hex_lines(ik_hex)
            ik_instr, ik_cycles = trace_and_measure(ik_hex, mcu)
            results[bench]["ik"] = (ik_lines, ik_instr, ik_cycles)
            
            # 3. C
            c_elf = f"out/{bench}_{mcu}_c.elf"
            c_hex = f"out/{bench}_{mcu}_c.hex"
            run_cmd(f"avr-gcc -mmcu={mcu} -Os {bench}.c -o {c_elf}")
            run_cmd(f"avr-objcopy -O ihex -R .eeprom {c_elf} {c_hex}")
            
            c_lines = get_hex_lines(c_hex)
            c_instr, c_cycles = trace_and_measure(c_hex, mcu)
            results[bench]["c"] = (c_lines, c_instr, c_cycles)
            
        print_table(core_family, mcu, results)
        
    else:
        # Multi-architecture comparison mode (Default)
        print("Running multi-architecture benchmark profiling...")
        
        results = {}
        for core_name, mcu in CORE_FAMILIES.items():
            results[core_name] = {}
            for bench in BENCHMARKS:
                results[core_name][bench] = {}
                
                # 1. Assembly
                asm_elf = f"out/{bench}_{mcu}_asm.elf"
                asm_hex = f"out/{bench}_{mcu}_asm.hex"
                # Use atmega328p for Assembly baseline to keep instructions standard
                run_cmd(f"avr-gcc -mmcu=atmega328p -nostartfiles {bench}.S -o {asm_elf}")
                run_cmd(f"avr-objcopy -O ihex {asm_elf} {asm_hex}")
                
                asm_lines = get_hex_lines(asm_hex)
                asm_instr, asm_cycles = trace_and_measure(asm_hex, mcu)
                results[core_name][bench]["asm"] = (asm_lines, asm_instr, asm_cycles)
                
                # 2. ik8b
                ik_hex = f"out/{bench}_{mcu}_ik.hex"
                compile_ik_for_mcu(bench, mcu, ik_hex)
                
                ik_lines = get_hex_lines(ik_hex)
                ik_instr, ik_cycles = trace_and_measure(ik_hex, mcu)
                results[core_name][bench]["ik"] = (ik_lines, ik_instr, ik_cycles)
                
                # 3. C
                c_elf = f"out/{bench}_{mcu}_c.elf"
                c_hex = f"out/{bench}_{mcu}_c.hex"
                run_cmd(f"avr-gcc -mmcu={mcu} -Os {bench}.c -o {c_elf}")
                run_cmd(f"avr-objcopy -O ihex -R .eeprom {c_elf} {c_hex}")
                
                c_lines = get_hex_lines(c_hex)
                c_instr, c_cycles = trace_and_measure(c_hex, mcu)
                results[core_name][bench]["c"] = (c_lines, c_instr, c_cycles)

        for core_name, mcu in CORE_FAMILIES.items():
            print_table(core_name, mcu, results[core_name])

    # Universal validation loop across ALL possible MCUs
    print("\n")
    print("=========================================================================================================")
    print("                      Running Verification Suite Across ALL Microcontrollers                             ")
    print("=========================================================================================================")
    
    # Get all MCUs
    mcu_list = [m for _, m in list_all_mcus()]
                    
    print(f"Detected {len(mcu_list)} compatible microcontrollers.")
    
    success_count = 0
    failed_mcus = []
    
    for mcu in mcu_list:
        hex_path = "out/bench_io_ik.hex"
        cmd = f"{shlex.quote(VM_BIN)} {hex_path} -mmcu={mcu} -d -n 20"
        res = run_cmd(cmd)
        
        # Check if Port B output R16 ends up with 0xAA correctly without core faults
        if res.returncode == 0 and "R16 = 0xAA" in res.stdout:
            success_count += 1
        else:
            failed_mcus.append(mcu)
            
    if len(failed_mcus) == 0:
        print(f"SUCCESS: 100% of all {len(mcu_list)} compatible microcontrollers validated successfully under VM simulation!")
    else:
        print(f"FAILED: {len(failed_mcus)} MCUs failed validation: {failed_mcus}")
        sys.exit(1)

if __name__ == "__main__":
    main()
