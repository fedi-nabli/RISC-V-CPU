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

## Getting Started

### Prerequisites

You need `verilator` and a `C++ compiler` (g++ or clang++). You can install them automatically:

```bash
chmod +x ./setup.sh
./setup.sh
```

### Build and Simulation

To compile the hardware into a C++ model and execute the firmware:

```bash
make run
```

## Program

The Demo program: "Array Max Value Algorithm"

### Expected simulation output

```text
...
Cycle 58 | PC: 00000068 | Result (x11): 42
...
```

### Program Firmware

```text
ADDRESS    HEX CODE    ASSEMBLY               COMMENT
--------------------------------------------------------------------------------
[INIT STAGE: Populate Memory with Array Data]
0x00       00000537    lui a0, 0              ; Base Addr a0 = 0
0x04       00050513    addi a0, a0, 0         ; NOP
0x08       00800593    addi a1, zero, 8       ; a1 = 8
0x0C       00b52023    sw a1, 0(a0)           ; mem[0] = 8
0x10       feb00593    addi a1, zero, -21     ; a1 = -21
0x14       00b52223    sw a1, 4(a0)           ; mem[4] = -21
0x18       00f00593    addi a1, zero, 15      ; a1 = 15
0x1C       00b52423    sw a1, 8(a0)           ; mem[8] = 15
0x20       ffd00593    addi a1, zero, -3      ; a1 = -3
0x24       00b52623    sw a1, 12(a0)          ; mem[12] = -3
0x28       02a00593    addi a1, zero, 42      ; a1 = 42
0x2C       00b52823    sw a1, 16(a0)          ; mem[16] = 42
0x30       01100593    addi a1, zero, 17      ; a1 = 17
0x34       00b52a23    sw a1, 20(a0)          ; mem[20] = 17

[SETUP STAGE: Prepare for Loop]
0x38       00052583    lw a1, 0(a0)           ; Load first element as initial Max
0x3C       00100613    addi a2, zero, 1       ; i = 1 (Loop index)
0x40       00600693    addi a3, zero, 6       ; n = 6 (Array size)

[LOOP STAGE: Iterate and Find Max]
0x44       02d65263    bge a2, a3, 48         ; if (i >= n) goto FINISH (0x68)
0x48       00261793    slli a5, a2, 2         ; Offset = i * 4
0x4C       00f50833    add a6, a0, a5         ; Addr = Base + Offset
0x50       00082703    lw a4, 0(a6)           ; Val = mem[Addr]
0x54       00e5c463    blt a1, a4, 8          ; if (Max < Val) goto UPDATE (0x5C)
0x58       0080006f    jal zero, 8            ; else SKIP (Jump over update)

[UPDATE LABEL]
0x5C       000705b3    add a1, a4, zero       ; Max = Val

[INCREMENT LABEL]
0x60       00160613    addi a2, a2, 1         ; i++
0x64       fe1ff06f    jal zero, -32          ; Jump back to start of LOOP (0x44)

[FINISH LABEL]
0x68       00b52c23    sw a1, 44(a0)          ; Store Result (42) at mem[44]
0x6C       00000013    addi zero, zero, 0     ; NOP (Padding)

[Halt Loop Here]
0x70       0000006f    jal zero, 0            ; Infinite Loop (Trap) to stop PC
```
