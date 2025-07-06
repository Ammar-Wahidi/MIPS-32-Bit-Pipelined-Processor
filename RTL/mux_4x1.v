`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 11:54:41 PM
// Design Name: 4-to-1 Multiplexer
// Module Name: mux_4x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This is a parameterized 4-to-1 multiplexer.
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//   - Width of inputs and output is parameterized using `Bits`.
//   - Default width is 32 bits (suitable for MIPS datapath).
//////////////////////////////////////////////////////////////////////////////////


module mux_4x1 #(parameter Bits = 32)(
input [Bits-1:0] a,
input [Bits-1:0] b,
input [Bits-1:0] c,
input [Bits-1:0] d,
input [1:0]     sel,
output reg [Bits-1:0] mux_out 
    );
    
    always @(sel,a,b)
    begin
    if (sel == 2'b00)
    mux_out = a;
    else if (sel == 2'b01)
    mux_out = b;
    else if (sel == 2'b10)
    mux_out = c;
    else if (sel == 2'b11)
    mux_out = d;
    else 
    mux_out = 0;
    end
    
endmodule
