module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter IDLE = 4'd0, START = 4'd1,DATA=4'd2, STOP = 4'd3, WAIT = 4'd4;
    reg [3:0] state,next;
    reg [3:0]count;
    
    always @(posedge clk) begin
        if(reset)begin
            state <= IDLE;
            count<=0;end
        else 
            state <= next;
        if(state == DATA)
            count<=count+1;
        else count<=0;
        
    end
    
    always @(*) begin
        case(state)
            IDLE: next <= in? IDLE:START;
            START: next <= DATA;
            DATA:if(count<4'd7)
                next=DATA;
            else if (in)
					next=STOP;
            else next=WAIT;
                
            
            
            STOP:  next <= in? IDLE:START;
            WAIT: next <= in? IDLE:WAIT;
        endcase
    end
    
    assign done = (state == STOP);

endmodule
