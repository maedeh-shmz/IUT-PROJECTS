`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:23 07/25/2020 
// Design Name: 
// Module Name:    sign 
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
module sign(input clk,input [15:0] in,output reg [31:0] out);
	 
	reg [15:0] ex_0 = 16'h0000;
	reg [15:0] ex_1 = 16'hffff;
	
	always @(posedge clk) begin
		if(in[15]) begin
			out <= {ex_1, in};
		end
		else begin
			out <= {ex_0, in};
		end
	end

endmodule
