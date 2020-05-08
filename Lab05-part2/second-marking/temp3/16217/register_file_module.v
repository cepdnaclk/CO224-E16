


module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
	input [7:0] IN;
	input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS; //input output addresses
	input WRITE, CLK, RESET;				
	                                        		
	output [7:0] OUT1, OUT2;
	
	//reg [7:0] OUT1, OUT2;
	                                                //registers as an array
	reg [7:0] registers [7:0];
	       
	integer i; 
	
	assign	OUT1 = registers[OUT1ADDRESS];				//always set OUT1 to data in OUT1ADDRESS th register 
	assign OUT2 = registers[OUT2ADDRESS];              //always set OUT2 to data in OUT2ADDRESS th register 
	
	always @ (posedge CLK) begin                       //only work with positive edge

		
		if(WRITE == 1'b1) 
			registers[INADDRESS] = IN;              //if write enabled update data in INADDRESS
			
		
	end
	
	

	
	
	always @ (RESET) begin
		if(RESET == 1'b1)  begin                         //reset all the registers 
		    
			for (i = 0; i < 8; i = i+1)
				registers[i] = 8'b0000_0000;
            
			i = 0;
		 end 
	end			
				
			
endmodule