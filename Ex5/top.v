//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

  module trafficlights (
    input clk,
    output wire red,
    output wire amber,
    output wire green
  );
  
   reg [2:0] counter;

   always @(posedge clk) begin
        if (counter<3'b100)
         counter <= #1 (counter + 1);
        else
         counter <= #1 3'b001;
        end

  always @(posedge clk) begin
    case(counter)
       3'b001 : begin
		assign red = 1;
                assign amber = 0;
		assign green = 0;
                end
       3'b010 : begin
		assign red = 1;
                assign amber = 1;
                assign green = 0;
		end
       3'b011 : begin
		assign red = 0;
                assign amber = 0;
                assign green = 1;
		end
       3'b100 : begin
		assign red = 0;
                assign amber = 1;
                assign green = 0;
		end
      //default: red <= 1 amber <= 0 green <= 0;
    endcase
   end

//if (counter==(1|2))
       //assign red = 1;
     //else
       //assign red = 0;
     //end
       //if (counter==(2|4))
         //assign amber = 1;
       //else
         //assign amber = 0;
       //end
         //if (counter==3)
           //assign green = 1;
         //else
           //assign green = 0;
         //end
   //end

endmodule
