module FSM_111_tb;

reg x;
wire y;
reg clk;
reg reset;

FSM_111_overlap uut (
.x(x),
.y(y),
.clk(clk),
.reset(reset)
);


always #5 clk=~clk;

initial begin
$dumpfile ("fsm_111.vcd");
$dumpvars;
end

initial begin

$monitor ($time,,,"x=%b|y=%b",x,y);

clk=0;reset=1;

#10 reset =0;x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=1;
#10 x=0;

#150 $finish ;

end
endmodule
