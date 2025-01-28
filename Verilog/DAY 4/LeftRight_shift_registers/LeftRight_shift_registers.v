module shift_reg(
    input d,
    input  clk,
    input  reset,
    output reg [WIDTH-1:0]q,
	input left,
	input right
    
);
parameter WIDTH=4;


    always @(posedge clk or negedge reset) begin
        if (!reset)
            q <= 0;
			
			
        else if (left)
		q<={q[WIDTH-2:0],d};
		
		else if (right)
		q<={d,q[WIDTH-1:1]};
		
		end
	
		
endmodule


ALTERNATE:

module shift_reg(
    input d,
    input  clk,
    input  reset,
    output reg [WIDTH-1:0]q,
	input left,
	input right
    
);
parameter WIDTH=4;


    always @(posedge clk or negedge reset) begin
        if (!reset)
            q <= 0;
			
			
        else if (right)begin
		q<=q>>1;
		q[3]<=d;
		end
		else if (left)begin
		q<=q<<1;
		q[0]<=d;
		end
		end
	
		
endmodule
