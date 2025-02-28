module digital_stopwatch(
    input clk,
    input reset,
    input stop,
    input start,
    output reg [10:0] sec_count,
    output reg [10:0] msec_count
);

    parameter IDLE = 2'b00, MSEC = 2'b01, SEC = 2'b10;
    reg [1:0] state, next;

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next;
    end

    
    always @(*) begin
        case (state)
            IDLE: 
                if (start)
                    next = MSEC;
                else 
                    next = IDLE;

            MSEC: begin 
			$monitor("sec_count=%d | msec_count=%d", sec_count, msec_count);
                if (stop) begin
                    
                    next = IDLE;
                end 
                else if (msec_count < 11'd999) 
                    next = MSEC;
                else 
                    next = SEC;
end
            SEC: begin
			$monitor("sec_count=%d | msec_count=%d", sec_count, msec_count);
                if (stop) begin
                    $display("sec_count=%d | msec_count=%d", sec_count, msec_count);
                    next = IDLE;
                end 
                else 
                    next = MSEC;
					end

            default: next = IDLE;
        endcase
    end

   
    always @(posedge clk or posedge reset) begin
        
        
         if (state == IDLE) begin
            sec_count <= 0;
            msec_count <= 0;
        end
        else if (state == MSEC) begin
            if (msec_count < 11'd999)
                msec_count <= msec_count + 1;
            else
                msec_count <= 0;
        end 
        else if (state == SEC) begin
            sec_count <= sec_count + 1;
        end
    end

endmodule
