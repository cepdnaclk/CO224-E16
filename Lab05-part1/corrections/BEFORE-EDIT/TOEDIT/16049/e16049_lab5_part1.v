/*
E16049
CO224
Lab05
Part01 -alu
without testbench
with latency 
*/  

/*
ALU
OPCODE
	000 Forward (load , mov)
	001	ADD	(add,sub)
	010	AND (and)
	011	OR (or)
	1XX	Reserved
*/
module alu(DATA1,DATA2,RESULT,SELECT);
//define inputs
	input [7:0]DATA1,DATA2;
	input [2:0]SELECT;
//define output 
	output[7:0]RESULT;
	reg RESULT;
	
	always @ (DATA1,DATA2,SELECT)
	/*
	we can always use always @(*)
	output keeps its value untill it changes
	*/
	begin
		case(SELECT)
		3'b000:
			//forward data2 to result
			//latency = 1
			RESULT = #1 DATA2;
		
		3'b001:
			//ADD data1,data2
			//latency = 2
			RESULT = #2 DATA1 + DATA2;
		3'b010:
			//AND
			//latency = 1
			RESULT = #1 DATA1 & DATA2;
		3'b011:
			//OR
			//latency = 1
			RESULT = #1 DATA1 | DATA2;
		
		default:
			//This is reserved
			RESULT = 8'b00000000;	
		endcase
	end
endmodule