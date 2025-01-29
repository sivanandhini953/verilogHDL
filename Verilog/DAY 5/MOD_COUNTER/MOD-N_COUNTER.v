module n_modcounter (
input reset,
input clk,
output reg [$clog2(N)-1:0]q
);
parameter N=15;
always @(posedge clk or posedge reset)begin
if (reset)

q <= 0;
else if (q==N-1)
q <= 0;
else 
q <= q+1;
end

endmodule



