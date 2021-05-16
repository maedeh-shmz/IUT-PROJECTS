`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:43:33 07/25/2020
// Design Name:   instruction_mem
// Module Name:   D:/files/FPGA_MIPS/Test_instruction_mem.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instruction_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_instruction_mem;

	// Inputs
	reg [4:0] addr;

	// Outputs
	wire [31:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	instruction_mem instruction_mem_ins (
		.addr(addr), 
		.instruction(instruction)
	);

	initial begin
		// Initialize Inputs
		addr = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here
		#10
		addr = 0;
		
		#15
		addr = 23;
		
		#13
		addr = 31;

	end
      
endmodule

