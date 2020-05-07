`include "reg_file.v"


module reg_file_tb;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file2_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
		
		// assign values with time to input signals to see output 
		RESET = 1'b0;
        WRITEENABLE = 1'b0;
		
		#1
		RESET = 1'b1;
        WRITEENABLE = 1'b1;
		
		#1
		READREG1 = 3'd2;
		
		
		#3
		RESET = 1'b0;
		WRITEDATA = 8'd34;
		WRITEREG = 3'd3;
		
		#6
		READREG1 = 3'd3;
		READREG2 = 3'd5;
		
		#3
		READREG1 = 3'd3;
		WRITEREG = 3'd4;
		
		#8
		WRITEDATA = 8'd45;
		WRITEREG = 3'd5;
		
		#4
		READREG2 = 3'd7;
		
		#8
		READREG1 = 3'd4;
		WRITEDATA = 8'd56;
		WRITEREG = 3'd7;
		
		
		#2
		WRITEDATA = 8'd32;
		WRITEREG = 3'd1;
		
		#6
		READREG1 = 3'd1;
		
		#4
		RESET = 1'b1;
        WRITEENABLE = 1'b1;
		WRITEDATA = 8'd20;
		WRITEREG = 3'd6;
		
		#7
		RESET = 1'b0;
		WRITEREG = 3'd5;
		WRITEDATA = 8'd33;
		
		#10
		READREG1 = 3'd5;
		READREG2 = 3'd5;
		
		#4
		WRITEREG = 3'd7;
		WRITEDATA = 8'd65;
		READREG1 = 3'd7;
		
		
		#10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule