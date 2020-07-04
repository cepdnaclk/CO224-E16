module testbench;						// create a testbench
	reg [7:0] operand1, operand2;		//declaring inputs and output with their bit sizes and variable type
	reg [2:0] aluop;
	wire [7:0]out;

	alu test(operand1,operand2,aluop,out);		//create a alu module's object named test
	initial
	begin
		$monitor($time," operand1: %b, operand2: %b, ALUop: %b, output: %b",operand1,operand2,aluop,out); //displaying inputs and outputs
		$dumpfile("wavedata1.vcd"); 
		$dumpvars(0,testbench);

	end

	initial
	begin
		operand1 = 8'b00000010;				//give some inputs to check the module
		operand2 = 8'b00111001;
		aluop = 3'b000;						// checking the output when forward command is selected

		#10							
		aluop = 3'b001;						//when addition is selected (check addition of two positive numbers)
		
		#10	
		operand2 = 8'b11111000;				//check the addition of a positive number and a negative number						
		aluop = 3'b001;

		#10
		operand1 = 8'b11111010;				//checking addition for two negative numbers
		operand2 = 8'b11111110;
		aluop = 3'b001;

		#10
		operand1 = 8'b00100101;			//checking bitwise AND operation
		operand2 = 8'b11000100;
		aluop= 3'b010;

		#10
		aluop = 3'b011;				//checking bitwise or operation

		#10
		operand2 = 8'b11110001;		//checking any other select command
		aluop = 3'b101;


		#10
		aluop = 3'b1xx;
	end
endmodule

