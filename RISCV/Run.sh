#!/bin/bash

echo "Starting the task..."
# Add your commands here, for example:

python3 LittleEndianBinaryCodeGenerator.py
iverilog -o output_RISCV tb.v
vvp output_RISCV
surfer /Users/sabhinav/Downloads/Pipelined-RISCV-Processor-ForwardingUnit/RISCV/tb.vcd

echo "Done!"
