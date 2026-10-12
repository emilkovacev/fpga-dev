`timescale 1ns/1ps

module testbed();

initial begin
    $dumpfile("clocks.vcd");
    $dumpvars();
    #100 $finish;
end

endmodule
