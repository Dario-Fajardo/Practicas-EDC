`timescale 1ns / 10ps

module microc_tb();
  reg clk, reset, s_inc, s_inm, we, wez;
  reg [2:0] ALUOp;
  wire [5:0] Opcode;
  wire zero;

  microc microc1 (Opcode, zero, clk, reset, s_inc, s_inm, we, wez, ALUOp);

  initial
    begin 
      clk = 0;
    end
  
  initial
    begin
      reset = 1;
      #5
      reset = 0;
    end

  always
    begin
      clk = ~clk;
      #20
    end
endmodule