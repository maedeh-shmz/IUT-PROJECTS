`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    10:50:24 07/25/2020 
// Design Name:   incrementer 
// Module Name:   D:/files/FPGA_MIPS/Test_incrementer.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: incrementer 
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_incrementer;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	incrementer  incrementer_ins (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here
		
		#100
		in = 32'h00000000;
		
		#30
		in = 32'hffffffff;
		
		#55
		in = 32'h35ac7690;

	end
      
endmodule

