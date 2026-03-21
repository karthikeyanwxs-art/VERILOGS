module halfadder(input a,b,output s,c);
assign s=a^b;
assign c=a&b;
endmodule

module tb();
  reg a,b;
  wire s,c;

  
module tb();
  reg a,b;
  wire d,bo;
  halfsub aa(a,b,d,bo);
  initial begin
    $monitor("@ %0t the input a=%b b=%b the output d=%b bo=%b",$time,a,b,d,bo);
    a=1'b0;b=1'b0;
    #10 a=1'b0;b=1'b1;
    #10 a=1'b1;b=1'b0;
    #10 a=1'b1;b=1'b1;
    #10 $finish;
  end
  initial begin 
    $dumpfile("halfsub.vcd");
    $dumpvars(0,tb); 
  end
endmodule
