module half_adder(Y,C,A,B);
input A,B;
output Y, C;

xor(Y,A,B);
and(C,A,B);

endmodule
