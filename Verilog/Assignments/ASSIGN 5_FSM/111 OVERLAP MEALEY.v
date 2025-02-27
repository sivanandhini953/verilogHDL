module FSM_111_overlap(
input x,
output reg y,
input clk,
input reset
);

parameter s0=2'b00,s1=2'b01,s11=2'b10,s111=2'b11;

reg [1:0]state ,next;

always@(posedge clk or posedge reset)

if(reset)

state <= s0;
else state <= next;


always@(*)begin
case(state)

s0:
if (x)begin
next=s1;
y=0;end
else begin
next=s0;
y=0;
end
s1:if (x)begin
next=s11;
y=0;end
else begin
next=s0;
y=0;
end
s11:
if (x)begin
next=s111;
y=0;end
else begin
next=s0;
y=0;end
s111:
if (x)begin
next=s111;
y=1;end
else begin
next=s0;
y=0;

end

endcase
end
endmodule
