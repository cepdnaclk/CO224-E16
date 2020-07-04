module alu (DATA1, DATA2, RESULT, SELECT);//

	//create 2 8bit registers to store DATA1, DATA2
	input [7:0] DATA1, DATA2;
	//create 3bit register to hold ALU-OP code 
	input [2:0] SELECT;
	//create 8 wires which can output 8 bit binary
	output reg [7:0] RESULT;

	//repeat always block when DATA1, DATA2, SELECT are changing
	always @ (DATA1, DATA2, SELECT)
	begin
		//switch case which do the corresponding operation accordingto the 3bit SELECT value
		casex (SELECT)
			//forward DATA2 values to the RESULT register,loadi and mov
			//delay of a one time segment
			3'b000 : #1 RESULT = DATA2;
			//add DATA1 and DATA2 values together and put to RESULT, add and sub
			//delay of two time segments
			3'b001 : #2 RESULT = DATA1 + DATA2;
			//do and operation bitwise DATA1 and DATA2, and 
			//delay of a one time segment
			3'b010 : #1 RESULT = DATA1 & DATA2;
			//do or operation bitwise DATA1 and DATA2, or
			//delay of a one time segment
			3'b011 : #1 RESULT = DATA1 | DATA2;
			//reserved for the future functional units
			3'b1xx : RESULT = 8'b00000000;
		endcase
	end		


endmodule
