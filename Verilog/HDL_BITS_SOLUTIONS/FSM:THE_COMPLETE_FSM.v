module top_module (
    input clk,
    input reset,     
    input data,
    output reg shift_ena,
    output reg counting,
    input done_counting,
    output reg done,
    input ack 
);
    
    reg [3:0] state, next;  
    parameter A=0, B=1, C=2, D=3, B0=4, B1=5, B2=6, B3=7, COUNT=8, WAIT=9;
    
    
    always @(posedge clk) begin
        if (reset) begin
            state <= A;
            
        end else begin
            state <= next;
        end
    end
    
    
    always @(*) begin
      
        next = state;
        shift_ena = 0;   
        counting = 0;
        done = 0;

        case (state)
            A: next = data ? B : A;
            B: next = data ? C : A;
            C: next = data ? C : D;
            D: next = data ? B0 : A;
            B0: begin next = B1; shift_ena = 1; end
            B1: begin next = B2; shift_ena = 1; end
            B2: begin next = B3; shift_ena = 1; end
            B3: begin next = COUNT; shift_ena = 1; end
            COUNT: begin counting = 1;
            
                    next =(done_counting)? WAIT:COUNT;
            end
                
            WAIT: begin
                counting = 0;
                done = 1;
                 next =ack? A:WAIT; 
            end
        endcase
    end

endmodule
