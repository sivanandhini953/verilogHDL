module bintogray_tb;

reg [3:0]bin;

wire [3:0]gray;


bintogray uut(
.bin(bin),
.gray(gray)
);

initial begin

bin=1100;
#10 bin=1010;

end
initial begin

$monitor("graycode for %b is %b",bin,gray );

end
endmodule
