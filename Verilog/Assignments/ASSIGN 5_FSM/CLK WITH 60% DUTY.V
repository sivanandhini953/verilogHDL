module clk_60dc(

    input clk,
    input reset,
    output reg clkout
);

    reg [3:0] count;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 0; 
        else
            if (count==9)
count <= 0;
else
count <= count+1;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            clkout <= 0; 
        else
            if (count<6)
clkout <= 1;
else
clkout <= 0;
    end
endmodule
    
    
