module JK_fftb;

    
    reg J;
    reg K;
    reg clk;
    reg reset;
    wire q;
    wire qn;

    
    JK_ff uut (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, JK_fftb);

        clk = 0;  reset=0;      
        #1 J = 0; K = 0;   
        #1 reset = 1;    

        // Test cases
         J = 0; K = 0 ;
         J = 0; K = 1; 
        J = 1; K = 0; 
         J = 1; K = 1; 
        #10 $finish;      
    end

    // Monitor outputs
    initial begin
        $monitor($time, " J=%b, K=%b, Reset=%b, Q=%b, Qn=%b", J, K, reset, q, qn);
    end

endmodule
