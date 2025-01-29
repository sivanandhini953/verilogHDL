module n_modcountertb;

reg reset;
reg clk;
wire [$clog2(N)-1:0]q;
parameter N=15;

n_modcounter uut(

.reset(reset),
.clk(clk),
.q(q)


);

always #5 clk=~clk;
 
 initial begin
 $dumpfile("d_latch.vcd");
 $dumpvars();
 
 reset=1;clk=0;
 
 #5  reset=0;
 
 
 #200 $finish;
 end
 initial begin
 $monitor($time , "q=%b",q);
 end
 endmodule
