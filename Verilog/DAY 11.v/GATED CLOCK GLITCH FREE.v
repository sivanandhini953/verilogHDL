module clock_gating (
    input  clk,
	input reset,
	input enable,
	
    output reg gated_clk     
);
reg latch_ena;
   always @(negedge clk or posedge reset)
   if (reset)
   latch_ena <= 0;
   
   else 
   latch_ena <= enable;
   
   always @(posedge clk or posedge reset)
   if(reset)
   gated_clk <= 0;
   
   else 
   
   gated_clk <= clk& latch_ena;
   
  
   
   
   
   

endmodule
