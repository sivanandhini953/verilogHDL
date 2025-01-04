module assi(a,b,x);
input [2:0]a,b;
input [2:0]x;
assign a=3'd5;
assign b=3'b101;
assign x= a | b;
initial begin

#5 $display($time,"x=%3b",x);
end
  endmodule


Ans : x=111 a=101 b=111 a or b = 111
