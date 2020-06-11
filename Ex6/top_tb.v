//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Registers and wires
    reg rst;
    reg clk;
    reg button;
    reg [2:0] throw_out;
    reg [2:0] lights_out;
    reg sel;
    reg err;
    wire [2:0] result;
    
    //Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end
    
     //Stimulus logic
     initial begin
       err=0;
       rst=1;
       sel=0;
       button=1;
     #CLK_PERIOD
       rst=0;
       throw_out=3'b000;
       lights_out=3'b000;
       //result=3'b000;

     forever begin
        
     #CLK_PERIOD

	sel = !sel;

       if ((sel==0)&(result!=throw_out))
	 begin
	 $display("***TEST FAILED! Should have been throw! sel==%d, throw==%d, result==%d***", sel,throw, result);
          err=1;
	end
	
	#(CLK_PERIOD*2)
	
	if ((sel == 1) && (result != lights_out))
	 begin
	 $display("***TEST FAILED! Should have been throw! sel==%d, throw==%d, result==%d***", sel,throw, result);
          err=1;
	end
		
     end
    end

//Todo: Finish test, check for success
      //#CLK_PERIOD
      initial begin
        #300 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end


    //User's module
     multiplexer top (
	.rst (rst),
	.clk (clk),
	.button (button),
	.sel (sel),
	.result (result)
      );
   dice dice_6(clk,rst,button,throw_out);
   lights lights_6(clk,red,amber,green);

endmodule


