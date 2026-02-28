module fulladd(a,b,cin,s,c);
  input a,b,cin; output s,c;
  assign s=a^b^cin;
  assign c=(b&cin)|(a&(b^cin));
     
endmodule

module addsub (a,b,cin,s,cout);
  input [3:0] a,b; 
  input cin;
  output [3:0] s;
  output cout;
  wire bn [3:0];
  wire c[2:0];
  assign bn[0]=b[0]^cin;
  assign bn[1]=b[1]^cin;
  assign bn[2]=b[2]^cin;
  assign bn[3]=b[3]^cin;
  
  
  
  fulladd aa(a[0],bn[0],cin,s[0],c[0]);
  fulladd bb(a[1],bn[1],c[0],s[1],c[1]); 
  fulladd cc(a[2],bn[2],c[1],s[2],c[2]); 
  fulladd dd(a[3],bn[3],c[2],s[3],cout);
  
endmodule


 module tb;
 reg [3:0] x,y;
 reg zin;
 wire [3:0]sum;
 wire carry;
   
addsub aa(x,y,zin,sum,carry);
   
   initial begin 
     $monitor("@ %0t the input x=%b y=%b zin=%b y=%b %b",$time,x,y,zin,carry,sum);
     
       x=4'b1110;y=4'b0010;zin=1'b0;
    #10 x=4'b1110;y=4'b0010;zin=1'b1;
    #10 x=4'b1111;y=4'b1111;zin=1'b0;
    #10 x=4'b1111;y=4'b1111;zin=1'b1;
    #10 $finish;
   end
   
   initial begin 
     $dumpfile("addsub.vcd");
     $dumpvars(0,tb);
   end
   
 endmodule
