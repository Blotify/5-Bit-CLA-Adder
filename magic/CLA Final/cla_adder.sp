* cla_adder_fixed.sp -- sanitized extracted netlist + simple testbench
.include "TSMC_180nm.txt"
.global Vdd Gnd


* NGSPICE file created from cla_adder.ext - technology: scmos

.subckt dff clk out gnd a vdd
M1000 b clk n1 w_n21_n12# CMOSP w=1.8u l=0.18u
+  ad=1.134p pd=4.86u as=1.296p ps=5.04u
M1001 c b n2 Gnd CMOSN w=0.9u l=0.18u
+  ad=0.729p pd=3.42u as=0.729p ps=3.42u
M1002 b a gnd Gnd CMOSN w=0.45u l=0.18u
+  ad=0.6885p pd=3.96u as=1.296p ps=9.18u
M1003 n1 a vdd w_n21_n12# CMOSP w=1.8u l=0.18u
+  ad=0p pd=0u as=2.106p ps=12.78u
M1004 out n4 vdd w_96_n10# CMOSP w=0.9u l=0.18u
+  ad=0.405p pd=2.7u as=0p ps=0u
M1005 c clk vdd w_n21_n12# CMOSP w=0.9u l=0.18u
+  ad=1.62p pd=5.4u as=0p ps=0u
M1006 n4 c vdd w_n21_n12# CMOSP w=0.9u l=0.18u
+  ad=1.539p pd=5.22u as=0p ps=0u
M1007 n2 clk gnd Gnd CMOSN w=0.9u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1008 out n4 gnd Gnd CMOSN w=0.45u l=0.18u
+  ad=0.2025p pd=1.8u as=0p ps=0u
M1009 n4 clk n3 Gnd CMOSN w=0.9u l=0.18u
+  ad=0.648p pd=3.24u as=0.729p ps=3.42u
M1010 n3 c gnd Gnd CMOSN w=0.9u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
.ends

.subckt xor GND VDD XOR A B
M1000 VDD A Anot w_n25_n4# CMOSP w=0.72u l=0.18u
+  ad=1.296p pd=9.36u as=0.324p ps=2.34u
M1001 GND Anot a_24_n44# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.648p pd=6.48u as=0.2592p ps=2.16u
M1002 XOR Bnot a_4_2# w_n25_n4# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0.5184p ps=2.88u
M1003 a_4_n44# A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.2592p pd=2.16u as=0p ps=0u
M1004 a_24_n44# Bnot XOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0.2592p ps=2.16u
M1005 a_24_2# B XOR w_n25_n4# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0p ps=0u
M1006 Bnot B GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0p ps=0u
M1007 GND A Anot Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0.162p ps=1.62u
M1008 a_4_2# A VDD w_n25_n4# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1009 VDD Anot a_24_2# w_n25_n4# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1010 XOR B a_4_n44# Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1011 Bnot B VDD w_n25_n4# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
.ends

.subckt sum vdd gnd b a sum
Xxor_0 gnd vdd sum a b xor
.ends

.subckt sum_block vdd gnd s1 s2 s3 s4 s5 c1 p1 c2 p2 c3 p3 c4 p4 c5 p5
Xsum_0 vdd gnd c1 p1 s1 sum
Xsum_1 vdd gnd c2 p2 s2 sum
Xsum_2 vdd gnd c3 p3 s3 sum
Xsum_4 vdd gnd c5 p5 s5 sum
Xsum_3 vdd gnd c4 p4 s4 sum
.ends

.subckt and2 GND VDD A B OUT
M1000 a_13_5# B a_13_n25# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.1944p pd=1.8u as=0.2592p ps=2.16u
M1001 OUT a_13_5# VDD w_43_n1# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=1.0368p ps=7.2u
M1002 a_13_n25# A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0.324p ps=3.24u
M1003 OUT a_13_5# GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0p ps=0u
M1004 a_13_5# A VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0p ps=0u
M1005 VDD B a_13_5# w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
.ends

.subckt pg a b g p vdd gnd
Xxor_0 gnd vdd p a b xor
Xand2_0 gnd vdd a b g and2
.ends

.subckt or4 GND VDD A B C D OUT
M1000 4NOR C GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.5184p pd=4.32u as=0.7452p ps=7.02u
M1001 a_0_13# A VDD w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0.648p ps=4.68u
M1002 a_19_13# C a_10_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0.4536p ps=2.7u
M1003 OUT 4NOR VDD w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
M1004 OUT 4NOR GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0p ps=0u
M1005 GND B 4NOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1006 GND D 4NOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1007 4NOR A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1008 a_10_13# B a_0_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1009 4NOR D a_19_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.3888p pd=2.52u as=0p ps=0u
.ends

.subckt or2 GND VDD A B OUT
M1000 NOR A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.2592p pd=2.16u as=0.486p ps=4.86u
M1001 OUT NOR VDD w_n13_0# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0.648p ps=4.68u
M1002 NOR B a_0_6# w_n13_0# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0.5184p ps=2.88u
M1003 OUT NOR GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0p ps=0u
M1004 a_0_6# A VDD w_n13_0# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1005 GND B NOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
.ends

.subckt and5 GND VDD A B C D E OUT
M1000 5NAND C VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=1.4256p pd=8.28u as=1.6848p ps=10.44u
M1001 VDD D 5NAND w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1002 a_23_n43# B a_13_n43# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.2592p pd=2.16u as=0.2592p ps=2.16u
M1003 5NAND E a_43_n43# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.1944p pd=1.8u as=0.2592p ps=2.16u
M1004 5NAND E VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1005 a_13_n43# A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0.324p ps=3.24u
M1006 a_43_n43# D a_33_n43# Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0.2592p ps=2.16u
M1007 OUT 5NAND GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0p ps=0u
M1008 5NAND A VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1009 OUT 5NAND VDD w_73_n1# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
M1010 VDD B 5NAND w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1011 a_33_n43# C a_23_n43# Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
.ends

.subckt and3 GND VDD A B C OUT
M1000 3NAND C VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0.9072p pd=5.4u as=1.1664p ps=7.56u
M1001 a_23_n28# B a_13_n28# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.2592p pd=2.16u as=0.2592p ps=2.16u
M1002 OUT 3NAND GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0.324p ps=3.24u
M1003 OUT 3NAND VDD w_53_n1# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
M1004 a_13_n28# A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1005 3NAND A VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1006 VDD B 3NAND w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1007 3NAND C a_23_n28# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.1944p pd=1.8u as=0p ps=0u
.ends

.subckt or5 GND VDD A B C D OUT
M1000 4NOR C GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.5184p pd=4.32u as=0.7452p ps=7.02u
M1001 a_0_13# A VDD w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0.648p ps=4.68u
M1002 a_19_13# C a_10_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0.4536p ps=2.7u
M1003 OUT 4NOR VDD w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
M1004 OUT 4NOR GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0p ps=0u
M1005 GND B 4NOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1006 GND D 4NOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1007 4NOR A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1008 a_10_13# B a_0_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1009 4NOR D a_19_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.3888p pd=2.52u as=0p ps=0u
.ends

.subckt or3 GND VDD A B C OUT
M1000 OUT 3NOR GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0.5508p ps=5.22u
M1001 a_0_13# A VDD w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.5184p pd=2.88u as=0.648p ps=4.68u
M1002 3NOR A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.4536p pd=3.96u as=0p ps=0u
M1003 3NOR C a_10_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.3888p pd=2.52u as=0.4536p ps=2.7u
M1004 3NOR C GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1005 OUT 3NOR VDD w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
M1006 GND B 3NOR Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1007 a_10_13# B a_0_13# w_n13_7# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
.ends

.subckt and4 GND VDD A B C D OUT
M1000 4NAND C VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=1.0368p pd=5.76u as=1.5552p ps=10.08u
M1001 VDD D 4NAND w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1002 a_33_n36# C a_23_n36# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.2592p pd=2.16u as=0.2592p ps=2.16u
M1003 a_23_n36# B a_13_n36# Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0.2592p ps=2.16u
M1004 4NAND A VDD w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1005 OUT 4NAND VDD w_61_n1# CMOSP w=0.72u l=0.18u
+  ad=0.324p pd=2.34u as=0p ps=0u
M1006 VDD B 4NAND w_0_n1# CMOSP w=0.72u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1007 OUT 4NAND GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0.162p pd=1.62u as=0.324p ps=3.24u
M1008 a_13_n36# A GND Gnd CMOSN w=0.36u l=0.18u
+  ad=0p pd=0u as=0p ps=0u
M1009 4NAND D a_33_n36# Gnd CMOSN w=0.36u l=0.18u
+  ad=0.1944p pd=1.8u as=0p ps=0u
.ends

.subckt cla_block g4 g2 g3 g1 p2 p3 p4 p5 c2 c3 c4 g5 c5 vdd gnd
Xor4_0 gnd vdd or4_0_A or4_0_B g4 or4_0_D c4 or4
Xor2_0 gnd vdd or2_0_A g2 c2 or2
Xand5_0 gnd vdd p5 p4 p3 p2 g1 or5_0_D and5
Xor2_1 gnd vdd g5 or2_1_B c5 or2
Xand3_0 gnd vdd p3 p2 g1 or3_0_A and3
Xand3_1 gnd vdd and3_1_A p3 g2 or4_0_B and3
Xand3_2 gnd vdd g3 p5 and3_2_C or5_0_B and3
Xor5_0 gnd vdd or5_0_A or5_0_B or5_0_C or5_0_D or2_1_B or5
Xor3_0 gnd vdd or3_0_A or3_0_B g3 c3 or3
Xand4_0 gnd vdd p4 p2 p3 g1 or4_0_D and4
Xand4_1 gnd vdd g2 p5 p4 p3 or5_0_C and4
Xand2_0 gnd vdd p2 g1 or2_0_A and2
Xand2_1 gnd vdd p3 g2 or3_0_B and2
Xand2_2 gnd vdd p4 g3 or4_0_A and2
Xand2_3 gnd vdd p5 g4 or5_0_A and2
.ends

.subckt cla_adder a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 clk s1 s2 s3 s4 s5
Xdff_0 clk pg_3_a pg_4_gnd a4 pg_4_vdd dff
Xdff_1 clk pg_2_b pg_4_gnd b3 pg_4_vdd dff
Xdff_2 clk pg_3_b pg_4_gnd b4 pg_4_vdd dff
Xdff_3 clk pg_2_a pg_4_gnd a3 pg_4_vdd dff
Xdff_4 clk pg_4_a pg_4_gnd a5 pg_4_vdd dff
Xdff_5 clk pg_1_b pg_4_gnd b2 pg_4_vdd dff
Xdff_6 clk pg_4_b pg_4_gnd b5 pg_4_vdd dff
Xdff_7 clk pg_1_a pg_4_gnd a2 pg_4_vdd dff
Xsum_block_0 sum_block_0_vdd pg_4_gnd dff_14_a dff_10_a dff_11_a dff_12_a dff_13_a
+ pg_0_g pg_0_p sum_block_0_c2 sum_block_0_p2 pg_2_p sum_block_0_p3 pg_3_p sum_block_0_p4
+ sum_block_0_c5 pg_4_p sum_block
Xdff_8 clk pg_0_b pg_4_gnd b1 pg_4_vdd dff
Xdff_9 clk pg_0_a pg_4_gnd a1 pg_4_vdd dff
Xpg_0 pg_0_a pg_0_b pg_0_g pg_0_p pg_4_vdd pg_4_gnd pg
Xpg_1 pg_1_a pg_1_b pg_1_g pg_1_p pg_4_vdd pg_4_gnd pg
Xpg_2 pg_2_a pg_2_b pg_2_g pg_2_p pg_4_vdd pg_4_gnd pg
Xdff_10 clk s2 pg_4_gnd dff_10_a pg_4_vdd dff
Xpg_3 pg_3_a pg_3_b pg_3_g pg_3_p pg_4_vdd pg_4_gnd pg
Xdff_12 clk s4 pg_4_gnd dff_12_a pg_4_vdd dff
Xdff_11 clk s3 pg_4_gnd dff_11_a pg_4_vdd dff
Xpg_4 pg_4_a pg_4_b pg_4_g pg_4_p pg_4_vdd pg_4_gnd pg
Xdff_13 clk s5 pg_4_gnd dff_13_a pg_4_vdd dff
Xdff_14 clk s1 pg_4_gnd dff_14_a pg_4_vdd dff
Xcla_block_0 pg_3_g pg_1_g pg_2_g pg_0_g sum_block_0_c2 pg_2_p pg_3_p pg_4_p sum_block_0_p2
+ sum_block_0_p3 sum_block_0_p4 pg_4_g sum_block_0_c5 sum_block_0_vdd cla_block_0_gnd
+ cla_block
.ends



* supply rails

Vdd Vdd 0 1.8


Vclk clk 0 PULSE(0 1.8 0n 5n 5n 200n 400n)


Va1 a1 0 PULSE(0 1.8 0n 2n 2n 200n 400n)
Vb1 b1 0 PULSE(0 1.8 20n 2n 2n 200n 400n)
Vc0 c0 0 PULSE(0 1.8 800n 2n 2n 200n 400n)

Va2 a2 0 PULSE(0 1.8 40n 2n 2n 200n 400n)
Vb2 b2 0 PULSE(0 1.8 60n 2n 2n 200n 400n)

Va3 a3 0 PULSE(0 1.8 80n 2n 2n 200n 400n)
Vb3 b3 0 PULSE(0 1.8 100n 2n 2n 200n 400n)

Va4 a4 0 PULSE(0 1.8 120n 2n 2n 200n 400n)
Vb4 b4 0 PULSE(0 1.8 140n 2n 2n 200n 400n)

Va5 a5 0 PULSE(0 1.8 160n 2n 2n 200n 400n)
Vb5 b5 0 PULSE(0 1.8 180n 2n 2n 200n 400n)

XU a1 b1 a2 b2 a3 b3 a4 b4 a5 b5 clk s1 s2 s3 s4 s5 cla_adder



.tran 1n 1u uic

* Measure crossing times at 0.9V (half of 1.8V)
.measure tran t_a1      WHEN v(a1)=0.9  RISE=1
.measure tran t_s1      WHEN v(s1)=0.9  RISE=1
.measure tran t_cout    WHEN v(xu.sum_block_0_c5)=0.9 RISE=1

* Clock edge
.measure tran t_clk_edge WHEN v(clk)=0.9 RISE=1

* Launch flop Q (bit-1): node = xu.pg_0_a
.measure tran t_q_launch WHEN v(xu.pg_0_a)=0.9 RISE=1

* Capture flop D (bit-1): node = s1
.measure tran t_d_capture WHEN v(s1)=0.9 RISE=1

* Capture flop Q_out (bit-1): node = xu.dff_14_a
.measure tran t_q_capture WHEN v(xu.dff_14_a)=0.9 RISE=1


.control
run

* print basic measurements
print t_a1
print t_s1
print t_cout
print t_clk_edge
print t_q_launch
print t_d_capture
print t_q_capture

* compute flop timing parameters
print "t_pcq   = ", t_q_launch - t_clk_edge
print "t_p_comb = ", t_d_capture - t_q_launch

* compute delays between input and outputs
print "delay a1→s1   = ", t_s1 - t_a1
print "delay a1→cout = ", t_cout - t_a1

set color0=black
set color1=white
set xbrushwidth=2
run


set curplottitle="satvik_shrivastava_2024102029"
plot v(a1) v(a2)+4 v(a3)+8 v(a4)+12 v(a5)+16  v(c0)+20 v(clk)+24


set curplottitle="atvik_shrivastava_2024102029"
plot v(b1) v(b2)+4 v(b3)+8 v(b4)+12 v(b5)+16 v(clk)+20


set curplottitle="atvik_shrivastava_2024102029"
plot v(s1) v(s2)+3 v(s3)+6 v(s4)+9 v(s5)+12


set curplottitle="atvik_shrivastava_2024102029"
plot v(xu.sum_block_0_c5) v(clk)+4

.endc

.end



