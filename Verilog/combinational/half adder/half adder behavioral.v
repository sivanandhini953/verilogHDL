module halfaddr(a,b,s,c);
input a,b;
output reg s,c;
always @(a,b)
begin 
if (a==b)
begin
s=0;
c=b;
end
else 
begin
s=1;
c=0;
end 
end
endmodule
