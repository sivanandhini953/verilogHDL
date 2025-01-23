module topmoduletb ();
    reg [3:0] in;
    wire [1:0] pos;
	
	top_module uut(in,pos);
	initial begin
	$monitor($time ,"in=%4b,pos=%2b",in,pos);
	
	in=0000;
#10	in=0001;
#10	in=0011;
#10	in=0111;
#10	in=1111;
#10	in=0101;
end
endmodule
