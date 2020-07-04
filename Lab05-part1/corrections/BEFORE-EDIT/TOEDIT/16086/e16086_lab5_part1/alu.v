// Module name alu
module alu(DATA1, DATA2, RESULT, SELECT);

//port declaration
input [7:0] DATA1, DATA2; //initialize 8bit values for input DATA1 and DATA2
input [2:0] SELECT;   //initialize 3bit values for input
output [7:0] RESULT;   //initialize 8bit values for output

 reg [7:0] ALU_OUT; // declare a variable ALU_OUT that can hold its value 
 
 assign RESULT=ALU_OUT; //Give variable ALU_OUT value to output

 //2second delay added
 always @(DATA1, DATA2, SELECT)
 
	begin
		case(SELECT)
	
		3'b000: //FORWARD loadi, mov 
		#1 ALU_OUT= DATA2;
			
		3'b001: //ADDITION add, sub
		#2 ALU_OUT= DATA1+DATA2;
		
		3'b010: //AND
		#1 ALU_OUT= DATA1&DATA2;

		3'b011: //OR
		#1 ALU_OUT= DATA1|DATA2;
		
		default: ALU_OUT=8'bx; //remaining bits are reserved
			//$display(" select value not allowed"); //remaining bits are reserved
			
		endcase
	
	end
	
endmodule	



	
	


