/*
Author: E/16/200
Name: Lakmali B.L.S
Lab 5
Part 1
This piece of code contains the alu module which is able to do basic commands add,sub,or,and,loadi,mov . Test bench is also implemented to test the code for different inputs
*/


//There are three inputs for the alu module - DATA1, DATA2, SELECT
//RESULT is the output of the alu module

module alu(DATA1, DATA2, RESULT, SELECT);
	//DATA1 and DATA2 are 8bit operands
	input [7:0]DATA1,DATA2;
	input [2:0]SELECT;//SELECT is 3bit opcode
	output [7:0]RESULT;//RESULT also in eight bits
	
	reg [7:0]RESULT;//as we assign values to RESULT , we want to define it as a register
	
	always @(DATA1,DATA2,SELECT)//when DATA1,DATA2,SELECT changes the loop runs again
	begin
		
		case(SELECT)
			3'b000 : RESULT = #1 DATA2;//forward function, this  supports to loadi and mov instuctions  - a delay of 1 time unit is added
			3'b001 : RESULT = #2 DATA1+DATA2;//add function , this supports to add and sub instructions -  a delay of 2 time unit is added
			3'b010 : RESULT = #1 DATA1&DATA2;//this supports for bitwise and operation   - a delay of 1 time unit is added
			3'b011 : RESULT = #1 DATA1|DATA2;//this supports for bitwise or operation   -  a delay of 1 time unit is added
			default : RESULT = 8'bxxxxxxxx;//when the opcode is none of the above
		endcase
		
	end
	
endmodule
