`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:46 07/25/2020
// Design Name:   MIPS
// Module Name:   D:/files/FPGA_MIPS/Test_MIPS.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_MIPS;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] write_data;
	wire [31:0] mem_addr;
	wire zero;
	wire [31:0] addr;
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	MIPS uut (
		.clk(clk), 
		.write_data(write_data), 
		.mem_addr(mem_addr), 
		.zero(zero), 
		.addr(addr), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		forever #5 clk = ~clk;
	end
      
endmodule

