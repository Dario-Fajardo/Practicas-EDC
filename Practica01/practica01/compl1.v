module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);

case(cpl)

  1'b0: Out = Inp;
  1'b1: Out = not(Inp);

endcase  

endmodule