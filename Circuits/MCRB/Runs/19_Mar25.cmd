# Cadence Genus(TM) Synthesis Solution, Version 20.11-s111_1, built Apr 26 2021 14:57:38

# Date: Wed Mar 19 11:22:12 2025
# Host: APL4.kletech.ac.in (x86_64 w/Linux 4.18.0-425.3.1.el8.x86_64) (6cores*12cpus*1physical cpu*12th Gen Intel(R) Core(TM) i5-12500 18432KB)
# OS:   Red Hat Enterprise Linux release 8.7 (Ootpa)

read_lib ../Libs/NanOCL_slow.lib
read_physical -lef ../Lef/NANOCL.lef
read_hdl ../Netlist/mcrb.v
elaborate
read_sdc ../Constraint/sdc.sdc
syn_gen
syn_map
syn_opt
write_hdl > ../Netlist/Nan_opt.v
report_timing
report_timing > ../Reports/Timing.rpt
report_area > ../Reports/area.rpt
report_clocks > ../Reports/clocks.rpt
report_gates  > ../Reports/gates.rpt
report_power  > ../Reports/power.rpt
gui_show
