module ring_counter(
input clk ,
input rst,

output reg [3:0]q
);


always @(posedge clk or posedge rst )begin

if (rst)
q <= 4'b0001;

else begin

q[3] <= q[0];
q[2] <= q[3];
q[1] <= q[2];
q[0] <= q[1];


end
end
endmodule



q <= {q[0],q[3:1]};   use this in else 
