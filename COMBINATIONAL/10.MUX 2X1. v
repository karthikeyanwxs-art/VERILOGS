module mux (I,S,Y);
  input [1:0]I; input S;
output reg Y;

always @ (*)
  begin
  if(S==0)
    Y=I[0];
  else
    Y=I[1];
  end
  
endmodule 




module tb();
  reg [1:0]In;
  reg Sel;
wire Out;
  mux aa(In,Sel,Out);  
  initial begin
    $monitor("@ %0t the S=%b,the output =%b",$time,Sel,Out);
    In[0]=1'b1;
    In[1]=1'b0;
	Sel = 1'b0;
    #10 Sel = 1'b1;
    #10 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
