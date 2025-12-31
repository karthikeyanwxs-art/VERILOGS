module halfadder(input a,b,output s,c);
assign s=a^b;
assign c=a&b;
endmodule

module fulladder(input A,B,C,output S,COUT);
wire s1,c1,c2;
halfadder aa(A,B,s1,c1);
halfadder bb(s1,C,S,c2);
assign COUT = c1|c2;
endmodule


 module tb;
reg a,b,c; wire s,cout;
fulladder add(a,b,c,s,cout);
initial begin
    $monitor("@ %0t a=%b , b=%b , c=%b sum=%b , carry=%b",$time,a,b,c,s,cout);
    a=1'b0;b=1'b0;c=1'b0;
    #10 a=1'b0;b=1'b0;c=1'b1;
    #10 a=1'b0;b=1'b1;c=1'b0;
    #10 a=1'b0;b=1'b1;c=1'b1;
    #10 a=1'b1;b=1'b0;c=1'b0;
    #10 a=1'b1;b=1'b0;c=1'b1;
    #10 a=1'b1;b=1'b1;c=1'b0;
    #10 a=1'b1;b=1'b1;c=1'b1;
    #10 $finish;
end
initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,tb); 
end
endmodule
