`timescale 1ns / 1ps
module sd_1011_tb;
  reg x, areset, clk;
  wire op;
  wire [1:0] current_state, next_state;
  // DUT instantiation
  sd_1011 dut (
    .x(x),
    .areset(areset),
    .clk(clk),
    .op(op),
    .current_state(current_state),
    .next_state(next_state)
  );
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  // Stimulus
  initial begin
    areset = 1;
    x = 0;
    #10 areset = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #100 $finish;
  end
  // VCD dump (REQUIRED for EPWave)
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, sd_1011_tb);
  end
endmodule
