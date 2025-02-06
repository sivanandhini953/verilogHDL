
https://hdlbits.01xz.net/wiki/Mt2015_muxdff



module top_module (
	input clk,
	input L,
    input r_in,
    input q_in,
	output reg Q
);
    always @(posedge clk)begin
    
      if(L)
                Q <= r_in;
            else
                Q <= q_in;
    end
endmodule
    
    
    module muxdff(
        input [2:0]r_in,
        input [2:0]Q
        
    );
        top_module uut1(.r_in(r_in[2]),.Q(Q[2]),.q_in(Q[2]^Q[1]));
        
        top_module uut2(.r_in(r_in[1]),.Q(Q[1]),.q_in(Q[2]^Q[0]));
        top_module uut3(.r_in(r_in[0]),.Q(Q[0]),.q_in(Q[2]^Q[2]));
        
          
    endmodule
