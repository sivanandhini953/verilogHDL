module tb;
reg clk_10Hz;  // Input clock (1000Hz)
reg rst;         // Reset signal
wire clk_1Hz ;

freq_divider uut(.clk_10Hz(clk_10Hz),
				.rst(rst),
				.clk_1Hz(clk_1Hz)
);

	initial begin
$dumpfile("hertz.vcd");
$dumpvars();
end

always #5 clk_10Hz=~clk_10Hz;

initial begin 
rst=1;clk_10Hz=0;
#10 rst=0;

#6000 $finish;
end

endmodule
