##############################################################################
## Basic ATPG Script (DO File)
## Description: This script performs ATPG using the scan-inserted netlist.
## Author: Harsh A Patil
## Contact: harshpatilhp28@gmail.com
##############################################################################

##############################################################################
## Load ATPG Setup DO File (generated from write_atpg_setup)
##############################################################################

# Run the dofile generated during write_atpg_setup to set up scan environment
dofile ATPG_set_verify_scan_modes.dofile

##############################################################################
## ATPG Flow
##############################################################################

# Add all detectable faults to the fault list
add_faults -all

# Generate test patterns for the inserted scan chains
create_patterns

puts "ATPG process completed successfully!"
