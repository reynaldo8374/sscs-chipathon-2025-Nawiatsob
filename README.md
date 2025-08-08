# 4:1 Multiplexer Using OSU Standard Cell Library

## Overview
This project implements a **4:1 Multiplexer** using the **OSU Standard Cell Library**.  
The design is based on **transmission gates** for signal selection and **buffers** for output signal restoration.

---

## Standard Cell Concept
A **standard cell** is a pre-designed and pre-characterized logic gate or functional block, stored in a library, that can be used in ASIC design.  
The OSU Standard Cell Library provides:
- **Schematic symbols** for circuit design
- **Layout views** for physical implementation
- **Characterization data** for timing and power analysis

By using a standard cell library, designers can:
- Ensure design rules compliance
- Reduce layout time
- Achieve predictable performance

---

## Transmission Gate MUX Architecture
A **transmission gate** is built from:
- One **nMOS** transistor
- One **pMOS** transistor
- Both transistors are controlled by complementary control signals

In a **4:1 multiplexer**, four transmission gates are used, each connected to one data input (`I0`, `I1`, `I2`, `I3`).  
Two select lines (`S0`, `S1`) determine which transmission gate is active.

---

## Buffer for Signal Restoration
Since transmission gates are **pass elements**, the output voltage can degrade due to the threshold voltage drop.  
A **buffer** (typically two inverters in series) is added after the transmission gate network to:
- Restore logic levels to `VDD` and `GND`
- Improve drive strength
- Reduce signal delay in subsequent stages

---

## Logical Function
The truth table for a 4:1 MUX is:

| S1 | S0 | Output |
|----|----|--------|
| 0  | 0  | I0     |
| 0  | 1  | I1     |
| 1  | 0  | I2     |
| 1  | 1  | I3     |

---

## OSU Standard Cells Used
- **Transmission Gate Cells** – for controlled signal pass
- **Inverter Cells** – for generating complementary control signals
- **Buffer Cells** – for output restoration

---

## Design Flow
1. **Schematic Design**  
   - Use OSU standard cells for transmission gates, inverters, and buffers
   - Connect according to the MUX architecture
2. **Simulation**  
   - Verify logic functionality and timing
3. **Layout Design**  
   - Place and route using OSU standard cell layouts
   - Ensure DRC/LVS compliance
4. **Post-Layout Simulation**  
   - Confirm functionality with extracted parasitics

---

## Advantages of This Implementation
- **Low propagation delay** due to pass-transistor design
- **Low area** using compact standard cells
- **Good signal integrity** due to output buffering
- **Reusable design** thanks to standard cell methodology

---

## License
This project is intended for educational purposes in digital IC design using standard cell libraries.

## Links
Tracking sheets:
https://docs.google.com/spreadsheets/d/1sVi-iYNIls3bni4GYa2EcIpRoHsRM33AFb4rUEtLEvo/edit?gid=0#gid=0
