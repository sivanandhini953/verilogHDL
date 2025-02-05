Build a decade counter that counts from 0 through 9, inclusive, with a period of 10. 
The reset input is synchronous, and should reset the counter to 0. We want to be able to pause the counter rather than always incrementing every clock cycle, 
  so the slowena input indicates when the counter should increment.


  module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
   
   
    always @(posedge clk)begin
        if (reset)
            q <= 0;
        else if(slowena)begin
            if(q<9)
        q <=q+1;
        else if (q==4'h9)
           
            q<=0;
        end
        else
            q <= q;
    end
endmodule
