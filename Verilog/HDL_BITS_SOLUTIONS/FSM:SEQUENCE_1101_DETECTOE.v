module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    reg [2:0]state,next;
    parameter A=0,
    B=1,
    C=2,
    D=3,
    E=4;
    
    always @(posedge clk)
        if (reset)
		state <= 0;
    else state <=next;
    
    always @(*)begin
        case (state)
            A:next = data?B:A;
            B:next = data?C:A;
            C:next = data?C:D;
            D:next = data?E:A;
            E:next = E;
            
            
          default next = A;
            
        endcase
    end
    assign start_shifting=(state==E)?1:0; 

endmodule
