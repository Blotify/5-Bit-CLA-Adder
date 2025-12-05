# 5-Bit Carry Lookahead Adder (180 nm CMOS)

A complete custom VLSI implementation of a synchronous 5-bit Carry Lookahead Adder (CLA) using 180 nm CMOS technology. The project covers the full digital IC design flow, from transistor-level circuit design and layout generation to post-layout verification and FPGA implementation.

## Features
- Custom-designed CMOS logic gates and positive edge-triggered D Flip-Flops
- Parallel carry computation using Carry Lookahead logic
- Manual transistor sizing for optimized delay and power
- Full custom layouts created in Magic VLSI
- Pre-layout and post-layout verification using NGSpice
- Verilog HDL implementation with FPGA validation
- Timing analysis including propagation delay and setup time calculations

## Tools Used
- Magic VLSI
- NGSpice
- Verilog HDL
- AMD/Boolean FPGA Board
- Oscilloscope

## Repository Structure
- `schematics/` – Circuit schematics
- `layouts/` – Magic layout files
- `spice/` – NGSpice netlists and simulations
- `verilog/` – HDL implementation
- `reports/` – Project documentation
- `images/` – Layouts and simulation waveforms

This project demonstrates the complete custom VLSI design workflow, including schematic capture, physical layout, circuit simulation, post-layout validation, and hardware verification.