Given the conditions, such that If A = 0, the circuit oscillates between either one
of the two cases. Case 1: 00-01-00-01... and Case 2: 10-11-10-11... And If A =
1, it switches inter between two cases. write Verilog code


module Oscillator(
    input wire A,       
    input wire clk,       
    input wire rst,       
    output reg [1:0] state
);

   
  parameter        CASE1_00 = 2'b00,
        CASE1_01 = 2'b01,
        CASE2_10 = 2'b10,
        CASE2_11 = 2'b11;
  

   
    reg [1:0] current_state, next_state;

   
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= CASE1_00; 
        end else begin
            current_state <= next_state;
        end
    end

    
    always @(current_state or A) begin
        if (A == 0) begin
           
            case (current_state)
                CASE1_00: next_state = CASE1_01; 
                CASE1_01: next_state = CASE1_00;
                CASE2_10: next_state = CASE2_11; 
                CASE2_11: next_state = CASE2_10; 
                default: next_state = CASE1_00;  
            endcase
        end else begin
          
            case (current_state)
                CASE1_00: next_state = CASE2_10; 
                CASE1_01: next_state = CASE2_11;
                CASE2_10: next_state = CASE1_00; 
                CASE2_11: next_state = CASE1_01; 
                default: next_state = CASE1_00;  
            endcase
        end
    end

   
    always @(current_state) begin
        state <= current_state;
    end

endmodule
