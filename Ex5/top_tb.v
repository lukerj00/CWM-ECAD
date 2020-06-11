//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
   );
   
   parameter CLK_PERIOD = 10;

   reg clk;
   reg [2:0] counter;
   wire red;
   wire amber;
   wire green;
   reg err;

   initial begin
   clk = 1'b0;
   forever
     #(CLK_PERIOD/2) clk=~clk;
   end

  initial begin
  
  clk = 0;
  counter = 3'b000;
  assign red = 1'b0;
  assign amber = 1'b0;
  assign green = 1'b0;
  
  #(CLK_PERIOD*5)

  forever begin

  #(CLK_PERIOD*5)

    if ((red==0)&(amber==0)&(green==0))
   begin
    $display("***TEST FAILED! no lights active, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end

  #(CLK_PERIOD*5)

    if ((red==1)&(amber==0)&(green==1))
   begin
    $display("***TEST FAILED! illegal light state, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end
end

  #(CLK_PERIOD*5)

    if ((red==0)&(amber==1)&(green==1))
   begin
    $display("***TEST FAILED! illegal light state, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end

  #(CLK_PERIOD*5)

    if ((red==1)&(amber==1)&(green==1))
   begin
    $display("***TEST FAILED! illegal light state, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end
end

  initial begin
     #50 
     if (err==0)
       $display("***TEST PASSED! :) ***");
     $finish;
  end

 trafficlights top (
 .clk (clk),
 .red (red),
 .amber (amber),
 .green (green)
);

endmodule
