`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2025 01:16:09 PM
// Design Name: 
// Module Name: Fetch_Decode_Reg
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


module Fetch_Decode_Reg(
    input           clk         ,
    input           reset_n     ,

    // Inputs from Fetch stage
    input           en          ,
    input           clr         ,
    input [31:0]    instr_F     ,
    input [31:0]    PCPlus4F    ,

    // Outputs to Decode stage
    output [31:0]   PCPlus4D    ,
    output [31:0]   instr_D
);

reg [31:0]      PCPlus4     ;
reg [31:0]      instr       ;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        PCPlus4 <= 0;
        instr   <= 0;
    end
    else if (clr) begin
        // Flush the pipeline ( for a branch)
        PCPlus4 <= 0;
        instr   <= 0;
    end
    else if (en) begin
        // Latch inputs into internal registers
        PCPlus4 <= PCPlus4F;
        instr   <= instr_F;
    end
    else
    begin
        // If not enabled, hold the current value (stall condition)
        PCPlus4 <= PCPlus4;
        instr   <= instr;
    end
end

assign PCPlus4D = PCPlus4;
assign instr_D  = instr;

endmodule
