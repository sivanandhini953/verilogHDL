module bintogray (
    input  [3:0] bin,   // 4-bit Binary Input
    output [3:0] gray   // 4-bit Gray Code Output
);

    assign gray[3] = bin[3];            // MSB remains the same
    assign gray[2] = bin[3] ^ bin[2];   // Next bits are XORed
    assign gray[1] = bin[2] ^ bin[1];
    assign gray[0] = bin[1] ^ bin[0];

endmodule
