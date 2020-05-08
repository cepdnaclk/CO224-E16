
module reg_file_testbench;
    
    reg [7:0] WRITEDATA;
    reg [2:0] WRITEREG, READREG1, READREG2;
    reg CLK, RESET, WRITEENABLE; 
    wire [7:0] REGOUT1, REGOUT2;
    
    reg_file myregfile(WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
       
    initial
    begin
        CLK = 1'b1;
        
        // generate files needed to plot the waveform using GTKWave
        $dumpfile("reg_file_wavedata.vcd");
		$dumpvars(0, reg_file_testbench);
        
        // assign values with time to input signals to see output 
        RESET = 1'b0;
        WRITEENABLE = 1'b0;
        
        #1                        
        RESET = 1'b1;                   //checking whether the register file stays reset state when reset = 1 , even if writeenable =1
        READREG1 = 3'd5;                   
        READREG2 = 3'd7;
        WRITEREG = 3'd5;
        WRITEDATA = 8'd95;
        WRITEENABLE = 1'b1;
        
        #10
        RESET = 1'b0;
        
        #5
        WRITEREG = 3'd2;                //checking whether write happend when it is a clock edge and writeenble is 1
        WRITEDATA = 8'd55;
        WRITEENABLE = 1'b1;
        READREG1 = WRITEREG;
        
        #10
        WRITEENABLE = 1'b0;
        
        #8
        READREG1 = 3'd3;                  
        
        #5
        WRITEREG = 3'd7;               //writing to register and read from out2
        WRITEDATA = 8'd75;
        WRITEENABLE = 1'b1;
        READREG2 = 3'd7;
        
        #10
        WRITEENABLE = 1'b0;
        
        #10
        WRITEREG = 3'd5;              //writing happen when outaddress not equal to inaddress
        WRITEDATA = 8'd68;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEDATA = 8'd15;
        WRITEENABLE = 1'b1;
        
        #10
        WRITEENABLE = 1'b0;
        
        #11
        WRITEREG = 3'd1;               //writing to register when writeenable , writedata and writereg changed at same Clk edge
        WRITEDATA = 8'd88;
        WRITEENABLE = 1'b1;
        READREG1 = WRITEREG;

        #13
        READREG1 = 3'd5;               //checking whether new value is written to the register
        
        #5
        WRITEENABLE = 1'b0;
        
        #15
        RESET = 1;                     //checking again does the rest is working
        READREG1 = 3'd5;
        READREG2 = 3'd7;

        #10
        RESET = 0;

        
        #20
        $finish;
    end
    
    // clock signal generation
    always
        #5 CLK = ~CLK;
    always
        #10  $display(" IN : %8b, OUT1 : %8b, OUT2 : %8b, INADDRESS : %3b, OUT1ADDRESS : %3b, OUT2ADDRESS : %3b, WRITE : %b, CLK : %b, RESET : %b\n",WRITEDATA, REGOUT1, REGOUT2, WRITEREG, READREG1, READREG2, WRITEENABLE, CLK, RESET);
      
endmodule
