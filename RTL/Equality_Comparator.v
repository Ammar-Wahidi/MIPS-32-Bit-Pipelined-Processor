`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2025 10:22:52 PM
// Design Name: 
// Module Name: Equality_Comparator
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


module Equality_Comparator(a,b,EqualD);
input       [31:0]      a       ;
input       [31:0]      b       ;
output                  EqualD  ;

assign EqualD = (a==b) ? 1'b1 : 1'b0 ;
endmodule
