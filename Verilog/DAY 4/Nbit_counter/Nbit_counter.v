module nbit_counter(
    input [WIDTH-1:0]d,
    input  clk,
    input  reset,
    output reg [WIDTH-1:0]q
    
);
parameter WIDTH=4;

    always @(posedge clk or negedge reset) begin
        if (!reset)
            q <= 0;
            
        else 
		q<=q+1;
		end 
		
endmodule
