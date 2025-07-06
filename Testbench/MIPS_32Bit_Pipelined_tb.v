`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 03:30:24 PM
// Design Name: 
// Module Name: MIPS_32Bit_single_cycle_tb
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


module MIPS_32Bit_Pipelined_tb();
reg clk,reset_n;

    // Generating a clk signal
    localparam T = 20;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
MIPS_32Bit_Pipelined_Wrapper DUT (
.clk(clk),
.reset_n(reset_n)
);

initial begin
reset_n =0 ;
#20;
reset_n=1;

#800;
$stop;
end
endmodule
