`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Ahmed Wahidi
// 
// Create Date: 06/23/2025 05:19:36 PM
// Design Name: 
// Module Name: Progame_Counter
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


module Progame_Counter(clk,reset_n,PC_next,PC);

input               clk     ;
input               reset_n ;
input      [31:0]   PC_next ;
output reg [31:0]   PC      ;

always @(posedge clk or negedge reset_n)
begin
    if (~reset_n)
        PC <= 0;
    else
        PC <= PC_next;
end

endmodule
