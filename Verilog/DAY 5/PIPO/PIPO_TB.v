module PIPO_tb;
	
    reg clk;
    reg reset;
    reg [WIDTH-1:0]parallel_in;
	
    wire [WIDTH-1:0]parallel_out;
	
    parameter WIDTH = 4;
	

    
    PIPO uut (
        
        .clk(clk),
        .reset(reset),
		
        .parallel_out(parallel_out),
		.parallel_in(parallel_in)
	
        
    );

    // Clock generation
    always #5 clk = ~clk;  

   
    initial begin
        $dumpfile("siso.vcd");
        $dumpvars(0);

        clk = 0;  reset=1;parallel_in=4'b0000;
		#5 reset=0;
		 parallel_in=4'b1010;
		 #50 parallel_in=4'b1011;
		 
		 
		
		
		
		
	
		
			
        #500 $finish;  
		
    end

    // Monitor outputs
    initial begin
        $monitor($time, " the output:%4b , %b",parallel_in,parallel_out);
    end

endmodule
