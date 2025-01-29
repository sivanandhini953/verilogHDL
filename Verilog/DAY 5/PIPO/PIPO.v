module PIPO (
input clk,
input reset,

input [WIDTH-1:0]parallel_in,
output reg [WIDTH-1:0]parallel_out
	);

parameter WIDTH=4;


always @(posedge clk or posedge reset)begin
if(reset)
parallel_out <= 0;

else 

parallel_out<= parallel_in;

end

endmodule

