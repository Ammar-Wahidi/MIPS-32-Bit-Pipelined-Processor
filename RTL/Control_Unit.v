//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 11:42:18 PM
// Design Name: MIPS Control Unit
// Module Name: Control_Unit
// Project Name: MIPS Processor
// Target Devices: 
// Tool Versions: 
// Description: 
//   Top-level control unit that generates control signals based on instruction
//   opcode and function fields. This unit instantiates two submodules:
//   1. Main_Decoder: generates high-level control signals and ALUOp
//   2. ALU_Decoder: determines specific ALU operation using Funct and ALUOp
//
// Dependencies: Main_Decoder.v, ALU_Decoder.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//   - Supports basic MIPS instructions: R-type, lw, sw, beq, addi, jump
//////////////////////////////////////////////////////////////////////////////////


module Control_Unit (OPcode,Funct,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,Jump,ALU_control);

//inputs
input       [5:0]   OPcode; // Instruction[31:26] - primary opcode
input       [5:0]   Funct;  // Instruction[5:0] - function field (R-type)

//Output
output              MemtoReg;
output              MemWrite;
output              Branch;
output              ALUSrc;
output              RegDst;
output              RegWrite;
output              Jump;
output      [2:0]   ALU_control ;

wire        [1:0]   ALUOp;

// Generates control signals and ALUOp based on opcode
Main_Decoder MainDecoder (
.OPcode(OPcode),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.Jump(Jump),
.ALUOp(ALUOp)
);

// Selects actual ALU operation using funct field and ALUOp
ALU_Decoder ALUDecoder (
.Funct(Funct),
.ALUOp(ALUOp),
.ALU_control(ALU_control)
);

endmodule