module synchronous_fifo #(parameter WIDTH=8, DEPTH=8)(
input clk ,rst_n,
input w_en,r_en,

input [WIDTH-1:0]data_in,
output reg [WIDTH-1:0]data_out,
output full,empty
);
reg [$clog2(DEPTH)-1:0] w_ptr,r_ptr;
reg [WIDTH-1:0]fifo[DEPTH-1:0];

always @(posedge clk)begin
if (!rst_n)  begin    
data_out <= 0;
w_ptr <= 0;
r_ptr <= 0;
end
end

always @(posedge clk)begin
 if (w_en && !full)
begin
fifo[w_ptr] <=  data_in;
w_ptr=w_ptr+1;
end
end

always @(posedge clk)begin
 if (r_en && !empty)
begin
data_out <= fifo[r_ptr];
r_ptr <= r_ptr+1;
end
end

assign full=((w_ptr+1'b1)==r_ptr);
assign empty=(w_ptr==r_ptr);

endmodule
