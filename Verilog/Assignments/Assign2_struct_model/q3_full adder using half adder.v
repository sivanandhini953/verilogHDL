module ha(a,b,s,cout);
input a,b;
output s,cout;
wire h,i,j;
xor (s,a,b);
and (cout,a,b);
endmodule


module fa(x,y,cin,s2,c_out);
input x,y;
input cin;
output s2;
wire s1;
output  c_out;
wire i,j;

ha ha1(.a(x),.b(y),.s(s1),.cout(i));
ha ha2(.a(s1),.b(cin),.s(s2),.cout(j));



or (c_out, i ,j);
endmodule

TEST BENCH
module fulladdertb;
reg x,y;
reg cin;
wire s1,s2;

wire c_out;
fa uut(x,y,cin,s2,c_out);
initial
    begin
       $dumpfile("exor.vcd");
  		$dumpvars(1);
    end
	initial 
	begin
$monitor ($time,"a=%b,b=%b,cin=%b,sum=%b,cout=%b",x,y,cin,s2,c_out);
 #5 x=1'b0;y=1'b0;cin=0;
 #5 x=1'b0;y=1'b0;cin=1;
 #5 x=1'b0;y=1'b1;cin=0;
 #5 x=1'b0;y=1'b1;cin=1;
 #5 x=1'b1;y=1'b0;cin=0;
 #5 x=1'b1;y=1'b0;cin=1;
 #5 x=1'b1;y=1'b1;cin=0;
 #5 x=1'b1;y=1'b1;cin=1;

 end
endmodule
