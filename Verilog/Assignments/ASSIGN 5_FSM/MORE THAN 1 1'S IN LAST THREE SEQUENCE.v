module fsm(
    input clk,        
    input reset,       
    input x,           
    output reg y       
);

    reg [1:0] state, next_state;  

    
    parameter S0 = 2'b00,  
              S1 = 2'b01,  
              S2 = 2'b10,  
              S3 = 2'b11;  

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0; 
        else
            state <= next_state;
    end

    
    always @(*) begin
        case (state)
            S0: next_state = (x) ? S1 : S0; 
            S1: next_state = (x) ? S2 : S0; 
            S2: next_state = (x) ? S3 : S1; 
            S3: next_state = (x) ? S3 : S1; 
            default: next_state = S0;  
        endcase
    end

    
    always @(*) begin
        case (state)
            S0, S1: y = 0; // Less than 2 ones
            S2, S3: y = 1; // More than 1 one
            default: y = 0;
        endcase
    end

endmodule
