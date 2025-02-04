module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    reg [1:0]state,nxt_state;

    parameter A=2'b00,
    B=2'b01,
    C=2'b10,D=2'b11;
    
    always @(posedge clk or posedge areset)begin
        if (areset)
            state <= A;
    else 
        state <=nxt_state;
    end
    
    always @ (*)begin
        case(state)
            A:if(in)
              nxt_state <= B;
            else
                nxt_state <= A;
            B:if(in)
                nxt_state <= B;
            else
                nxt_state <= C;
            C:if(in)
                nxt_state <= D;
            else
                nxt_state <= A;
            D:if(in)
                nxt_state <= B;
            else
                nxt_state <= C;
   default:nxt_state <= A;
        endcase
    end
    assign out=(state==D)?1:0;

  

endmodule
