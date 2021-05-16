`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:19 07/25/2020 
// Design Name: 
// Module Name:    regbank 
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
module regbank(input clk, reg_write,input [4:0] read_reg1, read_reg2, write_reg,input [31:0] write_data,output [31:0] read_data1, read_data2);
	reg [31:0] regbank [31:1];
	reg [31:0] R = 0;
	
	assign read_data1 = (read_reg1 == 0) ? 0 : regbank[read_reg1];
	assign read_data2 = (read_reg2 == 0) ? 0 : regbank[read_reg2];

	always @(posedge clk) begin
		if(reg_write) begin
			if(write_reg == 0)
				R <= R;
			else
				regbank[write_reg] <= write_data;
		end
	end

endmodule
