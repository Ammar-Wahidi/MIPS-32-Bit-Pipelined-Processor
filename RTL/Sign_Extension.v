`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Ahemd Wahidi
// 
// Create Date: 06/23/2025 05:29:18 PM
// Design Name: 
// Module Name: Sign_Extension
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


module Sign_Extension(imm,sign,sign_imm);
input  [15:0]           imm             ;
input                   sign            ;
output [31:0]           sign_imm        ;       

assign sign_imm = (sign)?  {{16{imm[15]}},imm}:{{16{1'b0}},imm} ;

endmodule
