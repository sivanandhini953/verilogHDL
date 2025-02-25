module tr_light (
    input clk,
    input reset
);
    reg [1:0] state, next_state;
    reg [3:0] count;

    parameter RED = 2'b00, YELLOW = 2'b01, GREEN = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= RED;
            count <= 0;
        end else begin
            state <= next_state;
            count <= count + 1;
        end
    end

    always @(*) begin
        case (state)
            RED: begin
                if (count < 7) begin
                    next_state = RED;
                end else begin
                    next_state = YELLOW;
                    count = 0;
                end
            end
            YELLOW: begin
                if (count < 3) begin
                    next_state = YELLOW;
                end else begin
                    next_state = GREEN;
                    count = 0;
                end
            end
            GREEN: begin
                if (count < 15) begin
                    next_state = GREEN;
                end else begin
                    next_state = RED;
                    count = 0;
                end
            end
            default: next_state = RED;
        endcase
    end
endmodule
