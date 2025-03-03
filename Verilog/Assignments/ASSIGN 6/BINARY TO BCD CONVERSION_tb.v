 module tb_bin2bcd;


    reg [7:0] bin;

    wire [11:0] bcd;

    reg [8:0] i;

  
    bin2bcd uut (
        .bin(bin), 
        .bcd(bcd)
    );
	
	initial begin
$dumpfile ("fsm1.vcd");
$dumpvars;
end


    initial begin
   
        for(i=0;i<256;i=i+1)
        begin
            bin = i; 
            #10;
        end 
        $finish; 
    end
      
endmodule
