module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
     parameter LEFT=2'b00, 
    RIGHT=2'b01,
    L_FALL=2'b10,
    R_FALL=2'b11;
    
    reg [1:0]state, next_state;

    always @(*) begin
        if (bump_left&&bump_right) 
            next_state=(state==LEFT)?RIGHT:LEFT;
            
        case(state)
            LEFT:
                if(!ground)
                next_state=L_FALL;
            
              else  if(bump_left)
                next_state=RIGHT;
            else 
        		 next_state=LEFT;
            
            
            RIGHT:
                 if (!ground)
                next_state=R_FALL;
              else  if(bump_right&&ground)
                next_state=LEFT;
            else 
        		 next_state=RIGHT;
            
            
            L_FALL:if(ground) 
                 next_state=LEFT;
           
            
            R_FALL:if(ground)
                next_state=RIGHT;
            default:next_state=LEFT;
            
            endcase
    end
 always @(posedge clk, posedge areset) begin
        if (areset)
            state <= LEFT;
       
        
        else
            state <= next_state;
    end
        
        assign walk_left = (state == LEFT)?1:0;
    assign walk_right = (state == RIGHT)?1:0;
    assign aaah=((state==R_FALL)||(state==L_FALL))?1:0;

endmodule
