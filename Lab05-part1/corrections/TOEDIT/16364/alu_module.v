

module alu(DATA1, DATA2, RESULT, SELECT);		//verifying the ports in the module ALU
	input [7:0]DATA1;						//declating the inputs with their bit lengths
	input [7:0]DATA2;
	input[2:0]SELECT;						//select signal with 3 bits length
	output reg [7:0]RESULT;					// result is a register type output of 8 bit length

	always @ (SELECT)						// make the sensitivity list, to do the operations accordig to the given SELECT signal
	case (SELECT)							//use case structure to operate on corresponing operations
											// make the selecetor as 'select'
		3'b000:									// 1st case when select = 000
			#1 RESULT = DATA2;							// forward the data2 value to result

		3'b001:									// case 2: select = 001
			#2 RESULT = DATA1 + DATA2;					// addition of data operands

		3'b010:									// case 3: select = 010
			#1 RESULT = DATA1 & DATA2;					// bitwise and operation

		3'b011:									// case 4: select =011
			#1 RESULT = DATA1 | DATA2;					// bit wise or operation

		default:

			RESULT = 8'b00000000;					// set the result to 0 for any other select signals...if the result is not assigned to a number it will take the value of previous result  which is wrong to oupput the result to a any other reserved signal

	endcase
endmodule


