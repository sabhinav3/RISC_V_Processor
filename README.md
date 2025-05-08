# RISC-V Processor: 5-Stage Pipelined Verilog Implementation

## Overview

This repository implements a **5-stage pipelined RISC-V processor** based on the RV32I instruction set architecture (ISA). The project is designed to demonstrate key concepts in processor design, including pipelining, hazard detection, and data forwarding. The project was initially developed as a **single-cycle processor** and later extended to a **five-stage pipelined processor**, enabling increased performance and instruction throughput.

### Key Highlights:

* **Single-Cycle Processor** as a foundation for design.
* **5-Stage Pipeline**: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), Write-Back (WB).
* **Hazard Detection**: Handling data hazards and control hazards (with stalling and forwarding techniques).
* **Verilog Implementation** for FPGA and simulation.
* **Testbenches**: Simulated using a custom test suite to validate processor functionality.

## Features

* **RV32I Instruction Set Support**:

  * R-Type: `add`, `sub`, `xor`, `and`, `or`, `sll`, `srl`, `sra`, `slt`, `sltu`
  * I-Type: `addi`, `lw`, `xori`, `ori`, `andi`, `slti`, `sltiu`, `slli`, `srli`, `srai`
  * S-Type: `sw`
  * B-Type: `beq`, `bne`, `blt`, `bge`, `bltu`, `bgeu`
  * J-Type: `jal`

* **Pipeline Implementation** with forward and stall mechanisms.

* **Simulation and Verification** using assembly programs for different instruction formats and cycles.

* **Verilog Code**: Modular design with separate modules for control and data path.

* **Waveform Analysis** for verifying functional correctness.

## Directory Structure

```
RISC-V_Processor/
├── ControlPath/      # Control logic modules (decoder, hazard detection, forwarding)
├── DataPath/         # Data path modules (ALU, registers, memory)
├── RISCV/            # Top-level Verilog code and testbenches
├── LICENSE           # MIT License
└── README.md         # Project documentation
```

## Getting Started

### Prerequisites

* **Verilog Simulator** (e.g., ModelSim, VCS, Icarus Verilog)
* **FPGA Development Board** (optional for hardware implementation)
* **Python** (optional for running scripts or testbenches)

### Clone the Repository

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/your_username/RISC-V-Processor.git
   cd RISC-V-Processor
   ```

### Simulation

1. **Compile** the Verilog files:

   ```bash
   vlog -sv RISCV/*.sv
   ```

2. **Run the simulation** with a simulator (e.g., ModelSim, Icarus Verilog):

   ```bash
   vsim RISCV.tb_riscv_processor
   ```

3. View the waveform and verify the execution of instructions.

### FPGA Implementation

1. **Synthesize** the design with your FPGA toolchain (e.g., Xilinx Vivado, Intel Quartus).
2. **Generate the bitstream** and **upload** it to the FPGA for testing.

---

## Design Details

### 1. **Single-Cycle Processor**

The single-cycle design executes each instruction in a single clock cycle, simplifying control logic but limiting performance due to inefficiencies in resource utilization.

### 2. **5-Stage Pipelined Processor**

* **Instruction Fetch (IF)**: Fetches instructions from memory.
* **Instruction Decode (ID)**: Decodes instruction and fetches operand values from registers.
* **Execute (EX)**: Executes arithmetic/logical operations using the ALU.
* **Memory Access (MEM)**: Reads from or writes to data memory.
* **Write-Back (WB)**: Writes the result back to the register file.

#### Advantages of Pipelining:

* Increased throughput by allowing multiple instructions to be processed simultaneously at different stages.
* Shortened cycle time compared to single-cycle design.

### 3. **Hazard Handling**

* **Data Hazards**: Managed with data forwarding and stalls for Load-Use hazards.
* **Control Hazards**: Handled through branch prediction and pipeline flushing.

---

## Simulation Results

### Test Instructions

The processor was validated using a variety of test programs:

* **R-Type Instructions**: `add`, `sub`, `xor`, `and`, etc.
* **I-Type Instructions**: `addi`, `lw`, `xori`, etc.
* **S-Type Instructions**: `sw`
* **Branch Instructions**: `beq`, `bne`, `blt`, etc.

### Example Assembly Code for R-Type Instructions:

```assembly
addi t0, zero, 10    # t0 = 10
addi t1, zero, 3     # t1 = 3
add t3, t0, t1       # t3 = t0 + t1 = 13
sub t4, t0, t1       # t4 = t0 - t1 = 7
```

### Waveform Analysis:

Simulation results demonstrated correct functionality for:

* **Data forwarding**: Correct operand propagation between stages.
* **Hazard resolution**: No incorrect data due to forward paths or stalls.

## References and Resources

* [RISC-V Instruction Set Manual](https://riscv.org/specifications/)
* [Verilog Documentation](https://www.verilog.com/)
* [FPGA Implementation Guide](https://www.fpga.com/)
* [RISC-V Wiki](https://en.wikipedia.org/wiki/RISC-V)

---
