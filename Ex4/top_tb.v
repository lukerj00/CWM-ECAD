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
  button = 1;
  clk = 0;
  throw  = 3'b000;
  
  #(CLK_PERIOD*5)

  forever begin

  button = 1;
  reset = 1;

  #(CLK_PERIOD*5)

  if (throw!=3'b001)
   begin
    $display("***TEST FAILED! reset=1, throw=%d", throw);
   err = 1;
   end

  #(CLK_PERIOD*5)

  reset = 0;
  
  #(CLK_PERIOD*5)
  if (throw==(3'b111|3'b000))
   begin
     $display("***TEST FAILED! reset=0, throw=%d", throw);
   err = 1;
   end
  
  begin
    #(CLK_PERIOD*5)
      if (err==0)
        $display("***TEST PASSED! :) ***");
      $finish;
    end

end

 dice top (
 .clk (clk),
 .reset (reset),
 .button (button),
 .throw (throw),
);

endmodule

