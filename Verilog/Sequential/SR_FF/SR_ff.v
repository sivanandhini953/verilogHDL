module SR_ff(
    input  S,
    input  R,
    input  clk,
    input  reset,
    output reg q,
    output qn
);
    always @(posedge clk , negedge reset) begin
        if (!reset) begin
            q <= 0;
            //qn <= 1;
        end else begin
            case ({S, R})
                2'b00: ;                  // No change
                2'b01: begin q <= 0; //qn <= 1;
				end  // Reset
                2'b10: begin q <= 1; //qn <= 0;
				end  // Set
                2'b11: begin q <= 1'bx; //qn <= 1'bx;
				end // Invalid state
            endcase
        end
    end
	assign qn=~q;
endmodule
