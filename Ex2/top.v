//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module mux(
    //Todo: define inputs here
    input a, b, sel,
    output out
);

    //Todo: define registers and wires here
reg clk_reg;
reg out_reg;
    

parameter t = 5;
initial begin
	clk_reg = 0;
	forever
        #t clk_reg=!clk_reg;
end

assign out = out_reg;

    //Todo: define your logic here                 
always @ (posedge clk_reg) begin
	out_reg = (sel && b) || (!sel && a);
end
	
      
endmodule
