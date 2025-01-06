module fa(a,b,c,s,cout);
input a,b,c;
output s,cout;
wire h,i,j;
xor (s,a,b,c);
and (h,a,b);
and (i,b,c);
and (j,a,c);
or (cout,h,i,j);
endmodule


module ripplecarry(x,y,cin,z,sum,c_out);
input [3:0]x,y;
input cin;
output [3:0]sum;
output  c_out;
output [4:1]z;

fa fa1(.a(x[0]),.b(y[0]),.c(cin),.s(sum[0]),.cout(z[1]));
fa fa2(.a(x[1]),.b(y[1]),.c(z[1]),.s(sum[1]),.cout(z[2]));
fa fa3(.a(x[2]),.b(y[2]),.c(z[2]),.s(sum[2]),.cout(z[3]));
fa fa4(.a(x[3]),.b(y[3]),.c(z[3]),.s(sum[3]),.cout(z[4]));

assign c_out=z[4];
endmodule



TEST BENCH

module rippletb;
reg [3:0]x,y;
reg cin;
wire [3:0]sum;
wire [4:1]z;
wire c_out;
ripplecarry rc(x,y,cin,z,sum,c_out);
initial
    begin
       $dumpfile("exor.vcd");
  		$dumpvars(1);
    end
	initial 
	begin
$monitor ($time,"a=%4b,b=%4b,c=%4b,s=%4b,cout=%b",x,y,cin,sum,c_out);
 #5 x=4'b1010;y=4'b1111;cin=0;
 #5 x=4'b1111;y=4'b1111;cin=0;
 #5 x=4'b1010;y=4'b1010;cin=0;
 #5 x=4'b1010;y=4'b0000;cin=0;
 end
endmodule
