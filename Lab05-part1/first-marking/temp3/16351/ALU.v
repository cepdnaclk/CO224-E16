//CO224 Computer Architecture
//Lab5 part1
//E/16/351


//Creating a testcase for the ALU
module testbench;	
	//Define registers and wires		
	reg [0:7] operand1;
	reg [0:7] operand2;
	reg [0:2] select;
	wire [0:7] result;

	//call ALU
	alu test(operand1,operand2,result,select);

	initial
	begin
		//printing the outputs
		$monitor($time," Operand1:%b, Operand2:%b, Selection:%b, Result:%b",operand1,operand2,select,result);

		//set values for operands
		operand1 = 8'b00000100;
		operand2 = 8'b00000101;
		//set selection for loadi or mov
		select = 3'b000;

		//set selection for add or subtraction
		#5
		select=3'b001;
		//set selection for bitwise and operation
		#5
		select=3'b010;
		//set selection for bitwise or operation
		#5
		select=3'b011;
		//set selection for 1xx
		#5
		select=3'b100;
	end
endmodule


//creating moduele for ALU
module alu(DATA1, DATA2, RESULT, SELECT);
	//define inputs and outputs
	input [0:7] DATA1;
	input [0:7] DATA2;
	input [0:2] SELECT;
	output [0:7] RESULT;
	reg [0:7] RESULT;

	//set variables for always checking
	always@(DATA1,DATA2,SELECT)

	begin
		case(SELECT)
			//loadi or mov operation
			3'b000:
				#1
				RESULT=DATA2;
			//add or sub operation
			3'b001:
				#2
				RESULT=DATA1 + DATA2;
			//bitwise and operation
			3'b010:
				#1
				RESULT=DATA1 & DATA2;
			//bitwise or operation
			3'b011:
				#1
				RESULT=DATA1 | DATA2;
			default:
				$monitor($time," Invalid selection!");
		endcase
	end
endmodule