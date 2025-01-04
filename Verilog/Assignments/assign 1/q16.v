module assi(a,y);
input  [3:0]a;
output y ;
assign a= 4'b110x;
assign y= (a==4'b1100)?(1'b1):(1'b0);
initial begin

#5 $display($time,"y=%b",y);
end
  endmodule


ans : Y=x ,As  the first 3 bits are same but 4th bit is unknown 
