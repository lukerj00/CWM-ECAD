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
   
   parameter CLK_PERIOD = 2;

   reg clk;
   reg [2:0] counter;
   reg red;
   reg amber;
   reg green;
   reg err;
   wire red_out;
   wire amber_out;
   wire green_out;

   initial begin
   clk = 1'b0;
   forever
     #(CLK_PERIOD/2) clk=~clk;
   end

  initial begin
  
  clk = 0;
  counter = 3'b000;
  red = 1'b0;
  amber = 1'b0;
  green = 1'b0;
  err = 0;
  //red_out = 1'b0;
  //amber_out = 1'b0;
  //green_out = 1'b0;

  #(CLK_PERIOD)

  forever begin

  #(CLK_PERIOD)

    if ((red_out==0)&(amber_out==0)&(green_out==0))
   begin
    $display("***TEST FAILED! no lights active, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end

  #(CLK_PERIOD*2)

    if ((red_out==1)&(amber_out==0)&(green_out==1))
   begin
    $display("***TEST FAILED! illegal light state, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end
end

  #(CLK_PERIOD*2)

    if ((red_out==0)&(amber_out==1)&(green_out==1))
   begin
    $display("***TEST FAILED! illegal light state, red=%d, amber=%d, red=%d ***", red, amber, red);
   err = 1;
   end

  #(CLK_PERIOD*2)

    if ((red_out==1)&(amber_out==1)&(green_out==1))
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
 .red_out (red_out),
 .amber_out (amber_out),
 .green_out (green_out)
);

endmodule
