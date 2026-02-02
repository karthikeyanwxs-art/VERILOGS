module fullsub(x,y,zin,d,bo);
  input x,y,zin;
  output d,bo;
  assign d=x^y^zin;
  assign bo=(y&zin)|(~x&y)|(~x&zin); 
endmodule
 
module tb();
  reg a,b,zin;
  wire d,bo;
  fullsub aa(a,b,zin,d,bo);
  initial begin 
    $monitor("@ %0t the input a=%b b=%b c=%b the output d=%b bo=%b",$time,a,b,zin,d,bo);
    a=1'b0;b=1'b0;zin=1'b0;
    #10 a=1'b0;b=1'b0;zin=1'b1;
    #10 a=1'b0;b=1'b1;zin=1'b0;
    #10 a=1'b0;b=1'b1;zin=1'b1;
    #10 a=1'b1;b=1'b0;zin=1'b0;
    #10 a=1'b1;b=1'b0;zin=1'b1;
    #10 a=1'b1;b=1'b1;zin=1'b0;
    #10 a=1'b1;b=1'b1;zin=1'b1;
  end 
  initial begin  
    $dumpfile("halfsub.vcd");
    $dumpvars(0,tb);
  end
endmodule
