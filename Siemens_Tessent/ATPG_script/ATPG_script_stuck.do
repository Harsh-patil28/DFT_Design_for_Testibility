##############################################################################
## Basic ATPG Script (DO File)
## Description: General ATPG script for scan-inserted netlist.
## Author: Harsh A Patil
## Contact: harshpatilhp28@gmail.com
##############################################################################

##############################################################################
## Load ATPG Setup DO File (generated from write_atpg_setup)
##############################################################################

# Run the setup dofile to configure scan environment
dofile <setup_dofile_name>.dofile

##############################################################################
## ATPG Flow
##############################################################################

# Set the fault type (e.g., stuck, transition, etc.)
set_fault_type stuck

# Add all detectable faults to the fault list
add_faults -all

# Generate ATPG patterns
create_patterns

##############################################################################
## Output Results
##############################################################################

# Write detected fault report
# <file_name>: name of the output fault file (e.g., faults_report.txt)
# -class <fault_class>: specify fault class (e.g., AU, AB, RE) 
write_faults <file_name> -class <fault_class>

# Write ATPG patterns to file
# <output_path>: file path and name for pattern output
# -stil / -verilog: pattern format
# -serial / -parallel: scan type
write_patterns <output_path> -<format> 

##############################################################################
## Completion Message
##############################################################################

puts "ATPG process completed successfully!"
