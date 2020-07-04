/*	Madushanka H.M.K
	E/16/221
	Code for ALU
*/


module alu(input[7:0] Data1,Data2,input[2:0] Select,output[7:0] Result);/*Data1 and Data2 are 8-bit inputs, Select variable is a 3-bit input
									Result variable is a 8-bit output(These are the logical inputs and 										outputs)*/
reg Result;	//To hold the output values

always @(Data1,Data2,Select) begin	//sensitivity list, triggers when values change(in here when Data1,Data2 and Data3 change)
	casex(Select) 
		3'b000 : 
			begin
			#1;	//delay
			Result = Data2;	//forward Data2 into Results
			end
		3'b001 : 
			begin
			#2;	//delay
			Result = Data1 + Data2;//Add,Sub
			end
		3'b010 : 
			begin
			#1;	//delay
			Result = Data1 & Data2;//And
			end
		3'b011 : 
			begin
			#1;	//delay
			Result = Data1 | Data2;//Or
			end
		3'b1xx : Result = 1'b0;	//Reserved case returns zero as output
		default : Result = 1'b0;//default case returns zero as output
	endcase 
end
endmodule

//Here is the testbench for module. remove comment tag to test
/*
module testbench;
	reg [7:0] Data1, Data2;	//hold input values(registers are used to hold inputs)
	reg [2:0] Select;	//hold select value
	wire [7:0] Result;	//getting outputs by 8 wires(since there are 8 bits, wires cant hold data.)
	

	alu test_unit(Data1,Data2,Select,Result);	//accesing alu module including our inputs and select operation

	initial
	begin
		$monitor($time, " Data1: %b, Data2: %b, Select: %b, Result: %b", Data1, Data2, Select, Result);	//to print output format
		$dumpfile("wavedata.vcd");
		$dumpvars(0, testbench);
	end
	
	initial begin	//input combinations
		Select = 3'b000;
		Data1 = 8'b10101010;
		Data2 = 8'b00011000;
		
		#10;
		Select = 3'b001;
		Data1 = 8'b10101010;
		Data2 = 8'b00011000;

		#10;
		Select = 3'b010;
		Data1 = 8'b10101010;
		Data2 = 8'b00011000;

		#10;
		Select = 3'b011;
		Data1 = 8'b10101010;
		Data2 = 8'b00011000;

		#10;
		Select = 3'b111;
		Data1 = 8'b10101010;
		Data2 = 8'b00011000;
	end
endmodule
*/

