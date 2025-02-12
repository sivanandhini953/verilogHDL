module top_module (
    input clk,
    input reset,      // Synchronous reset
    output reg shift_ena  // Must be reg since it's assigned inside an always block
);
    reg [2:0] count;  // 3-bit counter (0 to 7)

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            shift_ena <= 0;
        end else begin
            if (count < 5) begin
                shift_ena <= 1;
                count <= count + 1;
            end else begin
                shift_ena <= 0;
            end
        end
    end
endmodule
