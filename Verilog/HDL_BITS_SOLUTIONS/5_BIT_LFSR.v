module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
  
); 
     wire w1;
    always @(posedge clk)begin
        if(reset)
            q <= 5'h1;
    else begin
        w1=q[3]^q[0];
        q <={q[0],q[4],w1,q[2],q[1]};
        
    end 
   
        
    end  

endmodule
