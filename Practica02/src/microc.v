// Darío Fajardo Álvarez
// José Miguel Díaz González

module microc(output wire [5:0] Opcode, output wire zero, input wire clk, reset, s_inc, s_inm, we, wez, input wire [2:0] ALUOp);
//Microcontrolador sin memoria de datos de un solo ciclo
  wire [15:0] instruccion; // Instrucción que se lee de memoria
  wire [9:0] dir_salto, nuevo_PC, PC_actual, sum_out; // Direcciones de PC
  wire [7:0] RD1, RD2, mux_alu_out, WD3; // Datos leidos de registros y salida de la ALU
  wire [7:0] inm; // Dato inmediato
  wire [3:0] RA1, WA3, RA2, mux3_out; // Direcciones de registros y salida de mux3
  wire zalu; // Salida de la señar zero de la ALU

  assign dir_salto = instruccion[9:0]; // Los 10 bits menos significativos de la instrucción son la dirección de salto
  assign Opcode = instruccion[15:10]; // Los 6 bits más significativos de la instrucción son el Opcode
  assign RA1 = instruccion[11:8]; // Los 4 bits menos significativos de la instrucción son la dirección del primer registro
  assign RA2 = instruccion[7:4]; // Los 4 bits menos significativos de la instrucción son la dirección del segundo registro
  assign WA3 = instruccion[3:0]; // Los 4 bits menos significativos de la instrucción son la dirección del registro de escritura
  assign inm = instruccion[11:4]; // Bits de la instruccion que representan un dato inmediato

  mux2 #(10) mux_pc (nuevo_PC, dir_salto, sum_out, s_inc); // Mux para la selección de la dirección de PC
  registro #(10) pc (PC_actual, clk, reset, nuevo_PC); // Registro para el PC
  sum sum1 (sum_out, PC_actual, 10'b0000000001); // Sumador para la siguiente dirección de PC
  memprog memprog1 (instruccion, clk, PC_actual); // Memoria de programa
  mux2 #(4) mux3 (mux3_out, RA1, WA3, s_inm); // Mux para la selección de la dirección de registro
  regfile regfile1 (RD1, RD2, clk, we, mux3_out, RA2, WA3, WD3); // Banco de registros
  mux2 #(8) mux_alu (mux_alu_out, RD2, inm, s_inm); // Mux para la selección de la segunda entrada de la ALU
  alu alu1 (WD3, zalu, RD1, mux_alu_out, ALUOp); // ALU
  ffd ffz(clk, reset, zalu, wez, zero); // Biestable con el flag de cero
endmodule