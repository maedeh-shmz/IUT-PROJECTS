`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:37:05 07/25/2020
// Design Name:   regbank
// Module Name:   D:/FPGA_MIPS/Test_regbank.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: regbank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_regbank;

	// Inputs
	reg clk;
	reg reg_write;
	reg [4:0] read_reg1;
	reg [4:0] read_reg2;
	reg [4:0] write_reg;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;

	// Instantiate the Unit Under Test (UUT)
	regbank regbank_ins (
		.clk(clk), 
		.reg_write(reg_write), 
		.read_reg1(read_reg1), 
		.read_reg2(read_reg2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.read_data1(read_data1), 
		.read_data2(read_data2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reg_write = 0;
		read_reg1 = 0;
		read_reg2 = 0;
		write_reg = 0;
		write_data = 0;
	end

	initial repeat (60) #5 clk = ~clk;
	
	initial begin
		#10
		reg_write = 1;
		write_reg = $random;
		write_data = $random;
		read_reg1 = 0;
		read_reg2 = $random;
		
		#15
		reg_write = 1;
		read_reg1 = $random;
		read_reg2 = 5'h4;
		write_reg = $random;
		write_data = $random;
		
		#17
		reg_write = 0;
		read_reg1 = 5'h0d;
		read_reg2 = 5'h4;
		write_reg = $random;
		write_data = $random;
		

	end
      
endmodule

