/*************************
   E16232
   F.S.Marzook
   Lab5_Part2
   Register File Module 
**************************/

`timescale 1ns / 1ns

module reg_file (IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
	
	//declare inputs
	input [7:0] IN;
	input [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
	input WRITE, CLK, RESET;
	//declare output
	output [7:0] OUT1, OUT2;

	integer i;

	reg [7:0] myreg[7:0];			//array of registers
	reg [7:0] temp1,temp2;			//temperary registers
	
	parameter DELAY = 2;


	//whenever the reset changes and it becomes high, all the registers must be zero
	always @(RESET)
	begin
		if(RESET==1)
		begin
			#DELAY
			for(i=0;i<8;i=i+1)
			begin
				myreg[i] = 0;		//all the registers are cleared
			end	
		end
	end
	

	//the output should change always when the output address change.
	//It doesn't depend in the clk edge
	always @(*)
	begin
		temp1 =  myreg[OUT1ADDRESS];
		temp2 =  myreg[OUT2ADDRESS];		
	end

	assign  #DELAY OUT1 = temp1;			//assign output values in the register
	assign  #DELAY OUT2 = temp2;
	

	//input should change in every positive edge and reset
	always @(posedge CLK,RESET)
	begin
		//when reset is low and the write signal is high the input value should change
		if(RESET == 0 && WRITE == 1)
		begin
				#DELAY 
				myreg[INADDRESS] = IN;	// write the value in input to the register
		end
	end

endmodule

	
