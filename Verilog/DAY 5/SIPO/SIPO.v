module SIPO (
input clk,
input reset,
input serial_in,
output [WIDTH-1:0]parallel_out
	);

parameter WIDTH=4;
reg [WIDTH-1:0]q;

always @(posedge clk or posedge reset)begin
if(reset)
q <= 0;

else

q <= {q[WIDTH-2:0],serial_in};

end

assign parallel_out = q[WIDTH-1:0];


endmodule

