#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Thu Mar  6 15:40:00 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_lib ../NangateOpenCellLibrary_slow_conditional_ccs.lib
read_verilog ../Scan_Ins/S_net.v
set_top_module
read_verilog ../Scan_Ins/S_net.v
set_top_module
ui::getColorByName yellow
selectInst {counter_up_reg[3]}
deselectInst {counter_up_reg[3]}
selectInst {counter_up_reg[3]}
deselectInst {counter_up_reg[3]}
selectInst {counter_up_reg[3]}
deselectInst {counter_up_reg[3]}
selectInst {counter_up_reg[3]}
deselectInst {counter_up_reg[3]}
selectInst {counter_up_reg[3]}
deselectInst {counter_up_reg[3]}
ui::getColorByName yellow
ui::getColorByName green
verify_connectivity -type all -error 1000 -warning 50
exit
