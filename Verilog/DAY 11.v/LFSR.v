module LFSR(
output reg [3:0]q,
//input [3:0]d,
input clk,
input reset



);

always @(posedge clk)

if(reset)

q <= 4'h1;
else begin
 
// q[3]=d[0]^d[1];
 
q <= {q[0]^q[1],q[3:1]};

end
endmodule
