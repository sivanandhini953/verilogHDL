module nbit_counter(rst_n, clk, q);
input rst_n;
input clk;
output reg [WIDTH-1:0]q;
parameter WIDTH=6;
	always @(posedge clk) begin
		if (!rst_n)
			q<=6'b000000;
				else
					q<=q+1;
					
end
endmodule
