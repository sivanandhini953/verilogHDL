module T_fftb;

    
    reg t;
   
    reg clk;
    reg reset;
    wire q;
    wire qn;

    
    T_ff uut (
        .t(t),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("t_ff.vcd");
        $dumpvars(0);

        clk = 0;  reset=0;
		t=1;
     
        #1 reset = 1;  
		#1 t=1;
         #1 t=1;
		#1	t=1;
      
		
		#1 t=1;
         #1 t=1;
		#1	t=1;		
        #10 $finish;      
    end

    // Monitor outputs
    initial begin
        $monitor($time, " t=%b, Reset=%b, Q=%b, Qn=%b", t, reset, q, qn);
    end

endmodule
