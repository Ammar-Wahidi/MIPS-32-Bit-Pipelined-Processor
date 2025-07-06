`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Ammar Wahidi 
// 
// Create Date: 06/24/2025 12:06:31 AM
// Design Name: Parameterized Adder Module
// Module Name: Add_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   A simple parameterized adder module that adds two inputs `a` and `b`.
//   Commonly used for PC incrementing or address calculation in a MIPS CPU.
//
// Dependencies: None
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//   - Default width is 32 bits, but configurable using `Bits` parameter.
//////////////////////////////////////////////////////////////////////////////////


module Adder #(parameter Bits = 32) (
input signed  [Bits-1:0] a,
input signed  [Bits-1:0] b,
output signed [Bits-1:0] pc
);

assign pc = a+b ;

endmodule
