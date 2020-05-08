// Computer Architecture (CO224) - Lab 05
// Design: Register File module of Simple Processor
// Author: Nipun Dewenarayane
// ENumber: E/16/360



module reg_file (IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

	//3 bit inputs to access registers
	input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
	//8 bit input to write data into a registers 
	input [7:0] IN;
	//single bit inputs, signals to control the process
	input WRITE, CLK, RESET;
	//8 bit registers to output 8 bit binary values
	//for read from registers
	output reg [7:0] OUT1, OUT2;

	//create 8 bit register array
	//8 registers 
	reg [7:0] Register[7:0];
	
	//*****************************************************************************

	//read from given register address OUT1ADDRESS and put to OUT1
	//block will run whenever OUT1ADDRESS is change
	//only when RESET signal is zero with #2 latency
	always @ (OUT1ADDRESS)
	begin
		if (!RESET) begin
			#2
			OUT1 = Register[OUT1ADDRESS];
		end
	end

	//******************************************************************************

	//read from given register address OUT2ADDRESS and put to OUT1
	//block will run whenever OUT2ADDRESS is change
	//only when RESET signal is zero with #2 latency
	always @ (OUT2ADDRESS)
	begin
		if (!RESET) begin
			#2
			OUT1 = Register[OUT2ADDRESS];
		end
	end
	
	//*******************************************************************************

	//this block will run for the positive edge of the clock
	//write to INADDRESS register from IN if WRITE is equal to 1
	//register write delay is #2
	//after that if they want to read that updated register
	//which has OUT1ADDRESS, OUT2ADDRESS it will do after #2 of delay
	//total delay is #4 if want to write and read that register
	always @ (posedge CLK)
	begin
		if (WRITE) begin
			#2
			Register[INADDRESS] = IN;

			#2
			OUT1 = Register[OUT1ADDRESS];
			OUT2 = Register[OUT2ADDRESS];

		end
	end
	
	//*******************************************************************************

	//this block will run when there is a change in the RESET
	//when RESET is 1 change all the register values into 0 with #2 delay
	//after that if there is a register to read #2 delay and read
	//total delay is #4 when reset and read registers
	always @ (RESET)
	begin
		if (RESET) begin
			#2
			Register[3'd0] = 8'd0;
			Register[3'd1] = 8'd0;
			Register[3'd2] = 8'd0;
			Register[3'd3] = 8'd0;
			Register[3'd4] = 8'd0;
			Register[3'd5] = 8'd0;
			Register[3'd6] = 8'd0;
			Register[3'd7] = 8'd0;
		
		
			#2
			OUT1 = Register[OUT1ADDRESS];
			OUT2 = Register[OUT2ADDRESS];
		end
		
	end


endmodule
