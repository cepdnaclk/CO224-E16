//Verilog module for a 8 x 8 register file 
//The given module in the pdf
module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

    //inputs,outputs and internal variables declared here
	input CLK;
	input RESET;
	input WRITE;
	input [2:0] INADDRESS;
	input [7:0] IN;
	input [2:0] OUT1ADDRESS;
	output [7:0] OUT1;
	input [2:0] OUT2ADDRESS;
	output [7:0] OUT2;
   
	// Register file storage
	reg [7:0] registers[7:0];
    
	//Assign register values to the outputs
	// #2 delay is added, because it is given already
	assign #2 OUT1 = registers[OUT1ADDRESS];
	assign #2 OUT2 = registers[OUT2ADDRESS];
   
    // if reset is high should give value 0 to every register
	// #2 delay is added, because it is given already
	always @(RESET) begin
        if (RESET) begin #2
	        registers[0] <= 0;
	        registers[1] <= 0;
	        registers[2] <= 0;
			registers[3] <= 0;
			registers[4] <= 0;
			registers[5] <= 0;
			registers[6] <= 0;
			registers[7] <= 0;
		end 
	end	  
	
	// if the clk is positive and write is enabled should write in value to the given register
	// #2 delay is added, because it is given already
	always @(posedge CLK ) begin 
		if (WRITE) begin 
			#2 registers[INADDRESS] <= IN;
		end 
    end

endmodule