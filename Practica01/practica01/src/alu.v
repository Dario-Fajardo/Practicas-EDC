module alu(output wire [3:0] R, output wire zero, c_out, sign, input wire [3:0] A, B, input wire c_in,
input wire [1:0] ALUOP, input wire l);

// CERO Y UNO
wire[3:0] cero, uno;
assign cero = 4'b0000;
assign uno = 4'b0001;

// SEÑALES INTERNAS
wire [3:0] mux_add1_out, OP1, mux_op2_B_out, OP2;
wire [3:0] ul_out, sum_out;

// SEÑALES QUE CONTROLAN LOS MUX Y EL CPL1
wire op1_A, op2_B, add1, cpl;
assign op1_A = (l | (ALUOP[1] & ~ALUOP[0]));
assign op2_B = (l | (ALUOP[1] & ~ALUOP[0]));
assign add1 = ALUOP[0];
assign cpl = (~l & ~ALUOP[1] & ALUOP[0]);

// MÓDULOS

// Mux de la primera parte del circuito y el complementador a 1
mux2_4 mux_add1(mux_add1_out, cero, uno, add1);
mux2_4 mux_op1_A(OP1, mux_add1_out, A, op1_A);
mux2_4 mux_op2_B(mux_op2_B_out, A, B, op2_B);
compl1 cpl1(OP2, mux_op2_B_out, cpl);
// Sumador y unidad lógica
sum4_v2 sum(sum_out, c_out, OP1, OP2, c_in);
ul4 ul(ul_out, OP1, OP2, ALUOP);
// Mux que elige si la operación elegida será la aritmética o la lógica
mux2_4 mux_R(R, sum_out, ul_out, l);

// SEÑALES ZERO Y SIGN
assign zero = (R == 4'b0000) ? 1'b1 : 1'b0;
assign sign = R[3];

endmodule