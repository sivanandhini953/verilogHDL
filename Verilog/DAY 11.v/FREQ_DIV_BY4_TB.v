
module tb_freq_div_by4;

    reg clk;       
    reg reset;     
    wire clk_by4; 

    
    freq_div_by4 uut (
        .clk(clk),
        .reset(reset),
        .clk_by4(clk_by4)
    );

    
    always #5 clk = ~clk;
	
	initial begin
	
	$dumpfile("count.vcd");
	$dumpvars;
	end

    
    initial begin
       
        clk = 0;
        reset = 1;
        #20;  

        reset = 0;  

        
        #500;
        
        $finish; 
    end

   
    initial begin
        $monitor("Time = %0t | clk = %b | count = %b | clk_by4 = %b", $time, clk, uut.count, clk_by4);
    end

endmodule
