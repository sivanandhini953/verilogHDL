module clock_divider (
    input clk,        
    input reset,      
    output reg clk_by2, 
    output reg clk_by4, 
    output reg clk_by8  
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            clk_by2 <= 0;
        else
            clk_by2 <= ~clk_by2;
    end

    always @(posedge clk_by2 or posedge reset) begin
        if (reset)
            clk_by4 <= 0;
        else
            clk_by4 <= ~clk_by4;
    end

    always @(posedge clk_by4 or posedge reset) begin
        if (reset)
            clk_by8 <= 0;
        else
            clk_by8 <= ~clk_by8;
    end

endmodule
