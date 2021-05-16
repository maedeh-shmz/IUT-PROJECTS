`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:09 07/25/2020 
// Design Name: 
// Module Name:    instruction_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instruction_mem(input [4:0] addr,output [31:0] instruction);
	wire [31:0] instruction_mem [31:0];
	
	
	assign instruction_mem[0] = 32'b001000_00000_00001_0000000000000011;
	assign instruction_mem[1] = 32'b001000_00000_00010_0000000000000011;
	assign instruction_mem[2] = 32'b000000_00001_00010_00011_00000_011000;
	
	assign instruction_mem[3] = 32'b100011_00010_00001_0000000000001010;
	assign instruction_mem[4] = 32'b000100_00001_00010_0000000000010100;

	
	assign instruction = instruction_mem[addr];

endmodule
