module tr_light_tb;
reg clk;
reg reset;

tr_light uut(
.clk(clk),
.reset(reset)
);

initial begin
$dumpfile("tr_light.vcd");
$dumpvars;

end
always #5 clk=~clk;

initial begin
clk=0;reset=1;

#10 reset=0;

#500 $finish;

end

endmodule







