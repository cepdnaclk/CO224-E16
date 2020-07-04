//CO224 : Lab 5 : Part 1
//E/16/078 


//ALU module
module alu(DATA1, DATA2, RESULT, SELECT);

	//port declaration
	input [7:0]DATA1;
	input [7:0]DATA2;
	input [2:0]SELECT;
	output [7:0]RESULT;
	
	reg [7:0]RESULT;
	
	
	
	//always block 
	//sensitivity list: DATA1,DATA2,SELECT : if either of input change, block should execute 
	always @ (DATA1,DATA2,SELECT)
	begin
		case(SELECT)
		
			//FORWARD : DATA2->RESULT
			3'b000:
				begin
				#1
				RESULT = DATA2;
				end
			
			//ADD : add DATA1 and DATA2
			3'b001:
				begin
				#2
				RESULT = DATA1 + DATA2;
				end
			
			//bitwise AND on DATA1 with DATA2
			3'b010:
				begin
				#1
				RESULT = DATA1 & DATA2;
				end
			
			//bitwise OR on DATA1 with DATA2
			3'b011:
				begin
				#1
				RESULT = DATA1 | DATA2;
				end
			
			//Reserved
			default:
				begin
				RESULT = 8'bxxxxxxxx;
				end
		
		endcase	
	end
	
endmodule

