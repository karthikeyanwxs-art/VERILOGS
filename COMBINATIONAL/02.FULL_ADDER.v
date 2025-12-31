  module fulladder(input A,B,C,output S,Cout);
    xor sum(S,A,B,C);
    assign Cout= (B&C)|(A&C)|(A&B); // (B&C)|(A&(B^C))
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


