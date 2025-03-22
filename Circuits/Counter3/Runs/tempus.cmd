#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Thu Mar  6 16:17:03 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v20.20-p001_1 (64bit) 12/02/2020 16:07 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.20-p001_1 NR200917-0125/MT (database version 18.20.530) {superthreading v2.11}
#@(#)CDS: AAE 20.20-p005 (64bit) 12/02/2020 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.20-p010_1 () Dec  2 2020 14:35:30 ( )
#@(#)CDS: SYNTECH 20.20-p001_1 () Nov 24 2020 02:28:20 ( )
#@(#)CDS: CPE v20.20-p009

read_verilog /home/02fe21bec035/HP/DFT/Count2/Scan_Rpt/scan_net.v
read_lib /home/02fe21bec035/HP/DFT/Count2/NangateOpenCellLibrary_slow_conditional_ccs.lib
set_top_module
ui::getColorByName chartreuse
selectInst ts_lockup_latchn_clkc1_intno2_i
deselectInst ts_lockup_latchn_clkc1_intno2_i
selectInst {counter_reg[0]}
deselectInst {counter_reg[0]}
exit
