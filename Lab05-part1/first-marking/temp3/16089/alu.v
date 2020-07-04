module testbench;  // Module of Test bench

	reg [7:0] DATA1_t, DATA2_t;  // Internal sgnals to check the funtionality of the mux 
	reg [2:0] SELECT_t;
	wire [7:0] RESULT_t;

	alu myalu(DATA1_t, DATA2_t, RESULT_t, SELECT_t  ); //Instantiate the module  

	initial //Initial Block 
	begin
		// Display the Inputs and Outputs
		$monitor($time," DATA1_t: %b, DATA2_t: %b, SELECT_t: %b, RESULT_t: %b", DATA1_t ,DATA2_t, SELECT_t, RESULT_t ); 

		//Generate the files needed to display the waveform using GTKWave
		$dumpfile("Wavedata.vcd"); 
		$dumpvars(0,testbench); 
	end


	initial  // Initial block to input Test Values 
	begin
		DATA1_t = 8'b11011100;  // Assign values to Inputs 
		DATA2_t = 8'b10010011;
		SELECT_t = 3'b000;  

		#10

		SELECT_t= 3'b001;  // Change values after 10 simulation Seconds 

		#10

		SELECT_t= 3'b010; // Change values after 10 simulation Seconds 

		#10

		SELECT_t= 3'b011; // Change values after 10 simulation Seconds 

		#10

		SELECT_t= 3'b111; // Change values after 10 simulation Seconds 
	end
endmodule 



module alu (DATA1, DATA2, RESULT, SELECT); // Module of the ALU 

//Port Declaration
	input [7:0] DATA1, DATA2; //Two 8 bit Inputs 
	input [2:0] SELECT;		  // 3 bit Opp-Selector 
	output [7:0] RESULT; 	  // 8 bit Output 


	reg RESULT;               //Store output in a Register 

	always @ (DATA1, DATA2, SELECT)  //Always Block 
	begin 
		case(SELECT)                 // Case Statement to select operands 
			3'b000 : #1 RESULT = DATA2;          //Forward
			3'b001 : #2 RESULT = DATA1 + DATA2;  // Adition 
			3'b010 : #1 RESULT = DATA1 & DATA2;  // Bitwise AND 
			3'b011 : #1 RESULT = DATA1 | DATA2;  // Bitwise OR 
			default : RESULT = 8'bXXXXXXXX;   // Other Operands 
		endcase
	end

endmodule