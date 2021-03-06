//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

  module dice (
    input clk,
    input reset,
    input button,
    output reg [2:0] throw
  );

  always @(posedge clk) begin
    if (reset == 1)
      throw <= #1 3'b001;
    else if (reset == 0) begin
      if (button) begin
        if (throw<3'b111)
         throw <= #1 (throw + 1);
        else
         throw <= #1 3'b001;
        end
      else
        throw <= #1 throw;
      end
    end  
        //((button)&(throw==(3b'000|3b'110|3b'111)))
     
     //else if (!button)
      //throw <= #1 throw;

endmodule
    








