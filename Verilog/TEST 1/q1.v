module random();
  //output reg [7:0]val;
  
initial begin
  real val;
  integer i;
  
  for (i=0;i<20;i=i+1)begin
    val=($random % 101);
    $display("val=%d",val);
  end
end
endmodule


ANS

# KERNEL: val=         89
# KERNEL: val=        -27
# KERNEL: val=        -63
# KERNEL: val=        -85
# KERNEL: val=         38
# KERNEL: val=         97
# KERNEL: val=        -26
# KERNEL: val=        -96
# KERNEL: val=         10
# KERNEL: val=         36
# KERNEL: val=         44
# KERNEL: val=         55
# KERNEL: val=         42
# KERNEL: val=         12
# KERNEL: val=         62
# KERNEL: val=        -31
# KERNEL: val=        -76
# KERNEL: val=        -62
# KERNEL: val=         45
# KERNEL: val=        -32
