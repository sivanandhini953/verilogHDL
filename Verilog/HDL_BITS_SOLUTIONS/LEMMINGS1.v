module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

     parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        if (bump_left&&bump_right)
            next_state=(state==LEFT)?RIGHT:LEFT;
        case(state)
            LEFT:if(bump_left)
                next_state=RIGHT;
            else 
        		 next_state=LEFT;
            
            RIGHT:if(bump_right)
                next_state=LEFT;
            else 
        		 next_state=RIGHT;
            endcase
    end

    always @(posedge clk, posedge areset) begin
        if (areset)begin
            state <= LEFT;
       
        end
        else
            state <= next_state;
    end

         
    assign walk_left = (state == LEFT)?1:0;
    assign walk_right = (state == RIGHT)?1:0;

endmodule
