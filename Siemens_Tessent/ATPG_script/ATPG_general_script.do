set_context patterns -scan

read_verilog <scan inserted netlist>

read_cell_library <path to mdt>

set_current_design <name>

dofile ATPG_set.dofile

set_system_mode analysis

set_fault_type <fault type>

add_faults -all

create_patterns 

write_faults <file name> > <-all or -class type of class such as AU.PC>

write_patterns <file name > <format such as -stil or -verilog> <-parallel or -serial>

