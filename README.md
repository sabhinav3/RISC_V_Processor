# RISC-V Processor: 5-Stage Pipelined Verilog Implementation

## Overview

This repository provides a **5-stage pipelined RISC-V processor** implemented in **Verilog**. It is designed to serve as an educational tool for understanding processor architecture, particularly in the context of RISC-V (Reduced Instruction Set Computing). The processor is designed to execute RISC-V instructions with a 5-stage pipeline, which includes:

* **Instruction Fetch (IF)**
* **Instruction Decode (ID)**
* **Execute (EX)**
* **Memory Access (MEM)**
* **Write Back (WB)**

This project allows you to simulate and explore the fundamental workings of a CPU, making it ideal for students, educators, and enthusiasts of computer architecture and digital design.

---

## Key Features

* **5-Stage Pipeline**: Implemented using the traditional IF, ID, EX, MEM, and WB stages.
* **Verilog-Based**: The processor is written in **Verilog**, making it suitable for simulation and FPGA implementation.
* **Modular Design**: The design is modular and organized into separate files for **control path** and **data path**, making it easy to modify and extend.
* **Testbenches**: Includes testbenches to simulate the processor’s functionality and verify its performance.
* **MIT License**: The project is open source and available for educational use under the MIT license.

---

## Directory Structure

```
RISC_V_Processor/
├── ControlPath/      # Control path logic (instruction decoding, hazard detection)
├── DataPath/         # Data path logic (ALU, registers, memory interface)
├── RISCV/            # Top-level module and testbenches for verification
├── LICENSE           # MIT License file
└── README.md         # Project documentation
```

### 1. `ControlPath/`

* Contains the control unit logic that generates control signals for the data path.
* Handles instruction decoding and hazard detection.

### 2. `DataPath/`

* Implements the actual data processing units, such as the **ALU**, **register file**, and **memory**.
* Contains modules for multiplexers, registers, and ALU components to execute instructions.

### 3. `RISCV/`

* Contains the **top-level module** that integrates both the control and data path.
* Includes **testbenches** to simulate the processor with different instruction sets and verify the correct operation.

---

## Getting Started

### Prerequisites

Before using this project, ensure you have the following tools installed:

* **Verilog Simulator**: Any simulator like **ModelSim**, **VCS**, **XSIM**, or similar. You can also use **Xilinx Vivado** or **Intel Quartus** for FPGA simulation.
* **FPGA Development Board** (optional): To deploy and test the processor on actual hardware.
* **Python** (optional): For running any associated scripts or testbenches.

### Clone the Repository

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/sabhinav3/RISC_V_Processor.git
   cd RISC_V_Processor
   ```

2. The directory structure:

   ```
   RISC_V_Processor/
   ├── ControlPath/
   ├── DataPath/
   ├── RISCV/
   ├── LICENSE
   └── README.md
   ```

### Simulation

1. **Compile** the Verilog files with your Verilog simulator. For example, with **ModelSim**:

   ```bash
   vlog -sv RISCV/*.sv
   vsim RISCV.tb_riscv_processor
   ```

2. **Run the simulation**. You will see the results on the waveform viewer, which will allow you to inspect the processor’s operations in different stages of the pipeline.

3. The testbenches include various RISC-V instructions to verify correct behavior, including:

   * Register operations
   * Memory operations
   * ALU operations
   * Branch instructions

### FPGA Implementation

To implement the processor on an FPGA:

1. **Synthesize** the design using your FPGA toolchain (e.g., **Xilinx Vivado** or **Intel Quartus**).
2. **Generate** the bitstream file.
3. **Upload** the bitstream to the FPGA.
4. **Test** the processor using input stimuli (e.g., switches or a UART interface for input/output).

---

## How the Processor Works

### Control Path

The **control path** is responsible for:

* Decoding the instructions.
* Generating control signals for the data path based on the instruction type.
* Handling hazards like data hazards and control hazards.

The control unit fetches the instruction from memory, decodes it, and generates the appropriate signals for the data path.

### Data Path

The **data path** is where the actual processing happens. It consists of:

* **Registers** to store intermediate results.
* **ALU** to perform arithmetic and logical operations.
* **Multiplexers (MUX)** to select between different data inputs.
* **Memory** for data storage and retrieval.

The data path modules perform the operations based on the control signals received from the control path. These operations include reading from or writing to memory, executing arithmetic operations, and updating the register file.

### Pipeline Stages

* **IF (Instruction Fetch)**: Fetches the instruction from the instruction memory.
* **ID (Instruction Decode)**: Decodes the instruction and generates control signals.
* **EX (Execute)**: Performs the ALU operations.
* **MEM (Memory Access)**: Handles data memory operations (read/write).
* **WB (Write Back)**: Writes the result back to the register file.

### Pipelining and Hazards

* **Pipeline Stages**: Each instruction goes through five stages, which allows for multiple instructions to be processed simultaneously.
* **Data Hazards**: Handled by forwarding data between stages or stalling the pipeline when necessary.
* **Control Hazards**: Handled by branch prediction and stalling.

---

## Testbenches

The repository includes testbenches for simulating the processor. These testbenches verify the correctness of the RISC-V instruction set, ensuring that the processor behaves as expected under various scenarios.

### Example Testbench

```verilog
module tb_riscv_processor;
    // Inputs and outputs for the processor
    reg clk, reset;
    wire [31:0] instruction;
    
    // Instantiate the RISC-V processor
    RISCV_Processor uut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        #10 reset = 0;  // Deassert reset after 10 time units
        
        // Add your test cases here
    end
endmodule
```



## References and Resources

* [RISC-V Instruction Set Manual](https://riscv.org/specifications/)
* [Verilog Documentation](https://www.verilog.com/)
* [FPGA Implementation Guide](https://www.fpga.com/)
* [RISC-V Wiki](https://en.wikipedia.org/wiki/RISC-V)

---
