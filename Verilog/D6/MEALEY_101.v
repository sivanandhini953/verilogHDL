module mealey_101 (
    input clk,
    input reset,
    input seq_in,
    output seq_out,
    output reg  [1:0]crnt_state 
);

parameter 
    S1   = 2'b00,
    S10  = 2'b01,
    S101 = 2'b10;

reg [1:0] nxt_state;


always @(posedge clk or posedge reset) begin  
    if (reset)
        crnt_state <= S1;
    else 
        crnt_state <= nxt_state;
end


always @(*) begin
    case (crnt_state)
        S1:   if (seq_in) nxt_state = S10;
              else nxt_state = S1;

        S10:  if (seq_in) nxt_state = S1;
              else nxt_state = S101;

        S101: if (seq_in) nxt_state = S10;
              else nxt_state = S1;

        default: nxt_state = S1;  
    endcase
end


//always @(posedge clk or posedge reset) begin
   //// if (reset)
      //  seq_out <= 0;
  //  else
       assign seq_out = (crnt_state == S101)?1:0; 
//end

endmodule
