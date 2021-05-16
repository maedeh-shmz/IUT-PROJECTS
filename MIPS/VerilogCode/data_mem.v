`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:32 07/25/2020 
// Design Name: 
// Module Name:    data_mem 
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
module data_mem(input clk,input [6:0] addr,input  mem_wr, mem_rd, input [31:0] wr_data,output reg [31:0] read_data);

	reg [31:0] data_mem [127:0];
	
	initial begin
		data_mem[13] = 3;
	end
	
	always @(posedge clk) begin
	if(mem_wr==1 & mem_rd==0) 
	data_mem[addr] <= wr_data;
	else if(mem_rd==1 & mem_wr==0)
	read_data <= data_mem[addr];
	else data_mem[addr] <= data_mem[addr];
	end
	
endmodule
