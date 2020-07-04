

module testbed;


	//initialize
	reg [7:0] DATA1,DATA2;
	reg [2:0] SELECT;
	wire [7:0] RESULT;
	integer i, j;		//for loop

	//intance of module
	alu alu_1(DATA1, DATA2, RESULT, SELECT);

	initial
	begin

		//data initial
		DATA1 = 8'b00000001;
		DATA2 = 8'b11111111;
		SELECT = 3'b000;

		#2
		
			//change data
			DATA1 = DATA1 + 8'b00000001;
			DATA2 = DATA2 + 8'b00000001;
		#3
			SELECT = 3'b001;
		#3
			SELECT = 3'b011;



		

	end

	//this is monitoring part
	initial 
	begin
		
		$monitor($time,"  DATA1: %b  DATA2 : %b  Select %b --> %b",DATA1,DATA2,SELECT,RESULT);

		//for gtk wave
		$dumpfile("wavedata.vcd");
		$dumpvars(0,alu_1);

	end

endmodule