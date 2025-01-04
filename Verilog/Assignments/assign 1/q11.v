module assi(a,x);
input [2:0]a;
input [2:0]x;
assign a = 3'd4;
assign x=^a;
initial begin

#5 $display($time,"x=%d",x);
end
  endmodule


Ans   :  x=1 
reason :  binary of 4 is 0100, 3 bit so 100 taking exor 1
