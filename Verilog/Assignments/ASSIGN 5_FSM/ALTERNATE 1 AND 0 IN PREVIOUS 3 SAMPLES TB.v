module tb_moore_111_detector;
    reg clk, reset, x;
    wire y;

   
    clk_101_010 uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    
    always #5 clk = ~clk;
	initial begin
$dumpfile ("fsm1.vcd");
$dumpvars;
end

    initial begin
       
        clk = 0;
        reset = 1;
        x = 0;

       
        #10 reset = 0;x=1;

        
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
		#10 x = 1;		
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;  
        #10 x = 1;
        
     
        #20 $finish;
    end

  
    initial begin
        $monitor("Time = %0t | Input = %b | Output = %b", $time, x, y);
    end

endmodule
