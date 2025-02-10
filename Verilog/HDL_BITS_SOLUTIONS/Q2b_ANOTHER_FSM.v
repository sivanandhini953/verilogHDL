module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    
    reg [3:0]state ,next;
    parameter  A=4'd0,
    B=4'd1,
    s0=4'd2,
    s1=4'd3,
    s10=4'd4,
    s101=4'd5,
    choose=4'd6,
    one_always=4'd7,
    zero_always=4'd8;
    
    always @(posedge clk)begin
        if(!resetn)
            state <= A;
    		
    
    else if (clk)
        state <= next;
  
    end
    always @(*)begin
        case(state)
            A:begin
                next = B;
                f=0;
                g=0;
            end
              
           B:begin
                next = s0;
                f=1;
                g=0;
            end
    		s0:begin
                next = x?s1:s0;
                f=0;
                g=0;
            end
            s1:begin
                next = x?s1:s10;
                f=0;
                g=0;
            end
            s10:begin
                next = x?s101:s0;
                f=0;
                g=0;
            end
            s101:begin
                next = y?one_always:choose;
                f=0;
                g=1;
            end
            choose:begin
                next =y?one_always:zero_always;
                f=0;
                g=1;
            end
            
            one_always:begin
                
                 next = one_always;
                f=0;
                    g=1;end
                
            
           
            zero_always:
                
               begin
               
                 next = zero_always;
                f=0;
                    g=0;end
                
            
            

        endcase
    end

endmodule
