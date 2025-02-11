module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] temp;
    always @(posedge clk )
        if (reset)begin
            out <= 0;
            temp <= in;end
    else begin
        temp <= in;
        out <= (~in) & temp|out;
    end

endmodule
