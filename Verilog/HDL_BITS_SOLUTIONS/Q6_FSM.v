module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    reg [2:0]state,next;
    parameter A=3'b000,
    B=3'b001,
    C=3'b010,
    D=3'b011,
    E=3'b100,
    F=3'b101;
    
    always @(posedge clk)
        if(reset)
            state <= A;
    else state <= next;
    always @(*)begin
        case(state)
            A:if(w)
                next <= A;
            else
				next <= B;
            B:if(w)
                next <= D;
            else
                next <= C;
            C:if(w)
                next <= D;
            else next <= E;
            D:if(w)
                next <= A;
            else next <= F;
            E:if(w)
                next <= D;
            else next <= E;
            F:if(w)
                next <= D;
            else next <= C;
            
        endcase
    end
    assign z=(state==E||state==F)?1:0;
endmodule
