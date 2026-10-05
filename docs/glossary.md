# Glossary

A collection of terms related to FPGA development

## A

### ASIC

Application Specific Integrated Circuit. Typically expensive to fab and cannot
be reprogrammed after fabrication. They are very high-performance, but only useful
in large-scale markets.

https://www.arm.com/glossary/asic

## B

### BRAM

Block Random Access Memory. Used for storing large amounts of data in the FPGA.
BRAM is a physical component on an FPGA, and part of the FPGA spec. sheet.

In a single port BRAM configuration, data can be either read/written from BRAM 
on the positive edge of a clock cycle (not both).

In a dual port BRAM (DPRAM) configuration, data can be read and written during the same
clock cycle. This has more use-cases than single port.

BRAM can be used to store read-only data at initialization, or store data from
an external device (e.g. external SSD).

### Bus

A wired connection that transmits a fixed amount of data between components 
(e.g. wires, optical fiber).

## C

### Clock

A steady stream of low-to-high-to-low transitions of a voltage. The waveform of
the clock is a square wave, where the amplitude oscillates between fixed minimum
and maximum values. One **cycle** of the clock is one period of the wave.

Cycle rate is measured in Hz (cycles per second). A clock that completes
1E6 cycles per second, the clock speed is **1 MHz**.

FPGA clocks typically have a clock speed of about 100 MHz.

https://en.wikipedia.org/wiki/Clock_signal

https://en.wikipedia.org/wiki/Square_wave_(waveform)

## D

## E

## F

### FIFO

First in First Out (register). The mechanism can read one input at a time, and
output one output at a time. Kind of like an assembly line for data!

* Width: Size of data (e.g. 1-bit or 2-bit FIFO)
* Depth: Maximum number of items that can be stored at once within a FIFO

Big use-case for FIFOs is crossing clock domains:
* Moving data from a 60MHz to 40MHz clock domain, or from 40MHz to 60MHz

Rules for FIFOs:
* **Never write to a full FIFO**
* **Never read from an empty FIFO**

https://nandland.com/lesson-8-what-is-a-fifo/

### Flip-Flop

A component used to keep track of state on an FPGA. Flip-Flops enable FPGA
programs to keep track of counters, state machines, and statuses. Without them,
circuit logic would all be evaluated immediately.

A Flip Flop has three pins:

* a) Data input to Flip-Flop (from some sort of rectangular wave)
* b) Clock input to Flip-Flop (the square wave from the FPGA clock)
* c) Data output to Flip-Flop (a composite wave, `flip_flop(a, b) -> c`)

A Flip-Flop registers the data from the data input to the data output **only on 
the rising edge of the clock** (`0 -> 1`). If the data input rises at the same 
time as the clock input rises, the Flip-Flop **does not record**.

When Flip-Flops are chained, the data output of each Flip-Flop is offset by 1 
cycle.

https://nandland.com/lesson-5-what-is-a-flip-flop/

https://en.wikipedia.org/wiki/Pulse_wave

### FPGA

Field Programmable Gate Array. An SoC that can be reprogrammed! They offer
nearly the same speed as ASICs, but are much more flexible in their use-cases
because you can update the PL of the device ad-hoc.

SoCs typically refer to ASICs (ASIC-based SoC) or FPGAs (FPGA-based SoC).

## G

## H

### HDL

Hardware Description Language. A language used to describe the structure and 
behavior of circuits. Typically looks like a programming language, e.g. C, 
except they also encode the concept of time.

HDLs are used for logic simulation and synthesis.

* simulation: simulate waveforms of logic
* synthesis: optimize logic gates

There are two dominant HDLs, SystemVerilog and VHDL.

https://pages.hmc.edu/harris/cmosvlsi/4e/cmosvlsidesign_4e_App.pdf

### HDL Wrapper

A wrapper for HDL code from multiple modules. Combines HDL code from all modules
(including IP from AMD / board-specific IP) into one source.

## I

## J

## K

## L

### Latch

**Never use a latch in FPGA design.** They can be difficult for FPGAs to create
efficiently. Usually latches are created accidentally.

Two inputs - D and E, One output - Q

If E is ON, return D. Otherwise return the previous value for Q.

https://nandland.com/lesson-9-what-is-a-latch/

### LUT

Look-Up Table. A component programmed to perform boolean algebra. LUTs can be
programmed similar to boolean truth tables, and are programmed in an HDL 
(e.g. Verilog).

https://nandland.com/lesson-4-what-is-a-look-up-table-lut/

## M

### Module

A block of hardware with inputs and outputs. Kind of like a function, but for
a circuit.

## N

## O

## P

### Pin



### PL

Programmable Logic. Equivilent to an FPGA in capability. One of two parts of 
Zynq 7000 series SoCs.

### PS

Processing System. A CPU, typically ARM Cortex.

## Q

## R

## S

### SoC

System-on-Chip. A single silicon chip that is used to implement the 
functionality of an entire system. SoC can implement all aspects of a 
digital system, including processing, high-speed logic, interfacing, memory, 
etc.

### Synthesis / Code Synthesis

The process of converting HDL into machine instructions for the FPGA. The tool
that does this process is called the **Synthesis Tool**.

Some commands in HDLs are non-synthesizable (i.e. there is no hardware 
equivilent instruction). These are primarily used for simulation / debugging.
Examples include `delay` statements and `for` loops. In some cases, they can
be rewritten to be synthesizable, but **often times they work differently than
similar code in C/C++ would!**

https://nandland.com/lesson-6-synthesizable-vs-non-synthesizable-code/

## T

## U

## V

## W

## X

### XSA file

Xylinx Support Archive (XSA) file. A proprietary hardware design file format
used by Vitis. See https://github.com/Xilinx/Embedded-Design-Tutorials/tree/master/docs/Getting_Started/Zynq7000-EDT
for a tutorial on embedded design using the Zynq 7000 SoC.

## Y

## Z

### Zynq 7000

A series of SoCs developed by Xilinx/AMD that provide a CPU and PL on the same 
device. Critically, there are high-speed AXI connections between the two, which
allow for highly flexible SoC development (Zynq is marketed as a APSoC, 
'All-Programmable SoC').
