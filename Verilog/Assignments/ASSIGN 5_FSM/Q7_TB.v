module tb_Oscillator();

   
    reg A;
    reg clk;
    reg rst;

   
    wire [1:0] state;

   
    Oscillator uut (
        .A(A),
        .clk(clk),
        .rst(rst),
        .state(state)
    );

   
    always begin
        #5 clk = ~clk; 
    end

   
    initial begin
      
        clk = 0;
        rst = 0;
        A = 0;

       
        $display("Applying reset...");
        rst = 1;
        #10; 
        rst = 0;


        $display("Test Case 1: A = 0, oscillating between 00-01-00-01 and 10-11-10-11");
        A = 0;
        #40; // Run for 40ns

        
        $display("Test Case 2: A = 1, switching between 00-10-00-10 and 01-11-01-11");
        A = 1;
        #40; 

        
      

       
        $finish;
    end


    initial begin
        $monitor("At time %t, A = %b, state = %b", $time, A, state);
    end

endmodule
