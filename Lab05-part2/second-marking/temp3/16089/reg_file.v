module testbench;
    
    reg [7:0] IN;
    reg [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;

    reg [7:0] REGISTER[7:0];
    
    reg_file myregfile(IN, REGOUT1, REGOUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITEENABLE, CLK, RESET);
       
    initial   //Initial Block 
    begin

        CLK = 1'b1;
        
    	//Generate the files needed to display the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, testbench);
        
  		// Assign values to generate the GTK wave 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        OUT1ADDRESS = 3'b000;
        OUT2ADDRESS = 3'b101;
        
        #8
        RESET = 1'b0;
        OUT2ADDRESS = 3'b111;
        
        
        #5
        INADDRESS = 3'b010;
        IN = 8'b01010111;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        OUT1ADDRESS = 3'b110;
        
        #9
        INADDRESS = 3'b001;
        IN = 8'b00011101;
        WRITEENABLE = 1'b1;
        OUT1ADDRESS = 3'b001;
        OUT2ADDRESS = 3'b110;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        INADDRESS = 3'b100;
        IN = 8'b01000110;
        WRITEENABLE = 1'b1;
        
        #10
        IN = 8'b00001110;
        WRITEENABLE = 1'b1;
        OUT2ADDRESS = 3'b100;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        INADDRESS = 3'b011;
        IN = 8'b10110010;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;

        #10
        INADDRESS = 3'b101;
        IN = 8'b01000110;
        WRITEENABLE = 1'b0;
        OUT2ADDRESS = 3'b101;

        #10
        INADDRESS = 3'b111;
        IN = 8'b00011101;
        WRITEENABLE = 1'b1;
        OUT1ADDRESS = 3'b001;

        #10
        $finish;
    end
    
    // clock signal generation

    always
        #5 CLK = ~CLK;
        

endmodule





module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET); // Module of the register 

	input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS; // Input values - Address values of IN, OUT1 and OUT2
	input [7:0] IN;  			// Input 8bit Value 
	input WRITE, CLK, RESET; 	//Inputs
	output [7:0] OUT1, OUT2;  	// Output 8 bit Values

	reg [7:0] REGISTER[7:0]; // 8 8bit Registers to Store 8bit values 
	reg OUT1, OUT2;			 // Define Output as registers 
	integer i; 				 // i Values of the loop

	always @ (posedge CLK) // Always block for the CLK
	begin

		if(WRITE)begin // When WRITE is enable, 

		#2
		REGISTER[INADDRESS] = IN; // Write the value in IN to the relevent register(register in the INADDRESS)

		#2
		OUT1 = REGISTER[OUT1ADDRESS]; //Read the value of the given register(address in OUT1ADDRESS) and load to the OUT1
		OUT2 = REGISTER[OUT2ADDRESS]; //Read the value of the given register(address in OUT3ADDRESS) and load to the OUT2

		end
	end


	always @ (posedge RESET) begin // Always block for the RESET 

		#2
		for(i=0; i<8; i = i +1) begin  // Positive edge of the RESET all the register values should be Zero(00000000)
			REGISTER[i] = 8'b00000000;	
		end

		#2
		OUT1 = REGISTER[OUT1ADDRESS]; //After the reset Values should be loades to the OUT1 and OUT2
		OUT2 = REGISTER[OUT2ADDRESS];

	end


	always @ (OUT1ADDRESS) begin //Always block for the OUT1ADDRESS

		if (!RESET) begin // When the RESET == 0, 
			#2
			OUT1 = REGISTER[OUT1ADDRESS]; // Values in the given register address(OUT1ADDRESS) should be loaded in to the OUT1
		end
	end


	always @ (OUT2ADDRESS) begin //Always block for the OUT2ADDRESS

		if (!RESET) begin    // When the RESET == 0, 
			#2
			OUT2 = REGISTER[OUT2ADDRESS];   // Values in the given register address(OUT2ADDRESS) should be loaded in to the OUT2
		end
	end

endmodule 


