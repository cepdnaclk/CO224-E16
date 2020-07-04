




// alu model
module alu(DATA1, DATA2, RESULT, SELECT);
    //initializing the inputs and outputs
	input [7:0] DATA1;
	input [7:0] DATA2;
	input [2:0] SELECT;
	output [7:0] RESULT;

	reg [7:0] RESULT;

    //creating the always block which runs whenever a input is changed
	always @(DATA1,DATA2,SELECT)
	begin
	    //selecting based on the SELECT input using s switch case
		case(SELECT)
			  3'b000:
			    #1  RESULT = DATA2;          //Forward function
			  3'b001:
			    #2	RESULT = DATA1 + DATA2;   //Add and Sub function
			  3'b010:
			    #1  RESULT = DATA1 & DATA2;     //AND and Sub function
			  3'b011:
			    #1  RESULT = DATA1 | DATA2;     //OR and Sub function
			    //setting 1XX selection inputs.As there are reserved for future references it doesn't matter
			    //for the time being the output was set to 0 when the select is 1XX    
			    3'b100:
			        RESULT = 8'b00000000;  
			    3'b101:
			        RESULT = 8'b00000000;  
			    3'b110:
			        RESULT = 8'b00000000; 
			    3'b111:
			        RESULT = 8'b00000000;               
		endcase        
	end
endmodule