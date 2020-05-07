
module reg_file_tb;
    
    //initialize 
    reg [7:0] IN;
    reg [2:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
    reg CLK, RESET, WRITE; 
    wire [7:0] OUT1, OUT2;
    
    //reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG,  READREG1,    READREG2,    WRITEENABLE, CLK, RESET);
    reg_file register(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS, OUT2ADDRESS, WRITE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_tb);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITE = 1'b0;
        
        #1
        RESET = 1'b1;
        OUT1ADDRESS = 3'd0;
        OUT2ADDRESS = 3'd4;
        
        #8
        RESET = 1'b0;
        
        #5
        INADDRESS = 3'd2;
        IN = 8'd95;
        WRITE = 1'b1;
        
        #10
        WRITE = 1'b0;
        
        #1
        OUT1ADDRESS = 3'd2;
        
        #9
        INADDRESS = 3'd1;
        IN = 8'd28;
        WRITE = 1'b1;
        OUT1ADDRESS = 3'd1;
        
        #10
        WRITE = 1'b0;
        
        #9
        INADDRESS = 3'd4;
        IN = 8'd6;
        WRITE = 1'b1;
        
        #10
        IN = 8'd15;
        WRITE = 1'b1;
        
        #10
        WRITE = 1'b0;
        
        #6
        INADDRESS = 3'd1;
        IN = 8'd50;
        WRITE = 1'b0;
        
        

        #8
        RESET = 1'b0;
        INADDRESS = 3'd2;
        IN = 8'd100;
        WRITE = 1'b1;
        OUT1ADDRESS = 3'd2;
        OUT2ADDRESS = 3'd0;

        
        #10
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
        

endmodule
