module moore_1101 (
    input clk,
    input reset,
    input seq_in,
    output reg seq_out,
    output reg  [2:0]crnt_state ,
	output  reg [2:0]nxt_state
	
);

parameter 
	IDLE = 3'b000,
    S1   = 3'b001,
    S11  = 3'b010,
    S110 = 3'b011,
	S1101= 3'b100;



always @(posedge clk or posedge reset) begin  
    if (reset)
        crnt_state <= IDLE;
    else 
        crnt_state <= nxt_state;
end


always @(*) begin
    case (crnt_state)
		IDLE:begin 
				seq_out <= 0; 
		if (seq_in) nxt_state = S1;
              else nxt_state = IDLE;
			  end
        S1:  begin 
				seq_out <= 0;
		if (seq_in) nxt_state = S11;
              else nxt_state = IDLE;
end
        S11:  begin 
				seq_out <= 0;
		if (seq_in) nxt_state = S11;
              else nxt_state = S110;
end
        S110: begin 
				seq_out <= 0;
		if (seq_in) nxt_state = S1101;
              else nxt_state = IDLE;
	end		  
	    S1101:begin 
				seq_out <= 1; 
		if (seq_in) nxt_state = S1;
              else nxt_state = IDLE;
end
        default: nxt_state = IDLE;  
    endcase
end


endmodule
