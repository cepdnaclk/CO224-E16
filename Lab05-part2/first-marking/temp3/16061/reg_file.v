/*	register file module
	Author - Chandula JPDM
	Date - 02/05/2020
*/

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

//define input and output ports
input [2:0] OUT1ADDRESS, OUT2ADDRESS, INADDRESS;
input [7:0] IN;
input CLK, RESET, WRITE;
output [7:0] OUT1, OUT2;

reg [7:0] OUT1, OUT2;
integer i;

integer t = 0; //calculate total delay time
integer resetDelay = 2;
integer readDelay = 2;

//Registers
reg [7:0] register [7:0];

//-------------- (if reset == 1 values of all the registers become 0) ----------------------
//level triggered reset
always @(*) begin
	
	if(RESET == 1) begin
		
		//assing 0 for each register
		for( i = 0; i<8; i = i+1) begin
			register[i] = 8'b00000000;
		end
		
	end
	
end
//---------------------------------------------------------------------------------------------------------------



/* 
	*Read the value from a given register address
	*This block will only initiate when out1address or out2address or  register values changes only.
*/
always @(OUT1ADDRESS or OUT2ADDRESS or  register[INADDRESS]) begin
		
		//if reset == 1 when registers are reading time delay should be equal to addition of  reset delay and read delay
		if(RESET==1) begin
			
			t = resetDelay+ readDelay;
	
		end
		
		else begin 
			
			t=readDelay;
		
		end

		#t
		
		//setting values for out1
		case (OUT2ADDRESS)
			
		3'b000 : OUT2 = register[0];
		3'b001 : OUT2 = register[1];
		3'b010 : OUT2 = register[2];
		3'b011 : OUT2 = register[3];
		3'b100 : OUT2 = register[4];
		3'b101 : OUT2 = register[5];
		3'b110 : OUT2 = register[6];
		3'b111 : OUT2 = register[7];	
		
		endcase

		//setting value for out2	
		case (OUT1ADDRESS)
			
		3'b000 : OUT1 = register[0];
		3'b001 : OUT1 = register[1];
		3'b010 : OUT1 = register[2];
		3'b011 : OUT1 = register[3];
		3'b100 : OUT1 = register[4];
		3'b101 : OUT1 = register[5];
		3'b110 : OUT1 = register[6];
		3'b111 : OUT1 = register[7];	
		
		endcase

end


/*
	*Write a value to a given register address
	*This block only initiate when positive edge of  the clock
*/
always @(posedge CLK) begin

	if(WRITE==1)
		
		#2 //delay for write a value to a register

		//write data to register for given input address
		case (INADDRESS)
	
			3'b000 : register[0] = IN;
			3'b001 : register[1] = IN;
			3'b010 : register[2] = IN;
			3'b011 : register[3] = IN;
			3'b100 : register[4] = IN;
			3'b101 : register[5] = IN;
			3'b110 : register[6] = IN;
			3'b111 : register[7] = IN;	
	
		endcase
	
end

endmodule
