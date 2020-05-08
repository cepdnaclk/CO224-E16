
/*
	test bench for register file module
	Author - E/16/061 Chandula JPDM
	03/05/2020
*/


module reg_file_testbench;

	reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
	
	initial begin
	
		CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("wavedata.vcd");
		$dumpvars(0, reg_file_testbench);
		
		// assign values with time to input signals to see output 
		#1
		RESET = 1'b1;
	
		#2
		READREG1 = 3'd0;
        READREG2 = 3'd1;
		
		#3
		RESET = 1'b0;
		
		#2
		WRITEENABLE = 1'b1;
		WRITEDATA = 8'd7;
		WRITEREG = 3'd1;
		
		#12
		WRITEENABLE = 1'b0;
		WRITEDATA = 8'd6;
		WRITEREG = 3'd0;
		
		#4
		WRITEENABLE =1'b1;
		
		#20
		WRITEDATA = 8'd15;
		WRITEREG = 3'd4;
		READREG1 = 3'd4;
		READREG2 = 3'd5;
		
		#8
		WRITEREG = 3'd4;
		READREG1 = 3'd4;
		READREG2 = 3'd4;
		
		#5
		WRITEENABLE = 1'b0;
		RESET = 1'b1;
		
		#8
		RESET = 1'b0;
		READREG1 = 3'd4;
		
		#6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
		
		#5
		READREG1 = 3'd1;
        
		#10
		WRITEENABLE = 1'b0;
		
		#10
        $finish;
	
	end
	
	// clock signal generation
    always
        #5 CLK = ~CLK;

endmodule