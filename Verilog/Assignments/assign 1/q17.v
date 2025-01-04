module assi(a,y);
input  [3:0]a;
output y ;
assign a= 4'b010x;
assign y= (a==4'b1100)?(1'b1):(1'b0);
initial begin

#5 $display($time,"y=%b",y);
end
  endmodule




Ans y=0 , Asthe other bits other then x is different
