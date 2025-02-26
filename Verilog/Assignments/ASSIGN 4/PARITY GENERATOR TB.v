module parity_generator_tb;

    reg [3:0] data;
    reg parity_select;
    wire parity_bit;

    
    parity_generator uut (
        .data(data),
        .parity_select(parity_select),
        .parity_bit(parity_bit)
    );

    initial begin
        $monitor("Data: %b | Parity Select: %b | Parity Bit: %b", data, parity_select, parity_bit);

        // Test cases
        #5 data = 4'b0000; parity_select = 0;  
        #5 data = 4'b0000; parity_select = 1;  
        #5 data = 4'b1010; parity_select = 0;  
        #5 data = 4'b1010; parity_select = 1;  
        #5 data = 4'b1111; parity_select = 0;  
        #5 data = 4'b1111; parity_select = 1;  

        #10 $finish; 
    end

endmodule
