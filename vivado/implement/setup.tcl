# This script sets up a Vivado project with all ip references resolved.
file delete -force proj.xpr *.os *.jou *.log proj.srcs proj.cache proj.runs
#
#create_project -force proj 
create_project -part xc7a100tcsg324-2 -force proj 
set_property target_language Verilog [current_project]
set_property default_lib work [current_project]
load_features ipintegrator
tclapp::install ultrafast -quiet


read_ip ../source/i2c_ila/i2c_ila.xci
upgrade_ip -quiet  [get_ips *]
generate_target {all} [get_ips *]


# Recreate the Block Diagram of the processor system.
source ../source/system.tcl
generate_target {synthesis implementation} [get_files ./proj.srcs/sources_1/bd/system/system.bd]
set_property synth_checkpoint_mode None    [get_files ./proj.srcs/sources_1/bd/system/system.bd]


read_verilog -sv ../../rtl/i2c_master.v
read_verilog -sv ../../rtl/axis_fifo.v
read_verilog -sv ../../rtl/i2c_master_axil.v

read_verilog -sv ../source/top.sv

read_xdc ../source/top.xdc

#add_files -norecurse ../vitis/release/production.elf
#set_property SCOPED_TO_REF system [get_files -all -of_objects [get_fileset sources_1] {production.elf}]
#set_property SCOPED_TO_CELLS { microblaze_0 } [get_files -all -of_objects [get_fileset sources_1] {production.elf}]

close_project



