module nbit_countertb;
reg rst_n;
reg clk;
wire [WIDTH-1:0]q;
parameter WIDTH =6;

nbit_counter uut(
.rst_n(rst_n),
.clk(clk),
.q(q));


initial begin
$dumpfile("counter.vcd");
$dumpvars();

end

always #1 clk=~clk;



initial begin 
$monitor ($time,"the counter o/p is=%d",q);
clk<=0; rst_n<= 0;
  #5   rst_n <= 1;
    
   #5   rst_n <= 0;
  #5   rst_n <= 1;  
#100 $finish;
end
endmodule
