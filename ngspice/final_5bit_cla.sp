.TITLE d flip flop
.include TSMC_180nm.txt
.param supply=1.8
.param LAMBDA=0.09u
.param W2 = {1.8u}
.param W1 = {2*W2}
.param c0=0

Vdd vdd gnd DC 1.8
Vclk clk gnd PULSE (0 1.8 2ns 0ns 0ns 3ns 6ns)

Va0 a0_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Va1 a1_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Va2 a2_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Va3 a3_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Va4 a4_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)

Vb0 b0_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Vb1 b1_in gnd 0v
Vb2 b2_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Vb3 b3_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)
Vb4 b4_in gnd PULSE(0 1.8 0ns 0ns 0ns 5ns 10ns)

.subckt inv op ip vdd gnd k=1
MP1 op ip vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MN1 op ip gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
.ends inv

.subckt and2 out a b vdd gnd k=1
MP1 out1 a vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP2 out1 b vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MN1 out1 a n1 gnd CMOSN W={W2*2} L={2*LAMBDA} AS={5*W2*2*LAMBDA} PS={10*LAMBDA+2*2*W2} AD={5*W2*2*LAMBDA} PD={10*LAMBDA+2*2*W2}
MN2 n1 b gnd gnd CMOSN W={W2*2} L={2*LAMBDA} AS={5*W2*2*LAMBDA} PS={10*LAMBDA+2*2*W2} AD={5*W2*2*LAMBDA} PD={10*LAMBDA+2*2*W2}
x1 out out1 vdd gnd inv k=1
.ends and2

.subckt and3 out a b c vdd gnd k=1
MP1 out1 a vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP2 out1 b vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP3 out1 c vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MN1 out1 a n1 gnd CMOSN W={W2*3} L={2*LAMBDA} AS={5*W2*3*LAMBDA} PS={10*LAMBDA+2*3*W2} AD={5*W2*3*LAMBDA} PD={10*LAMBDA+2*3*W2}
MN2 n1 b n2 gnd CMOSN W={W2*3} L={2*LAMBDA} AS={5*W2*3*LAMBDA} PS={10*LAMBDA+2*3*W2} AD={5*W2*3*LAMBDA} PD={10*LAMBDA+2*3*W2}
MN3 n2 c gnd gnd CMOSN W={W2*3} L={2*LAMBDA} AS={5*W2*3*LAMBDA} PS={10*LAMBDA+2*3*W2} AD={5*W2*3*LAMBDA} PD={10*LAMBDA+2*3*W2}
x1 out out1 vdd gnd inv k=1
.ends and3

.subckt and4 out a b c d vdd gnd k=1
MP1 out1 a vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP2 out1 b vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP3 out1 c vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP4 out1 d vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MN1 out1 a n1 gnd CMOSN W={W2*4} L={2*LAMBDA} AS={5*W2*4*LAMBDA} PS={10*LAMBDA+2*4*W2} AD={5*W2*4*LAMBDA} PD={10*LAMBDA+2*4*W2}
MN2 n1 b n2 gnd CMOSN W={W2*4} L={2*LAMBDA} AS={5*W2*4*LAMBDA} PS={10*LAMBDA+2*4*W2} AD={5*W2*4*LAMBDA} PD={10*LAMBDA+2*4*W2}
MN3 n2 c n3 gnd CMOSN W={W2*4} L={2*LAMBDA} AS={5*W2*4*LAMBDA} PS={10*LAMBDA+2*4*W2} AD={5*W2*4*LAMBDA} PD={10*LAMBDA+2*4*W2}
MN4 n3 d gnd gnd CMOSN W={W2*4} L={2*LAMBDA} AS={5*W2*4*LAMBDA} PS={10*LAMBDA+2*4*W2} AD={5*W2*4*LAMBDA} PD={10*LAMBDA+2*4*W2}
x1 out out1 vdd gnd inv k=1
.ends and4

.subckt and5 out a b c d e vdd gnd k=1
MP1 out1 a vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP2 out1 b vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP3 out1 c vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP4 out1 d vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP5 out1 e vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MN1 out1 a n1 gnd CMOSN W={W2*5} L={2*LAMBDA} AS={5*W2*5*LAMBDA} PS={10*LAMBDA+2*5*W2} AD={5*W2*5*LAMBDA} PD={10*LAMBDA+2*5*W2}
MN2 n1 b n2 gnd CMOSN W={W2*5} L={2*LAMBDA} AS={5*W2*5*LAMBDA} PS={10*LAMBDA+2*5*W2} AD={5*W2*5*LAMBDA} PD={10*LAMBDA+2*5*W2}
MN3 n2 c n3 gnd CMOSN W={W2*5} L={2*LAMBDA} AS={5*W2*5*LAMBDA} PS={10*LAMBDA+2*5*W2} AD={5*W2*5*LAMBDA} PD={10*LAMBDA+2*5*W2}
MN4 n3 d n4 gnd CMOSN W={W2*5} L={2*LAMBDA} AS={5*W2*5*LAMBDA} PS={10*LAMBDA+2*5*W2} AD={5*W2*5*LAMBDA} PD={10*LAMBDA+2*5*W2}
MN5 n4 e gnd gnd CMOSN W={W2*5} L={2*LAMBDA} AS={5*W2*5*LAMBDA} PS={10*LAMBDA+2*5*W2} AD={5*W2*5*LAMBDA} PD={10*LAMBDA+2*5*W2}
x1 out out1 vdd gnd inv k=1
.ends and5

.subckt or2 out a b vdd gnd k=1
MP1 n1 a vdd vdd CMOSP W={W1*2} L={2*LAMBDA} AS={5*W1*2*LAMBDA} PS={10*LAMBDA+2*W1*2} AD={5*W1*2*LAMBDA} PD={10*LAMBDA+2*W1*2}
MP2 out1 b n1 vdd CMOSP W={W1*2} L={2*LAMBDA} AS={5*W1*2*LAMBDA} PS={10*LAMBDA+2*W1*2} AD={5*W1*2*LAMBDA} PD={10*LAMBDA+2*W1*2}
MN1 out1 a gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN2 out1 b gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
x1 out out1 vdd gnd inv k=1
.ends or2

.subckt or3 out a b c vdd gnd k=1
MP1 n1 a vdd vdd CMOSP W={W1*3} L={2*LAMBDA} AS={5*W1*3*LAMBDA} PS={10*LAMBDA+2*W1*3} AD={5*W1*3*LAMBDA} PD={10*LAMBDA+2*W1*3}
MP2 n2 b n1 vdd CMOSP W={W1*3} L={2*LAMBDA} AS={5*W1*3*LAMBDA} PS={10*LAMBDA+2*W1*3} AD={5*W1*3*LAMBDA} PD={10*LAMBDA+2*W1*3}
MP3 out1 c n2 vdd CMOSP W={W1*3} L={2*LAMBDA} AS={5*W1*3*LAMBDA} PS={10*LAMBDA+2*W1*3} AD={5*W1*3*LAMBDA} PD={10*LAMBDA+2*W1*3}
MN1 out1 a gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN2 out1 b gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN3 out1 c gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
x1 out out1 vdd gnd inv k=1
.ends or3

.subckt or4 out a b c d vdd gnd k=1
MP1 n1 a vdd vdd CMOSP W={W1*4} L={2*LAMBDA} AS={5*W1*4*LAMBDA} PS={10*LAMBDA+2*W1*4} AD={5*W1*4*LAMBDA} PD={10*LAMBDA+2*W1*4}
MP2 n2 b n1 vdd CMOSP W={W1*4} L={2*LAMBDA} AS={5*W1*4*LAMBDA} PS={10*LAMBDA+2*W1*4} AD={5*W1*4*LAMBDA} PD={10*LAMBDA+2*W1*4}
MP3 n3 c n2 vdd CMOSP W={W1*4} L={2*LAMBDA} AS={5*W1*4*LAMBDA} PS={10*LAMBDA+2*W1*4} AD={5*W1*4*LAMBDA} PD={10*LAMBDA+2*W1*4}
MP4 out1 d n3 vdd CMOSP W={W1*4} L={2*LAMBDA} AS={5*W1*4*LAMBDA} PS={10*LAMBDA+2*W1*4} AD={5*W1*4*LAMBDA} PD={10*LAMBDA+2*W1*4}
MN1 out1 a gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN2 out1 b gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN3 out1 c gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN4 out1 d gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
x1 out out1 vdd gnd inv k=1
.ends or4

.subckt or5 out a b c d e vdd gnd k=1
MP1 n1 a vdd vdd CMOSP W={W1*5} L={2*LAMBDA} AS={5*W1*5*LAMBDA} PS={10*LAMBDA+2*W1*5} AD={5*W1*5*LAMBDA} PD={10*LAMBDA+2*W1*5}
MP2 n2 b n1 vdd CMOSP W={W1*5} L={2*LAMBDA} AS={5*W1*5*LAMBDA} PS={10*LAMBDA+2*W1*5} AD={5*W1*5*LAMBDA} PD={10*LAMBDA+2*W1*5}
MP3 n3 c n2 vdd CMOSP W={W1*5} L={2*LAMBDA} AS={5*W1*5*LAMBDA} PS={10*LAMBDA+2*W1*5} AD={5*W1*5*LAMBDA} PD={10*LAMBDA+2*W1*5}
MP4 n4 d n3 vdd CMOSP W={W1*5} L={2*LAMBDA} AS={5*W1*5*LAMBDA} PS={10*LAMBDA+2*W1*5} AD={5*W1*5*LAMBDA} PD={10*LAMBDA+2*W1*5}
MP5 out1 e n4 vdd CMOSP W={W1*5} L={2*LAMBDA} AS={5*W1*5*LAMBDA} PS={10*LAMBDA+2*W1*5} AD={5*W1*5*LAMBDA} PD={10*LAMBDA+2*W1*5}
MN1 out1 a gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN2 out1 b gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN3 out1 c gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN4 out1 d gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN5 out1 e gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
x1 out out1 vdd gnd inv k=1
.ends or5

.subckt nor2 out a b vdd gnd k=1
MP1 n1 a vdd vdd CMOSP W={W1*2} L={2*LAMBDA} AS={5*W1*2*LAMBDA} PS={10*LAMBDA+2*W1*2} AD={5*W1*2*LAMBDA} PD={10*LAMBDA+2*W1*2}
MP2 out b n1 vdd CMOSP W={W1*2} L={2*LAMBDA} AS={5*W1*2*LAMBDA} PS={10*LAMBDA+2*W1*2} AD={5*W1*2*LAMBDA} PD={10*LAMBDA+2*W1*2}
MN1 out a gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
MN2 out b gnd gnd CMOSN W={W2*k} L={2*LAMBDA} AS={5*W2*k*LAMBDA} PS={10*LAMBDA+2*k*W2} AD={5*W2*k*LAMBDA} PD={10*LAMBDA+2*k*W2}
.ends nor2

.subckt nand2 out a b vdd gnd k=1
MP1 out a vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MP2 out b vdd vdd CMOSP W={W1*k} L={2*LAMBDA} AS={5*W1*k*LAMBDA} PS={10*LAMBDA+2*W1*k} AD={5*W1*k*LAMBDA} PD={10*LAMBDA+2*W1*k}
MN1 out a n1 gnd CMOSN W={W2*2} L={2*LAMBDA} AS={5*W2*2*LAMBDA} PS={10*LAMBDA+2*2*W2} AD={5*W2*2*LAMBDA} PD={10*LAMBDA+2*2*W2}
MN2 n1 b gnd gnd CMOSN W={W2*2} L={2*LAMBDA} AS={5*W2*2*LAMBDA} PS={10*LAMBDA+2*2*W2} AD={5*W2*2*LAMBDA} PD={10*LAMBDA+2*2*W2}
.ends nand2

.subckt xor2 out a b vdd gnd
x1 out1 a b vdd gnd nor2 k=1
x2 out2 a b vdd gnd and2 k=1
x3 out out1 out2 vdd gnd nor2 k=1
.ends xor2

.subckt TSPC_DFF D Q clk Vdd gnd k=1
M1 c1 D Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1} AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M2 x clk c1 Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1} AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M3 x D gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M4 y clk Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1} AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M5 y x c2 gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M6 c2 clk gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M7 q_bar y Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1} AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M8 q_bar clk c3 gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M9 c3 y gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M10 q q_bar Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1} AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M11 q q_bar gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
.ends TSPC_DFF

XDFF1 a0_in a0_out clk Vdd gnd TSPC_DFF k=1
XDFF2 a1_in a1_out clk Vdd gnd TSPC_DFF k=1
XDFF3 a2_in a2_out clk Vdd gnd TSPC_DFF k=1
XDFF4 a3_in a3_out clk Vdd gnd TSPC_DFF k=1
XDFF4b a4_in a4_out clk Vdd gnd TSPC_DFF k=1
XDFF5 b0_in b0_out clk Vdd gnd TSPC_DFF k=1
XDFF6 b1_in b1_out clk Vdd gnd TSPC_DFF k=1
XDFF7 b2_in b2_out clk Vdd gnd TSPC_DFF k=1
XDFF8 b3_in b3_out clk Vdd gnd TSPC_DFF k=1
XDFF8b b4_in b4_out clk Vdd gnd TSPC_DFF k=1

x0_Xor2 p0 a0_out b0_out vdd gnd xor2
x1_Xor2 p1 a1_out b1_out vdd gnd xor2
x2_Xor2 p2 a2_out b2_out vdd gnd xor2
x3_Xor2 p3 a3_out b3_out vdd gnd xor2
x4_Xor2 p4 a4_out b4_out vdd gnd xor2

x0_and2 g0 a0_out b0_out vdd gnd and2 k=1
x1_and2 g1 a1_out b1_out vdd gnd and2 k=1
x2_and2 g2 a2_out b2_out vdd gnd and2 k=1
x3_and2 g3 a3_out b3_out vdd gnd and2 k=1
x4_and2 g4 a4_out b4_out vdd gnd and2 k=1

Xand2_k1 k1 p1 g0 vdd gnd and2 k=1
Xand2_k2 k2 p2 g1 vdd gnd and2 k=1
Xand2_k3 k3 p3 g2 vdd gnd and2 k=1
Xand2_k4b k4 p4 g3 vdd gnd and2 k=1
Xand3_k4 k5 p2 p1 g0 vdd gnd and3 k=1
Xand3_k5 k6 p3 p2 g1 vdd gnd and3 k=1
Xand3_k7 k7 p4 p3 g2 vdd gnd and3 k=1
Xand4_k6 k8 p3 p2 p1 g0 vdd gnd and4 k=1
Xand4_k8 k9 p4 p3 p2 g1 vdd gnd and4 k=1
Xand5_k9 k10 p4 p3 p2 p1 g0 vdd gnd and5 k=1
x0_and21 c1 a0_out b0_out vdd gnd and2 k=1
Xor2_1 c2 k1 g1 vdd gnd or2 k=1
Xor3_1 c3 k5 k2 g2 vdd gnd or3 k=1
Xor4_1 c4_in k8 k6 k3 g3 vdd gnd or4 k=1
Xor5_1 c5_in k10 k9 k7 k4 g4 vdd gnd or5 k=1
x4_Xor2b s0_in p0 c0 vdd gnd xor2
x5_Xor2 s1_in p1 c1 vdd gnd xor2
x6_Xor2 s2_in p2 c2 vdd gnd xor2
x7_Xor2 s3_in p3 c3 vdd gnd xor2
x8_Xor2 s4_in p4 c4_in vdd gnd xor2
XDFF9 s0_in s0_out clk Vdd gnd TSPC_DFF k=1
XDFF10 s1_in s1_out clk Vdd gnd TSPC_DFF k=1
XDFF11 s2_in s2_out clk Vdd gnd TSPC_DFF k=1
XDFF12 s3_in s3_out clk Vdd gnd TSPC_DFF k=1
XDFF12b s4_in s4_out clk Vdd gnd TSPC_DFF k=1
XDFF13 c5_in c5_out clk Vdd gnd TSPC_DFF k=1
xinverter1 dont_care_1 s0_out vdd gnd inv k=1
xinverter2 dont_care_2 s1_out vdd gnd inv k=1
xinverter3 dont_care_3 s2_out vdd gnd inv k=1
xinverter4 dont_care_4 s3_out vdd gnd inv k=1
xinverter4b dont_care_4b s4_out vdd gnd inv k=1
xinverter5 dont_care_5 c5_out vdd gnd inv k=1
.tran 0.1n 10n
.measure tran delay_dff_in      TRIG v(clk)    VAL=0.9 RISE=1  TARG v(b3_out) VAL=0.9 RISE=1
.measure tran delay_outputff    TRIG v(clk)    VAL=0.9 RISE=2  TARG v(s3_out) VAL=0.9 RISE=2
.measure tran delay_cla_a0out_s3 TRIG v(a0_out) VAL=0.9 RISE=1  TARG v(s3_in)  VAL=0.9 RISE=1

.control
set color0=black
set color1=white
set xbrushwidth=2
run
set curplottitle=satvik_shrivastava_2024102029
plot a0_in a1_in+4 a2_in+8 a3_in+12 a4_in+16 b0_in+2 b1_in+6 b2_in+10 b3_in+14 b4_in+18 clk+20
set curplottitle=atvik_shrivastava_2024102029
plot a0_out a1_out+4 a2_out+8 a3_out+12 a4_out+16 b0_out+2 b1_out+6 b2_out+10 b3_out+14 b4_out+18 clk+20
set curplottitle=satvik_shrivastava_2024102029
plot s0_out s1_out+2 s2_out+4 s3_out+6 s4_out+8 c5_out+10 clk+12
set curplottitle=satvik_shrivastava_2024102029
plot s0_in s1_in+2 s2_in+4 s3_in+6 s4_in+8 c5_in+10 clk+12
set curplottitle=satvik_shrivastava_2024102029
plot p0 p1+2 p2+4 p3+6 p4+8 clk+10
set curplottitle=satvik_shrivastava_2024102029
plot g0 g1+2 g2+4 g3+6 g4+8 clk+10
.endc
.end