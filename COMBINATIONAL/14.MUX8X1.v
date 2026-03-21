module mux8x1(I,S,Y);
  input [7:0]I;
  input [2:0]S;
  output Y;
  
  always@(*) begin
    case(S)
      3'b000:Y=I[0];
      3'b001:Y=I[1];  
      3'b010:Y=I[2];
      3'b011:Y=I[3]; 
      3'b100:Y=I[4]; 
      3'b101:Y=I[5]; 
      3'b110:Y=I[6];      
      3'b111:Y=I[7];
     
      end case
        
     end
        endmodule


module tb();
  reg[7:0]i; reg[2:0]s; wire y;
  
  mux8x1 aa(i,s,y);
  
  initial begin
    $monitor ("@ %0t the sel=5b and the output=%b" ,$time,s,y);
