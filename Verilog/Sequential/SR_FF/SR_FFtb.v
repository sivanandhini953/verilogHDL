module SR_fftb;

   
    reg S;
    reg R;
    reg clk;
    reg reset;
    wire q;
    wire qn;

    
    SR_ff uut (
        .S(S),
        .R(R),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #1 clk = ~clk;  

   
    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, SR_fftb);

        clk = 0;        
        reset = 0;      
        S = 0; R = 0;    
        #2 reset = 1;    
        // Test cases
        #5 S = 1; R = 0;
        #5 S = 0; R = 1;
       #5 S = 0; R = 0; 
        #5 S = 1; R = 1; 
        #5 $finish;      
    end

    
    initial begin
        $monitor($time, " S=%b, R=%b, Reset=%b, Q=%b, Qn=%b", S, R, reset, q, qn);
    end

endmodule
