`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 07:59:05 PM
// Design Name: Main Decoder
// Module Name: Main_Decoder
// Project Name: MIPS
// Target Devices: 
// Tool Versions: 
// Description: Control unit generating main control signals for MIPS datapath
//              based on instruction opcode.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// - Based on MIPS single-cycle control logic.
// 
//////////////////////////////////////////////////////////////////////////////////

module Main_Decoder(OPcode,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOp,Jump);

//inputs
input       [5:0]   OPcode;

//Output
output              MemtoReg;
output              MemWrite;
output              Branch;
output              ALUSrc;
output              RegDst;
output              RegWrite;
output              Jump;
output      [1:0]   ALUOp;

// === Named Opcode Parameters ===
parameter           OP_RTYPE = 6'b000000;
parameter           OP_LW    = 6'b100011;
parameter           OP_SW    = 6'b101011;
parameter           OP_BEQ   = 6'b000100;
parameter           OP_ADDI  = 6'b001000;
parameter           OP_JUMP  = 6'b000010;

reg                 MemtoReg_reg;
reg                 MemWrite_reg;
reg                 Branch_reg;
reg                 ALUSrc_reg;
reg                 RegDst_reg;
reg                 RegWrite_reg;
reg                 Jump_reg;
reg                 [1:0] ALUOp_reg;

always @(*)
begin
    case (OPcode)
    OP_RTYPE: {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b110000100 ;
    OP_LW:    {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b101001000 ;
    OP_SW:    {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b001010000 ;
    OP_BEQ:   {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b000100010 ;
    OP_ADDI:  {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b101000000 ;
    OP_JUMP:  {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b000000001 ;
    default:  {RegWrite_reg,RegDst_reg,ALUSrc_reg,Branch_reg,MemWrite_reg,MemtoReg_reg,ALUOp_reg,Jump_reg} = 9'b110000001 ;
    endcase
end

// Assign internal registers to outputs
assign MemtoReg = MemtoReg_reg;
assign MemWrite = MemWrite_reg;
assign Branch   = Branch_reg;
assign ALUSrc   = ALUSrc_reg;
assign RegDst   = RegDst_reg;
assign RegWrite = RegWrite_reg;
assign Jump     = Jump_reg;
assign ALUOp    = ALUOp_reg;

endmodule