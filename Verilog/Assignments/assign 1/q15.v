module assi(a,B);
input  [3:0]a;
output reg B;
assign a= 4'b110x;
initial
begin

if ( a !== 4'b1100)
begin B=1'b1;
end
else
begin B=1'b0; end
end
initial begin

#5 $display($time,"B=%b",B);
end
  endmodule


Ans:  B1 will be executed as there is dont care.
