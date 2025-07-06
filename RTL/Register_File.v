`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Ahmed Wahidi
// 
// Create Date: 06/23/2025 06:26:30 PM
// Design Name: 
// Module Name: Register_File
// Project Name: MIPS
// Target Devices: 
// Tool Versions: 
// Description: 32-register file for MIPS processor (2 read ports, 1 write port)
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Implements synchronous write and combinational read
//////////////////////////////////////////////////////////////////////////////////


module Register_File (clk,we3,addr_r1,addr_r2,addr_w3,write_data3,read_data1,read_data2);

//Inputs
input                       clk             ;
input                       we3             ;
input       [4:0]           addr_r1         ;
input       [4:0]           addr_r2         ;
input       [4:0]           addr_w3         ;
input       [31:0]          write_data3     ;
//Outputs
output      [31:0]          read_data1      ;
output      [31:0]          read_data2      ;

reg [31:0] register_file [0:31];

// Synchronous write: write to register addr_w3 on positive clock edge
always @(posedge clk) begin
register_file[0] = 32'b0;
    if (we3)
        register_file[addr_w3] <= write_data3;
end

// Combinational read: read outputs directly from addressed registers
assign read_data1 = register_file[addr_r1];
assign read_data2 = register_file[addr_r2];

endmodule
