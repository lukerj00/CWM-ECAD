//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
   );
   
   parameter CLK_PERIOD = 10;
   reg clk;
   reg reset;
   reg button;
   reg [2:0] throw;
   //output wire [2:0] throw_out;

   initial begin
   clk = 1'b0;
   forever
     #(CLK_PERIOD/2) clk=~clk;
   end

  initial begin
  reset = 1;
  button = 0;
  throw  = 3'b000;

  #(CLK_PERIOD*5)
  if (throw!=3'b001)
   begin
    $display("***TEST FAILED! reset=1, throw=%d", throw);
   err = 1;
   end

  reset=0;
  #(CLK_PERIOD*5)
  if (throw=3'b001)
   begin
    $display("***TEST FAILED! reset=0, throw=%d", throw);
  err = 1;
  end

  button = 1;
  #(CLK_PERIOD*5)

end

 counter top (
 .clk (clk)
 .reset (reset)
 .button (button)
 .throw (throw)
);

intial begin





