module fulladder(a,b,cin,s,c);
  input a,b,cin;
  output s,c;
  assign s=a^b^cin;
  assign c=b&cin|(a&(b^cin));
endmodule

module add(a,b,cin,s,c);
  input [3:0] a,b;
  input cin;
  output [3:0]s;
  output c;
  wire c[2:0];
  
  fulladder(a[0],b[0],cin,s[0],c[0]);
  fulladder(a[1],b[1],c[0],s[1],c[2]);  
  fulladder(a[2],b[2],c[2],s[2],c[3]); 
  fulladder(a[3],b[3],c[3],s[3],c);
  
endmodule

module top (a,b,c);
  input [3:0]b;
  input [2:0]a;
  output[6:0]c;
  wire g[2:0],p[3:0],k[3:0];
  wire ca[2:0],cb[2:0],q[3:0];
  wire h;
  
  
  assign g={4{a[0]}} & b;
  assign k={4{a[1]}}&b;
  assign p={4{a[2]}}&b;
  assign c[0]=a[0]&b[0];
  add ({1'b0,b[3],b[2],b[1]},k,1'b0,q,h);
  assign c[1]=q[0];
  add ({h,s[3],s[2],s[1]},p,1'b0,{c[5],c[4],c[3],c[2]},c[6]);
  
endmodule


 module tb;
   reg [3:0]b;
   reg [2:0]a;
   wire [6:0];
   
   top aa (a,b,c);
   
   initial begin
     $monitor ("@ %0t the a= %b b=%b and the out=%b",$time,a,b,c);
        x=4'b1110;y=4'b010;
    #10 x=4'b1110;y=4'b110;
    #10 x=4'b1111;y=4'b111;
    #10 x=4'b1111;y=4'b101;
    #10 $finish;

end

initial begin 
  $dumpfile("top.vcd");
    $dumpvars(0,tb);
end

endmodule

  
