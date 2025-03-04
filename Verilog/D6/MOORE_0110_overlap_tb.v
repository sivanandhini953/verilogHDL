module moore_overlap_0110_tb;

    reg clk;
    reg reset;
    reg in;
    wire out;
   

 

  
    moore_overlap_0110 uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
        
    );
	initial begin 
	$dumpfile ("fsm1.vcd");
	$dumpvars;
	end

    always #5 clk=~clk;

    
    initial begin
        
        $monitor("in:%b;out:%b",in,out);

        
        reset = 1;clk=0;
        #10 reset = 0; 
		in=1;
		#10  in=0;
		#10  in=1;
		#10  in=1;
		#10  in=0;
	    #10  in=1;
	    #10  in=1;
		#10  in=0;
		#10  in=0;
		#10  in=0;
		#10  in=1;
		#10  in=0;
		#10  in=0;
		#10  in=1;
		#10  in=1;

       #100 $finish;
    end
endmodule
