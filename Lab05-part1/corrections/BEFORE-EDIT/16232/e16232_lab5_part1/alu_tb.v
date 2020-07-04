/*************************
   E16232
   F.S.Marzook
   Lab5_Part1
   ALu Module Testbench
**************************/


module alu_tb;
	
	//declare input operands as signed inputs
	reg signed [7:0] DATA1_t,DATA2_t;

	reg [2:0] SELECT_t;

	//declare output result as signed output
	wire signed [7:0] RESULT_t;


	integer count,i;

	//instantiate module
	alu testbench (DATA1_t,DATA2_t,RESULT_t,SELECT_t);

	initial
	begin
		//generate wavedata to plot the wave in GTKWave
		$dumpfile("wavedata.vcd");
		$dumpvars(0, testbench);	
	end

	initial 
	begin
		//instantiate values
		DATA1_t = 8'b11111100;
		DATA2_t = 8'b00001111;
		SELECT_t = 3'b000;
		
		for ( count = 0; count < 8; count = count + 1)
		begin
			#10	//wait for a timespan of 10s and do the other selection

			//For the functions FORWARD,ADD,AND,OR disply the results. Else display the warning message
			if(SELECT_t < 3'b100)
			begin
				$display($time,"s	DATA1 = %d	DATA2 = %d	OPCODE = %b	RESULT = %d \n",DATA1_t,DATA2_t,SELECT_t,RESULT_t);
			end

			//increment of the select	
			SELECT_t = SELECT_t + 3'b001;

			//DATA1_t = DATA1_t+ 8'b00001111;
			//DATA2_t = DATA2_t+8'b00000011;
		end
		
		DATA1_t = 8'b11110000;
		DATA2_t = 8'b00111111;
		SELECT_t = 3'b000;
		$display($time,"s	DATA1 = %d	DATA2 = %d	OPCODE = %b	RESULT = %d \n",DATA1_t,DATA2_t,SELECT_t,RESULT_t);

		#10

		DATA1_t = 8'b11110111;
		DATA2_t = 8'b00111100;
		SELECT_t = 3'b001;
		$display($time,"s	DATA1 = %d	DATA2 = %d	OPCODE = %b	RESULT = %d \n",DATA1_t,DATA2_t,SELECT_t,RESULT_t);

	end


endmodule


			
