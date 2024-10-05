// 32-bit NOR
module NOR32_2x1(Y,A,B);
//output 
output [31:0] Y;
//input
input [31:0] A;
input [31:0] B;

  genvar i; 
  generate
    for ( i = 0; i<32;i=i+1) begin : nor_gate
      nor(Y[i], A[i], B[i]);
    end 
  endgenerate

endmodule

// 32-bit AND
module AND32_2x1(Y,A,B);
//output 
output [31:0] Y;
//input
input [31:0] A;
input [31:0] B;

  genvar i; 
  generate
    for ( i = 0; i<32;i=i+1) begin : and_gate
      and(Y[i], A[i], B[i]);
    end 
  endgenerate

endmodule

// 32-bit inverter
module INV32_1x1(Y,A);
//output 
output [31:0] Y;
//input
input [31:0] A;

  genvar i; 
  generate
    for ( i = 0; i<32;i=i+1) begin : not_gate
      not(Y[i], A[i]);
    end 
  endgenerate

endmodule

// 32-bit OR
module OR32_2x1(Y,A,B);
//output 
output [31:0] Y;
//input
input [31:0] A;
input [31:0] B;

  genvar i; 
  generate
    for ( i = 0; i<32;i=i+1) begin : or_gate
      or(Y[i], A[i], B[i]);
    end 
  endgenerate

endmodule
