module dff (
    input d,
    input clk,
    output reg q,
    output q_b
);

    assign q_b = ~q;

    always @(posedge clk) begin
        q <= d;
    end

endmodule