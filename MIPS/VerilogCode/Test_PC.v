`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:02:48 07/25/2020
// Design Name:   PC
// Module Name:   D:/files/FPGA_MIPS/Test_PC.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_PC;

	// Inputs
	reg clk;
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	PC PC_ins (
		.clk(clk), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	initial repeat (50) #5 clk = ~clk;
	
	initial begin 
		#100 
		in = $random;
		
		#50
		in = $random;
		
		#20
		in = $random;
	end
      
endmodule

