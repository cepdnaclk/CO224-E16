//E16096
//Lab5_part2

module reg_file_testbench;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        $dumpfile("reg_file_wavedata_2.vcd");
		$dumpvars(0, reg_file_testbench);
        
        RESET = 1'b0;
        WRITEENABLE = 1'b1;
        
        #3
		WRITEREG = 3'd0;
        WRITEDATA = 8'd9;
        READREG1 = 3'd0;
        READREG2 = 3'd4;
        
        #10
        RESET = 1'b1;
        
        #5
        WRITEREG = 3'd1;
        WRITEDATA = 8'd5;
        
		#4
		READREG1 = 3'd0;
        
        #5
		RESET = 1'b0;
        
        #1
        READREG1 = 3'd1;
		READREG2 = 3'd0;
        
        #9
        WRITEREG = 3'd1;
        WRITEDATA = 8'd20;
        WRITEENABLE = 1'b0;
		
        
        #10
        WRITEENABLE = 1'b1;
        
        
        #10
        WRITEENABLE = 1'b0;
        
        #6
        WRITEREG = 3'd4;
        WRITEDATA = 8'd25;
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
