module decoder #(parameter N = 3) (
    input [N-1:0] in,
    output reg [(2**N)-1:0] out
);

always @(*) begin
    out = 0; // Initialize output to zero
    out[in] = 1; // Set the corresponding bit to 1 based on input
end

endmodule
