module freq_div_by4 (
    input clk,      
    input reset,    
    output reg clk_by4 
);

    reg [1:0] count; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_by4 <= 0;
        end 
        else begin
            count <= count + 1;
            if (count == 2'b11) begin
                clk_by4 <= ~clk_by4; 
            end
        end
    end

endmodule
