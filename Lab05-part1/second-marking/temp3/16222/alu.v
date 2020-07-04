module alu(DATA1, DATA2, RESULT, SELECT);		//this is alu module
	
	//initial input output
	input [7:0] DATA1,DATA2;
	output reg [7:0] RESULT;
	input [2:0] SELECT;

	//always block
	//always @ (DATA1,DATA2,SELECT)
	always @ (*)
	begin

		case(SELECT)

			//load word
			3'b000 : begin

					 //generate result
					 #1						
					 RESULT <= DATA2;		//get result

					 end

			//add
			3'b001 : begin

					 //generate result
					 #2							
					 RESULT <= DATA1 + DATA2;	//result


					 end

			//and
			3'b010 : begin

					 //generate result
					 #1							//delay 1 unit
					 RESULT <= DATA1 & DATA2;	//get result


					 end

			//or
			3'b011 : begin

					 //generate result
					 #1							//delay 1 unit
					 RESULT <= DATA1 | DATA2;	//get result


					 end

			//reserved
			default : RESULT <= 8'b00000000;

		endcase

	end

endmodule










