module topmoduletb ();
    reg [7:0] in;
    wire [2:0] pos;
	
	top_module uut(in,pos);
	initial begin
	$monitor($time ,"in=%4b,pos=%2b",in,pos);
	
	in=00000000;
#10	in=00100000;
#10	in=11100000;
#10	in=01000000;
#10	in=10000000;
#10	in=01010000;
end
endmodule
