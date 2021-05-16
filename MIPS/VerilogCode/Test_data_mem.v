`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:18:53 07/25/2020
// Design Name:   data_mem
// Module Name:   D:/files/FPGA_MIPS/Test_data_mem.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_data_mem;

	// Inputs
	reg clk;
	reg [6:0] addr;
	reg mem_wr;
	reg mem_rd;
	reg [31:0] wr_data;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_mem data_mem_ins (
		.clk(clk), 
		.addr(addr), 
		.mem_wr(mem_wr), 
		.mem_rd(mem_rd), 
		.wr_data(wr_data), 
		.read_data(read_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		addr = 0;
		mem_wr = 0;
		mem_rd = 0;
		wr_data = 0;	
	end
	
	initial repeat (40) #5 clk = ~clk;
	
	initial begin
		#25
		mem_wr = 1;
		mem_rd = 0;
		addr = $random;
		wr_data = $random;

		#10
		mem_wr = 0;
		mem_rd = 1;
		addr = 7'h24;
		
		
		#10
		mem_wr = 0;
		mem_rd = 0;
		addr = $random;
		wr_data = $random;
		
	end
      
endmodule

