module tb_graytobin;
    reg [3:0] gray;
    wire [3:0] bin;

    graytobin uut (
        .gray(gray),
        .bin(bin)
    );

    initial begin
        $monitor("Gray: %b -> Binary: %b", gray, bin);

        gray = 4'b0000; #10;
        gray = 4'b0001; #10;
        gray = 4'b0011; #10;
     

        $finish;
    end
endmodule
