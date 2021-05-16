`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:22:43 07/25/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(input clk, input [31:0] a, b,input [3:0] mode,output reg zero,output reg [31:0] ALU_res);
	
	reg [31:0] tmp;
	

	always @(*) begin
	
		case (mode)
			4'b0000: tmp <= a & b;
			4'b0001: tmp <= a | b;
			4'b0010: tmp <= a + b;
			4'b0110: tmp <= a - b;
			4'b0111: tmp <= (a>b) ? b : a;
			4'b1100: tmp <= ~(a | b);
			default: tmp <= tmp;
		endcase
	end
	
	always @(posedge clk) begin
		if(a == b) begin
			zero <= 1;
		end
		else begin
			zero <= 0;
		end
		ALU_res <= tmp;
	end
endmodule
