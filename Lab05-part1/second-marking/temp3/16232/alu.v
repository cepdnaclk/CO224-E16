/*******************
   E16232
   F.S.Marzook
   Lab5_Part1
   ALu Module
********************/


module alu( DATA1, DATA2, RESULT, SELECT);

	//declare inputs for operands and opcode
	input [7:0] DATA1, DATA2;
	input [2:0] SELECT;

	//declare output register for alu result
	output reg [7:0] RESULT;

	//pass parameters for the opcodes used for the functions Forward,Add,And,Or
	parameter [2:0] FORWARD = 3'b000,
			ADD = 3'b001,
			AND = 3'b010,
			OR = 3'b011;
	
	//re-evaluate when one of these in the sensitive list changes
	always @ (DATA1 or DATA1 or SELECT)
	
	begin
		
		case (SELECT)
		
			FORWARD:begin
					#1 RESULT = DATA2;			//when the opcode is 000,move/laod Data2 to the result
				end
			ADD:	begin
					#2 RESULT = DATA1 + DATA2;		//when the opcode is 001,add Data1 and Data2 to produce the result
				end
			AND:	begin
					#1 RESULT = DATA1 & DATA2;		//when the opcode is 010,bitwise AND on Data1 with Data2 to produce the result
				end
			OR:	begin
					#1 RESULT = DATA1 | DATA2;		//when the opcode is 011,bitwise OR on Data1 with Data2 to produce the result
				end
			//when the opcode is 1xx,
			default:begin
					RESULT = 8'b0;		//make the result zero
					//display a warning					
					$display($time,"s	WARNING!The opcode %b is unused.Therefore the result produced is %d\n",SELECT,RESULT);
				end
		endcase
	end

endmodule
