module clk_60dc_tb;


reg clk;
reg reset;
wire clkout;

clk_60dc uut (

.clk(clk),
.reset(reset)
);


always #5 clk=~clk;

initial begin
$dumpfile ("fsm3.vcd");
$dumpvars;
end

initial begin


clk=0;reset=1;

#5 reset =0;

#100 $finish;

end
endmodule
