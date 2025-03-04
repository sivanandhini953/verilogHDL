module moore_overlap_0110(
input clk,
input reset,
input in,
output out
);

reg [2:0]state,next;

parameter A=3'b000,

B=3'b001,
C=3'b010,
D=3'b011,
E=3'b100,
F=3'b101;

always @(posedge clk or posedge reset)

if(reset)

state <= A;

else 
state <= next;

always@(*)begin

case(state)

A:next=in?A:B;
B:next=in?C:B;
C:next=in?D:B;
D:next=in?A:E;
E:next=in?C:B;

//default next=A;

endcase
end

assign out=(state==E)?1:0;
endmodule
