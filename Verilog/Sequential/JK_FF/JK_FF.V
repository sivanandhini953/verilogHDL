module JK_ff(
    input J,
    input  K,
    input  clk,
    input  reset,
    output reg q,
    output qn
);
    always @(posedge clk , negedge reset) begin
        if (!reset)
            q <= 0;
            
        else begin
            case ({J, K})
                2'b00: q <= q;  //hold               
               
                2'b01: q <= 0; //reset
				
                2'b10: q <= 1; //set
				
				2'b11: q <= ~q; //toggle
								
            endcase
        end
    end
	assign qn=~q;
endmodule
