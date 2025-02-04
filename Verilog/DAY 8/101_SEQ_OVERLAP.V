module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    reg [1:0]state,nxt_state;
    
    parameter s0=2'b00,
    s1=2'b01,
    s2=2'b10;
    
    always @(posedge clk or negedge aresetn)begin
        if (!aresetn)
            state <= s0;
    else
        state <= nxt_state;
    end
    
    always @ (*)begin
        case (state)
            2'b00:if (x)
                nxt_state =s1;
            else 
          nxt_state =s0;
          2'b01:  if(x)
                  nxt_state =s1;
            else
                nxt_state =s2;
            2'b10:if (x)
                nxt_state =s1;
            else
                nxt_state =s0;
            default : nxt_state =s0;
        endcase
          z=(state==s2&&nxt_state==s1)?1:0;
    end
   
    
endmodule
