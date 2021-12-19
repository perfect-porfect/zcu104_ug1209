// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sun Dec 19 10:17:42 2021
// Host        : laptop running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/hp/projects/vivado/zcu104_ug1209/Embedded_Design_Tutorial.srcs/sources_1/bd/Xilinx_Embedded_Design/ip/Xilinx_Embedded_Design_zynq_ultra_ps_e_0_0/Xilinx_Embedded_Design_zynq_ultra_ps_e_0_0_stub.v
// Design      : Xilinx_Embedded_Design_zynq_ultra_ps_e_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "zynq_ultra_ps_e_v3_2_2_zynq_ultra_ps_e,Vivado 2018.3" *)
module Xilinx_Embedded_Design_zynq_ultra_ps_e_0_0(pl_ps_irq0, pl_resetn0, pl_clk0)
/* synthesis syn_black_box black_box_pad_pin="pl_ps_irq0[0:0],pl_resetn0,pl_clk0" */;
  input [0:0]pl_ps_irq0;
  output pl_resetn0;
  output pl_clk0;
endmodule
