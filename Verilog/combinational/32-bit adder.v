module add1 ( input a, input b, input cin,   output sum, output cout );


    assign sum=a^b^cin;
    assign cout=(a&b)|(b&cin)|(a&cin);

endmodule

module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    wire [15:0]c;
	
   
    add1 uut1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(c[0]));
	generate
genvar i;
   for (i=1;i<16;i=i+1)
       begin:for_loop
        
        add1 uut2(.a(a[i]),.b(b[i]),.cin(c[i-1]),.sum(sum[i]),.cout(c[i]));
       end
		endgenerate
		assign cout = c[15];
endmodule



module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c2,c3;
	add16 uut4(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(sum[15:0]),.cout(c2));
    add16 uut3(.a(a[31:16]),.b(b[31:16]),.cin(c2),.sum(sum[31:16]),.cout(c3));
    
endmodule




TEST BENCH:
module top_moduletb;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] sum;
	reg c1,c2,c3;
	top_module uut5( a,b,sum);
	
	initial begin
	$monitor($time,"a=%32b,b=%32b,sum=%32b,c1=%b,c2=%b",a,b,sum,c1,c2);
 a='hffffffff; b='hffffffff;c1=1'b0;
 #10 a='hffffffff; b='h00000001;c1=1'b0;
 #10 a='h77777777; b='h00000001;c1=1'b0;

end
 endmodule
