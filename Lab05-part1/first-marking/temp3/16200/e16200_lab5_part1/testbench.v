/*
Author: E/16/200
Name: Lakmali B.L.S
Lab 5
Part 1
This piece of code contains the alu module which is able to do basic commands add,sub,or,and,loadi,mov . Test bench is also implemented to test the code for different inputs
*/


module testbench;
	//As we assign  values to the data_1,data_2,opcode.., they are defined as registers
	reg [7:0] data_1,data_2;//data_1 and data_2 are 8 bit
	reg [2:0] opcode; //opcode is 3 bit
	wire[7:0] out_t; // out_t is the output
	
	alu ALU (data_1,data_2,out_t,opcode);//module is called
	
	//all the initial blocks run parallely
	//this initial block is to display the output in the command lie
	initial
	begin
		// generate files needed to plot the waveform using GTKWave
        $dumpfile("ALU_Wavedata.vcd");
		$dumpvars(0, testbench);
		
		//for display in command line
		$monitor($time,"  Operand 1 :%b   Operand 2 :%b   Opcode:%b   Output:%b",data_1,data_2,opcode,out_t);//output is displayed
		
	end
	
	//this initial block is used to assign values to the inputs
	initial
	begin
		data_1 = 8'b11111101;//operand1
		data_2 = 8'b00000111;//operand2
		//below , these two values are procesed according to different opcodes
		opcode = 3'b000;//mov,loadi
		
		#10
		opcode = 3'b001;//add,sub
		
		#10
		opcode = 3'b010;//bitwise and
		
		#10
		opcode = 3'b011;//bitwise or
		
		#10
		opcode = 3'b100;//resereved opcodes
		
		#10
		data_1 = 8'b00110101;//operand1 is changed
		data_2 = 8'b00000011;//operand2 is changed
		opcode = 3'b000;//mov ,loadi
		
		#10
		opcode = 3'b001;//add,sub
		
		#10
		opcode = 3'b010;//bitwise and
		
		#10
		opcode = 3'b011;//bitwise or
		
		#10
		opcode = 3'b111;//reserved opcode
	end
endmodule

