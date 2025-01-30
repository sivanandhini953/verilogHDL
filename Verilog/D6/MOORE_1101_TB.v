module moore1101tb;
    reg clk;
    reg reset;
    reg seq_in;
    wire seq_out;
    wire [2:0]crnt_state,nxt_state;
	
	parameter 
	IDLE = 3'b000,
    S1   = 3'b001,
    S11  = 3'b010,
    S110 = 3'b011,
	S1101= 3'b100;
	
    
    moore_1101 uut (
        .clk(clk),
        .reset(reset),
        .seq_in(seq_in),
        .seq_out(seq_out),
        .crnt_state(crnt_state),
		.nxt_state(nxt_state)		
    );
	
	initial begin 
	$dumpfile("moore.vcd");
	$dumpvars;

   end
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        reset = 1;
        seq_in = 0;

        #5 reset = 0; 
         seq_in = 1;
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        #10 seq_in = 0;
        #10 seq_in = 1;
        
        #50 $finish; 
    end

    initial begin
        $monitor($time, " Input=%b | Output=%b | Current State=%b |next State=%b", seq_in, seq_out, crnt_state,nxt_state);
    end
endmodule
