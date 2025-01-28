module T_ff(
    input t,
    input  clk,
    input  reset,
    output reg q,
    output qn
);
    always @(posedge clk or negedge reset) begin
        if (!reset)
            q <= 0;
            
        else 
		q<=t?(~q):q;
		end 
		assign qn=~q;
endmodule
