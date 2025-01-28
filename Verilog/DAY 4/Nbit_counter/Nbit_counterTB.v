module nbit_countertb;

    
    reg [WIDTH-1:0]d;
   
    reg clk;
    reg reset;
    wire [WIDTH-1:0]q;
	parameter WIDTH=4;
    

    
    nbit_counter uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
        
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0);

        clk = 0;  reset=0;
		
     
        #1 reset = 1; 
			#50 reset=0;
			#2 reset=1;	
        #100 $finish;      
    end

    // Monitor outputs
    initial begin
        $monitor($time, " the count will be:%d",q);
    end

endmodule
