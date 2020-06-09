//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;
//Todo: Regitsers and wires
    reg clk;
    reg rst;
    reg enable;
    reg direction;
    reg err;
    reg counter_out_reg;
    wire counter_out;
//    reg counter_out;

//Todo: Clock generation
    initial begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
//Todo: User logic
initial begin
clk = 0;
rst = 1;
enable = 1;
direction = 1;
err=0;
#5 rst = 0;

#6

forever begin

if (rst&(counter_out!=0))
begin
$display("***TEST FAILED! counter_out==%d, counter_out_reg==%d, reset='%d' ***",counter_out,counter_out_reg,rst);
err = 1;
end

if (((direction==1)&(counter_out!=(counter_out_reg+1))&enable&(!rst))| ((direction==0)&(counter_out!=(counter_out_reg-1))))&enable&(!rst))
begin
$display("***TEST FAILED! counter_out==%d, counter_out_reg==%d, direction='%d', enable ='%d', reset = '%d' ***",counter_out,counter_out_reg,direction,enable,rst);
err=1;
end

if ((!enable&(counter_out!=counter_out_reg))|((enable&(counter_out==counter_out_reg)))
begin
$display("***TEST FAILED! counter_out==%d, counter_out_reg==%d, enable='%d' ***",counter_out,counter_out_reg,enable);
err = 1;
end

//Todo: Finish test, check for success
initial begin
#50 
if (err==0)
$display("***TEST PASSED! :) ***");
$finish;
end

//Todo: Instantiate counter module
     updown_counter top (
     .out (out)
     .rst (rst)
     .enable (enable)
     .clk (clk)
     .direction (direction)
     .counter_out (counter_out)
     .counter_out_reg (counter_out_reg)
);
     
endmodule 
