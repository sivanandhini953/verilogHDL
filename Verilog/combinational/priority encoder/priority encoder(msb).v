// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos
);
    always @(*) begin
        casez (in)
            4'b1???: pos = 2'd3; // MSB is 1
            4'b01??: pos = 2'd2; // Second MSB is 1
            4'b001?: pos = 2'd1; // Third MSB is 1
            4'b0001: pos = 2'd0; // LSB is 1
            default: pos = 2'd0; // No bits are set
        endcase
    end
endmodule

