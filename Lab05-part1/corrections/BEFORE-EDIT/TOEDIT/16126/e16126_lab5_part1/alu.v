
//*****Computer Architecture (CO224) - Lab 05 _ Part1****
// Design: ALU Module of Simple Processor
// Author: Hansika D. G. N. - E/16/126
//*************************************************


//DATA1, DATA2 -> 8-bit input ports
//SELECT -> 3-bit control input port  for op-code selecetion

module alu(DATA1, DATA2, RESULT, SELECT);

	input [0:7] DATA1;
	input [0:7] DATA2;
	input [0:2] SELECT;
	
	output [0:7] RESULT;
	
	//specify output result to a register
	reg [0:7] RESULT;
	
	
	//This always block will execute if either of inputs changes 
	always@(DATA1, DATA2, SELECT)
	begin	
	
		case(SELECT)
			3'b000:
				//loadi, mov ( DATA1 ignored)
				
				#1 	// 1 time units write delay
				RESULT = DATA2;
				
			3'b001:
				//add, sub
				
				#2	// 2 time units write delay
				RESULT = DATA1 + DATA2;
				
			3'b010:
				//bitwise AND on DATA1 with DATA2
				
				#1	// 1 time units write delay
				RESULT = DATA1 & DATA2;
				
			3'b011:
				//bitwise OR on DATA1 with DATA2
				
				#1	// 1 time units write delay
				RESULT = DATA1 | DATA2;
				
			//3'b1XX - Reserved for future functional units 
			
		endcase
		
	end
	
endmodule	
















