

//--------------E/16/061 ALU Module-------------------------------

//ALU module
module alu (DATA1, DATA2, RESULT, SELECT);

	input [7:0] DATA1, DATA2;	//operand1 and operand2
	input [2:0] SELECT;				//ALUOP code
	output [7:0] RESULT;			//Output of  ALU
	
	reg [7:0] RESULT;

	//This block will only initiate when the values of operand1 ,operand2, ALUOP change.  
	always @(DATA1 or DATA2 or SELECT)
	begin
	
		case (SELECT)
			//ALUOP = 000 -> move the value of operand2 into result (mov, loadi)
			3'b000 :  
				#1
				RESULT = DATA2;

			//ALUOP = 001 -> addtion (add)
			3'b001 :  
				#2
				RESULT = DATA1 + DATA2;
				
			//ALUOP = 010 -> Bit wise and (and) 	
			3'b010 :  
				#1
				RESULT = DATA1 & DATA2;
			
			//ALUOP = 011 -> Bit wise or (or)	
			3'b011 :  
				#1
				RESULT = DATA1 | DATA2;
			
			//ALUOP = 1XX -> Don't care	RESULT = XXXXXXXX
			default : RESULT = 8'bX;
		
		endcase
	
	end

endmodule

