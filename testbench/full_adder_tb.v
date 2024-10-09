`include "full_adder.v"


module full_adder_tb;
	reg a, b, cin;
	wire sum, carry;
	
	full_adder fadd(a,b,cin,carry,sum);

	initial begin
		$dumpfile("./output/full_adder.vcd");
		$dumpvars(0, full_adder_tb);
		// test begin.
        a = 0; b = 0; cin = 0;
        #1;
        a = 0; b = 0; cin = 1;
        #1;
        a = 0; b = 1; cin = 0;
        #1;
        a = 0; b = 1; cin = 1;
        #1;
        a = 1; b = 0; cin = 0;
        #1;
        a = 1; b = 0; cin = 1;
        #1;
        a = 1; b = 1; cin = 0;
        #1;
        a = 1; b = 1; cin = 1;
	end 

endmodule
