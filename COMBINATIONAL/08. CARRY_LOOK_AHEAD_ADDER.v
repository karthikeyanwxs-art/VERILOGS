module cla(a,b,cin,s,cout);
  input [3:0]a,b;
  input cin;
  output [3:0]s;
  output cout;
  wire [3:0]p,g;
  wire [3:1]c;
  
  assign p[0] = a[0]^b[0];
  assign p[1] = a[1]^b[1];
  assign p[2] = a[2]^b[2];
  assign p[3] = a[3]^b[3];
  
  assign g[0] = a[0]&b[0];
  assign g[1] = a[1]&b[1];
  assign g[2] = a[2]&b[2];
  assign g[3] = a[3]&b[3];
  
  assign c[1] = g[0]|(p[0]&cin);
  assign c[2] = g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
  assign c[3] = g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
  assign cout = g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
  
  assign s[0] = p[0]^cin;
  assign s[1] = p[1]^c[1];
  assign s[2] = p[2]^c[2];
  assign s[3] = p[3]^c[3];
  
endmodule
  
  
  module tb();

reg [3:0]x,y;
reg zin;
wire [3:0]s;
wire c;

cla aa(x,y,zin,s,c);

initial begin 
  $monitor("@ %0t the input a=%b,b=%b,cin=%b and the output is y=%b",$time,x,y,zin,{c,s});
  x=4'b0000;y=4'b1110;zin=1'b1;
  #10 x=4'b0000;y=4'b1110;zin=1'b1;
  #10 x=4'b1111;y=4'b1110;zin=1'b0;
  #10 x=4'b1111;y=4'b1111;zin=1'b1; 
  #10 x=4'b1111;y=4'b1100;zin=1'b1;
  #10 x=4'b1111;y=4'b1111;zin=1'b0;
  #10 $finish;
  
end

initial begin
  $dumpfile ("cla.vcd");
  $dumpvars (0,tb);
  
end
  
endmodule

