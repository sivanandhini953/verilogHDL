module shift_reg(
input in,
input clk,
input reset,
output reg [2:0]q,
output  out
);
always @(posedge clk or posedge reset)begin
if (reset)
q <= 0;
else 
begin
q[2] <= in;
q[1] <= q[2];
q[0] <= q[1];


end
end
assign out = q[0];
endmodule


TEST BENCH:

module shift_regtb;
reg in;
reg clk;
reg reset;
wire [2:0]q;
wire  out;

shift_reg uut(
.in(in),
.clk(clk),
.reset(reset),
.q(q),
.out(out)
);


always #5 clk=~clk;

initial begin
$dumpfile("shift.vcd");
$dumpvars();

reset=1;clk=0;

#10 reset=0 ; in=1;
#10 in=1;
#10 in=0;

#100 $finish;
end
initial begin
$monitor ($time ,"in=%b, out=%b",in,out);
end

endmodule
