# This file sets up the simulation environment.
create_project -force proj 
set_property part xc7a50tfgg484-2 [current_project]
set_property target_language Verilog [current_project]
set_property "default_lib" "work" [current_project]
create_fileset -simset simset

#read_ip [ glob ../source/dac_if_fifo/dac_if_fifo.xci ]
#generate_target {all} [get_ips *]

set_property  ip_repo_paths  ../ip_repo [current_project]
update_ip_catalog

source ../source/system.tcl
generate_target {synthesis implementation} [get_files ./proj.srcs/sources_1/bd/system/system.bd]

read_verilog -sv [glob ../source/system_tb.v]

current_fileset -simset [ get_filesets simset ]

set_property -name {xsim.elaborate.debug_level} -value {all} -objects [current_fileset -simset]
set_property -name {xsim.simulate.runtime} -value {600ns} -objects [current_fileset -simset]

close_project


