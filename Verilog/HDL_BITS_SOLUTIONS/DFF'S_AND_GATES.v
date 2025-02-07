https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q4



module top_module (
    input clk,
    input x,
    output z
); 
    //reg reset;
    reg [2:0]q;
   
    wire [2:0]d;
    always @(posedge clk) begin
       
       q <= d;
        end
        

   assign d[2]= x^q[2];
    assign d[1]=x&(~q[1]);
    assign  d[0]=x|(~q[0]);
  assign  z=~(q[2]|q[1]|q[0]);
   
    
endmodule
