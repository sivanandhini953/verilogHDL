
module tb_LFSR;

    reg clk;       
    reg reset;     
    //reg d
wire [3:0]q	; 

    
    LFSR uut(
        .clk(clk),
        .reset(reset),
        .q(q)
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
        $monitor("q = %b",q );
    end

endmodule
