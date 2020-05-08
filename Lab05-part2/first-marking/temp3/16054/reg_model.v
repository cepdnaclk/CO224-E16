
module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        $monitor($time,"reset :%b,READREG2 :%b,write_enable :%b,regOut1 :%b,regOut2 :%b,writedata :%b",RESET,READREG2,WRITEENABLE,REGOUT1,REGOUT2,WRITEDATA);
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
        RESET = 1'b1;
        READREG1 = 3'd2;
        READREG2 = 3'd4;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b1;
        WRITEDATA = 8'd5;
        WRITEREG = 3'd2;
        
        #1
        READREG1 = 3'd2;
        
        #9
        WRITEREG = 3'd4;
        WRITEDATA = 8'd7;
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
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
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



module reg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET) ;
	//Initalizing inputs
	input [2:0] INADDRESS;
	input [2:0] OUT1ADDRESS;
	input [2:0] OUT2ADDRESS;
	input  WRITE;
	input CLK;
	input RESET;
	input [7:0] IN;
	//initializing outputs
	output [7:0] OUT1;
	output [7:0] OUT2;
	//initializing register variables
	reg [7:0] OUT1;
	reg [7:0] OUT2;

	integer i; 
	//creating the register array
	reg [7:0]  regFile [0:7]; 
	//resetting the registers if the reset is 1 as a level triggered input
	always@(*)
	if (RESET == 1) begin 
			#2
			for (i = 0; i < 8; i = i + 1) 
			begin
    		  regFile [i] = 8'b00000000 ; 
    		end 
    	
    end 
    //this always block runs of the positive edge of the clock and write to the register if write is ennable
	always@(posedge CLK)
	begin	
		  if(WRITE == 1'b1 && RESET == 1'b0) begin
				#2 regFile  [INADDRESS] = IN; //this includes the write reg delay
		  end 
	end
	
	//this is for reading the inputs from the registers
	always@(OUT1ADDRESS,OUT2ADDRESS,regFile[INADDRESS])
	begin
		//this if block is to add the deley comefrom the reseting
	    if(RESET==1'b1)begin
	    #2;
	    end
		#2 //this is the read reg delay
	    OUT1 = regFile [OUT1ADDRESS];
		OUT2 = regFile [OUT2ADDRESS];
	end


endmodule	

