# Calculation-Circuit
Calculation Circuits for FPGA This repository contains two logic circuits developed for FPGA VHDL implementation: Arithmetic Calculation Circuit and Binary Manipulation Circuit. These circuits are designed to process multiple inputs and produce a desired output using mathematical and binary operations.
# Features
## Arithmetic Calculation Circuit
Input: 4-bit values (A, B, C, D)
Operations: Addition and multiplication of the inputs to produce a 12-bit result.
Use Cases: Ideal for applications requiring basic arithmetic logic in FPGA systems.
## Binary Manipulation Circuit
Input: 4-bit values (A, B, C, D)
Operations: Bitwise operations such as AND, OR, XOR, and shifts to generate a 12-bit result.
Use Cases: Suitable for applications needing efficient manipulation of binary data in FPGA environments.
# Hardware
FPGA: Zybo Z7010 (Xilinx Zynq-7000)
Development Environment: Vivado 2019.1 (Xilinx)
# Software
VHDL: Used to implement both circuits.
Vivado 2019.1: Used for FPGA synthesis, simulation, and timing analysis.
# Modules
Arithmetic Calculation Circuit: Processes the inputs (A, B, C, D) using arithmetic operations like addition and multiplication, producing a combined output.
Binary Manipulation Circuit: Utilizes bitwise operations and shifting to manipulate binary data, producing a unique result based on binary logic.
# Testing
Simulation files are included for testing both circuits. Testbenches are provided to verify the correct operation of both the arithmetic and binary manipulation circuits.
# License
This project is licensed under the MIT License. See the LICENSE file for more details.
