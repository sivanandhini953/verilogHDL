module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
   // reg [3:0]state,next;
    
   typedef enum logic [3:0] {
    IDLE = 4'd0,
    A    = 4'd1,
    B    = 4'd2,
    C    = 4'd3,
    D    = 4'd4,
    E    = 4'd5,
    F    = 4'd6,
    ERR  = 4'd7,
    DISC = 4'd8,
    FLAG = 4'd9
} state_t;

state_t state, next;
    
    always @(posedge clk)
        if (reset)
            state <= IDLE;
    else state <= next;
    
    always @(*)begin
        case (state)
            IDLE:next=in?A:IDLE;
            A:next=in?B:IDLE;
            B:next=in?C:IDLE;
            C:next=in?D:IDLE;
            D:next=in?E:IDLE;
            E:next=in?F:DISC;
            F:next=in?ERR:FLAG;
            DISC:next=in?A:IDLE;
            FLAG:next=in?A:IDLE;
            ERR:next=in?ERR:IDLE;
           
        endcase
    end
    
    assign disc=(state==DISC)?1:0;
    assign flag=(state==FLAG)?1:0;
    assign err=(state==ERR)?1:0;
            
endmodule
