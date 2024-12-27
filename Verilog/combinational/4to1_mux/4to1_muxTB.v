module mux_4to1tb();
reg [3:0]i;
reg [1:0]s;
wire y;

mux_4to1 uut(i,s,y);
initial
    begin
       $dumpfile(".vcd");
  		$dumpvars(1);
    end
	initial 
	begin
$monitor ($time,"i=%4b,s=%2b,y=%b",i,s,y);

 i=4'b1010; 
s=2'b00;
#5 s=2'b01;
#5 s=2'b10;
#5 s=2'b11;
 
  
 end

endmodule



