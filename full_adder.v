`include "half_adder.v"
module full_adder(A,B,Cin,Cout,Sum);
input A, B;
input Cin;
output Cout, Sum; 

wire x, y,z; 

half_adder hadd1(x,y,A,B);
half_adder hadd2(Sum,z,Cin, x);

or(Cout, y, z);

endmodule
