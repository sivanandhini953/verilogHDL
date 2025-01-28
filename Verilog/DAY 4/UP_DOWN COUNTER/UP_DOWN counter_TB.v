module nbit_countertb;

    
    reg [WIDTH-1:0]d;
   
    reg clk;
    reg reset;
	reg up;
	reg down;
    wire [WIDTH-1:0]q;
	parameter WIDTH=4;
    

    
    nbit_counter uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q),
		.up(up),
		.down(down)
        
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0);

        clk = 0;  reset=0;up=0;down=0;
		
     
       // #1 reset = 1;#1 up=1;
	//	#15	reset=0;
			#5 reset=1;  down=1;
			#30	reset=0;up=0;down=0;
			#10 reset = 1; up=1;
			#30	reset=0;up=0;down=0;
			#5 reset=1;  down=1;
			
        #300 $finish;      
    end

    // Monitor outputs
    initial begin
        $monitor($time, " the count will be:%d",q);
    end

endmodule
