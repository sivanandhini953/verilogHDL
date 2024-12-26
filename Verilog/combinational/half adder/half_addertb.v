module halfaddrtb();
reg a,b;
wire s,c;
halfaddr uut(a,b,s,c);
initial
begin
$dumpfile("halfaddr.vcd");
$dumpvars(1);
end
initial
begin
$monitor($time,"a=%b,b=%b,s=%b,c=%b",a,b,s,c);
a=0;b=0;
#5 a=0;b=1;
#5 a=1;b=0;
#5 a=1;b=1;
end
 endmodule
