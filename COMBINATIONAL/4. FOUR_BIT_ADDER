module fulladder(A,B,C,S,Cout);
input A,B,C;
output Cout,S;
assign S=A^B^C;
assign Cout= B&C|(A&(B^C));
endmodule

module four_bit_adder(a,b,cin,sum,cout);
input [3:0]a,b;
input cin;
output cout;
output [3:0]sum;
wire c1,c2,c3;

fulladder aa(a[0],b[0],cin,sum[0],c1);
fulladder bb(a[1],b[1],c1,sum[1],c2);
fulladder cc(a[2],b[2],c2,sum[2],c3);
fulladder dd(a[3],b[3],c3,sum[3],cout);

endmodule





module tb();
reg [3:0]x,y;
reg zin;
wire [3:0]sum;
wire carry;

four_bit_adder add(x,y,zin,sum,carry);

initial begin
    $monitor("@ %t the a=%b,b=%b,cin=%b the output is cout=%b,s=%b",$time,x,y,zin,carry,sum);
    x=4'b0010;y=4'b1010;zin=1'b0;
    #10 x=4'b0010;y=4'b1010;zin=1'b1;
    #10 x=4'b1111;y=4'b1111;zin=1'b0;
    #10 x=4'b1111;y=4'b1111;zin=1'b1;
    #10 $finish;
end
initial begin
    $dumpfile("four_bit_adder.vcd");
    $dumpvars(0,tb);
end

endmodule
