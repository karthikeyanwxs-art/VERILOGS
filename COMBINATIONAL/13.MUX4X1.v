module mux4x1(I,S,Y);
  input[3:0] I;
  input [1:0]S;
  output reg Y;
  
   always @(*)begin
     case(S)
      2'b00:Y=I[0];     
      2'b01:Y=I[1];    
      2'b10:Y=I[2];     
      2'b11:Y=I[3];
    endcase
  end
 endmodule

module tb();
  reg[3:0]i;
  reg[1:0]s;
  wire y;
  
  mux4x1 aa(i,s,y);
  
  initial begin
    $monitor("@ %0t the sel=%b and the output = %b",$time,s,y);
    
    i[0]=1'b0;
    i[1]=1'b1;
    i[2]=1'b0;
    i[3]=1'b0;
    #10 s=2'b00;   
    #10 s=2'b11;
    #10 s=2'b10;
    #10 s=2'b01;
    #10 $finish;
    
  end
  
  initial begin
    $dumpfile("mux4x1.vcd");
    $dumpvars(0,tb);
  end
  
endmodule
    

    
  

  
    
    
    
