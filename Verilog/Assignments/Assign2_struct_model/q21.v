module or_switch(A,B,Y);
input A,B;
output Y;
supply0 gnd;
supply1 vdd;
wire a;
pmos p1(a,vdd,A);
pmos p2(Y,a,B);
nmos n1(Y,gnd,A);
nmos n2(Y,gnd,B);
endmodule

module or_switch(A,B,Y);
input A,B;
output Y;
  nor (Y,A,B);
endmodule


Ans   nor gate
