//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_c1ac_wrapper.bd
//Design : bd_c1ac_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_c1ac_wrapper
   (clk,
    probe0,
    probe1,
    probe2);
  input clk;
  input [0:0]probe0;
  input [31:0]probe1;
  input [31:0]probe2;

  wire clk;
  wire [0:0]probe0;
  wire [31:0]probe1;
  wire [31:0]probe2;

  bd_c1ac bd_c1ac_i
       (.clk(clk),
        .probe0(probe0),
        .probe1(probe1),
        .probe2(probe2));
endmodule
