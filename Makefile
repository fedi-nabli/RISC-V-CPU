Verilator = verilator

VFLAGS = -Isrc/ -Ipackages/ --cc --exe --build -j 0 --top-module top 
SRC = packages/risc_pkg.sv src/top.sv simulation/main.cc

BIN = ./obj_dir/Vtop

all: run

build: $(SRC)
	@echo "Building RISC-V Simulator..."
	${Verilator} $(VFLAGS) $(SRC)

run: build
	@echo "Running Simulation..."
	@if [ ! -f machine_code.mem ]; then \
		echo "Error: machine_code.mem not found!"; \
		exit 1; \
	fi
	$(BIN)

clean:
	@echo "Cleaning build artifacts..."
	rm -rf obj_dir
	@echo "Cleaned up"

.PHONY: all build run clean

