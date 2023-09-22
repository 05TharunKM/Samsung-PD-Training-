`timescale 1ns / 1ps
module tb_mythcore_test;
	// Inputs
	reg clk, reset;
	// Outputs
	wire [9:0] out;

        // Instantiate the Unit Under Test (UUT)
	core uut (
		.clk(clk),
		.reset(reset),
		.out(out)
	);

	initial begin
        $dumpfile("postsynth_TB.vcd");
        $dumpvars;
        clk = 1;
        reset = 0;
        #20 reset = 1;
	#200 reset = 0;
        #2000 $finish;
        end
        always #1 clk = ~clk;

endmodule
