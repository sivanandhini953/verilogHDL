module PISO (
input clk,
input reset,
input load,
input [WIDTH-1:0]parallel_in,
output reg serial_out
	);

parameter WIDTH=4;
reg [WIDTH:0]q;

always @(posedge clk or posedge reset)begin
if(reset)
q <= 0;

else if (load) begin

q<= parallel_in;
end else begin 

serial_out <= q[WIDTH-1];
q <= q<<1;
end
end


endmodule
