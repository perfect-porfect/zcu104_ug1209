//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Sun Dec 19 10:14:13 2021
//Host        : laptop running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target Xilinx_Embedded_Design.bd
//Design      : Xilinx_Embedded_Design
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Xilinx_Embedded_Design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Xilinx_Embedded_Design,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "Xilinx_Embedded_Design.hwdef" *) 
module Xilinx_Embedded_Design
   ();


  Xilinx_Embedded_Design_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.pl_ps_irq0(1'b0));
endmodule
