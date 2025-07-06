`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 07:39:35 PM
// Design Name: Arithmetic Logic Unit
// Module Name: Arithmetic_Logic_Unit
// Project Name: MIPS
// Target Devices: 
// Tool Versions: 
// Description: 32-bit ALU for MIPS processor
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Supports basic arithmetic, logic, and comparison ops
/////////////////////////////////////////////////////////////////////////////////


module Arithmetic_Logic_Unit(Src_A,Src_B,ALU_control,result,zero);

//Inputs
input signed    [31:0]      Src_A               ;
input signed    [31:0]      Src_B               ;
input           [2:0]       ALU_control         ;
//Outputs 
output                      zero                ;
output          [31:0]      result              ;


// Parameterized ALU operation codes
parameter                   ALU_OR  = 3'b001    ;
parameter                   ALU_AND = 3'b000    ;
parameter                   ALU_ADD = 3'b010    ;
parameter                   ALU_SUB = 3'b110    ;
parameter                   ALU_SLT = 3'b111    ;

reg signed      [31:0]      result_reg          ;

// ALU Operation Selection
always @(*)
begin
    case (ALU_control)
    ALU_OR: result_reg = Src_A | Src_B;              // Bitwise OR
    ALU_AND: result_reg = Src_A & Src_B;              // Bitwise AND
    ALU_ADD: result_reg = Src_A + Src_B;              // Addition
    ALU_SUB: result_reg = Src_A - Src_B;              // Subtraction
    ALU_SLT: result_reg = (Src_A < Src_B) ? 32'b1 : 32'b0; // Set-on-less-than
    default:result_reg = Src_A;
    endcase
end

assign result = result_reg;
assign zero   = ~|result ;
 
endmodule