`timescale 1ns / 10ps

module microc_tb;
  reg clk, reset, s_inc, s_inm, we, wez;
  reg [2:0] ALUOp;
  wire [5:0] Opcode;
  wire zero;

  microc microc1 (Opcode, zero, clk, reset, s_inc, s_inm, we, wez, ALUOp);

  always
    begin
      clk = 1'b1;
      #10;
      clk = 1'b0;
      #10;
    end

  initial
    begin
      reset = 1'b1;
      #5
      reset = 1'b0;
    end

  initial
    begin
      $dumpfile("microc_tb.vcd");
      $dumpvars;
      $monitor("tiempo=%0d, clk=%b, reset=%b, s_inc=%b, s_inm=%b, we=%b, wez=%b, ALUOp=%b, Opcode=%b, zero=%b", $time, clk, reset, s_inc, s_inm, we, wez, ALUOp, Opcode, zero);
      
      #20;
      s_inm = 1'b0;
      s_inc = 1'b1;
      we = 1'b1;
      wez = 1'b1;
      ALUOp = 3'b010;
      
      #20;
      s_inm = 1'b1;
      s_inc = 1'b1;
      we = 1'b1;
      wez = 1'b0;
      ALUOp = 3'b010;

      #20;
      s_inc = 1'b0;
      we = 1'b0;
      wez = 1'b0;

      #20;
      s_inm = 1'b0;
      s_inc = 1'b1;
      we = 1'b1;
      wez = 1'b1;
      ALUOp = 3'b011;

      $finish;
    end
endmodule