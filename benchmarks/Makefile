# Makefile for comparing ik8b vs C vs Assembly
.PHONY: all build compare clean

AVR_GCC = avr-gcc
AVR_OBJCOPY = avr-objcopy
MCU = atmega328p
IK8B = ../ik8b

define compile_ik_with_namespace
	@tmp=$$(mktemp); \
	awk -v ns="$(MCU)" 'BEGIN{done=0} {if(!done && $$0 ~ /^[[:space:]]*@main([[:space:]]|$$)/){print "namespace " ns; print ""; done=1} print} END{if(!done){print "namespace " ns; print ""}}' "$(1)" > "$$tmp"; \
	$(IK8B) "$$tmp" -o "$(2)"; \
	rm -f "$$tmp"
endef

all: build compare

build:
	@mkdir -p out
	$(call compile_ik_with_namespace,bench_arithmetic.ik,out/bench_arithmetic_ik.hex)
	$(call compile_ik_with_namespace,bench_bitwise.ik,out/bench_bitwise_ik.hex)
	$(call compile_ik_with_namespace,bench_loops.ik,out/bench_loops_ik.hex)
	$(call compile_ik_with_namespace,bench_functions.ik,out/bench_functions_ik.hex)
	$(call compile_ik_with_namespace,bench_io.ik,out/bench_io_ik.hex)

	$(AVR_GCC) -mmcu=$(MCU) -Os bench_arithmetic.c -o out/bench_arithmetic_c.elf
	$(AVR_OBJCOPY) -O ihex -R .eeprom out/bench_arithmetic_c.elf out/bench_arithmetic_c.hex
	$(AVR_GCC) -mmcu=$(MCU) -Os bench_bitwise.c -o out/bench_bitwise_c.elf
	$(AVR_OBJCOPY) -O ihex -R .eeprom out/bench_bitwise_c.elf out/bench_bitwise_c.hex
	$(AVR_GCC) -mmcu=$(MCU) -Os bench_loops.c -o out/bench_loops_c.elf
	$(AVR_OBJCOPY) -O ihex -R .eeprom out/bench_loops_c.elf out/bench_loops_c.hex
	$(AVR_GCC) -mmcu=$(MCU) -Os bench_functions.c -o out/bench_functions_c.elf
	$(AVR_OBJCOPY) -O ihex -R .eeprom out/bench_functions_c.elf out/bench_functions_c.hex
	$(AVR_GCC) -mmcu=$(MCU) -Os bench_io.c -o out/bench_io_c.elf
	$(AVR_OBJCOPY) -O ihex -R .eeprom out/bench_io_c.elf out/bench_io_c.hex

	$(AVR_GCC) -mmcu=$(MCU) -nostartfiles bench_arithmetic.S -o out/bench_arithmetic_asm.elf
	$(AVR_OBJCOPY) -O ihex out/bench_arithmetic_asm.elf out/bench_arithmetic_asm.hex
	$(AVR_GCC) -mmcu=$(MCU) -nostartfiles bench_bitwise.S -o out/bench_bitwise_asm.elf
	$(AVR_OBJCOPY) -O ihex out/bench_bitwise_asm.elf out/bench_bitwise_asm.hex
	$(AVR_GCC) -mmcu=$(MCU) -nostartfiles bench_loops.S -o out/bench_loops_asm.elf
	$(AVR_OBJCOPY) -O ihex out/bench_loops_asm.elf out/bench_loops_asm.hex
	$(AVR_GCC) -mmcu=$(MCU) -nostartfiles bench_functions.S -o out/bench_functions_asm.elf
	$(AVR_OBJCOPY) -O ihex out/bench_functions_asm.elf out/bench_functions_asm.hex
	$(AVR_GCC) -mmcu=$(MCU) -nostartfiles bench_io.S -o out/bench_io_asm.elf
	$(AVR_OBJCOPY) -O ihex out/bench_io_asm.elf out/bench_io_asm.hex

compare:
	python3 compare.py

clean:
	rm -rf out
