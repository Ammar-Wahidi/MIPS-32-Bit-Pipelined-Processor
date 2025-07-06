`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 08:29:57 PM
// Design Name: ALU Decoder
// Module Name: ALU_Decoder
// Project Name: MIPS
// Target Devices: 
// Tool Versions: 
// Description: 
//  - This module decodes the ALU operation based on ALUOp (from Main Decoder)
//    and function field (for R-type instructions).
// 
// Dependencies: None
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_Decoder(Funct,ALUOp,ALU_control);

//Inputs
input       [5:0]       Funct       ;
input       [1:0]       ALUOp       ;
//Outputs
output      [2:0]       ALU_control ;

reg [2:0] ALU_control_reg;
always @(*)
begin
    if (ALUOp == 2'b00)
        ALU_control_reg = 3'b010; //add
    else if(ALUOp == 2'b01)
        ALU_control_reg = 3'b110; //sub
    else if(ALUOp == 2'b10)
    begin
        case(Funct)
        6'b100000:ALU_control_reg = 3'b010 ; //add 
        6'b100010:ALU_control_reg = 3'b110 ; //sub
        6'b100100:ALU_control_reg = 3'b000 ; //and
        6'b100101:ALU_control_reg = 3'b001 ; //or
        6'b101010:ALU_control_reg = 3'b111 ; //slt (set on less than)
        default:ALU_control_reg= 3'b100 ; //no opertion
        endcase
    end  
    else
        ALU_control_reg =3'b100; //no opertion
        
end

assign ALU_control = ALU_control_reg;
endmodule