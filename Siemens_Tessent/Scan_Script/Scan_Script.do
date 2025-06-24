##############################################################################
## DFT Scan Insertion Script (DO File)
## Description: This script performs scan insertion and DFT analysis.
## Author: Harsh A Patil
## Contact: harshpatilhp28@gmail.com
##############################################################################

##############################################################################
## Set global variables and paths
##############################################################################

# Path to gate-level netlist
set NETLIST_PATH "path/to/gate_level_netlist.v"

# Path to cell library (MDT file)
set CELL_LIB_PATH "path/to/cell_library.mdt"

# Path to save reports
set REPORT_DIR "dft_reports"
file mkdir $REPORT_DIR  ;# Create report directory if it doesn't exist

# Path to save the final output design
set OUTPUT_NETLIST_PATH "path/to/output_netlist.v"

# Scan chain configuration
set CHAIN_LENGTH 100  ;# Number of scan cells per chain
set CHAIN_COUNT 2     ;# Number of scan chains

##############################################################################
## DFT Setup and Analysis
##############################################################################

# Set DFT context
set_context dft -scan

# Read gate-level netlist
if {![file exists $NETLIST_PATH]} {
    puts "Error: Gate-level netlist '$NETLIST_PATH' not found!"
    exit 1
}
read_verilog $NETLIST_PATH

# Read cell library
if {![file exists $CELL_LIB_PATH]} {
    puts "Error: Cell library '$CELL_LIB_PATH' not found!"
    exit 1
}
read_cell_library $CELL_LIB_PATH

# Set current design
set_current_design

# Set design Level
set_design_level top

# Analyze control signals for DFT
analyze_control_signals -auto

# Check design rules for DFT
check_design_rules

# Configure scan insertion options
set_scan_insertion_options -si_port_format "SI_%d"
set_scan_insertion_options -so_port_format "SO_%d"

# Add internal scan mode
add_scan_mode int_mode -type internal -chain_length $CHAIN_LENGTH -chain_count $CHAIN_COUNT -single_power_domain_chains on

# Analyze scan chains
analyze_scan_chains

# Insert test logic
insert_test_logic -write_in_tsdb on

# Generate reports
report_scan_elements > "${REPORT_DIR}/scan_elements_report.txt"
report_scan_chains > "${REPORT_DIR}/scan_chains_report.txt"
report_scan_cells > "${REPORT_DIR}/scan_cells_report.txt"
report_scan_enable > "${REPORT_DIR}/scan_enable_report.txt"

# Write the final design with scan inserted
write_design -output_file $OUTPUT_NETLIST_PATH

# Set system mode to setup
set_system_mode setup

# Open visualizer (if supported by the tool)
open_visualizer

puts "DFT scan insertion completed successfully! Reports saved in ${REPORT_DIR}."
