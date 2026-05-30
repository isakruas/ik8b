# Makefile for ik8b Rust compiler

.PHONY: all build compile test clean

VM_BIN := ./bin/avr_vm

all: build

# Build the Rust compiler using a lightweight Docker container
build:
	@echo "Building ik8b Rust compiler via Docker..."
	docker run --rm -v "$(shell pwd):/volume" -w /volume rust:latest cargo build --release
	@cp target/release/ik8b ./ik8b
	@echo "=========================================================="
	@echo "Successfully built ik8b compiler! Binary located at ./ik8b"
	@echo "=========================================================="

# Compile the blink example to out.hex
compile:
	@echo "Compiling examples/demo_blink_modular.ik to out.hex..."
	./ik8b examples/demo_blink_modular.ik -o out.hex

# Run the automated language test suite across all supported MCUs.
# MCU list is derived from `ik8b --list-devices` (no external registry needed).
# Per test, the minimum SRAM is derived from compiler report output.
test: build
	@echo "=========================================================="
	@echo "Running Automated ik8b Test Suite across ALL fitting MCUs..."
	@echo "=========================================================="
	@[ -x "$(VM_BIN)" ] || (echo "Missing $(VM_BIN)." && exit 1)
	@table=$$(./ik8b --list-devices | tail -n +3 | awk 'NF>=6 { print $$2","$$1","$$3 }'); \
	total_mcus=$$(echo "$$table" | grep -c .); \
	echo "ik8b supports $$total_mcus MCU profiles."; \
	echo "=========================================================="; \
	fail=0; total_runs=0; \
	for f in tests/test_*.ik; do \
	  name=$$(basename $$f .ik); \
	  if [ "$$name" = "test_helper" ]; then continue; fi; \
	  suite_fail=0; ran=0; \
	  for row in $$table; do \
	    mcu=$$(echo $$row | cut -d, -f1); \
	    core=$$(echo $$row | cut -d, -f2); \
	    sram=$$(echo $$row | cut -d, -f3); \
	    [ -z "$$sram" ] && sram=0; \
	    tmp_src=$$(mktemp); \
	    awk -v ns="$$mcu" 'BEGIN{done=0} {if(!done && $$0 ~ /^[[:space:]]*@main([[:space:]]|$$)/){print "namespace " ns; print ""; done=1} print} END{if(!done){print "namespace " ns; print ""}}' $$f > $$tmp_src; \
	    hex=/tmp/$$name-$$mcu.hex; \
	    compile_out=$$(./ik8b $$tmp_src -o $$hex --report 2>&1); \
	    compile_rc=$$?; \
	    fp=$$(echo "$$compile_out" | grep -o 'SRAM_BYTES=[0-9]*' | cut -d= -f2 | tail -n1); \
	    [ -z "$$fp" ] && fp=999; \
	    if [ "$$fp" -gt 0 ] && [ "$$sram" -eq 0 ]; then rm -f $$tmp_src $$hex; continue; fi; \
	    rm -f $$tmp_src; \
	    if [ $$compile_rc -ne 0 ]; then \
	      if echo "$$compile_out" | grep -q "Memory Error: program"; then rm -f $$hex; continue; fi; \
	      echo "  -> $$mcu: COMPILE FAIL. Error: $$compile_out"; suite_fail=1; rm -f $$hex; continue; \
	    fi; \
	    out=$$($(VM_BIN) $$hex -mmcu=$$mcu -n 200000 -d 2>&1); \
	    rm -f $$hex; \
	    if echo "$$out" | grep -q "HEX overflows flash"; then continue; fi; \
	    r16=$$(echo "$$out" | grep -o 'R16 = 0x[0-9A-Fa-f]*' | awk '{print $$3}'); \
	    ran=$$((ran+1)); total_runs=$$((total_runs+1)); \
	    if [ "$$r16" != "0x01" ]; then echo "  -> $$mcu ($$core,$$sram B): FAIL (R16 = $$r16)"; suite_fail=1; fi; \
	  done; \
	  if [ $$suite_fail -eq 0 ]; then \
	    printf "%-28s ... PASS (%s MCUs)\n" "$$name" "$$ran"; \
	  else \
	    printf "%-28s ... FAIL\n" "$$name"; \
	    fail=$$((fail+1)); \
	  fi; \
	done; \
	echo "=========================================================="; \
	echo "Results: $$total_runs PASSED runs, $$fail FAILED test suites"; \
	echo "=========================================================="; \
	if [ $$fail -ne 0 ]; then exit 1; fi

# Clean cargo build artifacts and test HEX files
clean:
	@echo "Cleaning Cargo build artifacts..."
	docker run --rm -v "$(shell pwd):/volume" -w /volume rust:latest cargo clean
	rm -f ik8b out.hex tests/*.hex
