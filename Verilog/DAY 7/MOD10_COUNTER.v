module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
   
    always @(posedge clk)begin
        if (reset)
            q <= 0;
        else if(q<9)
        q <=q+1;
        else if (q==4'h9)
           
        q<=0;
    end
endmodule
