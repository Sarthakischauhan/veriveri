`include "ripple_carry.v"

module ripple_carry_adder_tb;

    // Inputs
    reg [3:0] A, B;
    reg Cin;

    // Outputs
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    ripple_carry_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Generate the VCD dump for GTKWave
    initial begin
        $dumpfile("./output/ripple_carry_adder.vcd"); // VCD file for GTKWave
        $dumpvars(0, ripple_carry_adder_tb); // Dump all variables
    end

    // Stimulus process
    initial begin
        // Apply inputs
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0001; Cin = 0; #10;
        A = 4'b0011; B = 4'b0010; Cin = 0; #10;
        A = 4'b0101; B = 4'b0011; Cin = 0; #10;
        A = 4'b1101; B = 4'b1010; Cin = 1; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;

        // End simulation
        $finish;
    end

endmodule
