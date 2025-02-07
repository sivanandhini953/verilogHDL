module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    
         parameter LEFT=3'b000, 
    RIGHT=3'b001,
    L_FALL=3'b010,
    R_FALL=3'b011,
    L_DIG=3'b100,
    R_DIG=3'b101;
    
    reg [2:0]state, next_state;

    always @(*) begin
        if (bump_left&&bump_right) 
            next_state=(state==LEFT)?RIGHT:LEFT;
            
        case(state)
            LEFT:
                if(!ground)
                next_state=L_FALL;
            else if(dig)
            	next_state=L_DIG;
           else  if(bump_left)
                next_state=RIGHT;
            else 
        		 next_state=LEFT;
            
            
            RIGHT:
                 if (!ground)
                next_state=R_FALL;
            else if(dig)
            	next_state=R_DIG;
              else  if(bump_right)
                next_state=LEFT;
            else 
        		 next_state=RIGHT;
            
            
            L_FALL:if(ground) 
                 next_state=LEFT;
           
            
            R_FALL:if(ground)
                next_state=RIGHT;
            
            L_DIG: if (ground)
                next_state=L_DIG;
            else
                next_state=L_FALL;
            R_DIG:if(ground)
                next_state=R_DIG;
            else
                 next_state=R_FALL;
                
                
            
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
    assign digging=((state==L_DIG)||(state==R_DIG))?1:0;

endmodule
