module comp_2bit(a0,b0, a1,b1,more,less,equal);
input a0,b0, a1,b1;
output more,less,equal;

not n1(a0bar,a0);
not n2(a1bar,a1);
not n3(b0bar,b0);
not n4(b1bar,b1);

and(d1,a0,a1bar);
and(d2,b0, a1bar, b1bar);
and(d3,a0 ,b0 ,b1bar);
or(more,d1,d2,d3);

and(d4,a0bar,a1bar,b0bar,b1bar);
and (d5,a0bar,a1bar,b0,b1);
and (d6,a0,a1,b0bar,b1bar);
and(d7,a0,b0,a1,b1);
or (equal,d4, d5, d6, d7);



and (d8,a0bar,a1);
and(d9,a0bar ,b0bar, b1);
and (d10,a1 ,b1, b0bar);
or (less,d8,d9,d10);

endmodule






module comp_2bittb;
 reg a0,a1,b0,b1;
 wire more,less,equal;
comp_2bit sw(a0,b0, a1,b1,more,less,equal);
initial
    begin
       $dumpfile("or_switch.vcd");
  		$dumpvars(1);
    end
initial begin 
$monitor($time,"more=%b,equal=%b, less=%b",more,equal,less);
#5 a0=1'b0 ;b0=1'b0;a1=1'b0 ;b1=1'b0;
#5 a0=1'b0; b0=1'b1;a1=1'b0; b1=1'b1;
#5 a0=1'b1; b0=1'b0;a1=1'b1; b1=1'b0;
#5 a0=1'b1; b0=1'b1;a1=1'b1; b1=1'b1;
#5 a0=1'b1; b0=1'b1;a1=1'b0; b1=1'b0;
#5 a0=1'b1; b0=1'b1;a1=1'b0; b1=1'b1;
#5 a0=1'b1; b0=1'b1;a1=1'b1; b1=1'b0;
#5 a0=1'b0; b0=1'b0;a1=1'b0; b1=1'b1;
#5 $finish;
 
end
endmodule

