module fsm_tb;

reg x;
wire y;
reg clk;
reg reset;

fsm uut (
.x(x),
.y(y),
.clk(clk),
.reset(reset)
);


always #5 clk=~clk;

initial begin
$dumpfile ("fsm3.vcd");
$dumpvars;
end

initial begin

$monitor ($time,,,"x=%b|y=%b",x,y);

clk=0;reset=1;

#5 reset =0;x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=0;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;

#100 $finish ;

end
endmodule
