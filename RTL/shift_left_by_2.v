`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/24/2025 12:11:14 AM
// Design Name: Shift Left by 2
// Module Name: shift_left_by_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This module performs a logical left shift by 2 bits on the input.
//   Typically used in MIPS to shift branch offsets (word aligned).
//
// Dependencies: None
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//   - Shifts the input left by 2 bits: `out_shifted = in << 2`
//   - Parameterized for data width (default 32 bits)
//////////////////////////////////////////////////////////////////////////////////


module shift_left_by_2 #(parameter Bits = 32)(
input [Bits-1:0] in,
output[Bits-1:0] out_shifted
);

assign out_shifted = in << 2;
endmodule
