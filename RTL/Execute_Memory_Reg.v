`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2025 01:16:09 PM
// Design Name: 
// Module Name: Execute_Memory_Reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Execute_Memory_Reg(
    input               clk         ,
    input               reset_n     ,

    // Inputs from Execute stage
    input               RegWriteE   ,
    input               MemtoRegE   ,
    input               MemWriteE   ,
    input [31:0]        ALUOutE     ,
    input [31:0]        WriteDataE  ,
    input [4:0]         WriteRegE   ,

    // Outputs to Memory stage
    output reg          RegWriteM   ,
    output reg          MemtoRegM   ,
    output reg          MemWriteM   ,
    output reg [31:0]   ALUOutM     ,
    output reg [31:0]   WriteDataM  ,
    output reg [4:0]    WriteRegM   
);

always @(posedge clk or negedge reset_n)
begin
    if (~reset_n)
    begin
        RegWriteM   <=0;
        MemtoRegM   <=0;
        MemWriteM   <=0;
        ALUOutM     <=0;
        WriteDataM  <=0;
        WriteRegM   <=0;
    end
    else
    begin
        RegWriteM   <=RegWriteE;
        MemtoRegM   <=MemtoRegE;
        MemWriteM   <=MemWriteE;
        ALUOutM     <=ALUOutE;
        WriteDataM  <=WriteDataE;
        WriteRegM   <=WriteRegE;
    end

end
endmodule
