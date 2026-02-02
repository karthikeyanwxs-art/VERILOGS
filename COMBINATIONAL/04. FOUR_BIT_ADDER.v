module fulladder(a,b,cin,s,cout);
input a,b,cin;
output  s,cout;

assign s=a^b^cin;
assign cout= b&cin|(a&(b^cin));
endmodule

module four_bit_adder(A,B,Cin,S,Cout);
input [3:0]A,B;
input Cin;
output [3:0]S;
output Cout;
wire c1,c2,c3;

fulladder aa(A[0],B[0],Cin,S[0],c1);
fulladder bb(A[1],B[1],c1,S[1],c2);
fulladder cc(A[2],B[2],c2,S[2],c3);
fulladder dd(A[3],B[3],c3,S[3],Cout);

endmodule



module tb();
reg [3:0]x,y;
reg Zin;
wire [3:0]Sum;
wire carry;

 four_bit_adder add(x,y,Zin,Sum,carry);

initial begin
  $monitor("@ %0t the input is a=%b b=%b cin=%b and the output carry=%b sum=%b",$time,x,y,Zin,carry,Sum);

    x=4'b1110;y=4'b0010;Zin=1'b0;
    #10 x=4'b1110;y=4'b0010;Zin=1'b1;
    #10 x=4'b1111;y=4'b1111;Zin=1'b0;
    #10 x=4'b1111;y=4'b1111;Zin=1'b1;
    #10 $finish;

end

initial begin 
    $dumpfile("four_bit_adder.vcd");
    $dumpvars(0,tb);
end

endmodule
