
/*
E/16/388
Lab 05 part 1
8 bit ALU
Supports  add, sub, and, or, mov, and loadi instructions.
*/






/*
Below 8 bit alu can do addition, mov/loadi, bitwise AND, bitwise OR operations in this level.
*/

module alu(DATA1, DATA2, RESULT, SELECT);					//8 bit ALU
															
	input [7:0] DATA1, DATA2;								//8 bit input operands to ALU
	input [2:0] SELECT;										//3 bit selection input to ALU
	output  reg[7:0] RESULT;								//8 bit output register to store reults

	


	always @(DATA1, DATA2, SELECT) 							//always block sensitive to these inputs
	begin
		
		case(SELECT)										//case block sensitive to SELECT input

		3'b000 : #1 RESULT =  DATA2 ;						//if SELECT = 000 mov/loadi instruction with 1 time unit delay
		3'b001 : #2 RESULT = DATA2 + DATA1;					//if SELECT = 001 add/sub instruction 2 time unit delay
		3'b010 : #1 RESULT = DATA1 & DATA2;					//if SELECT = 010 bitwise & operation of DATA1 and DATA2 1 time unit delay
		3'b011 : #1 RESULT = DATA1 | DATA2;					//if SELECT = 011 bitwise or operation of DATA1 and DATA2 1 time unit delay
		default: $display("Reserved for future functional units.Operation unknown.Display previous RESULT.");		//if SELECT is something else it is reserved for future development
					
					
		endcase	

	end




endmodule






















