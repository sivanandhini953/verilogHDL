module priority_4to2_tb;
reg [7:0]d;
wire [2:0]out;

priority_4to2 uut (.d(d),.out(out));

initial begin
$monitor ("d=%b;out=%b",d,out);
repeat(5)
 #5 d=$urandom;

#100 $finish ;

end
endmodule
