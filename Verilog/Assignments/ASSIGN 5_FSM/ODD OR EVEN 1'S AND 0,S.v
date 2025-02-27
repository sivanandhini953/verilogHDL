module clk_101_010(
	input x,
    input clk,
    input reset,
    output reg even1,
	output reg even0
);
reg [1:0] state, next;

parameter  S0   = 2'b00,
           S1   = 2'b01,
           S2 = 2'b10;
		
    
    always @(posedge clk or posedge reset) begin
        if (reset)begin
            state <= S0;
even0 <= 0;
even1 <= 0;  
 end			
        else
           
state <= next;

    end

    always @(*) begin
	case(state)
	
	S0:
	
	if(x)
	next=S1;
	else 
	next=S2;
	
	S1:begin 
	even1=~even1;
	if(x)
	next=S1;
	else 
	next=S2;
	end
	
	S2:begin
	even0 = ~even0;
	if(x)
	next=S1;
	else 
	next=S2;
	
	end
	
	endcase
end
//assign y=(state==3'b011||state==3'b110)?1:0;	
	
	
	
endmodule
    
    
