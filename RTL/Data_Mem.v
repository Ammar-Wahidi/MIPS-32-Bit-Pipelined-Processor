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


module Data_Mem #(parameter addr_width = 32, parameter data_width = 8)(clk,reset_n ,we,addr,write_data,read_data);
input                                  clk                             ;
input                                  reset_n                         ;
input                                  we                              ;
input      [addr_width-1:0]            addr                            ;
input      [4*data_width-1:0]          write_data                      ;
output reg [4*data_width-1:0]          read_data                       ;

// Byte-addressable memory array (8-bit per entry)
reg     [data_width-1:0]            memory [0:(2**addr_width)- 1]   ;

// Synchronous write: Little-endian (addr = LSB)
always @(posedge clk)
begin
        if (we)
        begin
                memory[addr]     <= write_data[7:0];      // Byte 0 (LSB)
                memory[addr + 1] <= write_data[15:8];     // Byte 1
                memory[addr + 2] <= write_data[23:16];    // Byte 2
                memory[addr + 3] <= write_data[31:24];    // Byte 3 (MSB)
        end
end

// Combinational read
always @(*)
begin
        read_data = {memory[addr + 3],memory[addr + 2],memory[addr + 1],memory[addr]} ; 
end

//////////////////////////////////////////////////////////////////////////////////
/*
initial 
begin
$readmemh("Data.mem",memory);
end
*/
//////////////////////////////////////////////////////////////////////////////////


endmodule
