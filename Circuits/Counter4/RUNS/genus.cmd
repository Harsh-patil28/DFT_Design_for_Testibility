# Cadence Genus(TM) Synthesis Solution, Version 20.11-s111_1, built Apr 26 2021 14:57:38

# Date: Thu Mar 06 14:53:48 2025
# Host: APL7.kletech.ac.in (x86_64 w/Linux 4.18.0-425.3.1.el8.x86_64) (6cores*12cpus*1physical cpu*12th Gen Intel(R) Core(TM) i5-12500 18432KB)
# OS:   Red Hat Enterprise Linux release 8.7 (Ootpa)

read_lib ../NangateOpenCellLibrary_slow_conditional_ccs.lib
read_physcial -lef ../*.lef
read_physical -lef ../*.lef
read_hdl ../count.v
elaborate
read_sdc ../sdc.sdc
syn_gen
syn_map
syn_opt
write_hdl > count_net_Nan.v
gui_show
