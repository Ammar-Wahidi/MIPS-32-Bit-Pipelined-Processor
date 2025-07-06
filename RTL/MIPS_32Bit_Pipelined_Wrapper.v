`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ammar Wahidi
// 
// Create Date: 07/05/2025 02:28:04 PM
// Design Name: 
// Module Name: MIPS_32Bit_Pipelined_Wrapper
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

(* DONT_TOUCH = "TRUE" *)
module MIPS_32Bit_Pipelined_Wrapper(clk,reset_n);

// Inputs 
input                       clk                 ;
input                       reset_n             ;

// Wires 
wire            [31:0]      PCF_current         ; 
wire            [31:0]      PC_next             ;
wire            [31:0]      instr_F             ;
wire            [31:0]      instr_D             ;
// Instruction decoding
wire            [5:0]       OPcode              ;
wire            [5:0]       Funct               ;
wire            [4:0]       rs                  ;
wire            [4:0]       rt_r                ;
wire            [4:0]       rd_r                ;
wire            [4:0]       shamt               ;
wire            [4:0]       rt_i                ;
wire            [15:0]      imm                 ;
wire            [25:0]      addr_j              ;
// Control signals
wire                        MemtoReg            ;
wire                        MemWrite            ;
wire                        Branch              ;
wire                        ALUSrc              ;
wire                        RegDst              ;
wire                        RegWrite            ;
wire                        Jump                ;
wire            [2:0]       ALU_control         ;
wire            [31:0]      sign_imm            ;
// For D Stage 
wire            [4:0]       RsD                 ;
wire            [4:0]       RtD                 ;
wire            [4:0]       RdD                 ;
wire                        MemtoRegD           ;
wire                        MemWriteD           ;
wire                        BranchD             ;
wire                        ALUSrcD             ;
wire                        RegDstD             ;
wire                        RegWriteD           ;
wire                        JumpD               ;
wire            [2:0]       ALU_controlD        ;
wire            [31:0]      signimmD            ;
wire            [31:0]      imm_out_shifted_2   ;
wire            [31:0]      pc_BranchD          ;
wire            [31:0]      rd1_rf              ;
wire            [31:0]      rd2_rf              ;
wire            [31:0]      rd1_rfD             ;
wire            [31:0]      rd2_rfD             ;
wire            [31:0]      mux_to_eqA          ;
wire            [31:0]      mux_to_eqB          ; 
wire                        EqualD              ;
// For E Stage
wire                        RegWriteE           ;
wire                        MemtoRegE           ;
wire                        MemWriteE           ;
wire            [2:0]       ALU_controlE        ;
wire                        ALUSrcE             ;
wire                        RegDstE             ;
wire            [31:0]      rd1_rfE             ;
wire            [31:0]      rd2_rfE             ;
wire            [4:0]       RsE                 ;
wire            [4:0]       RtE                 ;
wire            [4:0]       RdE                 ;
wire            [31:0]      signimmE            ;
wire            [4:0]       WriteRegE           ;
wire            [31:0]      SrcAE               ;
wire            [31:0]      r_SrcBE             ;
wire            [31:0]      SrcBE               ;
wire                        zeroE               ;
wire            [31:0]      ALUOutE             ;       
wire            [31:0]      WriteDataE          ;
// For M Stage 
wire            [31:0]      ALUOutM             ;
wire                        MemtoRegM           ; 
wire                        RegWriteM           ;
wire                        MemWriteM           ;
wire            [4:0]       WriteRegM           ; 
wire            [31:0]      WriteDataM          ;
wire            [31:0]      ReadDataM           ;
// For W Stage 
wire                        RegWriteW           ;
wire                        MemtoRegW           ;
wire            [31:0]      ALUOutW             ;
wire            [31:0]      ResultW             ;
wire            [4:0]       WriteRegW           ; 
wire            [31:0]      ReadDataW           ;                 
// PC Control Logic 
wire                        PCSrcD              ;
wire            [31:0]      pc_plus4            ;
wire            [31:0]      PCPlus4F            ;
wire            [31:0]      PCPlus4D            ;
wire            [27:0]      addr_j_shifted      ;
wire            [31:0]      PCjump              ;
wire            [31:0]      pc_mux1out          ;
wire            [31:0]      pc_mux2out          ;
// Hazard Unit output signals
wire                        StallF              ;
wire                        StallD              ;
wire                        ForwardAD           ;
wire                        ForwardBD           ;
wire                        FlushE              ;
wire            [1:0]       ForwardAE           ;
wire            [1:0]       ForwardBE           ; 
wire                        clr_FD              ;

// Combinational Assignments 
assign PC_next      = pc_mux2out                            ; // Changeable 
assign PCPlus4F     = pc_plus4                              ;
// Combinational Assignments for Stages
assign MemtoRegD    = MemtoReg                              ;
assign MemWriteD    = MemWrite                              ;
assign BranchD      = Branch                                ;
assign ALUSrcD      = ALUSrc                                ;
assign RegDstD      = RegDst                                ;
assign RegWriteD    = RegWrite                              ;
assign JumpD        = Jump                                  ;
assign ALU_controlD = ALU_control                           ;
assign signimmD     = sign_imm                              ;
assign RsD          = rs                                    ;
assign RtD          = rt_i                                  ;
assign RdD          = rd_r                                  ;
assign rd1_rfD      = rd1_rf                                ;
assign rd2_rfD      = rd2_rf                                ;
assign PCSrcD       = EqualD & BranchD                      ;
assign WriteDataE   = r_SrcBE                               ;
assign clr_FD       = PCSrcD || JumpD                       ;
assign PCjump       = {pc_plus4[31:28], addr_j_shifted}     ;       // Jump target address

Hazard_Unit hazard_unit (
.BranchD(BranchD),
.JumpD(JumpD),
.MemtoRegE(MemtoRegE),
.MemtoRegM(MemtoRegM),
.RegWriteE(RegWriteE),
.RegWriteM(RegWriteM),
.RegWriteW(RegWriteW),
.RsD(RsD),
.RsE(RsE),
.RtD(RtD),
.RtE(RtE),
.WriteRegE(WriteRegE),
.WriteRegM(WriteRegM),
.WriteRegW(WriteRegW),
.StallF(StallF),
.StallD(StallD),
.ForwardAD(ForwardAD),
.ForwardBD(ForwardBD),
.FlushE(FlushE),
.ForwardAE(ForwardAE),
.ForwardBE(ForwardBE)
);
// Modules
Progame_Counter PC (
.clk(clk),
.reset_n(reset_n),
.PC_next(PC_next),
.PC(PCF_current)
);

Instr_Mem #(.addr_width(7),.data_width(8)) ROM (
.clk(clk),
.reset_n(reset_n),
.addr(PCF_current),
.read_data(instr_F)
);

Adder #(.Bits(32)) Adder_PCPlus4 (
.a(PCF_current),
.b(32'd4),
.pc(pc_plus4)
);

// MUX to select between PC+4 and PC+Branch (for branches)
mux_2x1 #(.Bits(32)) branch_mux
(
.a(pc_plus4),
.b(pc_BranchD),
.sel(PCSrcD),
.mux_out(pc_mux1out)
);

shift_left_by_2 #(.Bits(28)) SL2_J(
.in({2'b00,addr_j}),
.out_shifted(addr_j_shifted)
);

// MUX to select between Branch result and Jump target 
mux_2x1 #(.Bits(32)) jump_mux
(
.a(pc_mux1out),
.b(PCjump),
.sel(JumpD),
.mux_out(pc_mux2out)
);

Fetch_Decode_Reg FD_Reg (
.clk(clk),
.reset_n(reset_n),
.en(~StallD),
.clr(clr_FD),

.instr_F(instr_F),
.PCPlus4F(PCPlus4F),
.instr_D(instr_D),
.PCPlus4D(PCPlus4D)
);

Instruction_Decoder instr_decoder (
.instr(instr_D),
.OPcode(OPcode),
.Funct(Funct),
.rs(rs),
.rt_r(rt_r),
.rd_r(rd_r),
.shamt(shamt),
.rt_i(rt_i),
.imm(imm),
.addr_j(addr_j)
);



Register_File register_file (
.clk(clk),
.we3(RegWriteW),
.addr_r1(rs),
.addr_r2(rt_r),
.addr_w3(WriteRegW),
.write_data3(ResultW),
.read_data1(rd1_rf),
.read_data2(rd2_rf)
);

Control_Unit Controller (
.OPcode(OPcode),
.Funct(Funct),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.Branch(Branch),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.RegWrite(RegWrite),
.Jump(Jump),
.ALU_control(ALU_control)
);

Sign_Extension sign_extend (
.imm(imm),
.sign(1),
.sign_imm(sign_imm)
);

shift_left_by_2 #(.Bits(32)) SL2 (
.in(signimmD),
.out_shifted(imm_out_shifted_2)
);


Adder #(.Bits(32)) addpc_Branch
(
.a(imm_out_shifted_2),
.b(PCPlus4D),
.pc(pc_BranchD)
);

mux_2x1 #(.Bits(32)) to_equality_comparatorA (
.a(rd1_rf),
.b(ALUOutM),
.sel(ForwardAD),
.mux_out(mux_to_eqA)
);

mux_2x1 #(.Bits(32)) to_equality_comparatorB (
.a(rd2_rf),
.b(ALUOutM),
.sel(ForwardBD),
.mux_out(mux_to_eqB)
);

Equality_Comparator equality_comparator (
.a(mux_to_eqA),
.b(mux_to_eqB),
.EqualD(EqualD)
);

Decode_Execute_Reg DE_Reg (
.clk(clk),
.reset_n(reset_n),
.CLR(FlushE),

.RegWriteD(RegWriteD),
.MemtoRegD(MemtoRegD),
.MemWriteD(MemWriteD),
.ALU_controlD(ALU_controlD),
.ALUSrcD(ALUSrcD),
.RegDstD(RegDstD),
.rd1_rfD(rd1_rfD),
.rd2_rfD(rd2_rfD),
.rsD(RsD),
.rtD(RtD),
.rdD(RdD),
.signimmD(signimmD),

.RegWriteE(RegWriteE),
.MemtoRegE(MemtoRegE),
.MemWriteE(MemWriteE),
.ALU_controlE(ALU_controlE),
.ALUSrcE(ALUSrcE),
.RegDstE(RegDstE),
.rd1_rfE(rd1_rfE),
.rd2_rfE(rd2_rfE),
.rsE(RsE),
.rtE(RtE),
.rdE(RdE),
.signimmE(signimmE)
);

mux_2x1 #(.Bits(5)) R_writereg (
.a(RtE),
.b(RdE),
.sel(RegDstE),
.mux_out(WriteRegE)
);

mux_4x1 #(.Bits(32)) to_SrcAE (
.a(rd1_rfE),
.b(ResultW),
.c(ALUOutM),
.sel(ForwardAE),
.mux_out(SrcAE)
);

mux_4x1 #(.Bits(32)) to_SrcBE (
.a(rd2_rfE),
.b(ResultW),
.c(ALUOutM),
.sel(ForwardBE),
.mux_out(r_SrcBE)
);

mux_2x1 #(.Bits(32)) Alusrc_i_r  (
.a(r_SrcBE),
.b(signimmE),
.sel(ALUSrcE),
.mux_out(SrcBE)
);

Arithmetic_Logic_Unit ALU (
.Src_A(SrcAE),
.Src_B(SrcBE),
.ALU_control(ALU_controlE),
.zero(zeroE),
.result(ALUOutE)
);

Execute_Memory_Reg EM_Reg (
.clk(clk),
.reset_n(reset_n),

.RegWriteE(RegWriteE),
.MemtoRegE(MemtoRegE),
.MemWriteE(MemWriteE),
.ALUOutE(ALUOutE),
.WriteDataE(WriteDataE),
.WriteRegE(WriteRegE),

.RegWriteM(RegWriteM),
.MemtoRegM(MemtoRegM),
.MemWriteM(MemWriteM),
.ALUOutM(ALUOutM),
.WriteDataM(WriteDataM),
.WriteRegM(WriteRegM)
);

Data_Mem #(.addr_width(5),.data_width(8)) RAM (
.clk(clk),
.reset_n(reset_n),
.we(MemWriteM),
.addr(ALUOutM),
.write_data(WriteDataM),
.read_data(ReadDataM)
);

Memory_Writeback_Reg MW_Reg (
.clk(clk),
.reset_n(reset_n),

.RegWriteM(RegWriteM),
.MemtoRegM(MemtoRegM),
.ALUOutM(ALUOutM),
.read_d_M(ReadDataM),
.WriteRegM(WriteRegM),

.RegWriteW(RegWriteW),
.MemtoRegW(MemtoRegW),
.ALUOutW(ALUOutW),
.read_d_W(ReadDataW),
.WriteRegW(WriteRegW)
);

mux_2x1 #(.Bits(32)) memo_to_reg (
.a(ALUOutW),
.b(ReadDataW),
.sel(MemtoRegW),
.mux_out(ResultW)
);

endmodule
