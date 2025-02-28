module digital_stopwatch_tb;
reg clk;
reg reset;
reg stop;
reg start;
wire [10:0] sec_count;
   wire [10:0] msec_count;



digital_stopwatch uut(
.clk(clk),
.reset(reset),
.stop(stop),
.start(start),
.sec_count(sec_count),
.msec_count(msec_count)

);

   always #5 clk = ~clk;
	initial begin
$dumpfile ("fsm1.vcd");
$dumpvars;
end

initial begin

clk=0;reset=1;

#10 reset=0; start=1;

stop=0;

//#5000 stop=1;
//#10 $finish;

end 

endmodule

