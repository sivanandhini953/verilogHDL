module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
  //  assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && 
// q[3:0] == 4'd9, q[3:0] == 4'd9}; 
    count4 inst1_count4(.clk(clk),.reset(reset),.ena(1), .q(q[3:0])); 
    count4 inst2_count4(.clk(clk),.reset(reset),.ena(ena[1]),.q(q[7:4])); 
    count4 inst3_count4(.clk(clk),.reset(reset),.ena(ena[2]),.q(q[11:8])); 
    count4 inst4_count4(.clk(clk),.reset(reset),.ena(ena[3]),.q(q[15:12]));    
endmodule 
module count4 ( 
    input clk, 
    input reset, 
    input ena, 
    output reg[3:0] q); 
    always @(posedge clk) begin 
        if(reset) q <= 4'd0; 
        else begin 
            if(ena) begin 
          if(q == 4'd9)begin 
		  q <= 4'd0; en<=1;end
          else begin q <= q + 1; ena<=0;end
            end 
        end 
    end 

endmodule
