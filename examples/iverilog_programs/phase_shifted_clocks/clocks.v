`timescale 1ns/1ps

module clocks();

// call the testbed code to generate a .vcd file
testbed testbed ();

logic clk_main, clk_mirror, clk_phase_shifted, delay;
initial clk_main = 0;
initial clk_phase_shifted = 0;
initial clk_mirror = 0;
initial delay = 0;

initial begin
    #45 delay = 1;
end

always begin
    #5 clk_main = !clk_main; // change voltage every 5ns, 100MHz clock
end

always begin
    #5 clk_mirror = delay & ~clk_mirror;
end

always begin
    #5 clk_phase_shifted = delay & ~clk_main;
end

endmodule
