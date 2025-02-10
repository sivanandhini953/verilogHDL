module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    reg [2:0]state ,next;
    
    parameter A=3'b000,
    B=3'b001,
    C=3'b010,
    D=3'b011,
    E=3'b100;
    
    always @(posedge clk)begin
        if(reset)
            state <= A;
    else state <= next;
    
    end
    
    always @(*)begin
        case (state)
            A:
                if(x)
                next = B;
            else 
                next = A;
            
            B:if(x)
                next= E;
            else 
                next = B;
            
             C:if(x)
                next= B;
            else 
                next = C;
             D:if(x)
                next = C;
            else 
                next = B;
             E:if(x)
                next = E;
            else 
                next = D;
        endcase
    end
    assign z=(state==D||state==E)?1:0;
            
endmodule
