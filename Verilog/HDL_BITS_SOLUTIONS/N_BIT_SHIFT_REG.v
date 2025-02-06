https://hdlbits.01xz.net/wiki/Exams/2014_q4b


module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF uut1(.L(KEY[2]),.R(SW[0]),.clk(KEY[0]),.q(LEDR[0]),.out(LEDR[1]),.E(KEY[1]));
    MUXDFF uut2(.L(KEY[2]),.R(SW[1]),.clk(KEY[0]),.q(LEDR[1]),.out(LEDR[2]),.E(KEY[1]));            
    MUXDFF uut3(.L(KEY[2]),.R(SW[2]),.clk(KEY[0]),.q(LEDR[2]),.out(LEDR[3]),.E(KEY[1]));
    MUXDFF uut4(.L(KEY[2]),.R(SW[3]),.clk(KEY[0]),.q(LEDR[3]),.out(KEY[3]),.E(KEY[1]));
                                        
                                        
endmodule

module MUXDFF (
input E,
    input L,
    input R,
    input out,
    input clk,
    output q
    
);
    always @(posedge clk)begin
        if(L)
        q <= R;
            else if(E) 
                q <= out;
    else
        q<=q;
    end
endmodule
