module cl(output wire out, input wire a, b, input wire [1:0] S);

wire and_o, or_o, xor_o, not_o; 

and and1(and_o, a, b);
or or1(or_o, a, b);
xor xor1(xor_o, a, b);
not not1(not_o, a);

mux4_1 mux_cl(out, and_o, or_o, xor_o, not_o, S);

endmodule
