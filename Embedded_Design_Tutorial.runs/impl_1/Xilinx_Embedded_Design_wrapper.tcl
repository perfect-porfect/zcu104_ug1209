# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xczu7ev-ffvc1156-2-e
  set_property board_part xilinx.com:zcu104:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/hp/projects/vivado/zcu104_ug1209/Embedded_Design_Tutorial.cache/wt [current_project]
  set_property parent.project_path /home/hp/projects/vivado/zcu104_ug1209/Embedded_Design_Tutorial.xpr [current_project]
  set_property ip_output_repo /home/hp/projects/vivado/zcu104_ug1209/Embedded_Design_Tutorial.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet /home/hp/projects/vivado/zcu104_ug1209/Embedded_Design_Tutorial.runs/synth_1/Xilinx_Embedded_Design_wrapper.dcp
  set_msg_config -source 4 -id {BD 41-1661} -limit 0
  set_param project.isImplRun true
  add_files /home/hp/projects/vivado/zcu104_ug1209/Embedded_Design_Tutorial.srcs/sources_1/bd/Xilinx_Embedded_Design/Xilinx_Embedded_Design.bd
  set_param project.isImplRun false
  set_param project.isImplRun true
  link_design -top Xilinx_Embedded_Design_wrapper -part xczu7ev-ffvc1156-2-e
  set_param project.isImplRun false
  write_hwdef -force -file Xilinx_Embedded_Design_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Xilinx_Embedded_Design_wrapper_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file Xilinx_Embedded_Design_wrapper_drc_opted.rpt -pb Xilinx_Embedded_Design_wrapper_drc_opted.pb -rpx Xilinx_Embedded_Design_wrapper_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force Xilinx_Embedded_Design_wrapper_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file Xilinx_Embedded_Design_wrapper_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file Xilinx_Embedded_Design_wrapper_utilization_placed.rpt -pb Xilinx_Embedded_Design_wrapper_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file Xilinx_Embedded_Design_wrapper_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Xilinx_Embedded_Design_wrapper_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file Xilinx_Embedded_Design_wrapper_drc_routed.rpt -pb Xilinx_Embedded_Design_wrapper_drc_routed.pb -rpx Xilinx_Embedded_Design_wrapper_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file Xilinx_Embedded_Design_wrapper_methodology_drc_routed.rpt -pb Xilinx_Embedded_Design_wrapper_methodology_drc_routed.pb -rpx Xilinx_Embedded_Design_wrapper_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file Xilinx_Embedded_Design_wrapper_power_routed.rpt -pb Xilinx_Embedded_Design_wrapper_power_summary_routed.pb -rpx Xilinx_Embedded_Design_wrapper_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file Xilinx_Embedded_Design_wrapper_route_status.rpt -pb Xilinx_Embedded_Design_wrapper_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file Xilinx_Embedded_Design_wrapper_timing_summary_routed.rpt -pb Xilinx_Embedded_Design_wrapper_timing_summary_routed.pb -rpx Xilinx_Embedded_Design_wrapper_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file Xilinx_Embedded_Design_wrapper_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file Xilinx_Embedded_Design_wrapper_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file Xilinx_Embedded_Design_wrapper_bus_skew_routed.rpt -pb Xilinx_Embedded_Design_wrapper_bus_skew_routed.pb -rpx Xilinx_Embedded_Design_wrapper_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Xilinx_Embedded_Design_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Xilinx_Embedded_Design_wrapper.mmi }
  write_bitstream -force Xilinx_Embedded_Design_wrapper.bit 
  catch { write_sysdef -hwdef Xilinx_Embedded_Design_wrapper.hwdef -bitfile Xilinx_Embedded_Design_wrapper.bit -meminfo Xilinx_Embedded_Design_wrapper.mmi -file Xilinx_Embedded_Design_wrapper.sysdef }
  catch {write_debug_probes -quiet -force Xilinx_Embedded_Design_wrapper}
  catch {file copy -force Xilinx_Embedded_Design_wrapper.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

