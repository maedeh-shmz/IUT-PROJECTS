`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    10:45:43 07/25/2020 
// Design Name:   add
// Module Name:   D:/files/FPGA_MIPS/Test_add.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: add
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_add;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	add add_ins(
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		#20
		a = $random;
		b = $random;

	end
      
endmodule

