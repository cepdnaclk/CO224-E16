module testbench2;	//testing the registor file

//define all the inputs as reg type
reg [7:0] WRITEDATA;
reg [2:0] READREG1,READREG2,WRITEREG;
reg CLOCK,WRITEENABLE,RESET;

//define outputs as wire type
wire [7:0] REGOUT1,REGOUT2;

reg_file myreg_file(WRITEDATA,REGOUT1,REGOUT2,WRITEREG,READREG1,READREG2,WRITEENABLE,CLOCK,RESET);


initial begin

	//creating wavedata file
	$dumpfile("wd2.vcd");
	$dumpvars(0,testbench2);

end

//generating various input signals to test the alu
initial begin

CLOCK = 1'b0;
RESET = 1'b0;
WRITEENABLE = 1'b0;


//testing the writing function & OUT1 OUT2
#2
RESET = 1'b1;
READREG1 = 3'd4;
READREG2 = 3'd7;
#5
RESET = 1'b0;
#8
WRITEENABLE = 1'b1;
WRITEREG = 3'd1;
WRITEDATA = 8'd20;
READREG1 = 3'd1;
READREG2 = 3'd5;
#10
WRITEREG = 3'd1;
WRITEDATA = 8'd6;
READREG2 = 3'd1;
#10
WRITEREG = 3'd6;
WRITEDATA = 8'd77;
READREG1 = 3'd6;
#5
//testing the asynchonous RESET
RESET = 1'b1;
WRITEENABLE = 1'b0;
#5
$finish;
end

//generating clocl pluses
always 
	
	#5 CLOCK = ~CLOCK;

endmodule

module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);

reg [7:0] regFile [7:0];	//defining the registor file

//declearing input & output variables as bit sequences
input [7:0] IN;
input [2:0] INADDRESS, OUT1ADDRESS , OUT2ADDRESS;
input WRITE,CLK, RESET;
output [7:0] OUT1, OUT2;
reg [7:0] OUT1, OUT2;	//declearing output as reg type
integer i;
reg WRITEDONE = 1'b0;	//this register is used to check whether write/reset is done

//wrinting to registers is sensitive to rising clock edges
always @(posedge CLK) begin

	
	if(WRITE == 1'b1 && RESET == 1'b0 ) begin //check whether WRITE is enable & RESET is disable
		
		//wrinting write registor value to the corresponding registor in registor file
		#2
		regFile[ INADDRESS[2]*4 + INADDRESS[1]*2 + INADDRESS[0] ] = IN; //delaying the update of register file by two time units
		WRITEDONE = ~WRITEDONE; //denoting wrinting to registers is done
	end

end

//reseting all the registor values to zero
always @(RESET) begin
    
	if(RESET == 1'b1)begin	//checking whether the RESET is enable
	
		#2 //add time delay for reseting registors
		
		for(i = 0 ; i < 8 ; i = i +1)begin

			regFile[i] = 8'd0;	//loop through the register file and make all registors zero
		
		end
		
		WRITEDONE = ~WRITEDONE;	//denoting resting the registers is done
	end
	
end

//updating the OUT1 when there is a change in the READREG1 
always @(OUT1ADDRESS)begin

	if(RESET == 1'b0) begin	//check whether the RESET in disable
	
	//add time delay for outputing register values
	//calculating the output1 registor address and outputing the corresponding register values
    OUT1 =  #2 regFile[ OUT1ADDRESS[2]*4 + OUT1ADDRESS[1]*2 + OUT1ADDRESS[0] ];

	end
end

//updating the OUT2 when there is a change in the READREG2 
always @(OUT2ADDRESS)begin

	if(RESET == 1'b0) begin	//check whether the RESET in disable
	
	//add time delay for outputing register values
	//calculating the output2 registor address and outputing the corresponding register values
	OUT2 =  #2 regFile[ OUT2ADDRESS[2]*4 + OUT2ADDRESS[1]*2 + OUT2ADDRESS[0] ];
	
	end

end

//afret a resetting or writing,updating the output registors
always @(WRITEDONE)begin

	//add time delay for outputing register values
	//calculating the output registor addresses and outputing the corresponding register values
	#2
	OUT1 = regFile[ OUT1ADDRESS[2]*4 + OUT1ADDRESS[1]*2 + OUT1ADDRESS[0] ];
	OUT2 = regFile[ OUT2ADDRESS[2]*4 + OUT2ADDRESS[1]*2 + OUT2ADDRESS[0] ];
end



endmodule