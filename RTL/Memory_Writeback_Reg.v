`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2025 01:16:09 PM
// Design Name: 
// Module Name: Memory_Writeback_Reg
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


module Memory_Writeback_Reg(
    input               clk         ,
    input               reset_n     ,

    // Inputs from Memory stage
    input               RegWriteM   ,
    input               MemtoRegM   ,
    input [31:0]        ALUOutM     ,
    input [31:0]        read_d_M    ,
    input [4:0]         WriteRegM   ,             

    // Outputs to Writeback stage
    output reg          RegWriteW   ,
    output reg          MemtoRegW   ,
    output reg [31:0]   ALUOutW     ,
    output reg [31:0]   read_d_W    ,
    output reg [4:0]    WriteRegW     
);

always @(posedge clk or negedge reset_n)
begin
    if (~reset_n)
    begin
        RegWriteW   <= 0;
        MemtoRegW   <= 0;
        ALUOutW     <= 0;
        read_d_W    <= 0;
        WriteRegW   <= 0;
    end
    else
    begin
        RegWriteW   <= RegWriteM;
        MemtoRegW   <= MemtoRegM;
        ALUOutW     <= ALUOutM;
        read_d_W    <= read_d_M;
        WriteRegW   <= WriteRegM;
    end
end
endmodule
