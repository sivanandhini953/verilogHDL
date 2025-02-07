https://hdlbits.01xz.net/wiki/Exams/2014_q4a


module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    //wire Q1;
    always @ (posedge clk) begin
        if(L)
            Q <= R;
    else if (E)
        Q <= w;
    else Q <=Q;
    end
endmodule
