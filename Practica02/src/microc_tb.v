// Darío Fajardo Álvarez
// José Miguel Díaz González

`timescale 1ns / 10ps

module microc_tb;
  reg test_clk, test_reset, test_s_inc, test_s_inm, test_we, test_wez;
  reg [2:0] test_ALUOp;
  wire [5:0] test_Opcode;
  wire test_zero;

  microc microc1 (test_Opcode, test_zero, test_clk, test_reset, test_s_inc, test_s_inm, test_we, test_wez, test_ALUOp);

  always
    begin
      test_clk = 1'b1;
      #20;
      test_clk = 1'b0;
      #20;
    end

  initial
    begin
      test_reset = 1'b1;
      #10
      test_reset = 1'b0;
    end

  initial
    begin
      $dumpfile("microc_tb.vcd");
      $dumpvars;
      $monitor("tiempo=%0d, clk=%b, reset=%b, s_inc=%b, s_inm=%b, we=%b, wez=%b, ALUOp=%b, Opcode=%b, zero=%b", $time, test_clk, test_reset, test_s_inc, test_s_inm, test_we, test_wez, test_ALUOp, test_Opcode, test_zero);
      #20 // LI #10 R10
      test_s_inm = 1;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b000;
      test_wez = 0;

      #40 // MOV R10 R12
      test_s_inm = 0;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b000;
      test_wez = 0;

      #40 // MOV R0 R1
      test_s_inm = 0;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b000;
      test_wez = 0;

      #40 // SBI #2 R12
      test_s_inm = 1;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b011;
      test_wez = 1;

      #40 // SUB R10 R12 R11
      test_s_inm = 0;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b011;
      test_wez = 1;

      #40 // JNZ NEXT
      test_we = 0;
      test_wez = 0;
      test_s_inc = test_zero;

      #40 // ADI #1 R12
      test_s_inm = 1;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b010;
      test_wez = 1;

      #40 // ADI #1 R1
      test_s_inm = 1;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b010;
      test_wez = 1;

      #40 // J CHECK
      test_we = 0;
      test_wez = 0;
      test_s_inc = 0;

      #40 // SUB R10 R12 R11
      test_s_inm = 0;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b011;
      test_wez = 1;

      #40 // JNZ NEXT
      test_we = 0;
      test_wez = 0;
      test_s_inc = test_zero;

      #40 // ADI #1 R12
      test_s_inm = 1;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b010;
      test_wez = 1;

      #40 // ADI #1 R1
      test_s_inm = 1;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b010;
      test_wez = 1;

      #40 // J CHECK
      test_we = 0;
      test_wez = 0;
      test_s_inc = 0;

      #40 // SUB R10 R12 R11
      test_s_inm = 0;
      test_s_inc = 1;
      test_we = 1;
      test_ALUOp = 3'b011;
      test_wez = 1;

      #40 // JNZ NEXT
      test_we = 0;
      test_wez = 0;
      test_s_inc = test_zero;

      #40 // J END
      test_we = 0;
      test_wez = 0;
      test_s_inc = 0;

      #40 // J END
      test_we = 0;
      test_wez = 0;
      test_s_inc = 0;

      #20
      $finish;
    end
endmodule