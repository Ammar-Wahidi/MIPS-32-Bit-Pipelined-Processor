`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 06/23/2025 11:54:41 PM
// Design Name: 8-to-1 Multiplexer
// Module Name: mux_8x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This is a parameterized 8-to-1 multiplexer.
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//   - Width of inputs and output is parameterized using `Bits`.
//   - Default width is 32 bits (suitable for MIPS datapath).
//////////////////////////////////////////////////////////////////////////////////


module mux_8x1 #(parameter Bits = 32)(
input [Bits-1:0] a,
input [Bits-1:0] b,
input [Bits-1:0] c,
input [Bits-1:0] d,
input [Bits-1:0] e,
input [Bits-1:0] f,
input [Bits-1:0] g,
input [Bits-1:0] h,
input [2:0]     sel,
output reg [Bits-1:0] mux_out 
    );
    
    always @(sel,a,b)
    begin
    case (sel)
    0:mux_out = a;
    1:mux_out = b;
    2:mux_out = c;
    3:mux_out = d;
    4:mux_out = e;
    5:mux_out = f;
    6:mux_out = g;
    7:mux_out = h;
    default:mux_out = 0;
    endcase
    end
    
endmodule
