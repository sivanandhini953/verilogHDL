module ring_countertb;
reg clk ;
reg rst;

wire [3:0]q;

Jhonson_counter uut(
.clk(clk),
.rst(rst),

.q(q)

);


always #5 clk = ~clk;


initial begin

clk =0 ; rst=1;

#2 rst=0;
#100 $finish;
end

initial begin 
$monitor ($time ,"the count is %b",q);
end
endmodule
