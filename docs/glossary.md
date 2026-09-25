# Glossary

A collection of terms related to FPGA development

### SoC

System-on-Chip. A single silicon chip that is used to implement the 
functionality of an entire system. SoC can implement all aspects of a 
digital system, including processing, high-speed logic, interfacing, memory, 
etc.

SoCs typically refer to ASICs (ASIC-based SoC) or FPGAs (FPGA-based SoC).

### ASIC

Application Specific Integrated Circuit. Typically expensive to fab and cannot
be reprogrammed after fabrication. They are very high-performance, but only useful
in large-scale markets.

https://www.arm.com/glossary/asic

### FPGA

Field Programmable Gate Array. An SoC that can be reprogrammed! They offer
nearly the same speed as ASICs, but are much more flexible in their use-cases
because you can update the PL of the device ad-hoc.

### PS

Processing System. A CPU, typically ARM Cortex.

### PL

Programmable Logic. Equivilent to an FPGA in capability. One of two parts of 
Zynq 7000 series SoCs.

### Zynq 7000

A series of SoCs developed by Xilinx/AMD that provide a CPU and PL on the same 
device. Critically, there are high-speed AXI connections between the two, which
allow for highly flexible SoC development (Zynq is marketed as a APSoC, 
'All-Programmable SoC').

### Bus (hardware)

A wired connection that transmits a fixed amount of data between components 
(e.g. wires, optical fiber).

### HDL

Hardware Description Language. A language used to describe the structure and 
behavior of circuits. Typically looks like a programming language, e.g. C, 
except they also encode the concept of time.

HDLs are used for logic simulation and synthesis.
* simulation: simulate waveforms of logic
* synthesis: optimize logic gates

There are two dominant HDLs, SystemVerilog and VHDL.

https://pages.hmc.edu/harris/cmosvlsi/4e/cmosvlsidesign_4e_App.pdf

### Module

A block of hardware with inputs and outputs. Kind of like a function, but for
a circuit.

### .xsa file

Xylinx Support Archive (XSA) file. A proprietary hardware design file format
used by Vitis. See https://github.com/Xilinx/Embedded-Design-Tutorials/tree/master/docs/Getting_Started/Zynq7000-EDT
for a tutorial on embedded design using the Zynq 7000 SoC.

### HDL Wrapper

A wrapper for HDL code from multiple modules. Combines HDL code from all modules
(including IP from AMD / board-specific IP) into one source.
