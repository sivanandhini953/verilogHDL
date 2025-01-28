module D_fftb;

    
    reg D;
   
    reg clk;
    reg reset;
    wire q;
    wire qn;

    
    D_ff uut (
        .D(D),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, D_fftb);

        clk = 0;  reset=0;
		D=0;
     
        #1 reset = 1;   D=1;
         #2 D=0;
		#5	D=1;
      
				
        #10 $finish;      
    end

    // Monitor outputs
    initial begin
        $monitor($time, " D=%b, Reset=%b, Q=%b, Qn=%b", D, reset, q, qn);
    end

endmodule
