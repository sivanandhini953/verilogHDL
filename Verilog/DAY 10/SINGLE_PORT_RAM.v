module SRAM(

input   [7:0]  dataIn,

output reg [7:0]  dataOut,

input   [4:0]  Addr,

input CS,WE,RD,Clk


);
reg [7:0] mem [31:0];

always @ (posedge Clk)



 if (CS & WE & !RD)

    mem [Addr] <= dataIn;

  always @ (posedge Clk)

 if (CS & !WE & RD) 

   dataOut <= mem[Addr]; 


endmodule
