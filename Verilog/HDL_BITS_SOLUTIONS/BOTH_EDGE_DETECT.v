https://hdlbits.01xz.net/wiki/Edgedetect2




module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] indly;
    always @(posedge clk)begin
        indly <= in ;
        anyedge <= ~(in^(~indly)); 
        
    end
endmodule
