##############################################################################
## Static Timing Analysis (STA) Script (Tempus)
## Description: This script performs Basic STA using Tempus by reading libraries,
##              netlists, constraints, and generating timing reports.
## Author: Harsh A Patil
## Contact: harshpatilhp28@gmail.com
##############################################################################

##############################################################################
## Set global variables and paths
##############################################################################

# Path to dotlib file (library)
set LIB_PATH "path/to/technology_library.lib"

# Path to synthesized gate-level netlist
set NETLIST_PATH "path/to/gate_level_netlist.v"

# Top module name
set TOP_MODULE "your_top_module"

# Path to timing constraint file (SDC)
set SDC_PATH "path/to/timing_constraints.sdc"

# Optional: Path to interconnect parasitics file (SPEF)
set SPEF_PATH "path/to/parasitics.spef"

# Path to save STA reports
set REPORT_DIR "sta_reports"
file mkdir $REPORT_DIR  ;# Create report directory if it doesn't exist

##############################################################################
## STA Flow
##############################################################################

# Read library file
if {![file exists $LIB_PATH]} {
    puts "Error: Library file '$LIB_PATH' not found!"
    exit 1
}
read_lib $LIB_PATH

# Read gate-level Verilog netlist
if {![file exists $NETLIST_PATH]} {
    puts "Error: Netlist file '$NETLIST_PATH' not found!"
    exit 1
}
read_verilog $NETLIST_PATH

# Set the top module
set_top_module $TOP_MODULE

# Read SDC constraints
if {![file exists $SDC_PATH]} {
    puts "Error: SDC file '$SDC_PATH' not found!"
    exit 1
}
read_sdc $SDC_PATH

# Optional: Read parasitics file
if {[file exists $SPEF_PATH]} {
    read_spef $SPEF_PATH
} else {
    puts "Warning: SPEF file not found. Continuing without parasitics."
}

# Report timing analysis
report_timing > "${REPORT_DIR}/timing_report.txt"

puts "Static Timing Analysis completed successfully. Report saved in ${REPORT_DIR}."
