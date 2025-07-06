`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 07/05/2025 01:16:09 PM
// Design Name: MIPS Pipeline
// Module Name: Decode_Execute_Reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Pipeline register between Decode and Execute stages
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decode_Execute_Reg(
    input                   clk         ,
    input                   reset_n     ,
    input                   CLR         ,

    // Inputs from Decode stage
    input                   RegWriteD   ,
    input                   MemtoRegD   ,
    input                   MemWriteD   ,
    input [2:0]             ALU_controlD,
    input                   ALUSrcD     ,
    input                   RegDstD     ,
    input [31:0]            rd1_rfD     ,
    input [31:0]            rd2_rfD     ,
    input [4:0]             rsD         ,
    input [4:0]             rtD         ,
    input [4:0]             rdD         ,
    input [31:0]            signimmD    ,

    // Outputs to Execute stage
    output reg              RegWriteE   ,
    output reg              MemtoRegE   ,
    output reg              MemWriteE   ,
    output reg [2:0]        ALU_controlE,
    output reg              ALUSrcE     ,
    output reg              RegDstE     ,
    output reg [31:0]       rd1_rfE     ,
    output reg [31:0]       rd2_rfE     ,
    output reg [4:0]        rsE         ,
    output reg [4:0]        rtE         ,
    output reg [4:0]        rdE         ,
    output reg [31:0]       signimmE    
);

always @(posedge clk or negedge reset_n)
begin
    if (~reset_n)
    begin
        // Reset all outputs to default
        RegWriteE   <= 0;
        MemtoRegE   <= 0;
        MemWriteE   <= 0;
        ALU_controlE <= 0;
        ALUSrcE     <= 0;
        RegDstE     <= 0;
        rd1_rfE     <= 0;
        rd2_rfE     <= 0;
        rsE         <= 0;
        rtE         <= 0;
        rdE         <= 0;
        signimmE    <= 0;
    end
    else if (CLR)
    begin
        // Reset all outputs to Zero
        RegWriteE   <= 0;
        MemtoRegE   <= 0;
        MemWriteE   <= 0;
        ALU_controlE <= 0;
        ALUSrcE     <= 0;
        RegDstE     <= 0;
        rd1_rfE     <= 0;
        rd2_rfE     <= 0;
        rsE         <= 0;
        rtE         <= 0;
        rdE         <= 0;
        signimmE    <= 0;        
    end
    else
    begin
        // Pass values to Excuate
        RegWriteE   <= RegWriteD;
        MemtoRegE   <= MemtoRegD;
        MemWriteE   <= MemWriteD;
        ALU_controlE <= ALU_controlD;
        ALUSrcE     <= ALUSrcD;
        RegDstE     <= RegDstD;
        rd1_rfE     <= rd1_rfD;
        rd2_rfE     <= rd2_rfD;
        rsE         <= rsD;
        rtE         <= rtD;
        rdE         <= rdD;
        signimmE    <= signimmD;
    end
end

endmodule