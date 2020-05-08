module reg_testbench;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEEN; 
    
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file resgisterFile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEEN, CLK, RESET);
       
    initial
    begin
        CLK = 1'b0;
        RESET = 1'b0;
        WRITEEN = 1'b0;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("register_wavedata.vcd");
		$dumpvars(0, reg_testbench);
        
        // assign values with time to input signals to see output 
        
        // write 55 to reg 4
        #2
        WRITEREG = 3'd4;
        WRITEDATA = 8'd55;
        WRITEEN = 1'b1;

        // disable the write enable
        #4
        WRITEEN = 1'b0;
        
        //read reg 4
        #2
        READREG1 = 3'd4;
        
        //reset , read reg4 and 3
        #3
        RESET = 1'b1;
        READREG1 = 3'd4;
        READREG1 = 3'd3;

        // disable reset
        #5
        RESET = 1'b0;

        // write 100 to reg 6
        #10 
        WRITEREG = 3'd6;
        WRITEDATA = 8'd100;
        WRITEEN = 1'b1;

        // write 60 to reg 4
        #10
        WRITEREG = 3'd5;
        WRITEDATA = 8'd60;

        // disable the write enable
        #4
        WRITEEN = 1'b0;
        
        // read reg 4 and 6
        #6
        READREG1 = 3'd6;
        READREG2 = 3'd5;

        #5
        $finish;
    end
    
    // clock signal of 10 time units
    always
        #5 CLK = ~CLK;
        

endmodule
