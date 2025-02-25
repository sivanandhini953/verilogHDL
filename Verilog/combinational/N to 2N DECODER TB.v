
module tb_decoder;


parameter N = 3;  
reg [N-1:0] in;
wire [(2**N)-1:0] out;


decoder #(N) uut (
    .in(in),
    .out(out)
);

initial begin
 
    in = 0;
   
    repeat (2**N) begin
        #10 in = in + 1;
    end
    #10 $finish; 
end

initial begin
    $monitor("Time: %0t | Input: %b | Output: %b", $time, in, out);
end

endmodule
