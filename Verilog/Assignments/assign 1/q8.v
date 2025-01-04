module assi(output [13*8:1] s);
reg[13*8:1]s;
initial
begin
s = {"hello world",16'b0};
$display("Characters: %s", s[104:65]);

end

  endmodule


Ans: hel 
reason :  As the string is not terminated properly it gave truncated output 
total alloted space :13 characters ,each 8 bits.
our input is 11 chacter with space .
**the remaing 2byte space to be nullified to get correct output
104-97 h       Observation : displaying 104 - 65 leaves l and 0 as the simulation consider it as empty spaces .so do **
96-89 e
88-81 l
80-73 l
72-65 o
64-57 space
56-49 w
48-41 o
40-33 r
32-25 l
24-17 d
16-9 empty
8-1 empty
