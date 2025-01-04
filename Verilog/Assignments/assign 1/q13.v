module assi(a,b);
input [3:0]a;
input [6:0]b;

assign a=4'd10;
assign b={a,2'b1};

initial begin

#5 $display($time,"b=%b",b);
end
  endmodule


Ans:  b= 0010101    total 7 bits a is in decimal b is concatenation of a and 1.
