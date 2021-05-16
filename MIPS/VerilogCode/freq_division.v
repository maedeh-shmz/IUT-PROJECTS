`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:30 07/25/2020 
// Design Name: 
// Module Name:    freq_division 
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
module fre_division(input clk,output reg clk_out=0);
	reg [3:0] cnt = 0;
	
	always @(posedge clk) begin
	
			if(cnt == 9) begin
				clk_out = 1;
				cnt = 0;
			end
		
			else begin
				clk_out = 0;
				cnt = cnt + 1;
			end
	end
endmodule
