`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 07/05/2025 04:12:03 PM
// Design Name: 
// Module Name: Hazard_Unit
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


module Hazard_Unit(
    // Control Signals 
    input               BranchD         ,
    input               JumpD           ,
    input               MemtoRegE       ,
    input               MemtoRegM       ,
    input               RegWriteE       ,
    input               RegWriteM       ,
    input               RegWriteW       ,

    input [4:0]         RsD             ,
    input [4:0]         RsE             ,
    input [4:0]         RtD             ,
    input [4:0]         RtE             ,
    input [4:0]         WriteRegE       ,
    input [4:0]         WriteRegM       ,
    input [4:0]         WriteRegW       ,

    // Outputs 
    output              StallF          ,
    output              StallD          ,
    output              ForwardAD       ,
    output              ForwardBD       ,
    output              FlushE          ,
    output [1:0]        ForwardAE       ,
    output [1:0]        ForwardBE       

);

wire                    condition1_RsE      ;
wire                    condition1_RtE      ;
wire                    condition2_RsE      ;
wire                    condition2_RtE      ;
wire                    LWStall             ;
wire                    branchstall_cond1   ;
wire                    branchstall_cond2   ;
wire                    branchstall         ;

assign condition1_RsE = (RsE != 0 ) && (RsE == WriteRegM) && RegWriteM ;
assign condition1_RtE = (RtE != 0 ) && (RtE == WriteRegM) && RegWriteM ;

assign condition2_RsE = (RsE != 0 ) && (RsE == WriteRegW) && RegWriteW ;
assign condition2_RtE = (RtE != 0 ) && (RtE == WriteRegW) && RegWriteW ;

// Stall for load-use hazard
assign LWStall   = ((RsD == RtE ||RtD == RtE)) && MemtoRegE ;


// Stall for branch data dependency
assign branchstall_cond1 = BranchD && RegWriteE && ((WriteRegE == RsD)||(WriteRegE == RtD));
assign branchstall_cond2 = BranchD && MemtoRegM && ((WriteRegM == RsD)||(WriteRegM == RtD));
assign branchstall = branchstall_cond1 || branchstall_cond2;

// Forwarding to Execute stage (from MEM and WB)
assign ForwardAE = (condition1_RsE)? 2'b10:(condition2_RsE)? 2'b01: 2'b00;
assign ForwardBE = (condition1_RtE)? 2'b10:(condition2_RtE)? 2'b01: 2'b00;

// Forwarding to Decode stage for Branch comparison
assign ForwardAD = (RsD != 0) && (RsD == WriteRegM) && RegWriteM ;
assign ForwardBD = (RtD != 0) && (RtD == WriteRegM) && RegWriteM ;

// Apply stall and flush
assign StallF    = LWStall || branchstall ;
assign StallD    = LWStall || branchstall ;
assign FlushE    = LWStall || branchstall ;

endmodule
