# SystemVerilog RV32I Core

A cycle-accurate, synthesizable RISC-V processor core (RV32I Base Integer Instruction Set) designed
in SystemVerilog. This project includes a custom C++ verification environment using Verilator to
simulate and verify binary firmware execution.

## Key Features

- **Core Architecture:** Single-Cycle RISC-V (Harvard Architecture)
- **Instruction Set:** RV32I (Supports ALU, Load/Store, Branch/Jump)
- **Verification:** Custom C++ Testbench using `verilator` for high-speed simulation
- **Memory:** Parametrized Instruction and Data memory (Harvard Split)
- **Synthesizable**: Written in clean SystemVerilog RTL, ready for FPGA implementation

## Project Structure
```text
|-- src/                # Hardware RTL (SystemVerilog)
|-- packages/           # RISC-V ISA definitions
|-- simulation/         # C++ Testbench and wrapper
|-- machine_code.mem    # Hex Firmware (Array Max Value Algorithm) 
|-- firmware_dump.txt   # Human-readable assembly of the firmware
|-- Makefile            # Build automation
|-- setup.sh            # Dependency installer
```

