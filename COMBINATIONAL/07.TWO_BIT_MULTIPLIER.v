// module halfadder(a,b,s,c);
// input a,b;
// output s,c;
// assign s= a^b;
// assign c=a&b;
// endmodule

// module twobit(A,B,P);
// input [1:0] A,B ;
//   output [3:0]P;
// wire c1;
//   wire [3:0]g;

// // assign g[0]=A[0]&B[0];
// assign g[1]=A[1]&B[0];
// assign g[2]=A[0]&B[1];
// assign g[3]=A[1]&B[1];

// assign P[0]=A[0]&B[0];
// halfadder aa(g[1],g[2],P[1],c1);
// halfadder bb(g[3],c1,P[2],P[3]);

// endmodule


module twobit(a,b,p);
  input [1:0] a,b;
  output [3:0]p;
  
  
assign p[0]=a[0]&b[0];
assign p[1]=(a[1]&b[0])^(a[0]&b[1]);
assign p[2]=(a[1]&b[1])^((a[1]&b[0])&(a[0]&b[1]));
  assign p[3]=((a[1]&b[1])&((a[1]&b[0])&(a[0]&b[1])));
endmodule

 module tb();
   reg [1:0] A,B;
   wire [3:0]P;
twobit vv(A,B,P);

initial begin
  $monitor ("@ %t the input is A= %b ,B= %b and the output is P= %b ",$time,A,B,P);

   A=2'b00;B=2'b00;
#10A=2'b01;B=2'b01;
#10A=2'b10;B=2'b10;
#10A=2'b01;B=2'b10;
#10A=2'b11;B=2'b11;
#10A=2'b11;B=2'b01;
#10A=2'b11;B=2'b10;
#10 $finish;
end

initial begin
    $dumpfile("twobit.vcd");
    $dumpvars(0,tb);
end 
endmodule





