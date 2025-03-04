module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    reg [2:0]state,next;
    reg [1:0]count;
    parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;
    
    always @(posedge clk)
        
        if(reset)
            
            state <= A;
    else 
        state <= next;
    
    always @(*)begin
        case(state)
            
           A: next = s ? B : A;
        B: next = C;
        C: next = D;
        D: next = B;
        default: next = A;
            
            
        endcase
    end
               
    always @(posedge clk)
        
        if (reset) count <= 0;
    else case (state)
        B: count <= w;
        C, D: count <= count + w;
        default: count <= 0;
    endcase
    
    assign z=((state==B)&&(count==2'b10))?1:0;
    
    
    
endmodule
