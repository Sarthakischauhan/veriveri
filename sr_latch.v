
module TWOSCOMP64(Y,A);

output [63:0] Y;

input [63:0] A;

wire [63:0] not_A;
wire [63:0] one = 64'b1; 
wire CO;  


genvar i;
generate
    // Not using our self made inv gate, because then I will need to split.
    for (i = 0; i < 64; i = i + 1) begin
        not(not_A[i], A[i]);
    end
endgenerate

RC_ADD_SUB_64 adder(Y, CO, not_A, one, 1'b0);

endmodule


module TWOSCOMP32(Y,A);

output [31:0] Y;

input [31:0] A;
wire [31:0] not_A;  
wire [31:0] one = 1'b1; 
wire CO;

INV32_1x1 inv(not_A, A);

RC_ADD_SUB_32 adder(Y, CO, not_A, one, 1'b0);

endmodule

// NAND for 2 bit input and 3 bit input
module NAND2x1(Y, A, B);
input A;
input B;

output Y;

wire i;

and (i, A, B);
not (Y, i);

endmodule

module NAND3x1(Y, A, B, C);
input A;
input B;
input C;

output Y;

wire i;

and (i, A, B, C);
not (Y, i);

endmodule


// 32-bit registere +ve edge, Reset on RESET=0
module REG32(Q, D, LOAD, CLK, RESET);
output [31:0] Q;

input CLK, LOAD;
input [31:0] D;
input RESET;

genvar idx;
generate
    for (idx = 0; idx < 32; idx = idx + 1) begin
        REG1 reg_unit(Q[idx], D[idx], LOAD, CLK, (1'b1), RESET);
    end
endgenerate

endmodule

// 1 bit register +ve edge, 
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module REG1(Q, Qbar, D, L, C, nP, nR);
input D, C, L;
input nP, nR;
output Q,Qbar;

wire mux_output;

MUX1_2x1 data_select(mux_output, Q, D, L);
D_FF flip_flop(Q, Qbar(Qbar), mux_output, C, nP, nR);

endmodule

// 1 bit flipflop +ve edge, 
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module D_FF(Q, Qbar, D, C, nP, nR);
input D, C;
input nP, nR;
output Q,Qbar;

wire dlatchy;
wire comp_dlatchy;
wire invert_clock;

not(invert_clock, C);

D_LATCH dlatch1(dlatchy, comp_dlatchy, D, invert_clock, nP, nR);
SR_LATCH srlatch1(Q, Qbar, dlatchy, comp_dlatchy, C, nP, nR);

endmodule

// 1 bit D latch
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module D_LATCH(Q, Qbar, D, C, nP, nR);
input D, C;
input nP, nR;
output Q,Qbar;

wire dnandc;
wire comp_d_nandc;
wire comp_d;

not(comp_d, D);
NAND2x1 nand_1(dnandc,D,C);
NAND2x1 nand_2(comp_d_nandc, comp_d, C);
NAND3x1 nand_3(Q, nP, dnandc, Qbar);
NAND3x1 nand_4(Qbar, nR, comp_d_nandc. Q);

endmodule

// 1 bit SR latch
// Preset on nP=0, nR=1, reset on nP=1, nR=0;
// Undefined nP=0, nR=0
// normal operation nP=1, nR=1
module SR_LATCH(Q,Qbar, S, R, C, nP, nR);
input S, R, C;
input nP, nR;
output Q,Qbar;

wire snandc;
wire rnandc;

NAND2x1 nand_1(snandc, S, C);
NAND2x1 nand_2(rnandc, R, C);
NAND3x1 nand_3(Q, nP, snandc, Qbar);
NAND3x1 nand_4(Qbar, nR, rnandc, Q);

endmodule

// 5x32 Line decoder
module DECODER_5x32(D,I);
// output
output [31:0] D;
// input
input [4:0] I;

// TBD

endmodule

// 4x16 Line decoder
module DECODER_4x16(D,I);
// output
output [15:0] D;
// input
input [3:0] I;

// TBD


endmodule

// 3x8 Line decoder
module DECODER_3x8(D,I);
// output
output [7:0] D;
// input
input [2:0] I;

//TBD


endmodule

// 2x4 Line decoder
module DECODER_2x4(D,I);
// output
output [3:0] D;
// input
input [1:0] I;

// TBD

endmodule
