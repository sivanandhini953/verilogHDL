module sync_fifo_TB;
  reg clk, rst_n;
  reg w_en, r_en;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire full, empty;
  
  synchronous_fifo s_fifo(clk, rst_n, w_en, r_en, data_in, data_out, full, empty);
  
  always #2 clk = ~clk;
  
  
  
  initial begin
    clk = 0; rst_n = 0;
    w_en = 0; r_en = 0;
	
    #3 rst_n = 1;w_en = 1; r_en = 0;
   data_in=8'h11;
   
   #10 data_in=8'h12;
    #10 data_in=8'h13;
	 #10 data_in=8'h14;
	 
	 
	 
	 
	  
	  #10 r_en = 1;
	  #10 r_en = 0;
	  #10 r_en = 1;
	  #10 r_en = 0;
	  #10 r_en = 1;
	   #10 r_en = 0;
	   #10 r_en = 1;
	  
	   #3 rst_n = 1;w_en = 1; r_en = 1;
   data_in=8'h20;
   
	  
	
    #500 $finish;

  end
 initial begin 
  $dumpfile("dump.vcd"); 
  $dumpvars;
  $monitor($time,"rst_n=%b,w_en=%b,r_en=%b,data_in=%h,data_out=%h",
           rst_n,w_en,r_en,data_in,data_out);
end
endmodule
