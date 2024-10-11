`include "full_adder.v"

module ripple_carry_adder(A, B, Cin,Sum,Cout);
input [3:0] A, B; 
input Cin;
output [3:0] Sum;
output Cout;

wire [3:0] c; 

full_adder f0(A[0], B[0], Cin, c[0], Sum[0]);

genvar i;
generate
	for ( i = 1; i < 3; i = i+1 ) begin:add_loop
		full_adder fadd(A[i], B[i],c[i-1] , c[i], Sum[i]);
	end		
endgenerate

full_adder f1(A[3], B[3], c[2], Cout, Sum[3]);
endmodule

