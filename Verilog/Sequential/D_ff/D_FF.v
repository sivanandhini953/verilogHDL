module D_ff(
    input D,
    input  clk,
    input  reset,
    output reg q,
    output qn
);
    always @(posedge clk or negedge reset) begin
        if (!reset)
            q <= 0;
            
        else 
		q<=D;
		end 
		assign qn=~q;
endmodule
