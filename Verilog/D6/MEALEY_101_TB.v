module mealey_101tb;
    reg clk;
    reg reset;
    reg seq_in;
    wire seq_out;
    wire [1:0] crnt_state; 
	
    
    mealey_101 uut (
        .clk(clk),
        .reset(reset),
        .seq_in(seq_in),
        .seq_out(seq_out),
        .crnt_state(crnt_state) 
    );

   
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;
        seq_in = 0;

        #10 reset = 0; 
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        
        #50 $finish; 
    end

    initial begin
        $monitor($time, " Input=%b | Output=%b | Current State=%b", seq_in, seq_out, crnt_state);
    end
endmodule
