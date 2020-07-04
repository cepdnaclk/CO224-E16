//E16096
//Lab5_part1

module alu(DATA1, DATA2, RESULT, SELECT); 

	input [7:0] DATA1,DATA2;
	input [2:0] SELECT;
	output [7:0] RESULT;

	reg RESULT;

	always @ (DATA1,DATA2,SELECT) //Whenever one of DATA1,DATA2 or SELECT inputs are changed
	begin
		case (SELECT)  //defining the function for the result based on SELECT input
			
			3'b000 :#1 RESULT=DATA2; //SELECT=000 corresponds to FORWARD function(forward DATA2 into RESULT) (with delay #1)
					
			3'b001 :#2 RESULT=DATA1+DATA2; //SELECT=001 corresponds to ADD function(add DATA1 and DATA2) (with delay #2)
					
			3'b010 :#1 RESULT=DATA1&DATA2; //SELECT=010 corresponds to AND function(bitwise AND on DATA1 with DATA2) (with delay #1)
					
			3'b011 :#1 RESULT=DATA1|DATA2; //SELECT=011 corresponds to OR function(bitwise OR on DATA1 with DATA2) (with delay #1)
					
			default: RESULT=8'bx; //Reserved inputs for SELECT(for other bit combinations concerning the 1st bit) is considered a don't-care(x) condition at this stage                                                               			
					
		endcase
	end
endmodule


