## Pin mapping for AMD Urbana (Spartan-7) board
## Top-level ports: clk, da1..da5, db1..db5, s1..s5, c5

# Clock: on-board 100 MHz oscillator
set_property PACKAGE_PIN N15 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name clk -waveform {0 5} [get_ports clk]

# -------------------------
# da1-da5  → SW0..SW4  (inputs)
set_property PACKAGE_PIN G1 [get_ports da1]
set_property IOSTANDARD LVCMOS25 [get_ports da1]

set_property PACKAGE_PIN F2 [get_ports da2]
set_property IOSTANDARD LVCMOS25 [get_ports da2]

set_property PACKAGE_PIN F1 [get_ports da3]
set_property IOSTANDARD LVCMOS25 [get_ports da3]

set_property PACKAGE_PIN E2 [get_ports da4]
set_property IOSTANDARD LVCMOS25 [get_ports da4]

set_property PACKAGE_PIN E1 [get_ports da5]
set_property IOSTANDARD LVCMOS25 [get_ports da5]

# db1-db5  → SW5..SW9  (inputs)
set_property PACKAGE_PIN D2 [get_ports db1]
set_property IOSTANDARD LVCMOS25 [get_ports db1]

set_property PACKAGE_PIN D1 [get_ports db2]
set_property IOSTANDARD LVCMOS25 [get_ports db2]

set_property PACKAGE_PIN C2 [get_ports db3]
set_property IOSTANDARD LVCMOS25 [get_ports db3]

set_property PACKAGE_PIN B2 [get_ports db4]
set_property IOSTANDARD LVCMOS25 [get_ports db4]

set_property PACKAGE_PIN A4 [get_ports db5]
set_property IOSTANDARD LVCMOS25 [get_ports db5]

# -------------------------
# Outputs → LEDs (LVCMOS33)
# s1-s5 → LED0..LED4
set_property PACKAGE_PIN C13 [get_ports s1]
set_property IOSTANDARD LVCMOS33 [get_ports s1]
set_property SLEW SLOW [get_ports s1]

set_property PACKAGE_PIN C14 [get_ports s2]
set_property IOSTANDARD LVCMOS33 [get_ports s2]
set_property SLEW SLOW [get_ports s2]

set_property PACKAGE_PIN D14 [get_ports s3]
set_property IOSTANDARD LVCMOS33 [get_ports s3]
set_property SLEW SLOW [get_ports s3]

set_property PACKAGE_PIN D15 [get_ports s4]
set_property IOSTANDARD LVCMOS33 [get_ports s4]
set_property SLEW SLOW [get_ports s4]

set_property PACKAGE_PIN D16 [get_ports s5]
set_property IOSTANDARD LVCMOS33 [get_ports s5]
set_property SLEW SLOW [get_ports s5]

# c5 → LED5
set_property PACKAGE_PIN F18 [get_ports c5]
set_property IOSTANDARD LVCMOS33 [get_ports c5]
set_property SLEW SLOW [get_ports c5]
