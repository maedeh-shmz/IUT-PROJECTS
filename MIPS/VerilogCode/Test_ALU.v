`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    10:40:43 07/25/2020 
// Design Name:   ALU
// Module Name:   D:/files/FPGA_MIPS/Test_ALU.v
// Project Name:  FPGA_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ALU;

	// Inputs
	reg clk;
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] mode;

	// Outputs
	wire zero;
	wire [31:0] ALU_res;

	// Instantiate the Unit Under Test (UUT)
	ALU ALU_ins (
		.clk(clk),
		.a(a), 
		.b(b), 
		.mode(mode), 
		.zero(zero), 
		.ALU_res(ALU_res)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		a = 0;
		b = 1;
		mode = 0;
	end

		// Wait 100 ns for global reset to finish
		//#100;
   initial repeat (40) #5 clk = ~clk;   
		// Add stimulus here
	initial begin
		#20
		a = 32'h01010101;
		b = 32'h01010101;
		mode = 4'b0000;
		
		#20
		a = $random;
		b = $random;
		mode = 4'b0001;
		
		#20
		a = $random;
		b = $random;
		mode = 4'b0010;
		
		#20
		a = $random;
		b = $random;
		mode = 4'b0110;
		
		#20
		a = $random;
		b = $random;
		mode = 4'b0111;
		
		#20
		a = 32'h00110101;
		b = 32'h0011fefd;
		mode = 4'b1100;

	end
      
endmodule

