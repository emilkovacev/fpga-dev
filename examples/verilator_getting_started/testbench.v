module testbench(
    input wire clk,
    input reset_l
);

  reg [31:0] count_c;

  // on every rising edge of the clock
  always_ff @(posedge clk) begin
      // increment the counter if the clock was reset
      if (!reset_l) begin
          count_c <= 32'h0;
      end
      else begin
          // increment the counter
          count_c <= count_c + 1;

          // once the counter reaches '3'
          if (count_c >= 10) begin
              // finish simulation
              $write("*-* All Finished *-*\n");
              $finish;
          end
      end
  end
endmodule
