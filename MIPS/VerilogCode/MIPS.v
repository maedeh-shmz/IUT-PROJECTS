`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:36 07/25/2020 
// Design Name: 
// Module Name:    MIPS 
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
module MIPS(input clk,output [31:0] write_data, mem_addr,output zero,output [31:0] addr, read_data1, read_data2);
	
	and(M4_sel, branch, zero);
	wire[31:0] next_addr, S_Ex, result,
					 ALU_in2, ins,
					 pc_in, mem_r_data;
					
	wire clk_out, RegDst, 
			MemRead, MemtoReg, MemWrite,
			ALUsrc, RegWrite; 
			
	wire [3:0] op;
	wire [4:0] w_reg;
	wire [1:0] ALUop;
	
	
	fre_division freq_division_ins(clk, clk_out);
	
	PC PC_ins(clk_out, pc_in, addr);
	
	incrementer incrementer_ins(addr, next_addr);
	
	add add_ins(next_addr, S_Ex, result);
	
	ALU ALU_ins(clk, read_data1, ALU_in2, op, zero, mem_addr);
	
	instruction_mem instruction_ins(addr[4:0], ins);
	
	regbank reg_ins(clk, RegWrite, ins[25:21], ins[20:16], w_reg, write_data, read_data1, read_data2);
	
	Control Control_ins(ins[31:26], RegDst, branch, MemRead, MemtoReg, ALUop, MemWrite, ALUsrc, RegWrite);
	
	ALUControl ALUControl_ins(ALUop, ins[5:0], op);
	
	data_mem data_mem_ins(clk, mem_addr[6:0], MemWrite, MemRead, read_data2, mem_r_data);
	
	sign sign_ins(clk, ins[15:0], S_Ex);
	
	mux #(5) mux_ins1(ins[20:16], ins[15:11], RegDst, w_reg);
	
	mux mux_ins2(read_data2, S_Ex, ALUsrc, ALU_in2);
	
	mux mux_ins3(mem_addr, mem_r_data, MemtoReg, write_data);
	
	mux mux_ins4(next_addr, result, M4_sel, pc_in);

endmodule
