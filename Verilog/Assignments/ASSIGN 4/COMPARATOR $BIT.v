module comparator_4bit(
input [3:0]A,
input [3:0]B,
output  less,
output  greater,
output  equal
);

assign greater=A>B?1:0;
assign less=A<B?1:0;
assign equal=(A==B)?1:0;


endmodule
