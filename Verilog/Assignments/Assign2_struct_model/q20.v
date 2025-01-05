SWITCH MODEL:
module or_switch(A,B,OUT);
input A,B;
output OUT;
supply0 gnd;
supply1 vdd;
wire a;
pmos p1(OUT,vdd,A);
pmos p2(OUT,vdd,B);
nmos n1(OUT,a,A);
nmos n2(a,gnd,B);
endmodule



GATE MODEL:
module or_switch(A,B,OUT);
input A,B;
output OUT;
nand (OUT,A,B);
endmodule

Ans  Nand gate
