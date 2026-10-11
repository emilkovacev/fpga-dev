module top(
    input wire clk,
    input reset_l,

    output wire [1:0] out_small,
    input [1:0] in_small
);

  assign out_small = ~reset_l ? '0 : (in_small + 2'b1);

  testbench testbench (
    .clk                         (clk),
    .reset_l                     (reset_l)
  );

  initial begin
    $dumpfile("top.vcd");
    $dumpvars();
  end
endmodule
