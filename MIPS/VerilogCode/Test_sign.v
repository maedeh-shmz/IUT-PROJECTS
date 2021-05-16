`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    11:28:23 07/25/2020 
// Design Name:   sign
// Module Name:   D:/files/FPGA_MIPS/Test_sign.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_sign;

	// Inputs
	reg clk;
	reg [15:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	sign sign_ins (
		.clk(clk), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in = 0;
	end
	
	initial repeat (10) #5 clk = ~clk;
	
	initial begin

		#20
		in = 16'ha43d;
		
		#30
		in = 16'h7a0b;


	end
      
endmodule

