module tb_decoder3to8;

// Declare variables for the input and output
reg [2:0] in;
wire [7:0] out;

// Instantiate the decoder module
decoder3to8 uut (
    .in(in),
    .out(out)
);

initial begin
    // Initialize input
    in = 3'b000;
    // Wait for some time and then change the input
    #10 in = 3'b001;
    #10 in = 3'b010;
    #10 in = 3'b011;
    #10 in = 3'b100;
    #10 in = 3'b101;
    #10 in = 3'b110;
    #10 in = 3'b111;
    #10 $finish; // End the simulation
end

initial begin
    $monitor("Time: %0t | Input: %b | Output: %b", $time, in, out);
end

endmodule
