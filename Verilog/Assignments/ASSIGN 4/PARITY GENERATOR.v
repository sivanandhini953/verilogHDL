module parity_generator (
    input [3:0] data,          
    input parity_select,       
    output reg parity_bit      
);

    always @(*) begin
        if (parity_select)
            parity_bit = ~(^data); 
        else
            parity_bit = ^data;
    end

endmodule
