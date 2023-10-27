module signals(output wire zero, c_out, sign, input wire [3:0] R, input wire carry_sum, input wire l);
// Zero con una or
wire or_1;
or or_zero(or_1,R[3],R[2],R[1],R[0]);
not (zero, or_1);
// mux de puertas para cout
wire not_cout_out, and1_cout_out, and2_cout_out;
not not_l(not_cout,l);
and and1_cout(and1_cout_out,carry_sum,not_cout);
and and2_cout(and2_cout_out,1'bx,l);
or or_cout(c_out,and1_cout_out,and2_cout_out);
// mux de puertas para sign
wire not_sign_out, and1_sign_out, and2_sign_out;
and and1_sign(and1_sign_out,not_cout,R[3]);
and and2_sign(and2_sign_out,not_cout,R[3]);
or or_sign(sign,and1_sign_out,and2_sign_out);
endmodule