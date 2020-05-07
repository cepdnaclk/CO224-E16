
module reg_file_testbench;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate waveform files to plot using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1
		WRITEENABLE = 1'b1;
		WRITEREG = 3'd4;
		WRITEDATA = 8'd45;
        RESET = 1'b1;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #8
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;
        WRITEDATA = 8'd10;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #1
        READREG1 = 3'd2;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd88;
        WRITEENABLE = 1'b1;
        READREG1 = 3'd1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd4;
        WRITEDATA = 8'd6;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd35;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd1;
        WRITEDATA = 8'd37;
        WRITEENABLE = 1'b1;
        
        #5
        WRITEENABLE = 1'b0;
		
		
        
        #15
        $finish;
    end
    
    // create the clock
    always
        #5 CLK = ~CLK;
        

endmodule
