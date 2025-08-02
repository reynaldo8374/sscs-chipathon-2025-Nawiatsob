Hierarchical 4:1 MUX using Transmission Gates
This repository contains the design files for a 4-to-1 multiplexer standard cell, created as part of the Chipathon 2025 digital track. The design is targeted for the GF180MCU open-source PDK.

Design Overview
The primary goal of this project is to expand the existing OSU standard cell library by adding a functional and well-characterized 4:1 MUX.

The design follows a hierarchical approach, utilizing three instances of the pre-existing 2:1 MUX standard cells which are based on transmission gates. This method leverages verified library components to ensure robustness and accelerate the design-to-tapeout process.

Structure:

Stage 1: Two 2:1 MUXes select between four data inputs (I0, I1, I2, I3) controlled by the first select line (S0).

Stage 2: A final 2:1 MUX selects between the outputs of the first stage, controlled by the second select line (S1).

Repository Contents
/schematic: Contains Xschem files (.sch, .sym) for the 4:1 MUX and its testbench.

/layout: Contains KLayout files (.gds) for the final layout of the cell.

/simulation: Contains SPICE netlists (.spice) and simulation results.

/characterization: Contains the CharLib configuration (.yml) and the final Liberty file (.lib).

/docs: Project proposal and final report.

Tools Used
Xschem: for schematic entry.

KLayout: for physical layout and DRC/LVS verification.

Ngspice: for circuit simulation.

CharLib: for standard cell characterization.
