/* Computer Architecture (CO224) - Lab 05
 * Design: Alu File of a Simple Processor
 * Author: E/16/389 WELIKANDA V.H.L.N.
 * Date	: 02-May-2020
 */

// ALU module 
module alu(DATA1, DATA2, RESULT, SELECT);

	// Port declaration
	input [0:7] DATA1;
	input [0:7] DATA2;
	input [0:2] SELECT;
	output [0:7] RESULT;

	// Declare The RESULT as a register
	reg [0:7] RESULT;

	// Starting of the ALU Selection and Calculation
	always @ (DATA1, DATA2, SELECT)
	begin
		case (SELECT)
			3'b000:
				#1
				RESULT = DATA2;
			3'b001:
				#2
				RESULT = DATA1 + DATA2;
			3'b010:
				#1
				RESULT = DATA1 & DATA2;
			3'b011:
				#1
				RESULT = DATA1 | DATA2;
			default:
				$monitor($time, "=> Reserved for future functional units!");
		endcase
	end

endmodule

// Test bench for testing purpose
module testbench;
	// Initializing the variables
	reg [0:7] data1;
	reg [0:7] data2;
	reg [0:2] select;
	wire [0:7] result;

	// Calling the module
	alu myalu(data1, data2, result, select);

	// Different input combinations for checking the functionality
	initial
	begin

		// generate files needed to plot the waveform using GTKWave
        $dumpfile("alu_file_wavedata.vcd");
		$dumpvars(0, testbench);

		data1 = 8'b01010110;
		data2 = 8'b01000011;
		select = 3'd0;

		#5
		select = 3'd1;

		#5
		data2 = 8'b11000011;
		select = 3'd1;

		#5
		data1 = 8'b10010111;
		select = 3'd2;

		#5
		select = 3'd3;

		#5
		select = 3'd4;

		#5
		select = 3'd7;

		#5
        $finish;
	end
endmodule
