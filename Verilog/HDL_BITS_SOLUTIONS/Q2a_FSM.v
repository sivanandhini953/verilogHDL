module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    reg [2:0] state,next_state;
    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    
    always@(posedge clk)begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    always@(*)begin
        case(state)
            A:begin
                next_state = w ? B:A;
                z = 0;
            end
            B:begin
                next_state = w ? C:D;
                z = 0;
            end
            C:begin
                next_state = w ? E:D;
                z = 0;
            end
            D:begin
                next_state = w ? F:A;
                z = 0;
            end
            E:begin
                next_state = w ? E:D;
                z = 1;
            end
            F:begin
                next_state = w ? C:D;
                z = 1;
            end
        endcase
    end

endmodule
