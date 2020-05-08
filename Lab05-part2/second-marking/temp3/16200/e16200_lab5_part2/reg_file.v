
/*
Author: E/16/200
Name: Lakmali B.L.S.
Lab 5 Part 2
Register file implementation
*/


module reg_file (IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
	
	reg [7:0] REGISTERS[7:0];//register array 
	
	output wire  [7:0] OUT1, OUT2; //values read from the registers
	
	input[7:0] IN;//data writes into the register
	input[2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;//addresses of the register to write and read
	
	input WRITE, CLK, RESET;//when write is enable data is written to the registers in positive edges of the CLK
	//when RESET is high ,all the register values are cleared, and assign 0
	
	integer i;//i for loop
		
	
	assign #2 OUT1 = REGISTERS[OUT1ADDRESS];//assinchronously, OUT1 is assigned with the values regarding to paricular register address
	assign #2 OUT2 = REGISTERS[OUT2ADDRESS];//same as above, OUT2 has the value of the register which has the OUT2ADDRESS
	
	
	//following block is for reseting, we do it asynchronously and consider it as level triggered
	always @(RESET)
	begin
	
		if (RESET)//when reset is high , register values become 0
		  begin
			 	 
			#2 for(i=0;i<8;i=i+1)//we have put  2 time units delay
			begin
				  REGISTERS[i] <= 0;//assign 0
			end
		end
		
	end
	
	
	
	//followig block is for writing into the registers
	always @(posedge CLK)//data is writen to the registers in the positive edge of the clock
	begin
	
		if(WRITE && (!RESET))//when write is 1 and when reset is not 1, data is writted
		begin
			   #2 REGISTERS[INADDRESS] <= IN;//data is written to particular register
		end
		
	end
	

	

endmodule
