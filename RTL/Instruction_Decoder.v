`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Ahmed Wahidi
// 
// Create Date: 06/24/2025 11:30:04 AM
// Design Name: Instruction Decoder
// Module Name: Instruction_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This module extracts fields from a 32-bit MIPS instruction.
//   It supports decoding R-type, I-type, and J-type formats.
// 
// Dependencies: None
//
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module Instruction_Decoder(instr,OPcode,Funct,rs,rt_r,rd_r,shamt,rt_i,imm,addr_j);

//inputs
input       [31:0]      instr       ;

//outputs
output      [5:0]       OPcode      ;
output      [5:0]       Funct       ;
output      [4:0]       rs          ;
output      [4:0]       rt_r        ;
output      [4:0]       rd_r        ;
output      [4:0]       shamt       ;
output      [4:0]       rt_i        ;
output      [15:0]      imm         ;
output      [25:0]      addr_j      ;


// Instruction field extraction
assign OPcode   = instr[31:26];     // Common to all formats
assign Funct    = instr[5:0];       // R-type only
assign rs       = instr[25:21];     // Source register
assign rt_r     = instr[20:16];     // RT (R-type)
assign rd_r     = instr[15:11];     // RD (R-type)
assign shamt    = instr[10:6];      // Shift amount
assign rt_i     = instr[20:16];     // RT (I-type)
assign imm      = instr[15:0];      // Immediate (I-type)
assign addr_j   = instr[25:0];      // Address (J-type)

endmodule