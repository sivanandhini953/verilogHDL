module fsm(
    input x,
    input clk,
    input reset,
    output reg y
);

    reg [2:0] count; 
    reg [1:0] state, next;

    parameter S01 = 2'b00,
              S0  = 2'b01,
              S1  = 2'b10;

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S01; 
        else
            state <= next;
    end

    always @(*) begin
        case (state)
            S01:
                if (x)
                    next = S1;
                else 
                    next = S0;

            S0:
                if (x)
                    next = S1;
                else 
                    next = S0;

            S1:
                if (x)
                    next = S1;
                else 
                    next = S0;

            default: next = S01; 
        endcase 
    end

    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 2'b00;
            y <= 0;
        end
        else if (next == 2'b10)begin
		if (count == 3'b011) begin
            y <= 1;
            count <= 2'b00;
        end
        else begin
            count <= count + 1;
            y <= 0;
        end
		end
    end

endmodule






		   
          
