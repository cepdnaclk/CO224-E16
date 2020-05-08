module reg_file_tb;
	
	reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
	
	reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
	
	initial
    begin
	$monitor($time,"CLK: %b, RESET: %b,WRITEREG: %b , WRITEDATA: %b,WRITEENABLE: %b ,READREG1: %b ,REGOUT1: %b ,READREG2: %b, REGOUT2: %b ",CLK,RESET,WRITEREG,WRITEDATA,WRITEENABLE,READREG1,REGOUT1,READREG2, REGOUT2 );
        CLK = 1'b1;
        
		
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        READREG1 = 3'd2;
        READREG2 = 3'd1;
        
        #5
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd4;
        WRITEDATA = 8'd28;
        WRITEENABLE = 1'b0;
        
        #10
        WRITEENABLE = 1'b1;
		READREG2 = 3'd1;
        
        #5
        READREG1 = 3'd1;
        
        #9
		
        WRITEREG = 3'd1;
        WRITEDATA = 8'd65;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd2;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b0;
        
        #10
        WRITEENABLE = 1'b1;
		READREG1 = 3'd1;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd90;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule


module reg_file(IN,OUT1,OUT2,INADDRESS,OUT1ADDRESS,OUT2ADDRESS,WRITE,CLK,RESET);

//port declaration
input [7:0]IN; //two 8 bit inputs
input [2:0]INADDRESS,OUT1ADDRESS,OUT2ADDRESS;//3 bit select mode
input WRITE,CLK,RESET;//three one bit inputs
output [7:0]OUT1,OUT2;	//8 bit outputs

reg OUT1,OUT2;
reg [7:0] registers [7:0]; //eight 8-bit value registers

integer i;

//for anychange of inputs
always @ (*)
begin
	//reg read delay
	#2
			//give the outputs to the given output addesses.
			OUT1 = registers [OUT1ADDRESS];
			OUT2 = registers [OUT2ADDRESS];

end

always @ (RESET)begin

	if(RESET)begin	
	#2
	//if reset is enabled move all the registers to zero.
		for(i=0;i<8;i=i+1)begin
		registers[i]<=0;
		end
	
	#2
	//as the inputs are zero give the outputs as zero.
	OUT1 = registers [OUT1ADDRESS];
	OUT2 = registers [OUT2ADDRESS];
	end
end

//At the positive edge of the clock
always @(posedge CLK)	begin
		
		//if write is enabled
		if(WRITE) begin
		
		//delay the time to read the data(reg write delay)
		#2
			//write the data to the given register address.
			registers [INADDRESS] <= IN;
			
		//delay the time to read data (reg read delay)		
		#2
			
			//give the outputs to the given output addesses.
			OUT1 = registers [OUT1ADDRESS];
			OUT2 = registers [OUT2ADDRESS];
		end
		
	end
	
	
	

endmodule
