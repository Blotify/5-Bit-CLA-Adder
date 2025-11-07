
.TITLE d flip flop
.include TSMC_180nm.txt
.param supply=1.8
.param LAMBDA=0.09u
.param W2 = {1.8u}
.param W1 = {2*W2}


VDD Vdd gnd DC 'SUPPLY'

* Input Signals
Va1 A1 gnd PULSE(0 1.8 2ns 0ns 0ns 20ns 40ns)
*Vb A2 gnd PULSE(0 1.8 0ns 0.5ns 0.5ns 20ns 40ns)
VS clk gnd PULSE (0 1.8 2ns 0ns 0ns 5ns 10ns)

.subckt TSPC_DFF D Q clk Vdd gnd k=1
* Master Stage
M1 c1 D Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1}  AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M2 x clk c1 Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1} AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M3 x D gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2}  AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}

* Slave Stage
M4 y clk Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1}  AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M5 y x c2 gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2}  AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M6 c2 clk gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2}  AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}

* Output Stage
M7 q_bar y Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1}  AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M8 q_bar clk c3 gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2} AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
M9 c3 y gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2}  AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}

* Final Output Inversion
M10 q q_bar Vdd Vdd CMOSP W={k*w1} L={2*LAMBDA} AS={k*5*w1*LAMBDA} PS={10*LAMBDA+k*2*w1}  AD={k*5*w1*LAMBDA} PD={10*LAMBDA+k*2*w1}
M11 q q_bar gnd gnd CMOSN W={k*w2} L={2*LAMBDA} AS={k*5*w2*LAMBDA} PS={10*LAMBDA+k*2*w2}  AD={k*5*w2*LAMBDA} PD={10*LAMBDA+k*2*w2}
.ends TSPC_DFF

.subckt load in vdd gnd
M1 dont_care in vdd vdd CMOSP W={w1} L={2*LAMBDA} AS={5*w1*LAMBDA} PS={10*LAMBDA+2*w1} AD={5*w1*LAMBDA} PD={10*LAMBDA+2*w1}
M2 dont_care in gnd gnd CMOSN W={w2} L={2*LAMBDA} AS={5*w2*LAMBDA} PS={10*LAMBDA+2*w2} AD={5*w2*LAMBDA} PD={10*LAMBDA+2*w2}
.ends load 

* Instantiate TSPC D Flip-Flop
X1 A1 q1 clk Vdd gnd TSPC_DFF
*X2 A2 q2 clk Vdd gnd TSPC_DFF

* Measuring delay from D to Q on X1

.measure tran delay_dff  TRIG v(clk) VAL=0.9 RISE=5 TARG v(q1) VAL=0.9 RISE=1

.tran 1ps 100ns
.control
run
set color0 = white
set curplottitle=Satvik_shrivastava_2024102029
plot v(q1) 2+v(A1) 4+v(clk)
.endc