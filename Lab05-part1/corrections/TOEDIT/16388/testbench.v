/*
E/16/388
Lab 05 part 1
8 bit ALU testbench
*/


`include "alu.v"					//include alu module

module testbench;					//testbench for test ALU module

	reg[7:0] DATA1_t, DATA2_t;		//required 8bit DATA input operands for alu
	reg[2:0] SELECT_t;				//To select operation of the alu
	wire[7:0] RESULT_t;				//For store alu RESULTS
	

	alu octaAlu(DATA1_t, DATA2_t, RESULT_t, SELECT_t);			//making an ALU to work with


	initial														//initial block to display results and store wave patterns
	begin	
		$monitor(" SELECT: %b, DATA1 : %b, DATA2: %b,  RESULT: %b",SELECT_t, DATA1_t, DATA2_t, RESULT_t);
		$dumpfile("e16388_lab5_part1_wavedata.vcd");								//save waveforms to e16388_lab5_part1_wavedata.vcd 
		$dumpvars(0, testbench);

	end	

	/*
		For various DATA1 DATA2 values, checking outputs of the alu operations
	*/
	
	initial							//initial block to change inputs
	begin
		
		DATA1_t = 8'b00000111;
		DATA2_t = 8'b00111100;
		
		SELECT_t = 3'b000;			//mov/loadi

		#5						//pause 10 time units 
		SELECT_t = 3'b001;			//adition

		#5						//pause 10 time units 
		SELECT_t = 3'b010;			//bitwise & operation 

		#5						//pause 10 time units 
		SELECT_t = 3'b011;			//bitwise OR operation

		#5						//pause 10 time units 
		SELECT_t = 3'b100;			//reserved for future devolopment
										
	end


endmodule