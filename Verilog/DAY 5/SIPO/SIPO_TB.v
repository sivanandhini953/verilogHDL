module SIPO_tb;
	
    reg clk;
    reg reset;
    reg serial_in;
    wire [WIDTH-1:0]parallel_out;
	
    parameter WIDTH = 4;
	

    
    SIPO uut (
        
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
		.parallel_out(parallel_out)
	
        
    );

    // Clock generation
    always #5 clk = ~clk;  

   
    initial begin
        $dumpfile("siso.vcd");
        $dumpvars(0);

        clk = 0;  reset=1;serial_in=0;
		#5 reset=0;
		 serial_in=1;
		 #10 reset=0; serial_in=0;
		 #10 reset=0; serial_in=1;
		 #10 reset=0; serial_in=0;
		
		
		
	
		
			
        #1 $finish;  
		
    end

    // Monitor outputs
    initial begin
        $monitor($time, " the output:%4b , %4b",serial_in,parallel_out);
    end

endmodule
