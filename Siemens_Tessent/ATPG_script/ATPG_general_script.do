##############################################################################
## Comprehensive ATPG Script
## Description: Full ATPG flow for scan-inserted netlist including setup,
##              pattern generation, and output.
## Author:  Harsh A Patil
## Contact: harshpatilhp28@gmail.com
##############################################################################

##############################################################################
## Context and Setup
##############################################################################

# Set scan environment and patterns
set_context patterns -scan

# Read the scan-inserted Verilog netlist
# <netlist_file>: path to the scan-inserted netlist
read_verilog <netlist_file>

# Read cell library file
# <library_file>: path to the .mdt cell library file
read_cell_library <library_file>

# Set the current design
# <design_name>: name of the top module
set_current_design <design_name>

# Load ATPG configuration dofile (usually created with write_atpg_setup)
dofile ATPG_set.dofile

##############################################################################
## ATPG Analysis Mode and Fault Setup
##############################################################################

# Set the ATPG tool to analysis mode
set_system_mode analysis

# Set the type of faults to be targeted
# Example: stuck, transition, pathdelay, etc.
set_fault_type <fault_type>

# Add all faults of the specified type to the fault list
add_faults -all

##############################################################################
## Pattern Generation
##############################################################################

# Create test patterns for the selected faults
create_patterns

##############################################################################
## Output Results
##############################################################################

# Write fault report to file
# <faults_file>: name of the fault report output file
# -class <fault_class>: specify a fault class such as AU, PC, AB, etc.
write_faults <faults_file> -class <fault_class>

# Write generated patterns to file
# <pattern_file>: file name for ATPG pattern output
# -stil / -verilog: specify the output format
# -serial / -parallel: select scan chain mode
write_patterns <pattern_file> -<format> -<scan_type>

##############################################################################
## Completion Message
##############################################################################

puts "ATPG flow completed successfully!"
