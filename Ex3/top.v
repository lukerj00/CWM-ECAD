//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
input rst, enable, direction, clk,
output [7:0] counter_out
);
                  
//Todo: add registers and wires, if needed
reg clk_reg;
reg [7:0] counter_out_reg;
parameter t = 5;

assign counter_out=counter_out_reg;

//Todo: add user logic

always @ (posedge clk_reg) begin
 if (rst) begin
  counter_out_reg <= 8'b00000000;
 end
  else begin
   counter_out_reg <= (enable==0) ? (counter_out_reg) : (direction) ? (counter_out_reg + 1) : (counter_out_reg - 1);
  end
 //if (enable&&direction&&(!rst))
  //counter_out_reg <= counter_out_reg+1;
  //else if (enable&&(!direction)&&(!rst)) begin
   //counter_out_reg <= counter_out_reg-1;
  //end
   //else if (!enable) begin
    //counter_out_reg <= counter_out_reg;
   //end
    //else
     //counter_out_reg <= 0;
    end

endmodule
