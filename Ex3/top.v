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
output counter_out
);
                    
    //Todo: add registers and wires, if needed
reg clk_reg;
reg [7:0] counter_out_reg;
wire [7:0] counter_out;

parameter t = 5;
initial begin
	clk_reg = 0;
	forever
        #t clk_reg=!clk_reg;
end

assign counter_out=counter_out_reg;

    //Todo: add user logic
always @ (posedge clk_reg or posedge rst) begin
if (enable&&direction&&(!rst))
 counter_out_reg <= counter_out_reg+1;
else if (enable&&(!direction)&&(!rst))
 counter_out_reg <= counter_out_reg-1;
else if (!enable)
 counter_out_reg <= counter_out_reg;
else
 counter_out <= 0;
end
endmodule
