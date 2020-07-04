module testbench;						//test bench
	reg [0:7]operand1;					//8 bit inputs
	reg [0:7]operand2;
	reg [0:2]aluopp;					//3 bit ALUOP
	wire [0:7]result;
	alu myalu(operand1, operand2, result, aluopp);

	initial
	begin
		//print the simulate result
		$monitor($time, " OPERAND1: %b, OPPERAND2:%b, ALUOP: %b, REAULT %b",operand1, operand2, aluopp,result);
		$dumpfile("wavedata.vcd");
		$dumpvars(0, testbench);
	end

	//initial values for testing
	initial
	begin

		operand1 = 8'b00001111;
		operand2 = 8'b10011001;
		aluopp = 3'b000;			//FORWARD

		#10
		aluopp = 3'b001;			//ADD and SUB

		#10
		aluopp = 3'b010;			//AND

		#10
		aluopp=3'b011;				//OR
	end

endmodule

module alu(DATA1, DATA2, RESULT,SELECT);			//ALU
	input [0:7]DATA1;
	input [0:7]DATA2;
	input [0:2]SELECT;						//inputs
	output [0:7]RESULT;						//out put result

	reg [0:7]RESULT;
	always @ (DATA1,DATA2,SELECT)			//done it whe there is a change in values
	begin
		if (SELECT==3'b000) begin			//for the forward
		//for the FOWARD function
			RESULT= DATA2;

		end if (SELECT==3'b001) begin
		//for the ADD and SUB function
			RESULT=DATA1+DATA2;

		end if (SELECT==3'b010) begin
		//for the AND function
			RESULT= DATA1 & DATA2;

		end if(SELECT==3'b011) begin
		//for the OR function
			RESULT=DATA1 | DATA2;

		end 
	end
endmodule
