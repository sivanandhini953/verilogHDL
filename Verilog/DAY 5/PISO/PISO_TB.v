module PISO_tb;
	
    reg clk;
    reg reset;
    reg [WIDTH-1:0]parallel_in;
	reg load;
    wire serial_out;
	
    parameter WIDTH = 4;
	

    
    PISO uut (
        
        .clk(clk),
        .reset(reset),
		.load(load),
        .serial_out(serial_out),
		.parallel_in(parallel_in)
	
        
    );

    // Clock generation
    always #5 clk = ~clk;  

   
    initial begin
        $dumpfile("siso.vcd");
        $dumpvars(0);

        clk = 0;  reset=1;parallel_in=4'b0000;load=0;
		#5 reset=0;load=1;
		 parallel_in=4'b1010;
		 
		 #50 load=0;
		
		
		
		
	
		
			
        #500 $finish;  
		
    end

    // Monitor outputs
    initial begin
        $monitor($time, " the output:%4b , %b",parallel_in,serial_out);
    end

endmodule
