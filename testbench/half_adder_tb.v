`include "half_adder.v"

module half_adder_tb;
	reg a, b;
	wire sum, carry;
	
	half_adder hadd(sum, carry, a, b);

	initial begin
		$dumpfile("./output/half_adder.out");
		$dumpvars(0, half_adder_tb);
		// test begin.
		a = 0; b = 0;
		#1
		a = 1; b = 1;
		#1 
		a = 0; b = 1;
		#1
		a = 1; b = 0;
	end 

endmodule
