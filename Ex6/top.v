//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

 module top (
  input rst, clk, button, sel,
  output wire [2:0] result
 );

  //reg [2:0] choice;
  wire [2:0] throw_out;
  reg red;
  reg amber;
  reg green;
  wire [2:0] lights_out;
  parameter CLK_PERIOD = 10;

  dice dice_6(clk, rst, button, throw_out);
   trafficlights lights_6(clk, red, amber, green); 
    assign lights_out = {red, amber, green};
   mux mux_6(throw_out, lights_out, sel, result);

endmodule
