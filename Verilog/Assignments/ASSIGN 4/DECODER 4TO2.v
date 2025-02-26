module priority_4to2(
input [3:0]d,
output reg [1:0]out);

always @(*)begin
casex(d)
4'b0001: out=2'b00;
4'b001x: out=2'b01;
4'b01xx: out=2'b10;
4'b1xxx: out=2'b11;
endcase
end
endmodule


