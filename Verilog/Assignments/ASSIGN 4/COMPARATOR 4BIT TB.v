module comparator4bit_tb;

reg [3:0]A;
reg [3:0]B;
wire greater;
wire less;
wire equal;

comparator_4bit uut(.A(A),.B(B),.greater(greater),.less(less),.equal(equal));

initial begin

#1 A=$urandom;B=$urandom;
#1 A=$urandom;B=$urandom;
#1 A=$urandom;B=$urandom;
#1 A=$urandom;B=$urandom;
#1 A=$urandom;B=$urandom;
#1 A=$urandom;B=$urandom;

$monitor ($time,"A=%b;B=%b;greater=%b;less=%b,equal=%b",A,B,greater,less,equal);
#100 $finish;
end
endmodule



