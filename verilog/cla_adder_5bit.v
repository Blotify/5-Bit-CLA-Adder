module cla_adder_5bit (
    input wire clk,
    input wire [4:0] a,
    input wire [4:0] b,
    output wire [4:0] sum,
    output wire cout
);

    wire [4:0] a_reg, b_reg;
    wire [4:0] p, g;
    wire [5:0] c;
    wire [4:0] sum_wire;

    // Register inputs
    dff a_reg0 (.clk(clk), .d(a[0]), .q(a_reg[0]));
    dff a_reg1 (.clk(clk), .d(a[1]), .q(a_reg[1]));
    dff a_reg2 (.clk(clk), .d(a[2]), .q(a_reg[2]));
    dff a_reg3 (.clk(clk), .d(a[3]), .q(a_reg[3]));
    dff a_reg4 (.clk(clk), .d(a[4]), .q(a_reg[4]));

    dff b_reg0 (.clk(clk), .d(b[0]), .q(b_reg[0]));
    dff b_reg1 (.clk(clk), .d(b[1]), .q(b_reg[1]));
    dff b_reg2 (.clk(clk), .d(b[2]), .q(b_reg[2]));
    dff b_reg3 (.clk(clk), .d(b[3]), .q(b_reg[3]));
    dff b_reg4 (.clk(clk), .d(b[4]), .q(b_reg[4]));

    // Propagate
    xor p0_xor(p[0], a_reg[0], b_reg[0]);
    xor p1_xor(p[1], a_reg[1], b_reg[1]);
    xor p2_xor(p[2], a_reg[2], b_reg[2]);
    xor p3_xor(p[3], a_reg[3], b_reg[3]);
    xor p4_xor(p[4], a_reg[4], b_reg[4]);

    // Generate
    and g0_and(g[0], a_reg[0], b_reg[0]);
    and g1_and(g[1], a_reg[1], b_reg[1]);
    and g2_and(g[2], a_reg[2], b_reg[2]);
    and g3_and(g[3], a_reg[3], b_reg[3]);
    and g4_and(g[4], a_reg[4], b_reg[4]);

    // Carry-in
    assign c[0] = 1'b0;

    // C1 = g0 + p0*c0
    wire c1_and;
    and c1_and_gate(c1_and, p[0], c[0]);
    or  c1_or_gate(c[1], g[0], c1_and);

    // C2 = g1 + p1*g0 + p1*p0*c0
    wire c2_and1, c2_and2, c2_or1;
    and c2_and_gate1(c2_and1, p[1], g[0]);
    and c2_and_gate2(c2_and2, p[1], p[0], c[0]);
    or  c2_or_gate1(c2_or1, g[1], c2_and1);
    or  c2_or_gate2(c[2], c2_or1, c2_and2);

    // C3 = g2 + p2*g1 + p2*p1*g0 + p2*p1*p0*c0
    wire c3_and1, c3_and2, c3_and3, c3_or1, c3_or2;
    and c3_and_gate1(c3_and1, p[2], g[1]);
    and c3_and_gate2(c3_and2, p[2], p[1], g[0]);
    and c3_and_gate3(c3_and3, p[2], p[1], p[0], c[0]);
    or  c3_or_gate1(c3_or1, g[2], c3_and1);
    or  c3_or_gate2(c3_or2, c3_or1, c3_and2);
    or  c3_or_gate3(c[3], c3_or2, c3_and3);

    // C4 = g3 + p3*g2 + p3*p2*g1 + p3*p2*p1*g0 + p3*p2*p1*p0*c0
    wire c4_and1, c4_and2, c4_and3, c4_and4, c4_or1, c4_or2, c4_or3;
    and c4_and_gate1(c4_and1, p[3], g[2]);
    and c4_and_gate2(c4_and2, p[3], p[2], g[1]);
    and c4_and_gate3(c4_and3, p[3], p[2], p[1], g[0]);
    and c4_and_gate4(c4_and4, p[3], p[2], p[1], p[0], c[0]);
    or  c4_or_gate1(c4_or1, g[3], c4_and1);
    or  c4_or_gate2(c4_or2, c4_or1, c4_and2);
    or  c4_or_gate3(c4_or3, c4_or2, c4_and3);
    or  c4_or_gate4(c[4], c4_or3, c4_and4);

    // C5 = g4 + p4*g3 + p4*p3*g2 + p4*p3*p2*g1 + p4*p3*p2*p1*g0 + p4*p3*p2*p1*p0*c0
    wire c5_and1, c5_and2, c5_and3, c5_and4, c5_and5, c5_or1, c5_or2, c5_or3, c5_or4;
    and c5_and_gate1(c5_and1, p[4], g[3]);
    and c5_and_gate2(c5_and2, p[4], p[3], g[2]);
    and c5_and_gate3(c5_and3, p[4], p[3], p[2], g[1]);
    and c5_and_gate4(c5_and4, p[4], p[3], p[2], p[1], g[0]);
    and c5_and_gate5(c5_and5, p[4], p[3], p[2], p[1], p[0], c[0]);
    or  c5_or_gate1(c5_or1, g[4], c5_and1);
    or  c5_or_gate2(c5_or2, c5_or1, c5_and2);
    or  c5_or_gate3(c5_or3, c5_or2, c5_and3);
    or  c5_or_gate4(c5_or4, c5_or3, c5_and4);
    or  c5_or_gate5(c[5], c5_or4, c5_and5);

    // Sum bits
    xor sum0_xor(sum_wire[0], p[0], c[0]);
    xor sum1_xor(sum_wire[1], p[1], c[1]);
    xor sum2_xor(sum_wire[2], p[2], c[2]);
    xor sum3_xor(sum_wire[3], p[3], c[3]);
    xor sum4_xor(sum_wire[4], p[4], c[4]);

    // Register outputs
    dff sum_reg0 (.clk(clk), .d(sum_wire[0]), .q(sum[0]));
    dff sum_reg1 (.clk(clk), .d(sum_wire[1]), .q(sum[1]));
    dff sum_reg2 (.clk(clk), .d(sum_wire[2]), .q(sum[2]));
    dff sum_reg3 (.clk(clk), .d(sum_wire[3]), .q(sum[3]));
    dff sum_reg4 (.clk(clk), .d(sum_wire[4]), .q(sum[4]));
    dff cout_reg  (.clk(clk), .d(c[5]),     .q(cout));

endmodule
