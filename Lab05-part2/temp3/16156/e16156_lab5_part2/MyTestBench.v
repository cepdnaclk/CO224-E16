`include "REG.v"
module tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
		//$monitor($time,"  WRITEDATA: %b  REGOUT1: %b  REGOUT2: %b  WRITEREG: %b    READREG1: %b   READREG2: %b   WRITEENABLE: %b   CLK: %b   RESET: %b",WRITEDATA,REGOUT1,REGOUT2,WRITEREG,READREG1,READREG2, WRITEENABLE, CLK, RESET);
        $dumpfile("wavedata.vcd");
		$dumpvars(0,tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #5
        WRITEREG = 3'd1;
        WRITEDATA = 8'd28;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        
        #7
        RESET = 1'b1;
		READREG1 = 3'd0;
        
        #9
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #1
        WRITEENABLE = 1'b0;
        
        #6
        READREG1 = 3'd2;
        
        #7
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #6
        WRITEENABLE = 1'b0;
        
        #2
        RESET = 1'b0;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #3
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #7
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #10
        WRITEREG = 3'd1;
        WRITEDATA = 8'd50;
        WRITEENABLE = 1'b1;
        
        #7
        WRITEENABLE = 1'b0;
        
        #1
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
