module testbench;
	
	//create registers for DATA1 and DATA2 for hich can holds 8 bit binary
	reg [7:0] DATA1_t, DATA2_t;
	//create 3 bit register to holds ALU OP code
	reg [2:0] SELECT_t;
	//create 8 wires which can output 8 bit binary
	wire [7:0] RESULT_t;

	//create alu model to test
	alu test (DATA1_t, DATA2_t, RESULT_t, SELECT_t);


	initial
	begin
		//monitor how signal vary with time
		$monitor($time, "   DATA1: %b DATA2: %b ALUOP: %b RESULT: %b\n", DATA1_t, DATA2_t, SELECT_t, RESULT_t);
		
		//generate files needed to plot using GTKWave
		$dumpfile("wavedata.vcd");
		$dumpvars(0, testbench);

	end




	initial
	begin
		//add operation (0001 0000) + (0000 0111) = result
		DATA1_t = 8'b0001_0001;	
		DATA2_t = 8'b0000_0011;
		SELECT_t = 3'b001;

		#10
		//mov operation (0100 1111) to result
		DATA1_t = 8'b0000_0000;	
		DATA2_t = 8'b0100_1111;
		SELECT_t = 3'b000;

		#10
		//bitwise and operation (1111_1111) && (0101_1001) = result
		DATA1_t = 8'b0101_1001;	
		DATA2_t = 8'b1111_1111;
		SELECT_t = 3'b010;

		#10
		//bitwise or operation (1111_1111) || (0101_1001) = result
		DATA1_t = 8'b0101_1001;	
		DATA2_t = 8'b0110_0110;
		SELECT_t = 3'b011;

		#10
		//not implemented operations, result is always zero
		DATA1_t = 8'b1101_1001;	
		DATA2_t = 8'b0100_0110;
		SELECT_t = 3'b101;		

	end


endmodule

