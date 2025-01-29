module d_latch (
input d,
input reset,
input en,
output reg q,
output qbar
);
always @(*)begin
if (reset)

q <= 0;
else if (en)
q <= d;
end;
assign qbar=~q;
endmodule



