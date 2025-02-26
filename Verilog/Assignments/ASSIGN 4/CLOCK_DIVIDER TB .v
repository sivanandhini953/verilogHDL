module clock_divider_tb;

    reg clk;            
    reg reset;          
    wire clk_by2;       
    wire clk_by4;       
    wire clk_by8;       

   
    clock_divider uut (
        .clk(clk),
        .reset(reset),
        .clk_by2(clk_by2),
        .clk_by4(clk_by4),
        .clk_by8(clk_by8)
    );

    
    always #5 clk = ~clk;

    
    initial begin
        $dumpfile("clock_divider.vcd"); 
        $dumpvars(0, clock_divider_tb);

        clk = 0;
        reset = 1;   
        #20 reset = 0; 

        #200 $finish; 
    end

    
    initial begin
        $monitor("Time=%0t | clk=%b | clk_by2=%b | clk_by4=%b | clk_by8=%b", 
                  $time, clk, clk_by2, clk_by4, clk_by8);
    end

endmodule
