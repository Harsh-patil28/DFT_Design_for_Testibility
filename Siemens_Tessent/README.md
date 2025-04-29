# Siemens Tessent: Scan Insertion & MBIST Flow

This repository documents and automates a **Design-for-Test (DFT)** flow using **Siemens Tessent**, focusing on:

- ✅ Scan Chain Insertion 
- 🧠 Memory Built-In Self-Test (MBIST) for embedded memory testing (coming soon)

The repository is organized with clear folder structures for each DFT technique, including guides and TCL scripts.

---

## 📁 Repository Structure
/Siemens-Tessent-DFT  
│── /Scan  
│   ├── /Guide           # Scan insertion guide  
│   └── /Scripts         # Scan insertion TCL scripts  
│── /Memory  
│   ├── /Guide           # MBIST (Memory BIST) documentation (WIP)  
│   └── /Scripts         # MBIST TCL scripts (WIP)  
│── README.md            # DFT overview and flow instructions  


##  Features

- **Overview of Siemens Tessent Flow**  
  Introduction to scan and MBIST insertion using Tessent automation tools.

- **Input File Requirements and Setup**  
  Describes design netlist, library, timing constraints, and memory instance info.

- **Scan Chain Insertion Flow**  
  Automates scan stitching, port declaration, DFT rule checks, and scan analysis.

- **Memory BIST (MBIST) Insertion**  
  Guides you through inserting memory BIST logic with repair analysis and control ports.

- **Report Generation and Analysis**  
  Generates scan cell/chains and MBIST reports to evaluate fault coverage and logic integrity.

- **Best Practices**  
  Recommendations for clean DFT integration, rule compliance, and tool setup.

  ## Usage  
Refer to the **Guide** folder for step-by-step instructions. Ensure all necessary input files, such as `.lib`, `.mdt`, and `.v`, are properly set before running the synthesis script from the **Scripts** folder.  

## Contact  
For queries, reach out to **Harsh A. Patil** at harshpatilhp28@gmail.com 
