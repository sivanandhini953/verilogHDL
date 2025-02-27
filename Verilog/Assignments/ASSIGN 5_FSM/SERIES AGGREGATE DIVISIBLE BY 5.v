module fsm(
	input x,
    input clk,
    input reset,
    output  y
);
reg [2:0] state, next;

parameter  S0   = 3'b000,
           S1   = 3'b001,
           S2 = 3'b010,
		   S3 = 3'b011,
		   S4 = 3'b100;
		  
		   
		
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
  
			
        else
           
state <= next;

    end

    always @(*) begin
	case(state)
	
	S0:
	
	if(x)
	next=S1;
	else 
	next=S4;
	
	S1:
	
	if(x)
	next=S2;
	else 
	next=S3;
	
	
	S2:
	next=S3;
	
	
	
	S3:if(x)
	next=S4;
	else 
	next=S2;
	
	
	S4: 
	
	if(x)
	next=S1;
	else 
	next=S4;
	
	
	

	
	endcase
end
assign y=(state==3'b100)?1:0;	
	
	
	
endmodule
    
    
