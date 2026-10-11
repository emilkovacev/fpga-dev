// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain.
// SPDX-FileCopyrightText: 2017 Wilson Snyder
// SPDX-License-Identifier: CC0-1.0
//======================================================================

#include <verilated.h>
#include "Vtop.h"

int main(int argc, char** argv) {
    VerilatedContext* const contextp = new VerilatedContext;
    contextp->traceEverOn(true);
    contextp->randReset(2);
    contextp->threads(1);
    contextp->commandArgs(argc, argv);

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vtop* const top = new Vtop{contextp};

    top->clk = 0;
    top->reset_l = !0;
    top->in_small = 1;

    // Simulate until $finish
    while (!contextp->gotFinish()) {
        // 1 timeprecision period passes...
        contextp->timeInc(1);

        // Toggle a fast (time/2 period) clock
        top->clk = !top->clk;

        if (!top->clk) {
            if (contextp->time() > 1 && contextp->time() < 10) {
                top->reset_l = !1;  // Assert reset
            } else {
                top->reset_l = !0;  // Deassert reset
            }
        }

        // Evaluate model
        top->eval();

        contextp->statsPrintSummary();
    }

    // Final model cleanup
    top->final();

    // Return good completion status
    return 0;
}
