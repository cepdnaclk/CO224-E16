
module alu(DATA1, DATA2, RESULT, SELECT); //alu module

   input [7:0] DATA1, DATA2;             //declaring multiple bits inputs
   input [2:0] SELECT;
   output reg [7:0] RESULT;             //declaring output

   always @ (DATA1, DATA2, SELECT)      //when DATA values or SELECT values are changed then this should be run again(sensitive inputs for always block)

    begin
      case (SELECT)                                        //selecting the operation and making the result according to it
          3'b000 : #1 RESULT = DATA2;                        //FORWARD function when SELECT = 000
          3'b001 : #2 RESULT = DATA1 + DATA2;                //ADD function when SELECT = 001
          3'b010 : #1 RESULT = DATA1 & DATA2;                //bitwise AND function when SELECT = 010
          3'b011 : #1 RESULT = DATA1 | DATA2;                //bitwise OR funtion when SELECT = 011
          default: $display("This combination is preserved for future use, previous values will be printed.");       //for preserved combinations of SELECT for future use
      endcase
    end 
    



endmodule