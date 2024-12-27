module fulladdertb();
reg a,b,c;
wire sum,carry;
fulladdr uut(a,b,c,sum,carry);
initial
    begin
       $dumpfile("exor.vcd");
  		$dumpvars(1);
    end
	initial 
	begin
$monitor ($time,"a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
 a=0;b=0;c=0;
#5  a=0;b=0;c=1;
#5   a=0;b=1;c=0;
  #5  a=0;b=1;c=1;
	#5 a=1;b=0;c=0;
	  #5a=1;b=0;c=1;
	  #5 a=1;b=1;c=0;
	  #5  a=1;b=1;c=1;

end

endmodule
