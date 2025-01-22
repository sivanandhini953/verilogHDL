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



module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0]xb;
    wire cin1;
    
    
    assign xb=b^{32{sub}};
    add16 uut1 (.a(a[15:0]), .b(xb[15:0]), .cin(sub), .sum(sum[15:0]), .cout(cin1));
    add16 uut2 (.a(a[31:16]), .b(xb[31:16]), .cin(cin1), .sum(sum[31:16]), .cout());

endmodule


TEST BENCH:

module top_moduletb;
    reg [31:0] a;
    reg [31:0] b;
    reg sub;
    wire [31:0] sum;
	
	
	top_module uut5( a,b,sub,sum);
	
	initial begin
	$monitor($time,"a=%32b,b=%32b,sum=%32b",a,b,sum);
 a='hffffffff; b='hffffffff;sub=1'b1;
 #10 a='hffffffff; b='hffffffff;sub=1'b0;
 #10 a='hffffffff; b='h00000001;sub=1'b1;
  #10 a='hffffffff; b='h00000001;sub=1'b0;
 #10 a='h77777777; b='h00000001;sub=1'b1;

end
 endmodule

