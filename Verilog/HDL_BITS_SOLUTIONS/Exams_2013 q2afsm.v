module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    reg [1:0]state,next;
    parameter A=0,B=1,C=2,D=3;
    
    always @(posedge clk)
        if(!resetn)
            state <= A;
    else state <= next;
    always @(*)begin
        case(state)
            A: if(r[1])
                next=B;
                
            else if(r[2])
                next=C;
           
            else if (r[3])
                next=D;
            else next=A;
              
            B:next=r[1]?B:A;
            C:next=r[2]?C:A;
            D:next=r[3]?D:A;
            default next=A;
        endcase
            
    end
    assign g[1]=(state==B);
    assign g[2]=(state==C);
    assign g[3]=(state==D);
endmodule
