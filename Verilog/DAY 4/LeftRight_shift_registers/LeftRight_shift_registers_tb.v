module shift_regtb;

    
    reg d;
   
    reg clk;
    reg reset;
	reg left;
	reg right;
    wire [WIDTH-1:0]q;
	parameter WIDTH=4;
    

    
    shift_reg uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q),
		.left(left),
		.right(right)
        
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("shift.vcd");
        $dumpvars(0);

        clk = 0;  reset=0;left=0;right=0;d=1;
		#5 reset=1; left=1;
		
    repeat (7) @ (posedge clk)
         d <= d;
		 
	 
		#2 reset=0;left=0;right=0;d=1;
		#5 reset=1;right=1;
		 
		 repeat (7) @ (posedge clk)
         d <= d;
     
			
        #50 $finish;      
    end

    // Monitor outputs
    initial begin
        $monitor($time, " the count will be:%b",q);
    end

endmodule
