module cla_5bit (
    input clk,
    input da1, da2, da3, da4, da5,
    input db1, db2, db3, db4, db5,
    output s1, s2, s3, s4, s5,
    output c5
);

    wire a1, a2, a3, a4, a5;
    wire b1, b2, b3, b4, b5;
    wire unused_qb;

    dff reg_a1 (. d(da1), .clk(clk), .q(a1), .q_b(unused_qb));
    dff reg_a2 (.d(da2), .clk(clk), .q(a2), . q_b(unused_qb));
    dff reg_a3 (.d(da3), .clk(clk), . q(a3), .q_b(unused_qb));
    dff reg_a4 (.d(da4), .clk(clk), .q(a4), .q_b(unused_qb));
    dff reg_a5 (. d(da5), .clk(clk), .q(a5), .q_b(unused_qb));

    dff reg_b1 (.d(db1), .clk(clk), .q(b1), . q_b(unused_qb));
    dff reg_b2 (.d(db2), .clk(clk), . q(b2), .q_b(unused_qb));
    dff reg_b3 (.d(db3), .clk(clk), .q(b3), .q_b(unused_qb));
    dff reg_b4 (. d(db4), .clk(clk), .q(b4), .q_b(unused_qb));
    dff reg_b5 (.d(db5), .clk(clk), .q(b5), . q_b(unused_qb));

    wire p1, p2, p3, p4, p5;
    wire g1, g2, g3, g4, g5;

    assign p1 = a1 ^ b1;
    assign p2 = a2 ^ b2;
    assign p3 = a3 ^ b3;
    assign p4 = a4 ^ b4;
    assign p5 = a5 ^ b5;

    assign g1 = a1 & b1;
    assign g2 = a2 & b2;
    assign g3 = a3 & b3;
    assign g4 = a4 & b4;
    assign g5 = a5 & b5;

    wire c0, c1, c2, c3, c4, cc5;

    assign c0 = 1'b0;
    assign c1 = g1;
    assign c2 = g2 | (p2 & g1);
    assign c3 = g3 | (p3 & g2) | (p3 & p2 & g1);
    assign c4 = g4 | (p4 & g3) | (p4 & p3 & g2) | (p4 & p3 & p2 & g1);
    assign cc5 = g5 | (p5 & g4) | (p5 & p4 & g3) | (p5 & p4 & p3 & g2) | (p5 & p4 & p3 & p2 & g1);

    wire ss1, ss2, ss3, ss4, ss5;

    assign ss1 = p1 ^ c0;
    assign ss2 = p2 ^ c1;
    assign ss3 = p3 ^ c2;
    assign ss4 = p4 ^ c3;
    assign ss5 = p5 ^ c4;

    dff reg_s1 (. d(ss1), .clk(clk), .q(s1), .q_b(unused_qb));
    dff reg_s2 (.d(ss2), .clk(clk), .q(s2), . q_b(unused_qb));
    dff reg_s3 (.d(ss3), .clk(clk), . q(s3), .q_b(unused_qb));
    dff reg_s4 (.d(ss4), .clk(clk), .q(s4), .q_b(unused_qb));
    dff reg_s5 (. d(ss5), .clk(clk), .q(s5), .q_b(unused_qb));

    dff reg_c5 (.d(cc5), .clk(clk), .q(c5), . q_b(unused_qb));

endmodule