
module alu(DATA1, DATA2, RESULT, SELECT);	//defining the alu module

	//declearing input & output variables as bit sequences
	input [7:0] DATA1,DATA2;	//DATA1,DATA2 are 8 bit sequences
	input [2:0] SELECT;		//SELECT is 3 bit sequence
	output [7:0] RESULT;	//RESULT is 8 bit sequence
	reg [7:0] RESULT;	//declearing output as reg type


	always @(DATA1, DATA2, SELECT) begin	//ALU is sensitive for DATA1,DATA2,SELECT

		case(SELECT)	//select various operations based on the SELECT bits

		3'b000	:	 #1 RESULT = DATA2;					//move & loadi
		3'b001  :    #2 RESULT = DATA1 + DATA2;			//add & sub
		3'b010  :    #1 RESULT = DATA1 & DATA2;			//bitwise AND
		3'b011  :    #1 RESULT = DATA1 | DATA2;			//bitwise OR
		default :    RESULT = 8'bxxxxxxxx;    		//Reserved for future functional units,not implemented yet
													//denoted by 'xxxxxxxx'

		endcase

		//handling the not implemented funtions
		if(SELECT[2] == 1'b1 )begin

			$display($time," Not Implemented");

		end

	end

endmodule