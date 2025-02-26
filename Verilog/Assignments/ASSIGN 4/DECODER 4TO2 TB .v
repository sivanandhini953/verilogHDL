module priority_4to2_tb;
reg [3:0]d;
wire [1:0]out;

priority_4to2 uut (.d(d),.out(out));

initial begin
$monitor ("d=%b;out=%b",d,out);
repeat(5)
#2 d=$urandom;

#10 $finish ;

end
endmodule
