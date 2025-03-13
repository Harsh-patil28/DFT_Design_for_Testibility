##############################################################################
## Genus Synthesis Script
## Description: This script performs synthesis using Cadence Genus.
## It reads design files, performs synthesis, and writes out the netlist.
## Author: Harsh A Patil
## Contact: harshpatilhp28@gmail.com
##############################################################################

##############################################################################
## Preset global variables and attributes
##############################################################################

# Design name (replace <design_name> with your design name)
set DESIGN "my_design"

# Synthesis effort levels (high, medium, low)
set GEN_EFF "high"       # Effort for synthesis generation
set MAP_OPT_EFF "high"   # Effort for mapping and optimization

# Date and time for dynamic file naming
set DATE [clock format [clock seconds] -format "%b%d-%T"]

# Output directory for saving netlist
set OUTPUT_DIR "outputs_${DATE}"
file mkdir $OUTPUT_DIR  ;# Create output directory if it doesn't exist

# Output directory for saving netlist
set REPORT_DIR "REPORTS_${DATE}"
file mkdir $REPORT_DIR  ;# Create output directory if it doesn't exist

##############################################################################
## Set global paths for input files
##############################################################################

# Path to library file (.lib)
set LIB_PATH "path/to/my_library.lib"

# Path to LEF file (.lef)
set LEF_PATH "path/to/my_design.lef"

# Path to HDL file (.v)
set HDL_PATH "path/to/my_design.v"

# Path to SDC constraints file (.sdc)
set SDC_PATH "path/to/my_constraints.sdc"

##############################################################################
## Read input files
##############################################################################

# Read library files
if {![file exists $LIB_PATH]} {
    puts "Error: Library file '$LIB_PATH' not found!"
    exit 1
}
read_lib $LIB_PATH

# Read LEF files
if {![file exists $LEF_PATH]} {
    puts "Error: LEF file '$LEF_PATH' not found!"
    exit 1
}
read_physical -lef $LEF_PATH

# Read RTL design
if {![file exists $HDL_PATH]} {
    puts "Error: Verilog file '$HDL_PATH' not found!"
    exit 1
}
read_hdl $HDL_PATH

# Elaborate the design
elaborate $DESIGN

# Read SDC constraints
if {![file exists $SDC_PATH]} {
    puts "Error: SDC file '$SDC_PATH' not found!"
    exit 1
}
read_sdc $SDC_PATH

##############################################################################
## Synthesis Flow
##############################################################################

# Generate synthesis
syn_gen -effort $GEN_EFF
write_hdl > "${OUTPUT_DIR}/${DESIGN}_syn_gen.v"  ;# Save intermediate netlist

# Map the design
syn_map -effort $MAP_OPT_EFF
write_hdl > "${OUTPUT_DIR}/${DESIGN}_syn_map.v"  ;# Save intermediate netlist

# Optimize the design
syn_opt -effort $MAP_OPT_EFF
write_hdl > "${OUTPUT_DIR}/${DESIGN}_syn_opt.v"  ;# Save final netlist

##############################################################################
## Save Reports
##############################################################################

# Save synthesis reports
report_area > "${REPORT_DIR}/${DESIGN}_area_report_${DATE}.rpt"
report_timing > "${REPORT_DIR}/${DESIGN}_timing_report_${DATE}.rpt"
report_power > "${REPORT_DIR}/${DESIGN}_power_report_${DATE}.rpt"
report_gates > "${REPORT_DIR}/${DESIGN}_gates_report_${DATE}.rpt"

puts "Synthesis completed successfully! Results saved in ${OUTPUT_DIR} and Reports in ${REPORT_DIR}."
