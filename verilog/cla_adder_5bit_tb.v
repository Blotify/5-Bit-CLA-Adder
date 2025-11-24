module cla_adder_5bit_tb;
    reg clk;
    reg [4:0] a, b;
    wire [4:0] sum;
    wire cout;

    cla_adder_5bit uut (
        .clk(clk),
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        clk = 0;
        forever #50 clk = ~clk;
    end

    initial begin
        $dumpfile("cla_adder_5bit.vcd");
        $dumpvars(0, cla_adder_5bit_tb);

        a = 5'b00000; b = 5'b00000;
        #100;

        a = 5'b00001; b = 5'b00001;
        #100;

        a = 5'b11111; b = 5'b00001;
        #100;

        a = 5'b10101; b = 5'b01010;
        #100;

        a = 5'b00000; b = 5'b11111;
        #100;

        a = 5'b11111; b = 5'b11111;
        #100;

        a = 5'b11111; b = 5'b11101;   
        #100;

        #100;
        $finish;
    end
endmodule
