// Computer Architecture (CO224) - Lab 05 Part 2 
// Design: Register File Module of Simple Processor
// Author: E/16/094 Ekanayaka S.M.
// Date	: 3-May-2020

module reg_file(IN,OUT1,OUT2,INADDRESS,OUT1ADDRESS,OUT2ADDRESS, WRITE, CLK, RESET);	//module definition
	
	//input declaration
	input [7:0] IN;
	input [2:0] INADDRESS,OUT1ADDRESS,OUT2ADDRESS;
	input CLK,RESET,WRITE;

	//output declaration
	output [7:0] OUT1,OUT2;

	//make 8x8 register.
	reg [7:0] regset [7:0];
	
	//variable declaration.
	integer i;
	
	// always assign OUT1 & OUT2 values with 2 time units of delay.
	assign #2 OUT1 = regset[OUT1ADDRESS];
	assign #2 OUT2 = regset[OUT2ADDRESS];

	// write to register when WRITE is enabled with positive edge of the CLK signal with 2 time units of delay.
	always @(posedge CLK)
	begin
		if(WRITE == 1'b1) begin
			#2 regset[INADDRESS] = IN;
		end
	end

	// Reset the register with positive edge of the RESET signal with 2 time units of delay.
	always @(*)
	begin
		if (RESET == 1'b1) begin		
			#2
			for(i=0; i<8; i=i+1) begin
				regset[i]=0;
			end
		end
	end

endmodule
