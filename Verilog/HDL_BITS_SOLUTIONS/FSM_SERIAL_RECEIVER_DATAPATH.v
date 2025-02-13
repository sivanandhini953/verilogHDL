module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial

    // New: Datapath to latch input bits.
    parameter IDLE = 4'd0, START = 4'd1, S1 = 4'd2, S2 = 4'd3, S3 = 4'd4, S4 = 4'd5;
    parameter S5 = 4'd6, S6 = 4'd7, S7 = 4'd8, S8 = 4'd9, STOP = 4'd10, WAIT = 4'd11;
    reg [3:0] state,next_state;
    reg [7:0] out_reg;
    
    always @(posedge clk) begin
        if(reset)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    always @(*) begin
        case(state)
            IDLE: next_state <= in? IDLE:START;
            START: next_state <= S1;
            S1: next_state <= S2;
            S2: next_state <= S3;
            S3: next_state <= S4;
            S4: next_state <= S5;
            S5: next_state <= S6;
            S6: next_state <= S7;
            S7: next_state <= S8;
            S8: next_state <= in? STOP:WAIT;
            STOP: next_state <= in? IDLE:START;
            WAIT: next_state <= in? IDLE:WAIT;
        endcase
    end
    
    always @(posedge clk) begin
        case(next_state)
            S1: out_reg[0] <= in;
            S2: out_reg[1] <= in;
            S3: out_reg[2] <= in;
            S4: out_reg[3] <= in;
            S5: out_reg[4] <= in;
            S6: out_reg[5] <= in;
            S7: out_reg[6] <= in;
            S8: out_reg[7] <= in;
            default: out_reg <= out_reg;
        endcase
    end
    
    
    assign done = (state == STOP);
	assign out_byte = out_reg;
    
endmodule
