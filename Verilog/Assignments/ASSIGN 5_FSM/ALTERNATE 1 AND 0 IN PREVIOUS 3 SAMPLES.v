module clk_101_010(
	input x,
    input clk,
    input reset,
    output y
);
reg [2:0] state, next;

parameter  S0   = 3'b000,
           S1   = 3'b001,
           S2  = 3'b010,
           S3 = 3'b011,
           S4  = 3'b100,
           S5 = 3'b101,
		   S6=3'b110;
		
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0; 
        else
           
state <= next;

    end

    always @(*) begin
	case(state)
	
	S0:if(x)
	next=S1;
	else 
	next=S4;
	
	S1:if(x)
	next=S1;
	else 
	next=S2;
	
	S2:if(x)
	next=S3;
	else 
	next=S4;
	
	S3:if(x)
	next=S1;
	else 
	next=S6;
	
	S4:if(x)
	next=S5;
	else 
	next=S4;
	
	S5:if(x)
	next=S1;
	else 
	next=S6;
	
	S6:if(x)
	next=S3;
	else 
	next=S4;
	
	endcase
end
assign y=(state==3'b011||state==3'b110)?1:0;	
	
	
	
endmodule
    
    
