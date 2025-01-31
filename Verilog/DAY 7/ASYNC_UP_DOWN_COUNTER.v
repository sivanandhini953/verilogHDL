module async_countertb;
parameter SIZE =4;
  reg clk, rst;
  reg j, k;
  reg mode;
  wire [SIZE-1:0] q, qbar;
  
  async_counter uut(
  .clk(clk),
  .rst(rst),
  .j(j), 
  .k(k), 
  .mode(mode), 
  .q(q), 
  .qbar(qbar)
  );
  
  initial begin
    clk = 0; rst = 1; j=1;k=1;
  
	
    #10 rst = 0; mode=1;
   
   #50  clk = 0; rst = 1; j=1;k=1;
	
	#5 rst=0; mode=0;
	
	
    #200 $finish;
  end
  initial begin
        $monitor($time, " count %d", q);
    end
  always #2 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
