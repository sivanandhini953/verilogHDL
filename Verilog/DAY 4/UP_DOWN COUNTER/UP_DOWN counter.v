module nbit_counter(
    input [WIDTH-1:0]d,
    input  clk,
    input  reset,
    output reg [WIDTH-1:0]q,
	input up,
	input down
    
);
parameter WIDTH=4;

    always @(posedge clk or negedge reset) begin
        if (!reset)begin
            q <= 0;
            end
        else if (up)
		q<=q+1;
		else if (down)
		q<=q-1;
		end 
		
endmodule
