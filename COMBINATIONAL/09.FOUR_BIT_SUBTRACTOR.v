module fulladder(a,b,cin,s,cout);
input a,b,cin;
output  s,cout;

assign s=a^b^cin;
assign cout= b&cin|(a&(b^cin));
endmodule

module four_bit_sub(a,b,s,c);
input [3:0]a,b;
output [3:0]s;
output c;
wire c1,c2,c3;
wire [3:0]bn;
assign bn[0]= ~b[0];
assign bn[1]= ~b[1];
assign bn[2]= ~b[2];
assign bn[3]= ~b[3];

fulladder aa(a[0],bn[0],1'b1,s[0],c1);
fulladder bb(a[1],bn[1],c1,s[1],c2);
fulladder cc(a[2],bn[2],c2,s[2],c3);
fulladder dd(a[3],bn[3],c3,s[3],c);

endmodule


module tb();
reg [3:0]x,y;
wire [3:0]Sum;
wire carry;

 four_bit_sub dd(x,y,Sum,carry);


initial begin
  $monitor("@ %0t the input is a=%b b=%b  and the output carry=%b sum=%b",$time,x,y,carry,Sum);

    x=4'b1110; y=4'b0010;
#10 x=4'b1111; y=4'b0010;
#10 x=4'b1111; y=4'b1111;
#10 x=4'b1001; y=4'b1111;
#40 $finish;

end

initial begin 
    $dumpfile("four_bit_adder.vcd");
    $dumpvars(0,tb);
end

endmodule
