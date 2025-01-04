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
the remaing 2byte space to be nullified to get correct output
