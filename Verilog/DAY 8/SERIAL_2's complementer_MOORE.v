module top_module (
    input clk,
    input areset,  // Active-high asynchronous reset
    input x,
    output reg z
); 
    reg [1:0] state, nxt_state;
    reg z_next;  // Delayed output register

    parameter s0 = 2'b00, s1 = 2'b01;

    // State transition logic (sequential logic)
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= s0;
        else
            state <= nxt_state;
    end

    // Next state logic (combinational logic)
    always @(*) begin
        case (state)
            s0: begin
                if (x) begin
                    nxt_state = s1;
                    z_next = 1;end
                else begin
                    nxt_state = s0;
                    z_next = 0;end
            end
            s1: begin
                nxt_state = s1;
                if(x)
                z_next = 0;
                else z_next = 1;
            end
            default: begin nxt_state = s0;z_next = 0;end
        endcase
    end
