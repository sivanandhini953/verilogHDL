module tb_moore_111_detector;
    reg clk, reset, x;
    wire even0,even1;

   
    clk_101_010 uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .even0(even0),
		.even1(even1)
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
        $monitor("Time = %0t | Input = %b | even1 = %b| even0=%b", $time, x,even1,even0);
    end

endmodule
