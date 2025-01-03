What is the value of y in binary format in the below snippet?



module assi(output [5:0]y);
reg [5:0] y;
initial
begin
y= 'Ox2;
$display ($time,"y=%b",y);
end
endmodule



Ans :y=xxx010
