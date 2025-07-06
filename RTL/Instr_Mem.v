`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 05:35:10 PM
// Design Name: Ram Memory
// Module Name: ram_memory
// Project Name: MIPS
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


module Instr_Mem #(parameter addr_width = 32, parameter data_width = 8)(clk,reset_n ,addr,read_data);
input                                  clk                             ;
input                                  reset_n                         ;
input      [addr_width-1:0]            addr                            ;
output reg [4*data_width-1:0]          read_data                       ;

// Byte-addressable memory array (8-bit per entry)
reg     [data_width-1:0]            memory [0:(2**addr_width)- 1]   ;

// Combinational read
always @(*)
begin
        read_data = {memory[addr + 3],memory[addr + 2],memory[addr + 1],memory[addr]} ;
end


//////////////////////////////////////////////////////////////////////////////////
// NOT SYNTHESIZABLE: Simulation-only initialization
/*
always @(negedge reset_n) begin
    if (~reset_n)
    begin    
        for (integer i = 0; i < 2**addr_width; i = i + 1) begin
            memory[i] = 0;
        end
    end
end
*/

initial 
begin
$readmemh("Test1.mem",memory);
end

//////////////////////////////////////////////////////////////////////////////////


endmodule
