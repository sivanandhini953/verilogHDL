module assi(a,x);
input [3:0]a;
input [1:0]x;
assign a = 4'd10;
assign x= (a>>1);
initial begin

#5 $display($time,"x=%b",x);
end
  endmodule


Ans: x=1 due to right shit by one position
