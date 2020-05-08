/*********************************
   E16232
   F.S.Marzook
   Lab5_Part2
   Register File Module Testbench
**********************************/

`timescale 1ns / 1ns

module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;	
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("wavedata.vcd");
	$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITE = 1'b0;
        
        #5
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
	//$display ("IN:%b\nOUT1:%b\nOUT2:%b\n",WRITEDATA,REGOUT1, REGOUT2);
        
        #10
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd95;
        WRITE = 1'b1;
	//$display ("IN:%d\nOUT1:%d\nOUT2:%d\n",WRITEDATA,REGOUT1, REGOUT2);

	#10
        WRITEREG = 3'd5;
        WRITEDATA = 8'd85;
        
        #10
        WRITE = 1'b0;
        
        #5
        READREG1 = 3'd2;
	READREG2 = 3'd5;

        #10
	RESET = 1'b0;
        WRITEDATA = 8'd15;
        WRITE = 1'b1;
        
        #5
        WRITE = 1'b0;

        #5
	RESET = 1'b1;

	#2
	READREG1 = 3'd4;
        READREG2 = 3'd5;

  	#5
	RESET = 1'b0;

        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITE = 1'b1;
        
	#5
	READREG2 = 3'd7;
	
 	#10
        WRITEREG = 3'd1;
        WRITEDATA = 8'd28;
        WRITE = 1'b1;
		
        
        #10
        WRITE = 1'b0;
        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
