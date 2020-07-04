/*
E/16/070
DE SILVA N.S.C.K.S.
LAB05 PART1
*/

// alu module
module alu (DATA1, DATA2, RESULT, SELECT);

	// port declaration
	input wire [7:0] DATA1, DATA2; // for input data
	input [2:0] SELECT; // for opcode
	output reg  [7:0] RESULT; // for output result

// the alu is sensitive for data1, data2 and select inputs
always @(DATA1, DATA2, SELECT)
begin
	case(SELECT)

		// FORWARD function
		// latency is 1 time unit
		// when opcode is 000 mov or load data2 to the result
		3'b000 : begin  
				#1 RESULT = DATA2;
			 end

		// ADD function
		// latency is 2 time unit
		// when opcode is 001 add data1 & data2 to the result
		3'b001 : begin
			 	#2 RESULT = DATA1 + DATA2 ;
			 end

		// AND function
		// latency is 1 time unit
		// when opcode is 010 bitwise and on data1 with data2 to produce the result
		3'b010 : begin
			 	#1 RESULT = DATA1 & DATA2 ;
			 end

		// OR function
		// latency is 1 time unit
		// when opcode is 011 bitwise or on data1 with data2 to produce the result
		3'b011 : begin
			 	#1 RESULT = DATA1 | DATA2 ;
			 end

		// Reserved functions
		// handle reserved bit patterns for other instructions
		default : begin
				RESULT = 8'b00000000 ;
				$display (" Error : Instruction has not been implemented yet.") ;
			 end
	endcase
end
endmodule
	

	
