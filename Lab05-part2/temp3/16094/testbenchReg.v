// Computer Architecture (CO224) - Lab 05
// Design: Register File Testbench of Simple Processor
// Author: E/16/094 Ekanayaka S.M.
// Date	: 3-May-2020

module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b0;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
	READREG1 = 3'd1;
	READREG2 = 3'd7;
	WRITEDATA = 8'd3;
	WRITEREG = 3'd7;

	#1
	RESET = 1'b1;

	#2
	RESET = 1'b0;
	WRITEENABLE = 1'b1;

	#5
	WRITEENABLE = 1'b0;

	#3
	WRITEENABLE = 1'b1;	
	WRITEDATA = 8'd19;
	WRITEREG = 3'd1;

	#10
	READREG1 = 3'd2;
	READREG2 = 3'd6;

	#10
	WRITEENABLE = 1'b0;
	READREG1 = 3'd7;
	READREG2 = 3'd1;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule

