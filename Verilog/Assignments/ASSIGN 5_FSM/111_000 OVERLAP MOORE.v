module fsm_111_000(
input x,
output reg y,
input clk,
input reset
);
reg [2:0]state,next;

localparam s01  = 3'b000,
               s1   = 3'b001,
               s11  = 3'b010,
               s111 = 3'b011,
               s0   = 3'b100,
               s00  = 3'b101,
               s000 = 3'b110;
			   
always @(posedge clk or posedge reset)
if(reset)
state <= s01;

else 
state <= next;

always@(*)begin

case (state)
s01: begin
y=0;
if(x)
next =s1;
else 
next=s0;
end

s1: begin
y=0;
if(x)
next =s11;
else 
next=s0;
end

s11: begin
y=0;
if(x)
next =s111;
else 
next=s0;
end
 
s111: begin
y=1;
if(x)
next =s111;
else 
next=s0;
end

s0:  begin
y=0;
if(x)
next =s1;
else 
next=s00;
end

s00: begin
y=0;
if(x)
next =s1;
else 
next=s000;
end


s000: begin
y=1;
if(x)
next =s1;
else 
next=s000;
end






endcase
end


endmodule
