module jk_ff(
    input j,
    input k,
    input clk,
	input rst,
    output reg q,
    output qbar
);
    always @(posedge clk or posedge rst) begin
	if (rst)
	q <=0;
	else
        case ({j,k}) 
            2'b00: q <= q;        // No change
            2'b01: q <= 1'b0;     // Reset
            2'b10: q <= 1'b1;     // Set
            2'b11: q <= ~q;       // Toggle
        endcase 
    end
    assign qbar = ~q;  // qbar is the complement of q
endmodule

module async_counter #(parameter SIZE=4)(
    input clk, rst,
    input j, k,
     input mode, 
    output [SIZE-1:0] q, 
	output [SIZE-1:0]qbar
);

    
            genvar g;
            generate
                for (g = 0; g < SIZE; g = g + 1) begin: flip_flops
                    if (g == 0) 
                        // First flip-flop: driven by the main clock
                        jk_ff uut1 (
                            .j(j),
                            .k(k),
                            .clk(clk),
							.rst(rst),
                            .q(q[g]),
                            .qbar(qbar[g])
                        );
                    else  
                            // Counting Up: use previous q as clk for next flip-flop
                            jk_ff uut2 (
                                .j(j),
                                .k(k),
								.rst(rst),
                                .clk((mode ? q[g-1] : qbar[g-1])),  // Cascading clock (q[g-1] triggers q[g])
                                .q(q[g]),
                                .qbar(qbar[g])
                            );
                         
                        
                            
                end
            endgenerate
        
   
endmodule
