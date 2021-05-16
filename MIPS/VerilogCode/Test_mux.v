`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:48:49 07/25/2020
// Design Name:   mux
// Module Name:   D:/files/FPGA_MIPS/Test_mux.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_mux;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg s;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux mux_ins (
		.in1(in1), 
		.in2(in2), 
		.s(s), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here
		
		#30
		s = 0;
		in1 = $random;
		in2 = $random;
		
		#50
		s = 1;
		in1 = $random;
		in2 = $random;

	end
      
endmodule

