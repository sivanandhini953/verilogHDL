module assi(a,b);
input [3:0]a;
output wire [3:0]b;


assign a= 4'b0100;
assign b = a+1'bx;
initial begin
$display($time,"b=%4b",b);
end
  endmodule




Ans:  b=xxxx
