
//*****Computer Architecture (CO224) - Lab 05_Part2****
// Design: Register File Module of Simple Processor
// Author: Hansika D. G. N. - E/16/126
//*************************************************

// IN ->  8-bit data input port 
// OUT1, OUT2 ->  8-bit data output ports
// INADDRESS, OUT1ADDRESS, OUT2ADDRESS ->  INADDRESS, OUT1ADDRESS, OUT2ADDRESS
// WRITE -> control input port to accommodate the write enable control signal 
//CLOCK and RESET signals for synchronization.

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

	input [7:0] IN;
    input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;    //3-bits to represent which register
    input CLK, RESET, WRITE; 
	output [7:0] OUT1, OUT2;
	
	reg OUT1, OUT2;		//specifies output result to a register
	
	//creates a register array
	reg [7:0] registers [7:0];		//8 seperate 8-bit registers
	
	
	//if there is any change in both or either of OUT1ADDRESS or OUT2ADDRESS, do this
	always @ (OUT1ADDRESS, OUT2ADDRESS)
	begin
		
		// 2 time units read delay
		#2	
		OUT1 = registers[OUT1ADDRESS];		//OUT1ADDRESS is read and the value is loaded onto OUT1
		OUT2 = registers[OUT2ADDRESS];		//OUT2ADDRESS is read and the value is loaded onto OUT2
		
	end
	
	
	//if there is any change in RESET, do this
	always @ (RESET)
	begin
		if(RESET == 1'b1)begin
			
			#2	// 2 time units write delay
			registers[0] <= 8'b0;
			registers[1] <= 8'b0;
			registers[2] <= 8'b0;
			registers[3] <= 8'b0;
			registers[4] <= 8'b0;
			registers[5] <= 8'b0;
			registers[6] <= 8'b0;
			registers[7] <= 8'b0;
			
			#2	// 2 time units read delay
			OUT1 = registers[OUT1ADDRESS];		//OUT1ADDRESS is read and the value is loaded onto OUT1
			OUT2 = registers[OUT2ADDRESS];		//OUT2ADDRESS is read and the value is loaded onto OUT2
			
		end
	end

	
	//if the CLK is on it's positive edge, do this
	always @ (posedge CLK)
	begin	
		
			if(WRITE == 1'b1)begin
			
				// 2 time units write delay
				#2
				registers[INADDRESS] <= IN;		 //makes the data present on the IN port (from the instruction that just completed) 
												 //writes it to the input register specified by the INADDRESS
												 
				// 2 time units read delay
				#2									
				OUT1 <= registers[OUT1ADDRESS];		//OUT1ADDRESS is read and the value is loaded onto OUT1
				OUT2 <= registers[OUT2ADDRESS];		//OUT2ADDRESS is read and the value is loaded onto OUT2
			
			end
		
		
	end

endmodule