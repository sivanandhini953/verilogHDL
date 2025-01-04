module assi(a,b,x);
input [3:0]a,b;
input x;
assign a=3'd4;
assign b=3'b100;
assign x= a&&b;
initial begin

#5 $display($time,"x=%b",x);
end
  endmodule


Ans  :  x=  1 .  Both operands are non zero.dont see bitwise see whole number.
