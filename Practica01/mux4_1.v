module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] S);

wire and1_out, and2_out, and3_out, and4_out, nots0_out, nots1_out;

not (nots0_out, S[0]); 
not (nots1_out, S[1]);
and (and1_out, a, nots0_out, nots1_out); 
and (and2_out, b, S[0], nots1_out); 
and (and3_out, c, nots1_out, S[0]);
and (and4_out, d, S[0], S[1]);
or (out, and1_out, and2_out, and3_out, and4_out);
endmodule