`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 11:54:41 PM
// Design Name: 2-to-1 Multiplexer
// Module Name: mux_2x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This is a parameterized 2-to-1 multiplexer.
//   Selects between input 'a' and input 'b' based on control signal 'sel'.
//   If sel = 1, output = a; else, output = b.
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//   - Width of inputs and output is parameterized using `Bits`.
//   - Default width is 32 bits (suitable for MIPS datapath).
//////////////////////////////////////////////////////////////////////////////////


module mux_2x1 #(parameter Bits = 32)(
input [Bits-1:0] a,
input [Bits-1:0] b,
input sel,
output reg [Bits-1:0] mux_out 
    );
    
    always @(sel,a,b)
    begin
    if (~sel)
    mux_out = a;
    else
    mux_out = b;
    end
    
endmodule
