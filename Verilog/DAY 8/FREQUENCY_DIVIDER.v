module freq_divider (
    input wire clk_10Hz,  // Input clock (1000Hz)
    input wire rst,         // Reset signal
    output reg clk_1Hz      // Output clock (1Hz)
);

    reg [4:0] counter; // 10-bit counter (counts up to 1000)

    always @(posedge clk_10Hz or posedge rst) begin
        if (rst) begin
            counter <= 10'd0;
            clk_1Hz <= 1'b0;
        end else begin
            if (counter == 9) begin // Count from 0 to 999 (1000 cycles)
                counter <= 10'd0;
                clk_1Hz <= ~clk_1Hz; // Toggle output clock
            end 
			else begin
                counter <= counter + 10'd1;
            end
        end
   
end

endmodule
