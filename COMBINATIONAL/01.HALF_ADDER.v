module halfadder(input a,b,output s,c);
assign s=a^b;
assign c=a&b;
endmodule

module tb();
  reg a,b;
  wire s,c;

  
