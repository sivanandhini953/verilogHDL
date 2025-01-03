module assi(output reg [3:0] acc);
initial begin
acc = 4'b0000;
while (acc < 4'b1001) 
begin
#1 acc = acc + 1;
end
$display($time,"acc = %b", acc);
end
endmodule



Ans: acc=1000 at time 7
