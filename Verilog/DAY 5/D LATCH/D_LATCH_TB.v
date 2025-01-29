module d_latchtb;
reg d;
reg reset;
reg en;
wire q;
wire qbar;

d_latch uut(
.d(d),
.reset(reset),
.en(en),
.q(q),
.qbar(qbar)

);


 
 initial begin
 $dumpfile("d_latch.vcd");
 $dumpvars();
 
 reset=1;d=0;en=0;
 
 #5  reset=0;en=1; d=1;
 #5 en=0;d=0;
 #5 en=1; d=0;
 #5 en=0;d=1;
 
 #50 $finish;
 end
 initial begin
 $monitor($time , "d=%b, q=%b , qbar=%b",d,q,qbar);
 end
 endmodule
