module event_counter (
    input clk,          
    input reset,       
    input enable,       
    input event,        
    output reg [7:0] count 
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 8'b0; 
        else if (enable && event)
            count <= count + 1; 
    end

endmodule
